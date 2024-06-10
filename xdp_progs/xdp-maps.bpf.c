#include "def.bpf.h"
#include <bpf/bpf_helpers.h>

struct
{
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 8192);
	__type(key, int);
	__type(value, int);
} packet_size_distribute SEC(".maps");

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

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	int pkt_sz = data_end - data;
	struct ethhdr *eth = data;
	u64 nh_off;

	int count = 0;
	int *value = bpf_map_lookup_elem(&packet_size_distribute, &pkt_sz);
	if (value)
		count = *value + 1;
	bpf_map_update_elem(&packet_size_distribute, &pkt_sz, &count, BPF_ANY);

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return XDP_DROP;

	swap_src_dst_mac(data);
	return XDP_TX;
}

char __license[] SEC("license") = "GPL";
