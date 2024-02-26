#ifndef XDP_RUNTIME_H
#define XDP_RUNTIME_H

#include <stdint.h>
#include <linux/bpf.h>

#ifdef __cplusplus
extern "C" {
#endif

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
