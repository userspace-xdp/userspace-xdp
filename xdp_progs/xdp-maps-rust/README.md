# run

Run in userspace

```sh
sudo LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug /home/yunwei/ebpf-xdp-dpdk/xdp-maps/target/release/xdp 20 N base.btf
```

run with test tools

```console
$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 100000000 JIT
[sudo] password for yunwei: 
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 100000000 with run type JIT
[2024-04-08 14:55:14.939] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 14:55:14.939] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
Time taken: 16 ns
Return value: 3
INFO [547231]: Global shm destructed
yunwei@octopus3:~/ebpf-xdp-dpdk$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 100000000 JIT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 100000000 with run type JIT
[2024-04-08 14:55:25.382] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 14:55:25.382] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
[2024-04-08 14:55:25.382] [info] [llvm_jit_context.cpp:81] Initializing llvm
Time taken: 662 ns
Return value: 3
INFO [547376]: Global shm destructed
```

Why 16 vs 662? Seems hash map in shared memory is too slower, and ubpf has bug

Compile with opt:

```sh
opt -O3 /home/yunwei/ebpf-xdp-dpdk/xdp-maps/aot.ll -opaque-pointers -o a.opt.o
```

load inside and run with AOT


```console
$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/tools/aot/bpftime-aot load /home/yunwei/ebpf-xdp-dpdk/xdp-maps/xdp_pass.o 5
$ sudo /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 AOT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 10000000 with run type AOT
[2024-04-08 15:05:18.584] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 15:05:18.584] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
[2024-04-08 15:05:18.584] [info] [llvm_jit_context.cpp:81] Initializing llvm
[2024-04-08 15:05:18.584] [info] [llvm_jit_context.cpp:204] LLVM-JIT: Loading aot object
Time taken: 755 ns
```
The assembly code:

```console
$ objdump -S /home/yunwei/ebpf-xdp-dpdk/xdp-maps/xdp_pass.o

/home/yunwei/ebpf-xdp-dpdk/xdp-maps/xdp_pass.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <bpf_main>:
   0:   41 57                   push   %r15
   2:   41 56                   push   %r14
   4:   41 54                   push   %r12
   6:   53                      push   %rbx
   7:   48 81 ec 58 40 00 00    sub    $0x4058,%rsp
   e:   4c 8d bc 24 08 40 00    lea    0x4008(%rsp),%r15
  15:   00 
  16:   48 8b 1f                mov    (%rdi),%rbx
  19:   4c 8b 67 08             mov    0x8(%rdi),%r12
  1d:   44 89 e0                mov    %r12d,%eax
  20:   29 d8                   sub    %ebx,%eax
  22:   4c 8d b4 24 04 40 00    lea    0x4004(%rsp),%r14
  29:   00 
  2a:   89 84 24 04 40 00 00    mov    %eax,0x4004(%rsp)
  31:   c7 84 24 00 40 00 00    movl   $0x0,0x4000(%rsp)
  38:   00 00 00 00 
  3c:   bf 04 00 00 00          mov    $0x4,%edi
  41:   e8 00 00 00 00          call   46 <bpf_main+0x46>
  46:   48 89 c7                mov    %rax,%rdi
  49:   4c 89 f6                mov    %r14,%rsi
  4c:   31 c9                   xor    %ecx,%ecx
  4e:   e8 00 00 00 00          call   53 <bpf_main+0x53>
  53:   48 85 c0                test   %rax,%rax
  56:   74 0b                   je     63 <bpf_main+0x63>
  58:   8b 00                   mov    (%rax),%eax
  5a:   ff c0                   inc    %eax
  5c:   89 84 24 00 40 00 00    mov    %eax,0x4000(%rsp)
  63:   49 83 c7 f8             add    $0xfffffffffffffff8,%r15
  67:   bf 04 00 00 00          mov    $0x4,%edi
  6c:   e8 00 00 00 00          call   71 <bpf_main+0x71>
  71:   48 89 c7                mov    %rax,%rdi
  74:   4c 89 f6                mov    %r14,%rsi
  77:   4c 89 fa                mov    %r15,%rdx
  7a:   31 c9                   xor    %ecx,%ecx
  7c:   e8 00 00 00 00          call   81 <bpf_main+0x81>
  81:   48 8d 4b 0e             lea    0xe(%rbx),%rcx
  85:   b8 01 00 00 00          mov    $0x1,%eax
  8a:   4c 39 e1                cmp    %r12,%rcx
  8d:   77 1f                   ja     ae <bpf_main+0xae>
  8f:   8b 03                   mov    (%rbx),%eax
  91:   0f b7 4b 06             movzwl 0x6(%rbx),%ecx
  95:   66 89 0b                mov    %cx,(%rbx)
  98:   8b 4b 08                mov    0x8(%rbx),%ecx
  9b:   0f b7 53 04             movzwl 0x4(%rbx),%edx
  9f:   89 4b 02                mov    %ecx,0x2(%rbx)
  a2:   66 89 53 0a             mov    %dx,0xa(%rbx)
  a6:   89 43 06                mov    %eax,0x6(%rbx)
  a9:   b8 03 00 00 00          mov    $0x3,%eax
  ae:   48 81 c4 58 40 00 00    add    $0x4058,%rsp
  b5:   5b                      pop    %rbx
  b6:   41 5c                   pop    %r12
  b8:   41 5e                   pop    %r14
  ba:   41 5f                   pop    %r15
  bc:   c3                      ret    
yunwei@octopus3:~/ebpf-xdp-dpdk$ 
```

perf to see stats:

```sh
$ sudo /home/yunwei/linux/tools/perf/perf stat --all-user /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm
/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 AOT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 10000000 with run type AOT
[2024-04-08 15:13:54.638] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 15:13:54.638] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
[2024-04-08 15:13:54.638] [info] [llvm_jit_context.cpp:81] Initializing llvm
[2024-04-08 15:13:54.638] [info] [llvm_jit_context.cpp:204] LLVM-JIT: Loading aot object
Time taken: 781 ns
Return value: 3
INFO [565080]: Global shm destructed

 Performance counter stats for '/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 AOT':

          7,827.95 msec task-clock:uhH                   #    1.000 CPUs utilized             
                 0      context-switches:uhH             #    0.000 /sec                      
                 0      cpu-migrations:uhH               #    0.000 /sec                      
             1,079      page-faults:uhH                  #  137.839 /sec                      
    23,359,794,376      cycles:uhH                       #    2.984 GHz                       
    80,169,773,358      instructions:uhH                 #    3.43  insn per cycle            
     5,671,919,819      branches:uhH                     #  724.573 M/sec                     
            50,339      branch-misses:uhH                #    0.00% of all branches           
                        TopdownL1                 #      0.8 %  tma_backend_bound      
                                                  #      1.6 %  tma_bad_speculation    
                                                  #     29.0 %  tma_frontend_bound     
                                                  #     68.6 %  tma_retiring           

       7.829053949 seconds time elapsed

       7.820940000 seconds user
       0.008000000 seconds sys


yunwei@octopus3:~/ebpf-xdp-dpdk$ sudo /home/yunwei/linux/tools/perf/perf stat --all-user /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 JIT
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 10000000 with run type JIT
[2024-04-08 15:14:26.962] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 15:14:26.962] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
Time taken: 18 ns
Return value: 3
INFO [565422]: Global shm destructed

 Performance counter stats for '/home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 JIT':

            187.57 msec task-clock:uhH                   #    0.996 CPUs utilized             
                 0      context-switches:uhH             #    0.000 /sec                      
                 0      cpu-migrations:uhH               #    0.000 /sec                      
               208      page-faults:uhH                  #    1.109 K/sec                     
       355,041,635      cycles:uhH                       #    1.893 GHz                       
     1,392,776,923      instructions:uhH                 #    3.92  insn per cycle            
       240,453,836      branches:uhH                     #    1.282 G/sec                     
            15,016      branch-misses:uhH                #    0.01% of all branches           
                        TopdownL1                 #      0.1 %  tma_backend_bound      
                                                  #      1.6 %  tma_bad_speculation    
                                                  #     16.8 %  tma_frontend_bound     
                                                  #     81.5 %  tma_retiring           

       0.188418901 seconds time elapsed

       0.184477000 seconds user
       0.004010000 seconds sys


yunwei@octopus3:~/ebpf-xdp-dpdk$ 
```

perf record -g in AOT

```txt
# sudo /home/yunwei/linux/tools/perf/perf  record -g /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 AOT
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 31K of event 'cycles:P'
# Event count (approx.): 23566903835
#
# Children      Self  Command          Shared Object         Symbol                                                                  >
# ........  ........  ...............  ....................  ........................................................................>
#
    99.94%     0.00%  xdp-bpftime-run  [unknown]             [.] 0000000000000000
            |
            ---0
               |          
                --99.94%--0x3
                          main
                          |          
                          |--62.70%--0x7fe070a4f081
                          |          |          
                          |          |--59.59%--bpftime::bpf_map_handler::map_update_elem(void const*, void const*, unsigned long, bo>
                          |          |          |          
                          |          |          |--24.99%--boost::container::vector<unsigned char, boost::interprocess::allocator<uns>
                          |          |          |          |          
                          |          |          |           --22.86%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex>
                          |          |          |                     |          
                          |          |          |                      --17.79%--boost::interprocess::rbtree_best_fit<boost::interpro>
                          |          |          |                                |          
                          |          |          |                                |--7.41%--boost::intrusive::bstree_impl<boost::intru>
                          |          |          |                                |          |          
                          |          |          |                                |          |--4.70%--boost::intrusive::rbtree_algori>
                          |          |          |                                |          |          |          
                          |          |          |                                |          |           --0.63%--boost::intrusive::bs>
                          |          |          |                                |          |          
                          |          |          |                                |           --1.71%--boost::intrusive::bstree_algori>
                          |          |          |                                |          
                          |          |          |                                 --4.19%--boost::intrusive::bstree_algorithms<boost:>
                          |          |          |          
                          |          |          |--16.72%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, bo>
                          |          |          |          |          
                          |          |          |           --16.15%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex>
                          |          |          |                     |          
                          |          |          |                     |--7.05%--boost::intrusive::multiset_impl<boost::intrusive::bht>
                          |          |          |                     |          |          
                          |          |          |                     |          |--2.05%--boost::intrusive::rbtree_algorithms<boost:>
                          |          |          |                     |          |          
                          |          |          |                     |           --1.98%--boost::intrusive::bstree_algorithms<boost:>
                          |          |          |                     |          
                          |          |          |                     |--3.58%--boost::intrusive::bstree_algorithms<boost::intrusive:>
                          |          |          |                     |          
                          |          |          |                      --1.32%--boost::intrusive::bstree_algorithms_base<boost::intru>
                          |          |          |          
                          |          |          |--4.49%--boost::interprocess::offset_ptr<boost::unordered::detail::node<boost::inter>
                          |          |          |          |          
                          |          |          |           --1.35%--bool boost::intrusive::algo_equal<boost::container::vec_iterator>
                          |          |          |          
                          |          |          |--4.08%--pthread_mutex_lock@@GLIBC_2.2.5
                          |          |          |          
                          |          |          |--2.12%--pthread_mutex_unlock@@GLIBC_2.2.5
                          |          |          |          
                          |          |          |--1.72%--unsigned long boost::unordered::detail::mix64_policy<unsigned long>::apply_>
                          |          |          |          
                          |          |          |--1.55%--void boost::container::vector<unsigned char, boost::interprocess::allocator>
                          |          |          |          
                          |          |           --0.61%--__memmove_evex_unaligned_erms
                          |          |          
                          |           --2.01%--pthread_mutex_unlock@@GLIBC_2.2.5
                          |          
                           --34.96%--0x7fe070a4f053
                                     |          
                                      --34.42%--bpftime::bpf_map_handler::map_lookup_elem(void const*, bool) const
                                                |          
                                                |--12.82%--boost::container::vector<unsigned char, boost::interprocess::allocator<uns>
                                                |          |          
                                                |           --11.47%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex>
                                                |                     |          
                                                |                      --8.72%--boost::interprocess::rbtree_best_fit<boost::interproc>
                                                |                                |          
                                                |                                 --4.14%--boost::intrusive::bstree_algorithms<boost:>
                                                |          
                                                |--10.29%--boost::container::vector<unsigned char, boost::interprocess::allocator<uns>
                                                |          |          
                                                |          |--8.37%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_>
                                                |          |          |          
                                                |          |           --8.00%--boost::interprocess::rbtree_best_fit<boost::interproc>
                                                |          |                     |          
                                                |          |                     |--3.34%--boost::intrusive::bstree_algorithms<boost:>
                                                |          |                     |          
                                                |          |                      --1.44%--boost::intrusive::bstree_algorithms_base<b>
                                                |          |          
                                                |           --1.34%--pthread_mutex_lock@@GLIBC_2.2.5
                                                |          
                                                |--6.13%--boost::unordered::unordered_map<boost::container::vector<unsigned char, boo>
                                                |          |          
                                                |          |--3.84%--boost::interprocess::offset_ptr<boost::unordered::detail::node<b>
                                                |          |          |          
                                                |          |           --1.38%--bool boost::intrusive::algo_equal<boost::container::v>
                                                |          |          
                                                |           --1.66%--unsigned long boost::unordered::detail::mix64_policy<unsigned lo>
                                                |          
                                                |--2.08%--pthread_mutex_unlock@@GLIBC_2.2.5
                                                |          
                                                |--1.13%--pthread_mutex_lock@@GLIBC_2.2.5
                                                |          
                                                 --0.56%--void boost::container::vector<unsigned char, boost::interprocess::allocator>
```

ubpf jit: sudo /home/yunwei/linux/tools/perf/perf  record -g /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 100000000 JIT

```txt
# Children      Self  Command          Shared Object         Symbol                                                                  >
# ........  ........  ...............  ....................  ........................................................................>
#
    90.85%     0.00%  xdp-bpftime-run  [unknown]             [.] 0x00007ffe18125a20
            |
            ---0x7ffe18125a20
               |          
               |--19.89%--bpftime_map_update_elem_helper
               |          
               |--13.82%--bpftime_map_lookup_elem_helper
               |          
               |--13.74%--0x7f7f07f47096
               |          |          
               |          |--5.88%--__errno_location@plt
               |          |          
               |          |--2.60%--bpftime_map_update_elem_helper
               |          |          
               |           --2.59%--__errno_location
               |          
               |--10.86%--0x7f7f07f4704c
               |          |          
:...skipping...
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 6K of event 'cycles:P'
# Event count (approx.): 3567553719
#
# Children      Self  Command          Shared Object         Symbol                                                                  >
# ........  ........  ...............  ....................  ........................................................................>
#
    90.85%     0.00%  xdp-bpftime-run  [unknown]             [.] 0x00007ffe18125a20
            |
            ---0x7ffe18125a20
               |          
               |--19.89%--bpftime_map_update_elem_helper
               |          
               |--13.82%--bpftime_map_lookup_elem_helper
               |          
               |--13.74%--0x7f7f07f47096
               |          |          
               |          |--5.88%--__errno_location@plt
               |          |          
               |          |--2.60%--bpftime_map_update_elem_helper
               |          |          
               |           --2.59%--__errno_location
               |          
               |--10.86%--0x7f7f07f4704c
               |          |          
               |          |--3.80%--__errno_location@plt
               |          |          
               |          |--2.72%--bpftime_map_lookup_elem_helper
               |          |          
               |           --1.57%--__errno_location
               |          
               |--3.22%--0x7f7f07f47065
               |          
               |--3.18%--0x7f7f07f470ce
               |          
               |--3.02%--0x7f7f07f470b0
               |          
               |--2.97%--0x7f7f07f47094
               |          
               |--2.94%--0x7f7f07f4704a
               |          
               |--2.87%--0x7f7f07f4701f
               |          
               |--2.81%--0x7f7f07f47012
               |          
               |--2.77%--0x7f7f07f470be
               |          
               |--2.77%--0x7f7f07f470ee
               |          
               |--2.71%--0x7f7f07f470de
               |          
               |--2.18%--0x7f7f07f47079
               |          
               |--2.77%--0x7f7f07f470be
               |          
               |          
               |--2.77%--0x7f7f07f470be
               |          
               |--2.77%--0x7f7f07f470ee
               |          
               |--2.71%--0x7f7f07f470de
               |          
               |--2.18%--0x7f7f07f47079
               |          
                --0.71%--0x7f7f07f4702f

    31.04%    25.84%  xdp-bpftime-run  xdp-bpftime-runner    [.] bpftime_map_update_elem_helper
            |          
            |--25.84%--0x7ffe18125a20
            |          |          
            |          |--17.29%--bpftime_map_update_elem_helper
            |          |          
            |           --8.55%--0x7f7f07f47096
            |                     |          
            |                      --5.88%--__errno_location@plt
            |          
             --5.20%--bpftime_map_update_elem_helper
            |          |          
            |           --6.58%--0x7f7f07f4704c
            |                     |          
            |                      --3.80%--__errno_location@plt
            |          
             --3.69%--bpftime_map_lookup_elem_helper

    13.83%     4.15%  xdp-bpftime-run  xdp-bpftime-runner    [.] __errno_location@plt
            |          
            |--9.67%--__errno_location@plt
            |          
             --4.15%--0x7ffe18125a20
                       |          
                       |--2.59%--0x7f7f07f47096
                       |          __errno_location
                       |          
                        --1.57%--0x7f7f07f4704c
                                  __errno_location

    13.74%     0.00%  xdp-bpftime-run  [JIT] tid 568517      [.] 0x00007f7f07f47096
            |
            ---0x7f7f07f47096
               |          
               |--5.88%--__errno_location@plt
               |          
               |--2.60%--bpftime_map_update_elem_helper
               |          
                --2.59%--__errno_location

    10.86%     0.00%  xdp-bpftime-run  [JIT] tid 568517      [.] 0x00007f7f07f4704c
            |
            ---0x7f7f07f4704c
               |          
               |--3.80%--__errno_location@plt
               |          
               |--2.72%--bpftime_map_lookup_elem_helper
               |          
                --1.57%--__errno_location

     9.47%     5.32%  xdp-bpftime-run  libc.so.6             [.] __errno_location
            |          
            |--5.32%--0x7ffe18125a20
            |          |          
            |          |--2.72%--0x7f7f07f4704c
            |          |          bpftime_map_lookup_elem_helper
            |          |          
            |           --2.60%--0x7f7f07f47096
            |                     bpftime_map_update_elem_helper
            |          
             --4.15%--__errno_location
```

Test with intepreter

```console
$ sudo /home/yunwei/linux/tools/perf/perf  record -g /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 INTERPRET
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 10000000 with run type INTERPRET
[2024-04-08 15:26:36.977] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 15:26:36.978] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
Time taken: 923 ns
Return value: 3
INFO [571568]: Global shm destructed
[ perf record: Woken up 14 times to write data ]
[ perf record: Captured and wrote 3.413 MB perf.data (36932 samples) ]
```

intepreter perf report

```txt
sudo /home/yunwei/linux/tools/perf/perf  record -g /home/yunwei/ebpf-xdp-dpdk/build-bpftime-ubpf/xdp-bpftime-runner 5 /home/yun
wei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin 10000000 INTERPRET
Running eBPF program with id 5 and data in file /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
Repeat N: 10000000 with run type INTERPRET
[2024-04-08 15:31:17.156] [info] [bpftime_shm_internal.cpp:628] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-04-08 15:31:17.156] [info] [bpftime_shm_internal.cpp:28] Global shm initialized
Time taken: 930 ns
Return value: 3
INFO [573740]: Global shm destructed
[ perf record: Woken up 14 times to write data ]
[ perf record: Captured and wrote 3.441 MB perf.data (37212 samples) ]

# To display the perf.data header info, please use --header/--header-only optio>
# To display the perf.data header info, please use --header/--header-only options.
#
#
# Total Lost Samples: 0
#
# Samples: 37K of event 'cycles:P'
# Event count (approx.): 28007045957
#
# Children      Self  Command          Shared Object         Symbol                                                                  >
# ........  ........  ...............  ....................  ........................................................................>
#
    99.99%     0.00%  xdp-bpftime-run  libc.so.6             [.] __libc_start_call_main
            |
            ---__libc_start_call_main
               |          
               |--98.07%--main
               |          |          
               |          |--50.44%--bpftime::bpf_map_handler::map_update_elem(void const*, void const*, unsigned long, bool) const
               |          |          |          
               |          |          |--21.04%--boost::container::vector<unsigned char, boost::interprocess::allocator<unsigned char,>
               |          |          |          |          
               |          |          |           --19.30%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, bo>
               |          |          |                     |          
               |          |          |                      --14.43%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex>
               |          |          |                                |          
               |          |          |                                |--4.05%--boost::intrusive::bstree_algorithms<boost::intrusive:>
               |          |          |                                |          
               |          |          |                                |--3.66%--boost::intrusive::rbtree_algorithms<boost::intrusive:>
               |          |          |                                |          
               |          |          |                                 --1.17%--boost::intrusive::bstree_algorithms_base<boost::intru>
               |          |          |          
               |          |          |--15.33%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, boost::interp>
               |          |          |          |          
               |          |          |           --14.73%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, bo>
               |          |          |                     |          
               |          |          |                     |--5.91%--boost::intrusive::multiset_impl<boost::intrusive::bhtraits<boost>
               |          |          |                     |          |          
               |          |          |                     |          |--1.88%--boost::intrusive::rbtree_algorithms<boost::intrusive:>
               |          |          |                     |          |          
               |          |          |                     |           --1.79%--boost::intrusive::bstree_algorithms<boost::intrusive:>
               |          |          |                     |          
               |          |          |                     |--3.33%--boost::intrusive::bstree_algorithms<boost::intrusive::rbtree_nod>
               |          |          |                     |          
               |          |          |                      --1.34%--boost::intrusive::bstree_algorithms_base<boost::intrusive::rbtre>
               |          |          |          
               |          |          |--4.03%--boost::interprocess::offset_ptr<boost::unordered::detail::node<boost::interprocess::al>
               |          |          |          |          
               |          |          |           --1.28%--bool boost::intrusive::algo_equal<boost::container::vec_iterator<boost::int>
               |          |          |          
               |          |          |--3.30%--pthread_mutex_lock@@GLIBC_2.2.5
               |          |          |          
               |          |          |--1.50%--pthread_mutex_unlock@@GLIBC_2.2.5
               |          |          |          
               |          |          |--1.36%--void boost::container::vector<unsigned char, boost::interprocess::allocator<unsigned c>
               |          |          |          
               |          |           --1.29%--unsigned long boost::unordered::detail::mix64_policy<unsigned long>::apply_hash<bpftim>
               |          |          
               |          |--28.77%--bpftime::bpf_map_handler::map_lookup_elem(void const*, bool) const
               |          |          |          
               |          |          |--10.54%--boost::container::vector<unsigned char, boost::interprocess::allocator<unsigned char,>
               |          |          |          |          
               |          |          |           --9.52%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, boo>
               |          |          |                     |          
               |          |          |                      --7.19%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_>
               |          |          |                                |          
               |          |          |                                 --3.97%--boost::intrusive::bstree_algorithms<boost::intrusive:>
               |          |          |          
               |          |          |--8.72%--boost::container::vector<unsigned char, boost::interprocess::allocator<unsigned char, >
               |          |          |          |          
               |          |          |          |--7.22%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_family, boo>
               |          |          |          |          |          
               |          |          |          |           --6.98%--boost::interprocess::rbtree_best_fit<boost::interprocess::mutex_>
               |          |          |          |                     |          
               |          |          |          |                     |--3.04%--boost::intrusive::bstree_algorithms<boost::intrusive:>
               |          |          |          |                     |          
               |          |          |          |                      --1.01%--boost::intrusive::bstree_algorithms_base<boost::intru>
               |          |          |          |          
               |          |          |           --1.01%--pthread_mutex_lock@@GLIBC_2.2.5
               |          |          |          
               |          |          |--5.32%--boost::unordered::unordered_map<boost::container::vector<unsigned char, boost::interpr>
               |          |          |          |          
               |          |          |          |--3.43%--boost::interprocess::offset_ptr<boost::unordered::detail::node<boost::inter>
               |          |          |          |          |          
               |          |          |          |           --1.09%--bool boost::intrusive::algo_equal<boost::container::vec_iterator>
               |          |          |          |          
               |          |          |           --1.50%--unsigned long boost::unordered::detail::mix64_policy<unsigned long>::apply_>
               |          |          |          
               |          |          |--1.72%--pthread_mutex_unlock@@GLIBC_2.2.5
               |          |          |          
               |          |           --0.85%--pthread_mutex_lock@@GLIBC_2.2.5
               |          |          
               |          |--1.76%--bounds_check.constprop.0
               |          |          
               |           --1.71%--pthread_mutex_unlock@@GLIBC_2.2.5
               |          
                --1.19%--bounds_check.constprop.0
```

In kernel:

```console
$ sudo bpftool prog run id 3504 data_in /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin repeat 100000000
Return value: 3, duration (average): 62ns
```
