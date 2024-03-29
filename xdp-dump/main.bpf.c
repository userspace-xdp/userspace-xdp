#include "def.bpf.h"
#include <bpf/bpf_endian.h>
#include <bpf/bpf_helpers.h>
#include "main.h"

struct
{
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 256 * 1024);
} ringbuf SEC(".maps");

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;
	struct event e = {0};

	e.len = data_end - data;
	unsigned int load_size = e.len > 256 ? 256 : e.len;
	if (load_size < 14)
		return XDP_PASS;
	bpf_xdp_load_bytes(ctx, 0, e.data, load_size);

	bpf_ringbuf_output(&ringbuf, &e, sizeof(e), 0);

	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";