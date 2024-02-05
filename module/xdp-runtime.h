#ifndef XDP_RUNTIME_H
#define XDP_RUNTIME_H

#include <stdint.h>
#include <linux/bpf.h>

// run the eBPF program(s) for xdp
int ebpf_module_run_at_handler(void *mem, uint64_t mem_size,
                                     uint64_t *ret);
// init the runtime context
int ebpf_module_init();

#endif
