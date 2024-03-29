#include "vmlinux.h"
#include <bpf/bpf_helpers.h>

struct
{
	__uint(type, BPF_MAP_TYPE_HASH);
	__uint(max_entries, 8192);
	__type(key, int);
	__type(value, int);
} packet_size_distribute SEC(".maps");

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	int pkt_sz = data_end - data;

	bpf_printk("recived packet\n");
	int count = 0;
	int *value = bpf_map_lookup_elem(&packet_size_distribute, &pkt_sz);
	if (value)
		count = *value + 1;
	bpf_map_update_elem(&packet_size_distribute, &pkt_sz, &count, BPF_ANY);
	bpf_printk("already recived %d packets for size %d\n", count, pkt_sz);
	return XDP_PASS;
}

char __license[] SEC("license") = "GPL";
