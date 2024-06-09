/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
// #include "vmlinux.h"
// #include <bpf/bpf_helpers.h>
#include "def.bpf.h"
// #include "xdp_map_access_common.h"

unsigned int ctl_array[2] = { 0, 0 };
unsigned long long cntrs_array[512] = { 0 };

static void swap_src_dst_mac(void *data)
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

int bpf_main(void *ctx_base)
{
	struct xdp_md *ctx = (struct xdp_md *)ctx_base;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	__u32 ctl_flag_pos = 0;
	__u32 cntr_pos = 0;
	__u32 *flag = &ctl_array[ctl_flag_pos];
	if (!flag || (*flag != 0)) {
		return XDP_PASS;
	};

	__u64 *cntr_val = &cntrs_array[cntr_pos];
	if (cntr_val) {
		*cntr_val += 1;
	};

	if (data + sizeof(struct ethhdr) > data_end)
		return XDP_DROP;
	swap_src_dst_mac(data);
	return XDP_TX;
}
