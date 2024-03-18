/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
#include "def.bpf.h"

static inline void swap_src_dst_mac(void *data)
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

inline int xdp_pass(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;
	int rc;
	u64 nh_off;
	long dummy_value = 1;

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return rc;

	swap_src_dst_mac(data);

	return XDP_TX;
}

int batch_xdp_pass(struct xdp_md *ctx_array[], int array_size) {
	// test vectorization
	for (int i = 0; i < array_size; i++) {
		xdp_pass(ctx_array[i]);
	}
	return XDP_TX;
}
