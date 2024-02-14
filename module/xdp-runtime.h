#ifndef XDP_RUNTIME_H
#define XDP_RUNTIME_H

#include <stdint.h>
#include <linux/bpf.h>

// run the eBPF program(s) for xdp
int ebpf_module_run_at_handler(void *mem, uint64_t mem_size,
                                     uint64_t *ret);
// init the runtime context
int ebpf_module_init();

uint64_t bpftime_csum_diff(uint64_t r1, uint64_t from_size, uint64_t r3, uint64_t to_size, uint64_t seed);

#endif
