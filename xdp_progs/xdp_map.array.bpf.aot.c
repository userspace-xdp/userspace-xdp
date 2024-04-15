#include "def.bpf.h"

static void swap_src_dst_mac(void *data)
{
	unsigned short *p = (unsigned short *)data;
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

// struct
// {
// 	__uint(type, BPF_MAP_TYPE_HASH);
// 	__uint(max_entries, 8192);
// 	__type(key, int);
// 	__type(value, int);
// } packet_size_distribute SEC(".maps");

// use array to simulate hash map
int packet_size_distribute[8192] = {0};

inline int* bpf_map_lookup_elem(int *m, int *key)
{
	return &m[*key];
}

inline int bpf_map_update_elem(int *m, int *key, int *value, int flags)
{
	m[*key] = *value;
	return 0;
}

int bpf_main(void *ctx_base)
{
	struct xdp_md *ctx = (struct xdp_md *)ctx_base;
	unsigned char *data = (unsigned char *)(long)ctx->data;
	unsigned char *data_end = (unsigned char *)(long)ctx->data_end;
	int pkt_sz = (data_end - data);
	struct ethhdr *eth = (struct ethhdr *)data;
	u64 nh_off;

	int count = 0;
	int *value = bpf_map_lookup_elem(&packet_size_distribute, &pkt_sz);
	if (value)
		count = *value + 1;
	bpf_map_update_elem(&packet_size_distribute, &pkt_sz, &count, 0);

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return XDP_DROP;

	swap_src_dst_mac(data);
	return XDP_TX;
}

