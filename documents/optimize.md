# possible ways of optimize userspace eBPF

## SIMD

The eBPF instruction set aims at achieving a delicate balance
between expressiveness and cross-platform compatibility, as the
Just-In-Time compiler efficiently compile eBPF instructions into
native instructions on many platforms. 

SIMD is supported by many
CPUs on the two most common architectures (amd64 and arm64).
However, if SIMD instructions are added into eBPF instructions, the
JIT compiler on other CPUs not supporting SIMD must “emulate”
these instructions, possibly with minor performance penalty.

Now:

- Current AOT compiler of bpftime can generate LLVM IR code/Native code from eBPF bytecode
- The runtime can directly load the native ELF code and run it as a AOTed eBPF program

However, the llvm byte code generated from eBPF bytecode is missing some type information, which is needed for SIMD optimization.

Solutions:

- Find some ways to add type informations to llvm IR code. Maybe working because the type like `xdp_md` is fixed. We can simpilfy it and don't directly work from BTF.
  - C -> eBPF bytecode -> LLVM IR -> LLVM IR with type information -> Native code(SIMD) ELF -> Load with AOT runtime
- Another approach is after verfying the LLVM IR code, we transform and relocated the original eBPF C code, and directly compile it with clang.
  - C -> eBPF bytecode -> verified -> C with some changes for relocation -> clang -> Native code ELF(SIMD) -> Load with AOT runtime. This is used by eBPF for windows(They have a bpf2c tool), and can be easily implemented and SIMDed.
  - We have example of this, it is working(See `sumd-poc`)
  - We can also verified and make some code into native library, like the hash function.

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

Calling eBPF helper
functions leads to a significant performance penalty, likely due to
register variables being stashed prior to making any such calls,
similar to when a user-space program performs a syscall. However,
it is possible to avoid the penalty for function calls. Calls into simple functions can be inlined during compilation, which eliminates
the need for stashing.

Furthermore, user-space high-performance
network programs (e.g., DPDK-based programs) can be linked statically and benefit from link-time optimization (LTO). It might also
be possible for the eBPF JIT compiler to perform an optimization
similar to inlining/LTO, such that the "call" instruction to simple
helper procedures can be translated directly into the body of the
helper function.

Solution:

- helper calls can be inlined during AOT compilation. This is working with some examples.
  - link the build eBPF code with helper functions first, and the load it with AOT runtime.
- LTO and pgo can be applied to userspace runtime and eBPF code.
  - The native ELF or c code can be easily optimized with LTO and pgo.

## for csum example, the `perf -g` res

```txt
+   40.92%     0.01%  xdpsock  [kernel.kallsyms]     [k] entry_SYSCALL_64_after_hwframe
+   40.92%     0.06%  xdpsock  libc.so.6             [.] __libc_sendto
+   40.91%     0.01%  xdpsock  [kernel.kallsyms]     [k] do_syscall_64
+   40.75%     0.00%  xdpsock  [kernel.kallsyms]     [k] __x64_sys_sendto
+   40.73%     0.05%  xdpsock  [kernel.kallsyms]     [k] __sys_sendto
+   40.60%     0.01%  xdpsock  [kernel.kallsyms]     [k] sock_sendmsg
+   40.55%     0.01%  xdpsock  [kernel.kallsyms]     [k] xsk_sendmsg
+   40.53%     0.10%  xdpsock  [kernel.kallsyms]     [k] __xsk_sendmsg.constprop.0.isra.0
+   39.98%     4.84%  xdpsock  [kernel.kallsyms]     [k] __xsk_generic_xmit
+   21.56%     0.00%  xdpsock  [JIT] tid 755845      [.] 0x00007fca9f84c0ce
+   19.56%    18.12%  xdpsock  xdpsock               [.] bpftime_csum_diff
+   19.25%    13.19%  xdpsock  xdpsock               [.] bpftime::bpf_map_handler::map_lookup_elem(void const
+   12.68%     1.68%  xdpsock  [kernel.kallsyms]     [k] sock_alloc_send_pskb
+   10.69%     0.78%  xdpsock  [kernel.kallsyms]     [k] __dev_direct_xmit
+    7.92%     0.33%  xdpsock  [kernel.kallsyms]     [k] alloc_skb_with_frags
+    7.54%     7.13%  xdpsock  [kernel.kallsyms]     [k] __raw_spin_lock_irqsave
+    7.53%     0.06%  xdpsock  [kernel.kallsyms]     [k] _raw_spin_lock_irqsave
+    7.29%     5.83%  xdpsock  xdpsock               [.] map_ptr_by_fd
+    7.01%     1.21%  xdpsock  [kernel.kallsyms]     [k] __alloc_skb
```

## reference

- https://engineering.purdue.edu/~xiaoqic/documents/draft-eBPF.pdf