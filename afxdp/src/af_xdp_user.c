/* SPDX-License-Identifier: GPL-2.0 */

#include <assert.h>
#include <errno.h>
#include <getopt.h>
#include <locale.h>
#include <poll.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include <sys/resource.h>

#include <bpf/bpf.h>
#include <xdp/xsk.h>
#include <xdp/libxdp.h>

#include <arpa/inet.h>
#include <net/if.h>
#include <linux/if_link.h>
#include <linux/if_ether.h>
#include <linux/ipv6.h>
#include <linux/ip.h> // For ipv4hdr
#include <linux/icmpv6.h>
#include <netinet/tcp.h>
#include <xdp-runtime.h>

#include <net/if_arp.h>

#define DEBUG_OUTPUT 1

#define DEBUG_PRINT(fmt, args...) \
    do { if (DEBUG_OUTPUT) fprintf(stderr, fmt, ##args); } while (0)


#define NUM_FRAMES 4096
#define FRAME_SIZE XSK_UMEM__DEFAULT_FRAME_SIZE
#define RX_BATCH_SIZE 64
#define INVALID_UMEM_FRAME UINT64_MAX

int verbose = 1;
int ifindex = -1;
int xsk_map_fd = 0;
bool custom_xsk = false;
const char *ifname = NULL;

struct xsk_umem_info
{
	struct xsk_ring_prod fq;
	struct xsk_ring_cons cq;
	struct xsk_umem *umem;
	void *buffer;
};
struct stats_record
{
	uint64_t timestamp;
	uint64_t rx_packets;
	uint64_t rx_bytes;
	uint64_t tx_packets;
	uint64_t tx_bytes;
};
struct xsk_socket_info
{
	struct xsk_ring_cons rx;
	struct xsk_ring_prod tx;
	struct xsk_umem_info *umem;
	struct xsk_socket *xsk;

	uint64_t umem_frame_addr[NUM_FRAMES];
	uint32_t umem_frame_free;

	uint32_t outstanding_tx;

	struct stats_record stats;
	struct stats_record prev_stats;
};

static inline __u32 xsk_ring_prod__free(struct xsk_ring_prod *r)
{
	r->cached_cons = *r->consumer + r->size;
	return r->cached_cons - r->cached_prod;
}

static bool global_exit;

static struct xsk_umem_info *configure_xsk_umem(void *buffer, uint64_t size)
{
	struct xsk_umem_info *umem;
	int ret;

	umem = calloc(1, sizeof(*umem));
	if (!umem)
		return NULL;

	ret = xsk_umem__create(&umem->umem, buffer, size, &umem->fq, &umem->cq,
						   NULL);
	if (ret)
	{
		errno = -ret;
		return NULL;
	}

	umem->buffer = buffer;
	return umem;
}

static uint64_t xsk_alloc_umem_frame(struct xsk_socket_info *xsk)
{
	uint64_t frame;
	if (xsk->umem_frame_free == 0)
		return INVALID_UMEM_FRAME;

	frame = xsk->umem_frame_addr[--xsk->umem_frame_free];
	xsk->umem_frame_addr[xsk->umem_frame_free] = INVALID_UMEM_FRAME;
	return frame;
}

static void xsk_free_umem_frame(struct xsk_socket_info *xsk, uint64_t frame)
{
	assert(xsk->umem_frame_free < NUM_FRAMES);

	xsk->umem_frame_addr[xsk->umem_frame_free++] = frame;
}

static uint64_t xsk_umem_free_frames(struct xsk_socket_info *xsk)
{
	return xsk->umem_frame_free;
}

static struct xsk_socket_info *xsk_configure_socket(
	struct xsk_umem_info *umem)
{
	struct xsk_socket_config xsk_cfg;
	struct xsk_socket_info *xsk_info;
	uint32_t idx;
	int i;
	int ret;
	uint32_t prog_id;

	xsk_info = calloc(1, sizeof(*xsk_info));
	if (!xsk_info)
		return NULL;

	xsk_info->umem = umem;
	xsk_cfg.rx_size = XSK_RING_CONS__DEFAULT_NUM_DESCS;
	xsk_cfg.tx_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
	xsk_cfg.xdp_flags = 0;
	xsk_cfg.bind_flags = 0;
	xsk_cfg.libbpf_flags = (custom_xsk) ? XSK_LIBBPF_FLAGS__INHIBIT_PROG_LOAD : 0;
	ret = xsk_socket__create(&xsk_info->xsk, ifname,
							 0, umem->umem, &xsk_info->rx,
							 &xsk_info->tx, &xsk_cfg);
	if (ret)
		goto error_exit;

	if (custom_xsk)
	{
		ret = xsk_socket__update_xskmap(xsk_info->xsk, xsk_map_fd);
		if (ret)
			goto error_exit;
	}
	else
	{
		/* Getting the program ID must be after the xdp_socket__create() call */
		if (bpf_xdp_query_id(ifindex, 0, &prog_id))
			goto error_exit;
	}

	/* Initialize umem frame allocation */
	for (i = 0; i < NUM_FRAMES; i++)
		xsk_info->umem_frame_addr[i] = i * FRAME_SIZE;

	xsk_info->umem_frame_free = NUM_FRAMES;

	/* Stuff the receive path with buffers, we assume we have enough */
	ret = xsk_ring_prod__reserve(&xsk_info->umem->fq,
								 XSK_RING_PROD__DEFAULT_NUM_DESCS,
								 &idx);

	if (ret != XSK_RING_PROD__DEFAULT_NUM_DESCS)
		goto error_exit;

	for (i = 0; i < XSK_RING_PROD__DEFAULT_NUM_DESCS; i++)
		*xsk_ring_prod__fill_addr(&xsk_info->umem->fq, idx++) =
			xsk_alloc_umem_frame(xsk_info);

	xsk_ring_prod__submit(&xsk_info->umem->fq,
						  XSK_RING_PROD__DEFAULT_NUM_DESCS);

	return xsk_info;

error_exit:
	errno = -ret;
	return NULL;
}

static void complete_tx(struct xsk_socket_info *xsk)
{
	unsigned int completed;
	uint32_t idx_cq;

	if (!xsk->outstanding_tx)
		return;

	sendto(xsk_socket__fd(xsk->xsk), NULL, 0, MSG_DONTWAIT, NULL, 0);

	/* Collect/free completed TX buffers */
	completed = xsk_ring_cons__peek(&xsk->umem->cq,
									XSK_RING_CONS__DEFAULT_NUM_DESCS,
									&idx_cq);

	if (completed > 0)
	{
		DEBUG_PRINT("completed %d\n", completed);
		for (int i = 0; i < completed; i++)
			xsk_free_umem_frame(xsk,
								*xsk_ring_cons__comp_addr(&xsk->umem->cq,
														  idx_cq++));

		xsk_ring_cons__release(&xsk->umem->cq, completed);
		xsk->outstanding_tx -= completed < xsk->outstanding_tx ? completed : xsk->outstanding_tx;
	}
}

static inline __sum16 csum16_add(__sum16 csum, __be16 addend)
{
	uint16_t res = (uint16_t)csum;

	res += (__u16)addend;
	return (__sum16)(res + (res < (__u16)addend));
}

static inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
{
	return csum16_add(csum, ~addend);
}

static inline void csum_replace2(__sum16 *sum, __be16 old, __be16 new)
{
	*sum = ~csum16_add(csum16_sub(~(*sum), old), new);
}

unsigned short compute_ip_checksum(struct iphdr *iphdrp)
{
	unsigned long sum = 0;
	const unsigned short *ptr = (const unsigned short *)iphdrp;

	for (size_t i = 0; i < sizeof(struct iphdr) / 2; ++i)
	{
		sum += *ptr++;
	}

	while (sum >> 16)
	{
		sum = (sum & 0xFFFF) + (sum >> 16);
	}

	return (unsigned short)(~sum);
}

struct __attribute__((packed)) eth_addr
{
	unsigned char addr[ETH_ALEN];
};

// ARP负载部分的手动构造
struct arp_payload
{
	unsigned char ar_sha[ETH_ALEN]; // 发送方MAC地址
	unsigned char ar_sip[4];		// 发送方IP地址
	unsigned char ar_tha[ETH_ALEN]; // 目标MAC地址
	unsigned char ar_tip[4];		// 目标IP地址
};

static void handle_arp(uint8_t *pkt, struct ethhdr *eth, struct eth_addr our_mac)
{
	printf("handle_arp in userspace\n");
	struct arphdr *arp_hdr = (struct arphdr *)(pkt + sizeof(struct ethhdr));
	struct arp_payload *payload = (struct arp_payload *)(arp_hdr + 1);
	// 检查ARP操作类型是请求(ARPOP_REQUEST)
	if (ntohs(eth->h_proto) == ETH_P_ARP && ntohs(arp_hdr->ar_op) == ARPOP_REQUEST)
	{
		int our_ip = inet_addr("10.0.0.10");
		// 检查ARP请求是否针对我们的IP
		if (memcmp(payload->ar_tip, &our_ip, 4) == 0)
		{
			printf("Received ARP request for our IP, sending reply\n");

			// 构造ARP响应
			arp_hdr->ar_op = htons(ARPOP_REPLY);				// 设置操作为响应
			memcpy(payload->ar_tha, payload->ar_sha, ETH_ALEN); // 设置目标MAC为请求方MAC
			memcpy(payload->ar_sha, &our_mac, ETH_ALEN);		// 设置发送方MAC为我们的MAC
			memcpy(payload->ar_tip, payload->ar_sip, 4);		// 设置目标IP为请求方IP
			memcpy(payload->ar_sip, &our_ip, 4);				// 设置发送方IP为我们的IP

			// 设置以太网头部
			memcpy(eth->h_dest, payload->ar_tha, ETH_ALEN); // 设置目标MAC为原请求方MAC
			memcpy(eth->h_source, &our_mac, ETH_ALEN);		// 设置源MAC为我们的MAC
			eth->h_proto = htons(ETH_P_ARP);				// 设置协议类型为ARP

			// TODO: 发送ARP响应
			// 这里需要实现发送逻辑，例如将响应包加入到AF_XDP的TX环，并触发发送
		}
	}
}

// #define MAX_OPT_WORDS 10 // 40 bytes for options

// static __always_inline __u16 csum_reduce_helper(__u32 csum)
// {
// 	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);
// 	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);
// 	return csum;
// }

// struct ipv4_psd_header
// {
// 	uint32_t src_addr; /* IP address of source host. */
// 	uint32_t dst_addr; /* IP address of destination host. */
// 	uint8_t zero;	   /* zero. */
// 	uint8_t proto;	   /* L4 protocol type. */
// 	uint16_t len;	   /* L4 length. */
// };

// static inline unsigned short from32to16(unsigned int x)
// {
// 	/* add up 16-bit and 16-bit for 16+c bit */
// 	x = (x & 0xffff) + (x >> 16);
// 	/* add up carry.. */
// 	x = (x & 0xffff) + (x >> 16);
// 	return x;
// }

// static unsigned int do_csum(const unsigned char *buff, int len)
// {
// 	int odd;
// 	unsigned int result = 0;

// 	if (len <= 0)
// 		goto out;
// 	odd = 1 & (unsigned long)buff;
// 	if (odd)
// 	{
// 		// #ifdef __LITTLE_ENDIAN
// 		result += (*buff << 8);
// 		// #else
// 		// 		result = *buff;
// 		// #endif
// 		len--;
// 		buff++;
// 	}
// 	if (len >= 2)
// 	{
// 		if (2 & (unsigned long)buff)
// 		{
// 			result += *(unsigned short *)buff;
// 			len -= 2;
// 			buff += 2;
// 		}
// 		if (len >= 4)
// 		{
// 			const unsigned char *end = buff + ((unsigned)len & ~3);
// 			unsigned int carry = 0;
// 			do
// 			{
// 				unsigned int w = *(unsigned int *)buff;
// 				buff += 4;
// 				result += carry;
// 				result += w;
// 				carry = (w > result);
// 			} while (buff < end);
// 			result += carry;
// 			result = (result & 0xffff) + (result >> 16);
// 		}
// 		if (len & 2)
// 		{
// 			result += *(unsigned short *)buff;
// 			buff += 2;
// 		}
// 	}
// 	if (len & 1)
// 		// #ifdef __LITTLE_ENDIAN
// 		result += *buff;
// 	// #else
// 	// 		result += (*buff << 8);
// 	// #endif
// 	result = from32to16(result);
// 	if (odd)
// 		result = ((result >> 8) & 0xff) | ((result & 0xff) << 8);
// out:
// 	return result;
// }

// static __wsum csum_partial(const void *buff, int len, __wsum wsum)
// {
// 	unsigned int sum = (unsigned int)wsum;
// 	unsigned int result = do_csum((const unsigned char *)buff, len);

// 	/* add in old sum, and carry.. */
// 	result += sum;
// 	if (sum > result)
// 		result += 1;
// 	return (__wsum)result;
// }

// #define MAX_BPF_STACK 512
// struct bpf_scratchpad
// {
// 	union
// 	{
// 		__be32 diff[MAX_BPF_STACK / sizeof(__be32)];
// 		__u8 buff[MAX_BPF_STACK];
// 	};
// };

// static int
// bpftime_csum_diff(
// 	const void *from,
// 	int from_size,
// 	const void *to,
// 	int to_size,
// 	int seed)
// {
// 	int csum_diff = -EINVAL;

// 	if ((from_size % 4 != 0) || (to_size % 4 != 0))
// 	{
// 		// size of buffers should be a multiple of 4.
// 		goto Exit;
// 	}

// 	csum_diff = seed;
// 	if (to != NULL)
// 	{
// 		for (int i = 0; i < to_size / 2; i++)
// 		{
// 			csum_diff += (uint16_t)(*((uint16_t *)to + i));
// 		}
// 	}
// 	if (from != NULL)
// 	{
// 		for (int i = 0; i < from_size / 2; i++)
// 		{
// 			csum_diff += (uint16_t)(~*((uint16_t *)from + i));
// 		}
// 	}

// 	// Adding 16-bit unsigned integers or their one's complement will produce a positive 32-bit integer,
// 	// unless the length of the buffers is so long, that the signed 32 bit output overflows and produces a negative
// 	// result.
// 	if (csum_diff < 0)
// 	{
// 		csum_diff = -EINVAL;
// 	}
// Exit:
// 	return csum_diff;
// }

// static __always_inline int compute_tcp_csum(struct iphdr *ip, struct tcphdr *tcp, void *data_end)
// {
// 	struct ipv4_psd_header psdh;
// 	uint32_t csum;
// 	int ret = 0;

// 	register __be16 before_sum = tcp->check;
// 	tcp->check = 0;
// 	csum = bpftime_csum_diff(0, 0, tcp, sizeof(struct tcphdr), 0);
// 	printf("csum: %x\n", (unsigned short)csum);
// 	psdh.src_addr = ip->saddr;
// 	psdh.dst_addr = ip->daddr;
// 	psdh.zero = 0;
// 	psdh.proto = IPPROTO_TCP;
// 	psdh.len = htons(ntohs(ip->tot_len) - sizeof(struct iphdr));
// 	printf("psdh.len: %d\n", ntohs(psdh.len));
// 	csum = bpftime_csum_diff(0, 0, &psdh, sizeof(struct ipv4_psd_header),
// 							 csum);
// 	uint32_t tcphdrlen = tcp->doff * 4;
// 	printf("csum: %x\n", (unsigned short)csum);
// 	if (tcphdrlen == sizeof(struct tcphdr))
// 	{
// 		printf("no TCP options\n");
// 		goto OUT;
// 	}

// 	/* There are TCP options */
// 	uint32_t *opt = (uint32_t *)(tcp + 1);
// 	uint32_t parsed = sizeof(struct tcphdr);
// 	for (int i = 0; i < MAX_OPT_WORDS; i++)
// 	{
// 		if ((void *)(opt + 1) > data_end)
// 		{
// 			ret = -1;
// 			goto OUT;
// 		}

// 		csum = bpftime_csum_diff(0, 0, (__be32 *)opt, sizeof(uint32_t), csum);

// 		parsed += sizeof(uint32_t);
// 		if (parsed == tcphdrlen)
// 			break;
// 		opt++;
// 	}
// 	printf("csum: %x\n", (unsigned short)csum);

// OUT:
// 	tcp->check = ~csum_reduce_helper(csum);
// 	if (before_sum != tcp->check)
// 	{
// 		printf("before in compute_tcp_csum checksum: %x, after checksum: %x\n", before_sum, tcp->check);
// 	}
// 	return ret;
// }

/* set tcp checksum: given IP header and tcp segment */
void compute_tcp_checksum(struct iphdr *pIph, unsigned short *ipPayload)
{
	register unsigned long sum = 0;
	unsigned short tcpLen = ntohs(pIph->tot_len) - (pIph->ihl << 2);
	struct tcphdr *tcphdrp = (struct tcphdr *)(ipPayload);
	// add the pseudo header
	// the source ip
	sum += (pIph->saddr >> 16) & 0xFFFF;
	sum += (pIph->saddr) & 0xFFFF;
	// the dest ip
	sum += (pIph->daddr >> 16) & 0xFFFF;
	sum += (pIph->daddr) & 0xFFFF;
	// protocol and reserved: 6
	sum += htons(IPPROTO_TCP);
	// the length
	sum += htons(tcpLen);
	DEBUG_PRINT("tcpLen: %d\n", tcpLen);
	DEBUG_PRINT("sum: %x\n", (unsigned short)sum);

	// add the IP payload
	// initialize checksum to 0
	// printf("before checksum: %x\n", tcphdrp->check);
	register __be16 before_sum = tcphdrp->check;
	tcphdrp->check = 0;
	while (tcpLen > 1)
	{
		sum += *ipPayload++;
		tcpLen -= 2;
	}
	// if any bytes left, pad the bytes and add
	if (tcpLen > 0)
	{
		// printf("+++++++++++padding, %dn", tcpLen);
		sum += ((*ipPayload) & htons(0xFF00));
	}
	DEBUG_PRINT("sum: %x\n", (unsigned short)sum);
	// Fold 32-bit sum to 16 bits: add carrier to result
	while (sum >> 16)
	{
		sum = (sum & 0xffff) + (sum >> 16);
	}
	sum = ~sum;

	// set computation result
	tcphdrp->check = (unsigned short)sum;
	if (before_sum != tcphdrp->check)
	{
		printf("before checksum: %x, after checksum: %x\n", before_sum, tcphdrp->check);
	}
}

void print_mac(unsigned char mac[6])
{
	printf("MAC address: %02x:%02x:%02x:%02x:%02x:%02x\n",
		   mac[0], mac[1], mac[2], mac[3], mac[4], mac[5]);
}

void print_ip_info(uint8_t *pkt, void *data_end)
{
	struct ethhdr *eth = (struct ethhdr *)pkt;

	// Ensure the packet is IPv4
	if (ntohs(eth->h_proto) == ETH_P_IP)
	{
		int ret;
		uint32_t tx_idx = 0;
		struct iphdr *ip = (struct iphdr *)(pkt + sizeof(struct ethhdr));

		// Print received packet information
		char src_ip[INET_ADDRSTRLEN];
		char dst_ip[INET_ADDRSTRLEN];
		inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
		inet_ntop(AF_INET, &(ip->daddr), dst_ip, INET_ADDRSTRLEN);
		DEBUG_PRINT("SRC IP: %s, DST IP: %s\n", src_ip, dst_ip);
		// ip->check = 0; // Reset checksum to 0 before recalculating
		// ip->check = compute_ip_checksum(ip);
		if (ip->protocol == IPPROTO_TCP)
		{
			// compute_tcp_csum(ip, (struct tcphdr *)(pkt + sizeof(struct ethhdr) + sizeof(struct iphdr)), data_end);
			compute_tcp_checksum(ip, (unsigned short *)(pkt + sizeof(struct ethhdr) + sizeof(struct iphdr)));
		}
	}
}

bool do_userspace_redirect_demo(uint8_t *pkt)
{
	struct ethhdr *eth = (struct ethhdr *)pkt;
	struct eth_addr mac = {0xde, 0xad, 0xbe, 0xef, 0x0, 0x0};
	struct eth_addr our_mac = mac;
	our_mac.addr[5] = 10;

	// Ensure the packet is IPv4
	if (ntohs(eth->h_proto) == ETH_P_IP)
	{
		printf("Received IPv4 packet, processing\n");
		// int ret;
		// uint32_t tx_idx = 0;
		struct iphdr *ip = (struct iphdr *)(pkt + sizeof(struct ethhdr));

		// Print received packet information
		// char addr_str[INET_ADDRSTRLEN];
		char src_ip[INET_ADDRSTRLEN];
		char dst_ip[INET_ADDRSTRLEN];
		inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
		inet_ntop(AF_INET, &(ip->daddr), dst_ip, INET_ADDRSTRLEN);
		DEBUG_PRINT("Received packet: SRC IP: %s, DST IP: %s\n", src_ip, dst_ip);

		// // Change the destination IP address to 10.0.0.3
		// if (ip->saddr == inet_addr("10.0.0.2"))
		// {
		// 	ip->daddr = inet_addr("10.0.0.3");
		// 	ip->saddr = inet_addr("10.0.0.10");
		// 	mac.addr[5] = 3;
		// 	memcpy(eth->h_dest, mac.addr, ETH_ALEN);
		// 	printf("Change the destination IP address to 10.0.0.3\n");
		// }
		// else if (ip->saddr == inet_addr("10.0.0.3"))
		// {
		// 	ip->daddr = inet_addr("10.0.0.2");
		// 	ip->saddr = inet_addr("10.0.0.10");
		// 	mac.addr[5] = 2;
		// 	memcpy(eth->h_dest, mac.addr, ETH_ALEN);
		// 	printf("Change the destination IP address to 10.0.0.2\n");
		// }
		// else
		// {
		// 	printf("Unknown source IP address, drop\n");
		// 	return false;
		// }
		// Recalculate the IP checksum
		ip->check = 0; // Reset checksum to 0 before recalculating
		ip->check = compute_ip_checksum(ip);
		// Recalculate the TCP checksum
		if (ip->protocol == IPPROTO_TCP)
			compute_tcp_checksum(ip, (unsigned short *)(pkt + sizeof(struct ethhdr) + sizeof(struct iphdr)));
	}
	// handle arp
	else if (ntohs(eth->h_proto) == ETH_P_ARP)
	{
		handle_arp(pkt, eth, our_mac);
	}
	else
	{
		printf("Unknown packet type, drop\n");
		return false;
	}

	mac.addr[5] = 10;
	memcpy(eth->h_source, mac.addr, ETH_ALEN);
	return true;
}

int redirect_ifindex = -1;

void redirect_call_back(void *data, int ifindex) {
	printf("redirect_call_back\n");
	redirect_ifindex = ifindex;
}

static bool process_packet(struct xsk_socket_info *xsk,
						   uint64_t addr, uint32_t len)
{
	uint8_t *pkt = xsk_umem__get_data(xsk->umem->buffer, addr);
	int ret;
	uint32_t tx_idx = 0;
	/* Lesson#3: Write an IPv6 ICMP ECHO parser to send responses
	 *
	 * Some assumptions to make it easier:
	 * - No VLAN handling
	 * - Only if nexthdr is ICMP
	 * - Just return all data with MAC/IP swapped, and type set to
	 *   ICMPV6_ECHO_REPLY
	 * - Recalculate the icmp checksum */
	// struct ethhdr *eth = (struct ethhdr *)pkt;
	DEBUG_PRINT("\nreceived packet %p, len %d\n", pkt, len);
	// print_ip_info(pkt, pkt + len);
	// printf("h_dest ");
	// print_mac(eth->h_dest);
	// printf("h_source ");
	// print_mac(eth->h_source);
	uint64_t bpf_ret = 0;
	struct xdp_md_userspace data;
	data.data = (uintptr_t)pkt;
	data.data_end = data.data + len;
	// /* FIXME: Start your logic from here */
	ebpf_module_run_at_handler(&data, sizeof(data), &bpf_ret);
	DEBUG_PRINT("bpf_ret: %lu\n", bpf_ret);
	switch (bpf_ret)
	{
	case XDP_DROP:
		// TODO
		return false;
	case XDP_PASS:
		// TODO
		// return true;
		// in the load balance case, we will send the packet out
		do_userspace_redirect_demo(pkt);
	case XDP_TX:
		// continue sending packet out
		break;
	case XDP_REDIRECT:
		// TODO
		return true;
	default:
		return false;
	}

	// print_ip_info(pkt, pkt + len);
	// printf("h_dest ");
	// print_mac(eth->h_dest);
	// printf("h_source ");
	// print_mac(eth->h_source);
	/* Here we sent the packet out of the receive port. Note that
	 * we allocate one entry and schedule it. Your design would be
	 * faster if you do batch processing/transmission */
	ret = xsk_ring_prod__reserve(&xsk->tx, 1, &tx_idx);
	if (ret != 1)
	{
		printf("Error sending packet\n");
		/* No more transmit slots, drop the packet */
		return false;
	}

	xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->addr = addr;
	xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->len = len;
	xsk_ring_prod__submit(&xsk->tx, 1);
	xsk->outstanding_tx++;

	xsk->stats.tx_bytes += len;
	xsk->stats.tx_packets++;
	return true;
}

static void handle_receive_packets(struct xsk_socket_info *xsk)
{
	unsigned int rcvd, stock_frames, i;
	uint32_t idx_rx = 0, idx_fq = 0;
	int ret;

	rcvd = xsk_ring_cons__peek(&xsk->rx, RX_BATCH_SIZE, &idx_rx);
	if (!rcvd)
		return;

	/* Stuff the ring with as much frames as possible */
	stock_frames = xsk_prod_nb_free(&xsk->umem->fq,
									xsk_umem_free_frames(xsk));

	if (stock_frames > 0)
	{

		ret = xsk_ring_prod__reserve(&xsk->umem->fq, stock_frames,
									 &idx_fq);

		/* This should not happen, but just in case */
		while (ret != stock_frames)
			ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd,
										 &idx_fq);

		for (i = 0; i < stock_frames; i++)
			*xsk_ring_prod__fill_addr(&xsk->umem->fq, idx_fq++) =
				xsk_alloc_umem_frame(xsk);

		xsk_ring_prod__submit(&xsk->umem->fq, stock_frames);
	}

	/* Process received packets */
	for (i = 0; i < rcvd; i++)
	{
		uint64_t addr = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx)->addr;
		uint32_t len = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx++)->len;

		if (!process_packet(xsk, addr, len))
			xsk_free_umem_frame(xsk, addr);

		xsk->stats.rx_bytes += len;
	}

	xsk_ring_cons__release(&xsk->rx, rcvd);
	xsk->stats.rx_packets += rcvd;

	/* Do we need to wake up the kernel for transmission */
	complete_tx(xsk);
}

static void rx_and_process(
	struct xsk_socket_info *xsk_socket)
{
	struct pollfd fds[2];

	memset(fds, 0, sizeof(fds));
	fds[0].fd = xsk_socket__fd(xsk_socket->xsk);
	fds[0].events = POLLIN;

	while (!global_exit)
	{
		// if (cfg->xsk_poll_mode)
		// {
		// 	ret = poll(fds, nfds, -1);
		// 	if (ret <= 0 || ret > 1)
		// 		continue;
		// }
		handle_receive_packets(xsk_socket);
	}
}

#define NANOSEC_PER_SEC 1000000000 /* 10^9 */
static uint64_t gettime(void)
{
	struct timespec t;
	int res;

	res = clock_gettime(CLOCK_MONOTONIC, &t);
	if (res < 0)
	{
		fprintf(stderr, "Error with gettimeofday! (%i)\n", res);
		exit(1);
	}
	return (uint64_t)t.tv_sec * NANOSEC_PER_SEC + t.tv_nsec;
}

static double calc_period(struct stats_record *r, struct stats_record *p)
{
	double period_ = 0;
	__u64 period = 0;

	period = r->timestamp - p->timestamp;
	if (period > 0)
		period_ = ((double)period / NANOSEC_PER_SEC);

	return period_;
}

static void stats_print(struct stats_record *stats_rec,
						struct stats_record *stats_prev)
{
	uint64_t packets, bytes;
	double period;
	double pps; /* packets per sec */
	double bps; /* bits per sec */

	char *fmt = "%-12s %'11lld pkts (%'10.0f pps)"
				" %'11lld Kbytes (%'6.0f Mbits/s)"
				" period:%f\n";

	period = calc_period(stats_rec, stats_prev);
	if (period == 0)
		period = 1;

	packets = stats_rec->rx_packets - stats_prev->rx_packets;
	pps = packets / period;

	bytes = stats_rec->rx_bytes - stats_prev->rx_bytes;
	bps = (bytes * 8) / period / 1000000;

	printf(fmt, "AF_XDP RX:", stats_rec->rx_packets, pps,
		   stats_rec->rx_bytes / 1000, bps,
		   period);

	packets = stats_rec->tx_packets - stats_prev->tx_packets;
	pps = packets / period;

	bytes = stats_rec->tx_bytes - stats_prev->tx_bytes;
	bps = (bytes * 8) / period / 1000000;

	printf(fmt, "       TX:", stats_rec->tx_packets, pps,
		   stats_rec->tx_bytes / 1000, bps,
		   period);

	printf("\n");
}

static void *stats_poll(void *arg)
{
	unsigned int interval = 2;
	struct xsk_socket_info *xsk = arg;
	static struct stats_record previous_stats = {0};

	previous_stats.timestamp = gettime();

	/* Trick to pretty printf with thousands separators use %' */
	setlocale(LC_NUMERIC, "en_US");

	while (!global_exit)
	{
		sleep(interval);
		xsk->stats.timestamp = gettime();
		stats_print(&xsk->stats, &previous_stats);
		previous_stats = xsk->stats;
	}
	return NULL;
}

int do_unload(void)
{
	struct xdp_multiprog *mp = NULL;
	int err = EXIT_FAILURE;
	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts);

	mp = xdp_multiprog__get_from_ifindex(ifindex);
	if (libxdp_get_error(mp))
	{
		fprintf(stderr, "Unable to get xdp_dispatcher program: %s\n",
				strerror(errno));
		goto out;
	}
	else if (!mp)
	{
		fprintf(stderr, "No XDP program loaded on %s\n", ifname);
		mp = NULL;
		goto out;
	}

	err = xdp_multiprog__detach(mp);
	if (err)
	{
		fprintf(stderr, "Unable to detach XDP program: %s\n",
				strerror(-err));
		goto out;
	}
out:
	xdp_multiprog__close(mp);
	return err ? 0 : 1;
}

static void exit_application(int signal)
{
	int err;

	err = do_unload();
	if (err)
	{
		fprintf(stderr, "Couldn't detach XDP program on iface '%s' : (%d)\n",
				ifname, err);
	}

	signal = signal;
	global_exit = true;
}

int main(int argc, char **argv)
{
	int ret;
	void *packet_buffer;
	uint64_t packet_buffer_size;
	DECLARE_LIBBPF_OPTS(bpf_object_open_opts, opts);
	DECLARE_LIBXDP_OPTS(xdp_program_opts, xdp_opts, 0);
	struct rlimit rlim = {RLIM_INFINITY, RLIM_INFINITY};
	struct xsk_umem_info *umem;
	struct xsk_socket_info *xsk_socket;
	pthread_t stats_poll_thread;

	verbose = 1;

	/* Global shutdown handler */
	signal(SIGINT, exit_application);

	if (argc != 2)
	{
		printf("Usage: %s <ifname>\n", argv[0]);
		return -1;
	}
	ifname = argv[1];
	ifindex = if_nametoindex(ifname);
	/* Required option */
	if (ifindex == -1)
	{
		fprintf(stderr, "ERROR: Required option --dev missing\n\n");
		return 1;
	}

	/* Allow unlimited locking of memory, so all memory needed for packet
	 * buffers can be locked.
	 */
	if (setrlimit(RLIMIT_MEMLOCK, &rlim))
	{
		fprintf(stderr, "ERROR: setrlimit(RLIMIT_MEMLOCK) \"%s\"\n",
				strerror(errno));
		exit(1);
	}

	ebpf_module_init();
	register_redirect_map_callback(0, redirect_call_back);
	printf("init eBPF runtime success\n");

	/* Allocate memory for NUM_FRAMES of the default XDP frame size */
	packet_buffer_size = NUM_FRAMES * FRAME_SIZE;
	if (posix_memalign(&packet_buffer,
					   getpagesize(), /* PAGE_SIZE aligned */
					   packet_buffer_size))
	{
		fprintf(stderr, "ERROR: Can't allocate buffer memory \"%s\"\n",
				strerror(errno));
		exit(1);
	}

	/* Initialize shared packet_buffer for umem usage */
	umem = configure_xsk_umem(packet_buffer, packet_buffer_size);
	if (umem == NULL)
	{
		fprintf(stderr, "ERROR: Can't create umem \"%s\"\n",
				strerror(errno));
		exit(1);
	}

	/* Open and configure the AF_XDP (xsk) socket */
	xsk_socket = xsk_configure_socket(umem);
	if (xsk_socket == NULL)
	{
		fprintf(stderr, "ERROR: Can't setup AF_XDP socket \"%s\"\n",
				strerror(errno));
		exit(1);
	}

	/* Start thread to do statistics display */
	if (verbose)
	{
		ret = pthread_create(&stats_poll_thread, NULL, stats_poll,
							 xsk_socket);
		if (ret)
		{
			fprintf(stderr, "ERROR: Failed creating statistics thread "
							"\"%s\"\n",
					strerror(errno));
			exit(1);
		}
	}

	/* Receive and count packets than drop them */
	rx_and_process(xsk_socket);

	/* Cleanup */
	xsk_socket__delete(xsk_socket->xsk);
	xsk_umem__delete(umem->umem);

	return 0;
}
