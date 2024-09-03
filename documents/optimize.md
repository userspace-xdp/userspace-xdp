# possible ways of optimize userspace eBPF

## SIMD

> The eBPF instruction set aims at achieving a delicate balance between expressiveness and cross-platform compatibility, as the Just-In-Time compiler efficiently compile eBPF instructions into native instructions on many platforms.

> SIMD is supported by many CPUs on the two most common architectures (amd64 and arm64).
> However, if SIMD instructions are added into eBPF instructions, the JIT compiler on other CPUs not supporting SIMD must “emulate” these instructions, possibly with minor performance penalty.

Now:

- Current AOT compiler of bpftime can generate LLVM IR code/Native code from eBPF bytecode
- The runtime can directly load the native ELF code and run it as a AOTed eBPF program

However, the llvm byte code generated from eBPF bytecode is missing some type information, which is needed for SIMD optimization.

Solutions:

- Find some ways to add type informations to llvm IR code. Maybe working because the type like `xdp_md` is fixed. We can simpilfy it and don't directly work from BTF.
  - C -> eBPF bytecode -> LLVM IR -> LLVM IR with type information -> Native code(SIMD) ELF -> Load with AOT runtime
- Another approach is after verfying the LLVM IR code, we transform and relocated the original eBPF C code, and directly compile it with clang.
  - C -> eBPF bytecode -> verified -> C with some changes for relocation on AST level -> clang -> Native code ELF(SIMD) -> Load with AOT runtime. This is used by eBPF for windows(They have a bpf2c tool), and can be easily implemented and SIMDed.
  - We have example of this, it is working(See `sumd-poc`)
  - We can also verified and make some code into native library, like the hash function.

C[1] -> eBPF bytecode[2] -> LLVM IR[3] -> In JIT compiler and runtime[4] (dpdk_llvm_jit)
C[1] -> eBPF bytecode[2] -> LLVM IR[3] -> opt and llc[5] -> Load in AOT runtime[6](dpdk_llvm_base)
C[1] -> Source code transform[7] -> LLVM IR with more type information[8] -> Compare and add to the LLVM IR from bytecode[9] -> opt and llc[7] -> Load in AOT runtime[8] (dpdk_llvm_add type)

Given a eBPF code:

```c
#define BPF_NO_GLOBAL_DATA
#include <vmlinux.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>

SEC("uprobe/./victim:target_func")
int do_uprobe_trace(struct pt_regs *ctx)
{
 bpf_printk("target_func called.\n");
 return 0;
}

char LICENSE[] SEC("license") = "GPL";
```

The native C code after relocation is like:

```c
int _bpf_helper_ext_0006(char* arg0);

int bpf_main(void *ctx)
{
    _bpf_helper_ext_0006("target_func called.\n");
    return 0;
}
```

Compile it with `clang -O3 -c -o do_uprobe_trace.o do_uprobe_trace.c`, and you can load it with AOT runtime.

## Penalty for helper calls

> Calling eBPF helper functions leads to a significant performance penalty, likely due to register variables being stashed prior to making any such calls, similar to when a user-space program performs a syscall. However, it is possible to avoid the penalty for function calls. Calls into simple functions can be inlined during compilation, which eliminates the need for stashing.

> Furthermore, user-space high-performance network programs (e.g., DPDK-based programs) can be linked statically and benefit from link-time optimization (LTO). It might also be possible for the eBPF JIT compiler to perform an optimization similar to inlining/LTO, such that the "call" instruction to simple helper procedures can be translated directly into the body of the helper function.

Solution:

- helper calls can be inlined during AOT compilation. This is working with some examples.
  - link the build eBPF code with helper functions first, and the load it with AOT runtime.
- LTO and pgo can be applied to userspace runtime and eBPF code.
  - The native ELF or c code can be easily optimized with LTO and pgo.

## for csum example, the `perf -g` res

The code:

```c
#include "def.bpf.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#define LOOP_LEN 32
#define ETH_P_IP 0x0800
#define ETH_P_IPV6 0x86DD

struct {
 __uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
 __type(key, u32);
 __type(value, long);
 __uint(max_entries, 256);
} rxcnt SEC(".maps");

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

static __always_inline __u16 csum_fold_helper(__u32 csum)
{
 return ~((csum & 0xffff) + (csum >> 16));
}

static __always_inline void ipv4_csum(void *data_start, int data_size,
          __u32 *csum)
{
 *csum = bpf_csum_diff(0, 0, data_start, data_size, *csum);
 *csum = csum_fold_helper(*csum);
}

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
 void *data_end = (void *)(long)ctx->data_end;
 void *data = (void *)(long)ctx->data;
 struct ethhdr *eth = data;
 struct iphdr *iph;
 int rc = XDP_PASS;
 long *value;
 u16 h_proto;
 u64 nh_off;
 u32 dummy_int = 23;
 __u32 csum = 0;
 int i = 0;
 // bpf_printk("received packet %p %p\n", data, data_end);
 nh_off = sizeof(*eth);
 if (data + nh_off > data_end)
  return rc;

 h_proto = eth->h_proto;
 
 if (h_proto != bpf_htons(ETH_P_IP))
  return rc;

 iph = data + nh_off;
 // bpf_printk("iph->protocol\n");
 nh_off +=sizeof(*iph);
 if (data + nh_off  > data_end)
  return rc;
 
 for (i = 0; i < LOOP_LEN ;i++){
  ipv4_csum(iph, sizeof(struct iphdr), &csum);
  iph->check = csum;
  value = bpf_map_lookup_elem(&rxcnt, &dummy_int);
 }
 // bpf_printk("csum: %d\n", csum);

 value = bpf_map_lookup_elem(&rxcnt, &dummy_int);
 if (value)
  *value += 1;
 swap_src_dst_mac(data);
 rc = XDP_TX;
 return rc;
}


char _license[] SEC("license") = "GPL";
```

run in userspace:

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_csum enp24s0f1np1 xdp-ebpf-new/base.btf
```

Generate traffic with 1 thread, icmp traffic for ipv4.

kernel XDP:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/xdp_progs/xdp_csum enp24s0f1np1
```

- Native mode: Rx 1,031,770 Tx 47,924,864
- SKB mode: Rx 1,732,224 Tx 47,519,104

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1 -N`, llvm jit(With LTO): Rx 762,048 Tx 48,282,112

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(With LTO): Rx  1,310,560 Tx 46,579,712

Record the events with perf:

```sh
sudo -E LD_LIBRARY_PATH=/path/to/repo/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:afxdp/lib/xdp-tools/lib/libxdp/ /home/yunwei/linux/tools/perf/perf record -g dpdk/build/l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
```

Results:

```txt
Samples: 70K of event 'cycles:P', Event count (approx.): 54017267584
  Children      Self  Command          Shared Object            Symbol
+   32.74%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780ce
+   32.30%    30.63%  l2fwd            l2fwd-static             [.] bpftime_csum_diff
+   21.24%    11.39%  l2fwd            l2fwd-static             [.] bpftime::per_cpu_array_map_impl::elem_lookup(void const
+   13.32%    10.99%  l2fwd            l2fwd-static             [.] map_ptr_by_fd
+   12.04%    10.81%  l2fwd            l2fwd-static             [.] bpftime::bpf_map_handler::map_lookup_elem(void const*,
+    9.47%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780b1
+    9.23%     7.51%  l2fwd            l2fwd-static             [.] std::_Function_handler<void* (int), bpftime::per_cpu_ar
+    8.70%     7.41%  l2fwd            l2fwd-static             [.] bpftime_map_lookup_elem_helper
+    4.11%     2.88%  l2fwd            libc.so.6                [.] sched_getcpu
+    3.89%     0.00%  l2fwd            [unknown]                [k] 0000000000000000
+    2.28%     2.28%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780af
+    2.10%     1.47%  l2fwd            l2fwd-static             [.] std::_Function_handler<void* (int), bpftime::per_cpu_ar
+    1.68%     0.40%  l2fwd            l2fwd-static             [.] l2fwd_launch_one_lcore.cold
+    1.68%     1.64%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327808c
+    1.42%     1.22%  l2fwd            l2fwd-static             [.] sched_getcpu@plt
+    1.36%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327810b
+    1.28%     0.01%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327809b
+    1.27%     1.27%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d73278098
+    1.24%     1.24%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780cc
+    1.24%     1.24%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780bc
+    1.24%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780bf
+    1.14%     1.12%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327807a
+    1.12%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327807c
+    1.08%     0.00%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327808e
+    1.07%     0.00%  l2fwd            [kernel.kallsyms]        [k] entry_SYSCALL_64_after_hwframe
+    1.07%     0.00%  l2fwd            [kernel.kallsyms]        [k] do_syscall_64
+    0.97%     0.97%  l2fwd            l2fwd-static             [.] rxq_cq_process_v
+    0.91%     0.04%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d7327803a
+    0.87%     0.87%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d73278035
+    0.76%     0.01%  l2fwd            libc.so.6                [.] read
     0.75%     0.45%  l2fwd            [JIT] tid 1177142        [.] 0x00007f5d732780db
+    0.74%     0.00%  l2fwd            [kernel.kallsyms]        [k] __x64_sys_read
```

## reference

- <https://engineering.purdue.edu/~xiaoqic/documents/draft-eBPF.pdf>
