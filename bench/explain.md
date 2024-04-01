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

## xdp firewall

llvm jit:

```sh
/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/tools/aot/bpftime-aot build /home/yunwei/ebpf-xdp-dpdk/xdp-firewall/.output/xdp_firewall.bpf.o
objdump -S /home/yunwei/xdp_pass.o

/home/yunwei/xdp_pass.o:     file format elf64-x86-64

Disassembly of section .text:

0000000000000000 <bpf_main>:
   0:   55                      push   %rbp
   1:   41 57                   push   %r15
   3:   41 56                   push   %r14
   5:   41 55                   push   %r13
   7:   41 54                   push   %r12
   9:   53                      push   %rbx
   a:   48 81 ec 58 40 00 00    sub    $0x4058,%rsp
  11:   8b 1f                   mov    (%rdi),%ebx
  13:   8b 4f 04                mov    0x4(%rdi),%ecx
  16:   48 8d 53 0e             lea    0xe(%rbx),%rdx
  1a:   b8 02 00 00 00          mov    $0x2,%eax
  1f:   48 39 ca                cmp    %rcx,%rdx
  22:   0f 87 0c 01 00 00       ja     134 <bpf_main+0x134>
  28:   0f b7 53 0c             movzwl 0xc(%rbx),%edx
  2c:   81 fa 88 a8 00 00       cmp    $0xa888,%edx
  32:   74 08                   je     3c <bpf_main+0x3c>
  34:   81 fa 81 00 00 00       cmp    $0x81,%edx
  3a:   75 19                   jne    55 <bpf_main+0x55>
  3c:   48 8d 53 12             lea    0x12(%rbx),%rdx
  40:   48 39 ca                cmp    %rcx,%rdx
  43:   0f 87 eb 00 00 00       ja     134 <bpf_main+0x134>
  49:   0f b7 53 10             movzwl 0x10(%rbx),%edx
  4d:   41 bd 12 00 00 00       mov    $0x12,%r13d
  53:   eb 06                   jmp    5b <bpf_main+0x5b>
  55:   41 bd 0e 00 00 00       mov    $0xe,%r13d
  5b:   0f b7 f2                movzwl %dx,%esi
  5e:   81 fe 88 a8 00 00       cmp    $0xa888,%esi
  64:   74 08                   je     6e <bpf_main+0x6e>
  66:   81 fe 81 00 00 00       cmp    $0x81,%esi
  6c:   75 1b                   jne    89 <bpf_main+0x89>
  6e:   4a 8d 14 2b             lea    (%rbx,%r13,1),%rdx
  72:   48 83 c2 04             add    $0x4,%rdx
  76:   48 39 ca                cmp    %rcx,%rdx
  79:   0f 87 b5 00 00 00       ja     134 <bpf_main+0x134>
  7f:   41 0f b7 54 1d 02       movzwl 0x2(%r13,%rbx,1),%edx
  85:   49 83 c5 04             add    $0x4,%r13
  89:   4c 8d b4 24 08 40 00    lea    0x4008(%rsp),%r14
  90:   00 
  91:   48 c7 84 24 00 40 00    movq   $0x800,0x4000(%rsp)
  98:   00 00 08 00 00 
  9d:   0f b7 c2                movzwl %dx,%eax
  a0:   3d 86 dd 00 00          cmp    $0xdd86,%eax
  a5:   74 37                   je     de <bpf_main+0xde>
  a7:   83 f8 08                cmp    $0x8,%eax
  aa:   75 11                   jne    bd <bpf_main+0xbd>
  ac:   4e 8d 3c 2b             lea    (%rbx,%r13,1),%r15
  b0:   49 83 c7 14             add    $0x14,%r15
  b4:   49 39 cf                cmp    %rcx,%r15
  b7:   0f 86 89 00 00 00       jbe    146 <bpf_main+0x146>
  bd:   8b 03                   mov    (%rbx),%eax
  bf:   0f b7 4b 06             movzwl 0x6(%rbx),%ecx
  c3:   66 89 0b                mov    %cx,(%rbx)
  c6:   8b 4b 08                mov    0x8(%rbx),%ecx
  c9:   0f b7 53 04             movzwl 0x4(%rbx),%edx
  cd:   89 4b 02                mov    %ecx,0x2(%rbx)
  d0:   66 89 53 0a             mov    %dx,0xa(%rbx)
  d4:   89 43 06                mov    %eax,0x6(%rbx)
  d7:   b8 03 00 00 00          mov    $0x3,%eax
  dc:   eb 56                   jmp    134 <bpf_main+0x134>
  de:   48 b8 70 6f 72 74 65    movabs $0xa646574726f70,%rax
  e5:   64 0a 00 
  e8:   48 89 84 24 e8 3f 00    mov    %rax,0x3fe8(%rsp)
  ef:   00 
  f0:   48 b8 34 20 69 73 20    movabs $0x7075732073692034,%rax
  f7:   73 75 70 
  fa:   48 89 84 24 e0 3f 00    mov    %rax,0x3fe0(%rsp)
 101:   00 
 102:   48 b8 6f 6e 6c 79 20    movabs $0x76706920796c6e6f,%rax
 109:   69 70 76 
 10c:   48 89 84 24 d8 3f 00    mov    %rax,0x3fd8(%rsp)
 113:   00 
 114:   49 83 c6 d0             add    $0xffffffffffffffd0,%r14
 118:   be 18 00 00 00          mov    $0x18,%esi
 11d:   ba dd 86 00 00          mov    $0x86dd,%edx
 122:   b9 00 08 00 00          mov    $0x800,%ecx
 127:   4c 89 f7                mov    %r14,%rdi
 12a:   e8 00 00 00 00          call   12f <bpf_main+0x12f>
 12f:   b8 01 00 00 00          mov    $0x1,%eax
 134:   48 81 c4 58 40 00 00    add    $0x4058,%rsp
 13b:   5b                      pop    %rbx
 13c:   41 5c                   pop    %r12
 13e:   41 5d                   pop    %r13
 140:   41 5e                   pop    %r14
 142:   41 5f                   pop    %r15
 144:   5d                      pop    %rbp
 145:   c3                      ret    
 146:   49 01 dd                add    %rbx,%r13
 149:   41 0f b7 55 02          movzwl 0x2(%r13),%edx
 14e:   48 c7 84 24 f8 3f 00    movq   $0x0,0x3ff8(%rsp)
 155:   00 00 00 00 00 
 15a:   c7 84 24 f4 3f 00 00    movl   $0x0,0x3ff4(%rsp)
 161:   00 00 00 00 
 165:   41 8b 45 10             mov    0x10(%r13),%eax
 169:   89 84 24 f0 3f 00 00    mov    %eax,0x3ff0(%rsp)
 170:   45 0f b6 65 09          movzbl 0x9(%r13),%r12d
 175:   41 83 fc 33             cmp    $0x33,%r12d
 179:   66 89 54 24 06          mov    %dx,0x6(%rsp)
 17e:   74 19                   je     199 <bpf_main+0x199>
 180:   41 83 fc 70             cmp    $0x70,%r12d
 184:   75 47                   jne    1cd <bpf_main+0x1cd>
 186:   49 8d 55 1c             lea    0x1c(%r13),%rdx
 18a:   b8 01 00 00 00          mov    $0x1,%eax
 18f:   4c 89 fd                mov    %r15,%rbp
 192:   48 39 ca                cmp    %rcx,%rdx
 195:   77 9d                   ja     134 <bpf_main+0x134>
 197:   eb 40                   jmp    1d9 <bpf_main+0x1d9>
 199:   49 8d 6d 20             lea    0x20(%r13),%rbp
 19d:   48 39 cd                cmp    %rcx,%rbp
 1a0:   0f 87 17 ff ff ff       ja     bd <bpf_main+0xbd>
 1a6:   45 0f b6 3f             movzbl (%r15),%r15d
 1aa:   49 83 ff 70             cmp    $0x70,%r15
 1ae:   75 24                   jne    1d4 <bpf_main+0x1d4>
 1b0:   49 83 c5 28             add    $0x28,%r13
 1b4:   41 bf 70 00 00 00       mov    $0x70,%r15d
 1ba:   b8 01 00 00 00          mov    $0x1,%eax
 1bf:   49 39 cd                cmp    %rcx,%r13
 1c2:   49 89 ed                mov    %rbp,%r13
 1c5:   0f 87 69 ff ff ff       ja     134 <bpf_main+0x134>
 1cb:   eb 0c                   jmp    1d9 <bpf_main+0x1d9>
 1cd:   31 ed                   xor    %ebp,%ebp
 1cf:   4d 89 e5                mov    %r12,%r13
 1d2:   eb 05                   jmp    1d9 <bpf_main+0x1d9>
 1d4:   49 89 ed                mov    %rbp,%r13
 1d7:   31 ed                   xor    %ebp,%ebp
 1d9:   49 8d 76 e8             lea    -0x18(%r14),%rsi
 1dd:   31 ff                   xor    %edi,%edi
 1df:   4c 89 fa                mov    %r15,%rdx
 1e2:   4c 89 e9                mov    %r13,%rcx
 1e5:   4d 89 e0                mov    %r12,%r8
 1e8:   e8 00 00 00 00          call   1ed <bpf_main+0x1ed>
 1ed:   48 85 c0                test   %rax,%rax
 1f0:   74 08                   je     1fa <bpf_main+0x1fa>
 1f2:   48 ff 00                incq   (%rax)
 1f5:   e9 35 ff ff ff          jmp    12f <bpf_main+0x12f>
 1fa:   48 85 ed                test   %rbp,%rbp
 1fd:   0f 84 ba fe ff ff       je     bd <bpf_main+0xbd>
 203:   0f b6 45 01             movzbl 0x1(%rbp),%eax
 207:   89 84 24 d8 3f 00 00    mov    %eax,0x3fd8(%rsp)
 20e:   49 83 c6 d0             add    $0xffffffffffffffd0,%r14
 212:   31 ff                   xor    %edi,%edi
 214:   4c 89 f6                mov    %r14,%rsi
 217:   4c 89 fa                mov    %r15,%rdx
 21a:   4c 89 e9                mov    %r13,%rcx
 21d:   4d 89 e0                mov    %r12,%r8
 220:   e8 00 00 00 00          call   225 <bpf_main+0x225>
 225:   48 85 c0                test   %rax,%rax
 228:   0f 84 8f fe ff ff       je     bd <bpf_main+0xbd>
 22e:   0f b7 4c 24 06          movzwl 0x6(%rsp),%ecx
 233:   66 c1 c1 08             rol    $0x8,%cx
 237:   48 ff 40 10             incq   0x10(%rax)
 23b:   0f b7 c9                movzwl %cx,%ecx
 23e:   48 01 48 20             add    %rcx,0x20(%rax)
 242:   83 38 00                cmpl   $0x0,(%rax)
 245:   0f 85 72 fe ff ff       jne    bd <bpf_main+0xbd>
 24b:   48 ff 40 08             incq   0x8(%rax)
 24f:   48 01 48 18             add    %rcx,0x18(%rax)
 253:   e9 d7 fe ff ff          jmp    12f <bpf_main+0x12f>
```

native:

```sh
objdump -S /home/yunwei/ebpf-xdp-dpdk/xdp-firewall/.output/xdp_firewall.aot.o

/home/yunwei/ebpf-xdp-dpdk/xdp-firewall/.output/xdp_firewall.aot.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <bpf_main>:
   0:   f3 0f 1e fa             endbr64 
   4:   41 54                   push   %r12
   6:   41 b8 02 00 00 00       mov    $0x2,%r8d
   c:   55                      push   %rbp
   d:   53                      push   %rbx
   e:   48 83 ec 40             sub    $0x40,%rsp
  12:   48 8b 1f                mov    (%rdi),%rbx
  15:   48 8b 4f 08             mov    0x8(%rdi),%rcx
  19:   48 8d 43 0e             lea    0xe(%rbx),%rax
  1d:   48 39 c1                cmp    %rax,%rcx
  20:   0f 82 80 00 00 00       jb     a6 <bpf_main+0xa6>
  26:   0f b7 53 0c             movzwl 0xc(%rbx),%edx
  2a:   66 81 fa 81 00          cmp    $0x81,%dx
  2f:   0f 84 83 00 00 00       je     b8 <bpf_main+0xb8>
  35:   41 b8 2e 00 00 00       mov    $0x2e,%r8d
  3b:   be 22 00 00 00          mov    $0x22,%esi
  40:   66 81 fa 88 a8          cmp    $0xa888,%dx
  45:   74 71                   je     b8 <bpf_main+0xb8>
  47:   48 c7 44 24 10 00 00    movq   $0x0,0x10(%rsp)
  4e:   00 00 
  50:   89 d7                   mov    %edx,%edi
  52:   66 0f ef c0             pxor   %xmm0,%xmm0
  56:   66 c1 c7 08             rol    $0x8,%di
  5a:   0f 29 04 24             movaps %xmm0,(%rsp)
  5e:   66 83 fa 08             cmp    $0x8,%dx
  62:   0f 84 f8 00 00 00       je     160 <bpf_main+0x160>
  68:   66 81 ff dd 86          cmp    $0x86dd,%di
  6d:   0f 84 85 00 00 00       je     f8 <bpf_main+0xf8>
  73:   0f b7 03                movzwl (%rbx),%eax
  76:   0f b7 4b 0a             movzwl 0xa(%rbx),%ecx
  7a:   41 b8 03 00 00 00       mov    $0x3,%r8d
  80:   8b 53 02                mov    0x2(%rbx),%edx
  83:   48 c1 e0 10             shl    $0x10,%rax
  87:   48 09 c8                or     %rcx,%rax
  8a:   0f b7 4b 08             movzwl 0x8(%rbx),%ecx
  8e:   89 53 08                mov    %edx,0x8(%rbx)
  91:   48 c1 e0 10             shl    $0x10,%rax
  95:   48 09 c8                or     %rcx,%rax
  98:   0f b7 4b 06             movzwl 0x6(%rbx),%ecx
  9c:   48 c1 e0 10             shl    $0x10,%rax
  a0:   48 09 c8                or     %rcx,%rax
  a3:   48 89 03                mov    %rax,(%rbx)
  a6:   48 83 c4 40             add    $0x40,%rsp
  aa:   44 89 c0                mov    %r8d,%eax
  ad:   5b                      pop    %rbx
  ae:   5d                      pop    %rbp
  af:   41 5c                   pop    %r12
  b1:   c3                      ret    
  b2:   66 0f 1f 44 00 00       nopw   0x0(%rax,%rax,1)
  b8:   48 8d 43 12             lea    0x12(%rbx),%rax
  bc:   41 b8 02 00 00 00       mov    $0x2,%r8d
  c2:   48 39 c1                cmp    %rax,%rcx
  c5:   72 df                   jb     a6 <bpf_main+0xa6>
  c7:   0f b7 53 10             movzwl 0x10(%rbx),%edx
  cb:   66 81 fa 81 00          cmp    $0x81,%dx
  d0:   75 6e                   jne    140 <bpf_main+0x140>
  d2:   48 8d 43 16             lea    0x16(%rbx),%rax
  d6:   41 b8 02 00 00 00       mov    $0x2,%r8d
  dc:   48 39 c1                cmp    %rax,%rcx
  df:   72 c5                   jb     a6 <bpf_main+0xa6>
  e1:   0f b7 53 14             movzwl 0x14(%rbx),%edx
  e5:   41 b8 36 00 00 00       mov    $0x36,%r8d
  eb:   be 2a 00 00 00          mov    $0x2a,%esi
  f0:   e9 52 ff ff ff          jmp    47 <bpf_main+0x47>
  f5:   0f 1f 00                nopl   (%rax)
  f8:   48 8d 7c 24 20          lea    0x20(%rsp),%rdi
  fd:   be 18 00 00 00          mov    $0x18,%esi
 102:   ba 06 00 00 00          mov    $0x6,%edx
 107:   66 0f 6f 05 00 00 00    movdqa 0x0(%rip),%xmm0        # 10f <bpf_main+0x10f>
 10e:   00 
 10f:   48 b8 70 6f 72 74 65    movabs $0xa646574726f70,%rax
 116:   64 0a 00 
 119:   48 89 44 24 30          mov    %rax,0x30(%rsp)
 11e:   31 c0                   xor    %eax,%eax
 120:   0f 29 44 24 20          movaps %xmm0,0x20(%rsp)
 125:   ff d2                   call   *%rdx
 127:   48 83 c4 40             add    $0x40,%rsp
 12b:   41 b8 01 00 00 00       mov    $0x1,%r8d
 131:   5b                      pop    %rbx
 132:   44 89 c0                mov    %r8d,%eax
 135:   5d                      pop    %rbp
 136:   41 5c                   pop    %r12
 138:   c3                      ret    
 139:   0f 1f 80 00 00 00 00    nopl   0x0(%rax)
 140:   66 81 fa 88 a8          cmp    $0xa888,%dx
 145:   74 8b                   je     d2 <bpf_main+0xd2>
 147:   41 b8 32 00 00 00       mov    $0x32,%r8d
 14d:   be 26 00 00 00          mov    $0x26,%esi
 152:   e9 f0 fe ff ff          jmp    47 <bpf_main+0x47>
 157:   66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
 15e:   00 00 
 160:   48 8d 50 14             lea    0x14(%rax),%rdx
 164:   48 39 d1                cmp    %rdx,%rcx
 167:   0f 82 06 ff ff ff       jb     73 <bpf_main+0x73>
 16d:   44 0f b7 60 02          movzwl 0x2(%rax),%r12d
 172:   8b 50 10                mov    0x10(%rax),%edx
 175:   c7 44 24 10 00 08 00    movl   $0x800,0x10(%rsp)
 17c:   00 
 17d:   0f b6 40 09             movzbl 0x9(%rax),%eax
 181:   89 14 24                mov    %edx,(%rsp)
 184:   3c 70                   cmp    $0x70,%al
 186:   74 38                   je     1c0 <bpf_main+0x1c0>
 188:   3c 33                   cmp    $0x33,%al
 18a:   0f 84 b0 00 00 00       je     240 <bpf_main+0x240>
 190:   31 c0                   xor    %eax,%eax
 192:   48 89 e6                mov    %rsp,%rsi
 195:   bf 04 00 00 00          mov    $0x4,%edi
 19a:   e8 00 00 00 00          call   19f <bpf_main+0x19f>
 19f:   48 85 c0                test   %rax,%rax
 1a2:   0f 84 cb fe ff ff       je     73 <bpf_main+0x73>
 1a8:   48 83 00 01             addq   $0x1,(%rax)
 1ac:   41 b8 01 00 00 00       mov    $0x1,%r8d
 1b2:   e9 ef fe ff ff          jmp    a6 <bpf_main+0xa6>
 1b7:   66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
 1be:   00 00 
 1c0:   48 8d 2c 33             lea    (%rbx,%rsi,1),%rbp
 1c4:   48 8d 45 08             lea    0x8(%rbp),%rax
 1c8:   48 39 c1                cmp    %rax,%rcx
 1cb:   0f 82 56 ff ff ff       jb     127 <bpf_main+0x127>
 1d1:   31 c0                   xor    %eax,%eax
 1d3:   48 89 e6                mov    %rsp,%rsi
 1d6:   bf 04 00 00 00          mov    $0x4,%edi
 1db:   e8 00 00 00 00          call   1e0 <bpf_main+0x1e0>
 1e0:   48 85 c0                test   %rax,%rax
 1e3:   75 c3                   jne    1a8 <bpf_main+0x1a8>
 1e5:   0f b6 45 01             movzbl 0x1(%rbp),%eax
 1e9:   48 8d 74 24 20          lea    0x20(%rsp),%rsi
 1ee:   bf 05 00 00 00          mov    $0x5,%edi
 1f3:   89 44 24 20             mov    %eax,0x20(%rsp)
 1f7:   31 c0                   xor    %eax,%eax
 1f9:   e8 00 00 00 00          call   1fe <bpf_main+0x1fe>
 1fe:   48 85 c0                test   %rax,%rax
 201:   0f 84 6c fe ff ff       je     73 <bpf_main+0x73>
 207:   8b 10                   mov    (%rax),%edx
 209:   66 41 c1 c4 08          rol    $0x8,%r12w
 20e:   48 83 40 10 01          addq   $0x1,0x10(%rax)
 213:   45 0f b7 e4             movzwl %r12w,%r12d
 217:   4c 01 60 20             add    %r12,0x20(%rax)
 21b:   85 d2                   test   %edx,%edx
 21d:   0f 85 50 fe ff ff       jne    73 <bpf_main+0x73>
 223:   48 83 40 08 01          addq   $0x1,0x8(%rax)
 228:   41 b8 01 00 00 00       mov    $0x1,%r8d
 22e:   4c 01 60 18             add    %r12,0x18(%rax)
 232:   e9 6f fe ff ff          jmp    a6 <bpf_main+0xa6>
 237:   66 0f 1f 84 00 00 00    nopw   0x0(%rax,%rax,1)
 23e:   00 00 
 240:   48 01 de                add    %rbx,%rsi
 243:   48 8d 46 0c             lea    0xc(%rsi),%rax
 247:   48 39 c1                cmp    %rax,%rcx
 24a:   0f 82 23 fe ff ff       jb     73 <bpf_main+0x73>
 250:   80 3e 70                cmpb   $0x70,(%rsi)
 253:   0f 85 37 ff ff ff       jne    190 <bpf_main+0x190>
 259:   4a 8d 2c 03             lea    (%rbx,%r8,1),%rbp
 25d:   48 8d 45 08             lea    0x8(%rbp),%rax
 261:   48 39 c1                cmp    %rax,%rcx
 264:   0f 83 67 ff ff ff       jae    1d1 <bpf_main+0x1d1>
 26a:   e9 b8 fe ff ff          jmp    127 <bpf_main+0x127>
```