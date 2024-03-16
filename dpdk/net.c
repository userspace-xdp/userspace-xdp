#include <rte_ip.h>
#include <rte_arp.h>
#include <rte_ethdev.h>
#include <rte_ether.h>
#include <rte_tcp.h>

#include <base.h>
#include <net-config.h>
#include <xdp-runtime.h>
#include "config.h"

static int eth_out(struct rte_mbuf *pkt_buf, uint16_t h_proto,
				   struct rte_ether_addr *dst_haddr, uint16_t iplen)
{
	/* fill the ethernet header */
	struct rte_ether_hdr *hdr =
		rte_pktmbuf_mtod(pkt_buf, struct rte_ether_hdr *);

	hdr->dst_addr = *dst_haddr;
	memcpy(&hdr->src_addr, local_mac, 6);
	hdr->ether_type = rte_cpu_to_be_16(h_proto);

	/* Print the packet */
	// pkt_dump(pkt_buf);

	/* enqueue the packet */
	pkt_buf->data_len = iplen + sizeof(struct rte_ether_hdr);
	pkt_buf->pkt_len = pkt_buf->data_len;
	dpdk_out(pkt_buf);

	return 0;
}

static void arp_reply(struct rte_mbuf *pkt, struct rte_arp_hdr *arph)
{
	arph->arp_opcode = rte_cpu_to_be_16(RTE_ARP_OP_REPLY);

	/* fill arp body */
	arph->arp_data.arp_tip = arph->arp_data.arp_sip;
	arph->arp_data.arp_sip = rte_cpu_to_be_32(local_ip);

	arph->arp_data.arp_tha = arph->arp_data.arp_sha;
	memcpy(&arph->arp_data.arp_sha, local_mac, 6);

	eth_out(pkt, RTE_ETHER_TYPE_ARP, &arph->arp_data.arp_tha,
			sizeof(struct rte_arp_hdr));
}

static void arp_in(struct rte_mbuf *pkt)
{
	struct rte_arp_hdr *arph = rte_pktmbuf_mtod_offset(
		pkt, struct rte_arp_hdr *, sizeof(struct rte_ether_hdr));

	/* process only arp for this address */
	if (rte_be_to_cpu_32(arph->arp_data.arp_tip) != local_ip)
		goto OUT;

	switch (rte_be_to_cpu_16(arph->arp_opcode))
	{
	case RTE_ARP_OP_REQUEST:
		arp_reply(pkt, arph);
		break;
	default:
		fprintf(stderr, "apr: Received unknown ARP op");
		goto OUT;
	}

	return;

OUT:
	rte_pktmbuf_free(pkt);
	return;
}

static struct rte_ether_addr *get_mac_for_ip(uint32_t ip)
{
	return &mac_addresses[(ip & 0xf) - 1];
}

static uint32_t get_target_ip(uint32_t src_ip, uint16_t src_port,
							  uint16_t dst_port)
{
	/* FIXME: Implement the load balancing policy here */
	return targets[0];
}

static void lb_in(struct rte_mbuf *pkt_buf)
{
	struct rte_ipv4_hdr *iph = rte_pktmbuf_mtod_offset(
		pkt_buf, struct rte_ipv4_hdr *, sizeof(struct rte_ether_hdr));

	/* FIXME: Use the get_target_ip function to get the target server IP */

	/* FIXME: Set the src and destination IPs */

	/* FIXME: Fix the tcp and ip checksums */
	struct rte_ipv4_hdr *ip_hdr = rte_pktmbuf_mtod_offset(pkt_buf, struct rte_ipv4_hdr *, sizeof(struct rte_ether_hdr));
	ip_hdr->hdr_checksum = 0;					   // 将IP头校验和字段置0
	ip_hdr->hdr_checksum = rte_ipv4_cksum(ip_hdr); // 计算IP头校验和

	struct rte_tcp_hdr *tcp_hdr = (struct tcp_hdr *)((unsigned char *)ip_hdr + sizeof(struct rte_ipv4_hdr));
	tcp_hdr->cksum = 0;										 // 将TCP校验和字段置0
	tcp_hdr->cksum = rte_ipv4_udptcp_cksum(ip_hdr, tcp_hdr); // 计算TCP校验和

	/* Send the packet out */
	eth_out(pkt_buf, RTE_ETHER_TYPE_IPV4, get_mac_for_ip(targets[0]),
			rte_be_to_cpu_16(iph->total_length));
}

// here we use a sightly different one than kernel
// BTF can help us
struct xdp_md_userspace
{
	uint64_t data;
	uint64_t data_end;
	uint32_t data_meta;
	uint32_t ingress_ifindex;
	uint32_t rx_queue_index;
	uint32_t egress_ifindex;
};

void eth_in(struct rte_mbuf *pkt_buf)
{
	if (!pkt_buf)
	{
		printf("skip empty packet\n");
		return;
	}
	unsigned char *payload = rte_pktmbuf_mtod(pkt_buf, unsigned char *);
	struct rte_ether_hdr *hdr = (struct rte_ether_hdr *)payload;

	uint64_t bpf_ret = 0;
	struct xdp_md_userspace data;
	data.data = (uint64_t)payload;
	data.data_end = data.data + pkt_buf->data_len;
	DEBUG_PRINT("\n\nreceived packet, send data to eBPF module %p len: %d\n", data.data, pkt_buf->data_len);

	/* FIXME: Start your logic from here */
	ebpf_module_run_at_handler(&data, sizeof(data), &bpf_ret);
	switch (bpf_ret)
	{
	case XDP_DROP:
		// TODO
		rte_pktmbuf_free(pkt_buf);
		return;
	case XDP_TX:
		DEBUG_PRINT("send packet to dpdk_out\n");
		// eth_out(pkt_buf);
		if (hdr->ether_type == rte_cpu_to_be_16(RTE_ETHER_TYPE_IPV4))
		{
			lb_in(pkt_buf);
		}
		dpdk_out(pkt_buf);
		rte_pktmbuf_free(pkt_buf);
		return;
	case XDP_PASS:
		// TODO
		break;
	case XDP_REDIRECT:
		// TODO
		break;
	default:
		return;
	}

	if (hdr->ether_type == rte_cpu_to_be_16(RTE_ETHER_TYPE_ARP))
	{
		arp_in(pkt_buf);
	}
	else if (hdr->ether_type == rte_cpu_to_be_16(RTE_ETHER_TYPE_IPV4))
	{
		lb_in(pkt_buf);
	}
	else
	{
		DEBUG_PRINT("Unknown ether type: %" PRIu16 "\n",
			   rte_be_to_cpu_16(hdr->ether_type));
		rte_pktmbuf_free(pkt_buf);
	}
}
