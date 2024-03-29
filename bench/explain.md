# some questions:

## Why llvm jit is slower than ubpf jit?

It does slower.

```console

$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 1000000 JIT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 1000000 with run type JIT
[2024-03-27 22:23:51.801] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-03-27 22:23:51.801] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
[2024-03-27 22:23:51.801] [info] [llvm_jit_context.cpp:81] Initializing llvm
Time taken: 1242 ns
Return value: 3
INFO [3984829]: Global shm destructed
yunwei@octopus3:~/ebpf-xdp-dpdk$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/tools/bpftimetool/bpftimetool export /tmp/a.json
[2024-03-27 22:24:05.089] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-03-27 22:24:05.090] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
[2024-03-27 22:24:05.090] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=rxcnt found at 4
[2024-03-27 22:24:05.090] [info] [bpftime_shm_json.cpp:265] find prog fd=5 name=xdp_pass
INFO [3984877]: Global shm destructed
yunwei@octopus3:~/ebpf-xdp-dpdk$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-
xdp-dpdk/documents/benchmark/icmp.bin 1000000 JIT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 1000000 with run type JIT
[2024-03-27 22:24:13.082] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-03-27 22:24:13.083] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
Time taken: 784 ns
Return value: 3
INFO [3984906]: Global shm destructed
yunwei@octopus3:~/ebpf-xdp-dpdk$ 

```

The code of llvm JITed(dump by AOT without optimization):

```
$ objdump -S  ./xdp_pass.o

./xdp_pass.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <bpf_main>:
   0:   41 57                   push   %r15
   2:   41 56                   push   %r14
   4:   41 54                   push   %r12
   6:   53                      push   %rbx
   7:   50                      push   %rax
   8:   4c 8b 37                mov    (%rdi),%r14
   b:   48 8b 4f 08             mov    0x8(%rdi),%rcx
   f:   4d 8d 7e 0e             lea    0xe(%r14),%r15
  13:   b8 02 00 00 00          mov    $0x2,%eax
  18:   49 39 cf                cmp    %rcx,%r15
  1b:   77 7a                   ja     97 <bpf_main+0x97>
  1d:   66 41 83 7e 0c 08       cmpw   $0x8,0xc(%r14)
  23:   75 72                   jne    97 <bpf_main+0x97>
  25:   49 8d 56 22             lea    0x22(%r14),%rdx
  29:   48 39 ca                cmp    %rcx,%rdx
  2c:   77 69                   ja     97 <bpf_main+0x97>
  2e:   41 bc 1f 00 00 00       mov    $0x1f,%r12d
  34:   45 31 c0                xor    %r8d,%r8d
  37:   bb 1f 00 00 00          mov    $0x1f,%ebx
  3c:   0f 1f 40 00             nopl   0x0(%rax)
  40:   b9 14 00 00 00          mov    $0x14,%ecx
  45:   31 ff                   xor    %edi,%edi
  47:   31 f6                   xor    %esi,%esi
  49:   4c 89 fa                mov    %r15,%rdx
  4c:   e8 00 00 00 00          call   51 <bpf_main+0x51>
  51:   89 c1                   mov    %eax,%ecx
  53:   c1 e9 10                shr    $0x10,%ecx
  56:   48 01 c1                add    %rax,%rcx
  59:   48 f7 d1                not    %rcx
  5c:   66 41 89 4f 0a          mov    %cx,0xa(%r15)
  61:   44 0f b7 c1             movzwl %cx,%r8d
  65:   48 ff cb                dec    %rbx
  68:   45 85 e4                test   %r12d,%r12d
  6b:   49 89 dc                mov    %rbx,%r12
  6e:   75 d0                   jne    40 <bpf_main+0x40>
  70:   41 8b 06                mov    (%r14),%eax
  73:   41 0f b7 4e 06          movzwl 0x6(%r14),%ecx
  78:   66 41 89 0e             mov    %cx,(%r14)
  7c:   41 8b 4e 08             mov    0x8(%r14),%ecx
  80:   41 0f b7 56 04          movzwl 0x4(%r14),%edx
  85:   41 89 4e 02             mov    %ecx,0x2(%r14)
  89:   66 41 89 56 0a          mov    %dx,0xa(%r14)
  8e:   41 89 46 06             mov    %eax,0x6(%r14)
  92:   b8 03 00 00 00          mov    $0x3,%eax
  97:   48 83 c4 08             add    $0x8,%rsp
  9b:   5b                      pop    %rbx
  9c:   41 5c                   pop    %r12
  9e:   41 5e                   pop    %r14
  a0:   41 5f                   pop    %r15
  a2:   c3                      ret    
yunwei@octopus3:~/ebpf-xdp-dpdk$ 
```

Dump in kernel code:

```sh
$ sudo bpftool prog dump jited id 1536
int xdp_pass(struct xdp_md * ctx):
bpf_prog_034a2390f7a2b578_xdp_pass:
; int xdp_pass(struct xdp_md *ctx)
   0:   nopl    (%rax,%rax)
   5:   nop
   7:   pushq   %rbp
   8:   movq    %rsp, %rbp
   b:   pushq   %rbx
   c:   pushq   %r13
   e:   pushq   %r14
  10:   pushq   %r15
  12:   movl    $2, %eax
; void *data_end = (void *)(long)ctx->data_end;
  17:   movq    8(%rdi), %rsi
; void *data = (void *)(long)ctx->data;
  1b:   movq    (%rdi), %r13
; if (data + nh_off > data_end)
  1f:   movq    %r13, %rbx
  22:   addq    $14, %rbx
; if (data + nh_off > data_end)
  26:   cmpq    %rsi, %rbx
  29:   ja      0xe0
; h_proto = eth->h_proto;
  2f:   movzwq  12(%r13), %rdi
; if (h_proto != bpf_htons(ETH_P_IP))
  34:   cmpq    $8, %rdi
  38:   jne     0xe0
  3e:   movq    %r13, %rdi
  41:   addq    $34, %rdi
  45:   cmpq    %rsi, %rdi
  48:   ja      0xe0
  4e:   xorl    %r8d, %r8d
  51:   movl    $32, %r14d
  57:   movl    $4294901760, %r15d
; *csum = bpf_csum_diff(0, 0, data_start, data_size, *csum);
  5d:   xorl    %edi, %edi
  5f:   xorl    %esi, %esi
  61:   movq    %rbx, %rdx
  64:   movl    $20, %ecx
  69:   callq   0xffffffffd67da26c
  6e:   movq    %rax, %r8
  71:   andq    %r15, %r8
; return ~((csum & 0xffff) + (csum >> 16));
  74:   shrq    $16, %r8
; return ~((csum & 0xffff) + (csum >> 16));
  78:   addq    %rax, %r8
  7b:   xorq    $-1, %r8
; iph->check = csum;
  7f:   movw    %r8w, 10(%rbx)
; *csum = csum_fold_helper(*csum);
  84:   andq    $65535, %r8
; for (i = 0; i < LOOP_LEN ;i++){
  8b:   addq    $-1, %r14
  8f:   movq    %r14, %rdi
  92:   shlq    $32, %rdi
  96:   shrq    $32, %rdi
; for (i = 0; i < LOOP_LEN ;i++){
  9a:   testq   %rdi, %rdi
  9d:   jne     0x5d
; dst[0] = p[0];
  9f:   movzwq  (%r13), %rdi
; p[0] = p[3];
  a4:   movzwq  6(%r13), %rsi
; p[0] = p[3];
  a9:   movw    %si, (%r13)
; p[1] = p[4];
  ae:   movzwq  8(%r13), %rsi
; dst[1] = p[1];
  b3:   movzwq  2(%r13), %rdx
; p[4] = dst[1];
  b8:   movw    %dx, 8(%r13)
; p[1] = p[4];
  bd:   movw    %si, 2(%r13)
; p[2] = p[5];
  c2:   movzwq  10(%r13), %rsi
; dst[2] = p[2];
  c7:   movzwq  4(%r13), %rdx
; p[5] = dst[2];
  cc:   movw    %dx, 10(%r13)
; p[3] = dst[0];
  d1:   movw    %di, 6(%r13)
; p[2] = p[5];
  d6:   movw    %si, 4(%r13)
  db:   movl    $3, %eax
; }
  e0:   popq    %r15
  e2:   popq    %r14
  e4:   popq    %r13
  e6:   popq    %rbx
  e7:   leave
  e8:   retq
  e9:   int3
```