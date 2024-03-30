// SPDX-License-Identifier: GPL-2.0
/* Copyright (c) 2019, Oracle and/or its affiliates. All rights reserved. */
#define BPF_NO_GLOBAL_DATA

#include "def.bpf.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#define ICMP_ECHOREPLY		0	/* Echo Reply			*/
#define ICMP_DEST_UNREACH	3	/* Destination Unreachable	*/
#define ICMP_SOURCE_QUENCH	4	/* Source Quench		*/
#define ICMP_REDIRECT		5	/* Redirect (change route)	*/
#define ICMP_ECHO		8	/* Echo Request			*/
#define ICMP_TIME_EXCEEDED	11	/* Time Exceeded		*/
#define ICMP_PARAMETERPROB	12	/* Parameter Problem		*/
#define ICMP_TIMESTAMP		13	/* Timestamp Request		*/
#define ICMP_TIMESTAMPREPLY	14	/* Timestamp Reply		*/
#define ICMP_INFO_REQUEST	15	/* Information Request		*/
#define ICMP_INFO_REPLY		16	/* Information Reply		*/
#define ICMP_ADDRESS		17	/* Address Mask Request		*/
#define ICMP_ADDRESSREPLY	18	/* Address Mask Reply		*/
#define NR_ICMP_TYPES		18

#define ETH_P_IP 0x0800
#define ETH_P_IPV6 0x86DD


#include "xdping.h"

struct {
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 256);
	__type(key, __u32);
	__type(value, struct pinginfo);
} ping_map SEC(".maps");

static __always_inline void swap_src_dst_mac(void *data)
{
	unsigned short *p = data;
	unsigned short dst[3];

	dst[0] = p[0];
	dst[1] = p[1];
	dst[2] = p[2];
	p[0] = p[3];
	p[1] = p[4];
	p[2] = p[5];
	p[3] = dst[0];
	p[4] = dst[1];
	p[5] = dst[2];
}

static __always_inline __u16 csum_fold_helper(__wsum sum)
{
	sum = (sum & 0xffff) + (sum >> 16);
	return ~((sum & 0xffff) + (sum >> 16));
}

static __always_inline __u16 ipv4_csum(void *data_start, int data_size)
{
	__wsum sum;

	sum = bpf_csum_diff(0, 0, data_start, data_size, 0);
	return csum_fold_helper(sum);
}

#define ICMP_ECHO_LEN		64
#define ICMP_TEST_TYPE		99


static __always_inline int icmp_check(struct xdp_md *ctx, int type)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;
	struct icmphdr *icmph;
	struct iphdr *iph;
	// bpf_printk("icmp_check\n");
	if (data + sizeof(*eth) + sizeof(*iph) + ICMP_ECHO_LEN > data_end)
		return XDP_PASS;
	// bpf_printk("icmp_check ICMP_ECHO_LEN > data_end\n");
	if (eth->h_proto != bpf_htons(ETH_P_IP))
		return XDP_PASS;
	// bpf_printk("eth->h_proto\n");
	iph = data + sizeof(*eth);

	if (iph->protocol != IPPROTO_ICMP)
		return XDP_PASS;
	// bpf_printk("iph->protocol\n");
	// if (bpf_ntohs(iph->tot_len) - sizeof(*iph) != ICMP_ECHO_LEN)
	// 	return XDP_PASS;
	// bpf_printk("iph->tot_len\n");
	icmph = data + sizeof(*eth) + sizeof(*iph);
	// bpf_printk("icmph %p", icmph);
	// return XDP_PASS;
	if (&(icmph->type) > data_end) {
		bpf_printk("XDP_PASS for invalid icmp\n");
		return XDP_PASS;
	}
	// bpf_printk("icmph->type %d\n", icmph->type);
	// if (icmph->type != type)
	// 	return XDP_PASS;
	// bpf_printk("XDP_TX icmp\n");
	return XDP_TX;
}

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;
	struct icmphdr *icmph;
	struct iphdr *iph;
	__be32 raddr;
	int ret;
	// bpf_printk("get data %p %p\n", data, ctx->data_end);

	ret = icmp_check(ctx, ICMP_ECHO);
	if (ret != XDP_TX)
		return ret;
	iph = data + sizeof(*eth);
	icmph = data + sizeof(*eth) + sizeof(*iph);
	raddr = iph->saddr;
	/* Now convert request into echo reply. */
	swap_src_dst_mac(data);
	iph->saddr = iph->daddr;
	iph->daddr = raddr;
	icmph->type = ICMP_ECHOREPLY;
	icmph->checksum = 0;
	icmph->checksum = ipv4_csum(icmph, ICMP_ECHO_LEN);
	// bpf_printk("XDP_TX icmp\n");
	return XDP_TX;
}

SEC("xdp")
int xdping_client(struct xdp_md *ctx)
{
// 	void *data = (void *)(long)ctx->data;
// 	struct pinginfo *pinginfo = NULL;
// 	struct ethhdr *eth = data;
// 	struct icmphdr *icmph;
// 	struct iphdr *iph;
// 	__u64 recvtime;
// 	__be32 raddr;
// 	__be16 seq;
// 	int ret;
// 	__u8 i;

// 	ret = icmp_check(ctx, ICMP_ECHOREPLY);

// 	if (ret != XDP_TX)
// 		return ret;

// 	iph = data + sizeof(*eth);
// 	icmph = data + sizeof(*eth) + sizeof(*iph);
// 	raddr = iph->saddr;

// 	/* Record time reply received. */
// 	recvtime = bpf_ktime_get_ns();
// 	pinginfo = bpf_map_lookup_elem(&ping_map, &raddr);
// 	if (!pinginfo || pinginfo->seq != icmph->un.echo.sequence)
// 		return XDP_PASS;

// 	if (pinginfo->start) {
// #pragma clang loop unroll(full)
// 		for (i = 0; i < XDPING_MAX_COUNT; i++) {
// 			if (pinginfo->times[i] == 0)
// 				break;
// 		}
// 		/* verifier is fussy here... */
// 		if (i < XDPING_MAX_COUNT) {
// 			pinginfo->times[i] = recvtime -
// 					     pinginfo->start;
// 			pinginfo->start = 0;
// 			i++;
// 		}
// 		/* No more space for values? */
// 		if (i == pinginfo->count || i == XDPING_MAX_COUNT)
// 			return XDP_PASS;
// 	}

// 	/* Now convert reply back into echo request. */
// 	swap_src_dst_mac(data);
// 	iph->saddr = iph->daddr;
// 	iph->daddr = raddr;
// 	icmph->type = ICMP_ECHO;
// 	seq = bpf_htons(bpf_ntohs(icmph->un.echo.sequence) + 1);
// 	icmph->un.echo.sequence = seq;
// 	icmph->checksum = 0;
// 	icmph->checksum = ipv4_csum(icmph, ICMP_ECHO_LEN);

// 	pinginfo->seq = seq;
// 	pinginfo->start = bpf_ktime_get_ns();

	return XDP_TX;
}

char _license[] SEC("license") = "GPL";
