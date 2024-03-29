/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
#include "def.bpf.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#define ETH_P_IP 0x0800
#define ETH_P_IPV6 0x86DD

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;

	// bpf_printk("got something");

	struct ethhdr *eth = data;
	if (data + sizeof(struct ethhdr) > data_end)
		return XDP_ABORTED;

	if (bpf_ntohs(eth->h_proto) != ETH_P_IP)
		return XDP_PASS;

	struct iphdr *iph = data + sizeof(struct ethhdr);
	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) > data_end)
		return XDP_ABORTED;

	if (iph->protocol != IPPROTO_TCP)
		return XDP_PASS;

	struct tcphdr *tcph = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct tcphdr) > data_end)
		return XDP_ABORTED;
	return XDP_DROP;
}

char _license[] SEC("license") = "GPL";
