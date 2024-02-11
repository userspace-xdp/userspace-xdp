#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/udp.h>
#include <netinet/in.h>

#include <bpf/bpf_helpers.h>
#include <linux/bpf.h>

#include "common.h"

#define MAX_OPT_WORDS 10 // 40 bytes for options
#define MAX_TARGET_COUNT 64
#define CHECK_OUT_OF_BOUNDS(PTR, OFFSET, END)                                  \
	(((void *)PTR) + OFFSET > ((void *)END))

struct ipv4_psd_header {
	uint32_t src_addr; /* IP address of source host. */
	uint32_t dst_addr; /* IP address of destination host. */
	uint8_t zero;	   /* zero. */
	uint8_t proto;	   /* L4 protocol type. */
	uint16_t len;	   /* L4 length. */
};

/**
 * Map that holds the information for the target servers
 * You can assume that this map will always have two elements populated when
 * loading the XDP program
 */
struct {
	__uint(type, BPF_MAP_TYPE_ARRAY);
	__type(key, __u32);
	__type(value, struct ip_mac_pair);
	__uint(max_entries, MAX_TARGET_COUNT);
} targets_map SEC(".maps");

/**
 * Map that holds the IP and MAC address of the load balancer and the client.
 * The IP and MAC of the load balancer are in the first cell
 * and the information for the client are in the second cell.
 * This map is also populated when loading the XDP program.
 */
struct {
	__uint(type, BPF_MAP_TYPE_ARRAY);
	__type(key, __u32);
	__type(value, struct ip_mac_pair);
	__uint(max_entries, MAX_TARGET_COUNT);
} config_map SEC(".maps");

#if 0 // You might want to use functions below to compute the TCP checksum
/**
 * Helper function for computing checksum
 */
static __always_inline __u16 csum_reduce_helper(__u32 csum)
{
	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);
	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);

	return csum;
}

/**
 * Compute the checksum for tcp header
 */
static __always_inline int compute_tcp_csum(struct iphdr *ip, struct tcphdr *tcp, void * data_end)
{
  struct ipv4_psd_header psdh;
  uint32_t csum;
  int ret = 0;

  tcp->check = 0;
  csum = bpf_csum_diff(0, 0, (__be32 *)tcp, sizeof(struct tcphdr), 0);
  psdh.src_addr = ip->saddr;
	psdh.dst_addr = ip->daddr;
	psdh.zero = 0;
	psdh.proto = IPPROTO_TCP;
	psdh.len = htons(ntohs(ip->tot_len) - sizeof(struct iphdr));
	csum = bpf_csum_diff(0, 0, (__be32*)&psdh, sizeof(struct ipv4_psd_header),
			csum);
  uint32_t tcphdrlen = tcp->doff * 4;

  if (tcphdrlen == sizeof(struct tcphdr))
    goto OUT;

  /* There are TCP options */
  uint32_t *opt = (uint32_t *)(tcp + 1);
  uint32_t parsed = sizeof(struct tcphdr);
  for (int i=0;i<MAX_OPT_WORDS;i++) {
    if ((void *)(opt + 1) > data_end) {
      ret = -1;
      goto OUT;
    }

    csum = bpf_csum_diff(0, 0, (__be32 *)opt, sizeof(uint32_t), csum);

    parsed += sizeof(uint32_t);
    if (parsed == tcphdrlen)
      break;
    opt++;
  }

OUT:
  tcp->check = ~csum_reduce_helper(csum);
  return ret;
}
#endif

SEC("xdp")
int xdp_lb(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	if (CHECK_OUT_OF_BOUNDS(data, sizeof(struct ethhdr), data_end))
		return XDP_DROP;

	struct iphdr *ip = data + sizeof(struct ethhdr);
	if (CHECK_OUT_OF_BOUNDS(ip, sizeof(struct iphdr), data_end))
		return XDP_DROP;

	/* FIXME: Implement the load balancer logic below */
	/* Remove the ICMP filter presented here for demonstration purposes*/
	if (ip->protocol == IPPROTO_ICMP)
		return XDP_DROP;

	return XDP_PASS;
}

char LICENSE[] SEC("license") = "GPL";
