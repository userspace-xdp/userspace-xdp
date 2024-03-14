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

	struct event e;

	e.len = data_end - data;
	bpf_probe_read(&e.data, e.len, data);

	bpf_ringbuf_output(&ringbuf, &e, sizeof(e), 0);

	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";