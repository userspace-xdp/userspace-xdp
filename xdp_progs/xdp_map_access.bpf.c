/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

#include "xdp_map_access_common.h"


int counter = 0;

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;
	struct dummy_key key = {0};
	int rc = XDP_PASS;
	long *value;
	u16 h_proto;
	u64 nh_off;
	long dummy_value = 1;

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return rc;

//	swap_src_dst_mac(data);
//	rc = XDP_TX;

	h_proto = eth->h_proto;
	key.key = 23;
	
	counter++;
	bpf_printk("counter %d\n", counter);
	return rc;
}

char _license[] SEC("license") = "GPL";
