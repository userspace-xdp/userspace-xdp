#ifndef XDP_RUNTIME_H
#define XDP_RUNTIME_H

#include <stdint.h>
#include <linux/bpf.h>

#ifdef __cplusplus
extern "C" {
#endif

struct xdp_md_userspace
{
	__u64 data;
	__u64 data_end;
	__u32 data_meta;
	__u32 ingress_ifindex;
	__u32 rx_queue_index;
	__u32 egress_ifindex;
	// additional fields
	__u64 buffer_start; // record the start of the available buffer
	__u64 buffer_end; // record the end of the available buffer
};

typedef void (*redirect_call_back_func)(void *data, int ifindex);

// run the eBPF program(s) for xdp
int ebpf_module_run_at_handler(void *mem, uint64_t mem_size,
                                     uint64_t *ret);
// init the runtime context
int ebpf_module_init();

void register_redirect_map_callback(int map_id, redirect_call_back_func cb);

#ifdef __cplusplus
}
#endif

#endif
