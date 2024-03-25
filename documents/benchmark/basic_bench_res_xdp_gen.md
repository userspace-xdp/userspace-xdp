# Run with xdp trafficgen

generate icmp traffic for ipv4:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen file enp24s0f1np1 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
```

generate udp traffic for ipv6:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen udp enp24s0f1np1 --dst-mac b8:3f:d2:2a:e5:11 --src-mac b8:3f:d2:2a:e7:69 --dst-addr fe80::ba3f:d2ff:fe2a:e511 --src-addr fe80::ba3f:d2ff:fe2a:e769
```

## generated traffic config

thread 1:

```sh
$ sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen file enp24s0f1np1 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin -t 1
read 98 bytes from file as packet
Transmitting on enp24s0f1np1 (ifindex 6)
lo->enp24s0f1np1                0 err/s         3,654,912 xmit/s       
lo->enp24s0f1np1                0 err/s         5,175,504 xmit/s       
lo->enp24s0f1np1                0 err/s         5,267,649 xmit/s 
```

thread 4:

```sh
$ sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen udp enp24s0f1np1 --dst-mac b8:3f:d2:2a:e5:11 --src-mac b8:3f:d2:2a:e7:69 --dst-addr fe80::ba3f:d2ff:fe2a:e511 --src-addr fe80::ba3f:d2ff:fe2a:e769 -t 4
Transmitting on enp24s0f1np1 (ifindex 6)
lo->enp24s0f1np1                0 err/s        19,610,944 xmit/s       
lo->enp24s0f1np1                0 err/s        19,738,552 xmit/s       
lo->enp24s0f1np1                0 err/s        19,920,749 xmit/s       
lo->enp24s0f1np1                0 err/s        19,553,015 xmit/s       
lo->enp24s0f1np1                0 err/s        20,085,613 xmit/s   
```

thread 10:

```sh
$ sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen udp enp24s0f1np1 --dst-mac b8:3f:d2:2a:e5:11 --src-mac b8:3f:d2:2a:e7:69 --dst-addr fe80::ba3f:d2ff:fe2a:e511 --src-addr fe80::ba3f:d2ff:fe2a:e769 -t 10
Transmitting on enp24s0f1np1 (ifindex 6)
lo->enp24s0f1np1                0 err/s        30,041,242 xmit/s       
lo->enp24s0f1np1                0 err/s        29,960,434 xmit/s       
lo->enp24s0f1np1                0 err/s        30,305,261 xmit/s 
```

## xdp tx

```sh
# load in kernel with native mode
sudo xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1

# load in userspace
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1 xdp-ebpf-new/base.btf
```

measure with nload on octopus3, by redirecting the traffic from octopus1 back to octopus3. test with 10 seconds and get the average.

### Generate traffic with 1 thread, udp traffic for ipv6

kernel XDP:

- SKB_MODE: Avg: 960.72 MBit/s Min: 950.74 MBit/s Max: 965.38 MBit/
- DRV_MODE: Avg: 993.19 MBit/s  Min: 945.41 MBit/s Max: 1003.83 MBit/s

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, interpreter(Without LTO): Avg: 572.23 MBit/s  Min: 565.92 MBit/s  Max: 576.62 MBit/s
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, ubpf jit(Without LTO):  Avg: 778.46 MBit/s  Min: 774.47 MBit/s  Max: 781.60 MBit/s
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(Without LTO): Avg: Avg: 825.15 MBit/s  Min: 810.29 MBit/s  Max: 830.69 MBit/s
  
dpdk xdp:  

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, interpreter(Without LTO): Avg: 985.05 MBit/s Min: 924.11 Max: 1004.02 MBit/s
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, ubpf jit(Without LTO): Avg: 1000.35 MBit/s Min: 987.45 MBit/s Max: 1010.49 MBit/s
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO): Avg: 1002.87 MBit/s Min: 982.67 MBit/s Max: 1015.69 MBit/s

### Generate traffic with 1 thread, icmp traffic for ipv4

kernel XDP:

- Native mode: AVG: 1.27 GBit/s Min: 857.31 MBit/s  Max: 1.30 GBit/s

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(Without LTO): Avg: 1.17 GBit/s Min: 1.13 GBit/s Max: 1.20 GBit/s

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO): Avg: 1.29 GBit/s Min: 1.26 GBit/s Max: 1.31 GBit/s

## array map access

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_map_access  enp24s0f1np1 xdp-ebpf-new/base.btf
```

kernel eBPF:

```sh
sudo xdp_progs/xdp_map_access  enp24s0f1np1 -N
```

- Native mode: Avg: 1.29 GBit/s Min: 1.26 GBit/s  Max: 1.31 GBit/s
- SKB mode: Avg: 1.29 GBit/s Min: 1.27 GBit/s Max: 1.30 GBit/s

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(Without LTO): Avg: 1.07 GBit/s Min: 1.06 GBit/s Max: 1.08 GBit/s

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO): Avg: 1.30 GBit/s  Min: 1.26 GBit/s  Max: 1.31 GBit/s

## csum

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_csum enp24s0f1np1 xdp-ebpf-new/base.btf
```

Generate traffic with 1 thread, icmp traffic for ipv4.

kernel XDP:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/xdp_progs/xdp_csum enp24s0f1np1
```

- Native mode: Avg: 1.22 GBit/s  Min: 1.19 GBit/s Max: 1.25 GBit/s
- SKB mode: Avg: 726.06 MBit/s Min: 715.02 MBit/s Max: 733.82 MBit/s

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(Without LTO): Avg 355.79 MBit/s Min: 351.04 MBit/s Max: 360.46 MBit/s
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(With LTO): Avg: 488.49 MBit/s Min: 487.46 MBit/s Max: 490.21 MBit/s
  
Why AF_XDP so slow?

- AF XDP config
- bpftime_csum_diff can be optimized
- map_lookup_elem can be optimized

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

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO):  Avg: 733.70 MBit/s Min: 732.48 MBit/s Max: 734.27 MBit/s
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(With LTO): Avg: 932.87 MBit/s Min: 930.36 MBit/s Max: 934.84 MBit/s

## xdping

run in kernel:

```sh
sudo xdp_progs/xdping -s -I enp24s0f1np1 -N
```

- Native mode: Avg: 1.31 GBit/s Min: 1.28 GBit/s Max: 1.34 GBit/s
- SKB mode: Avg: Avg: 1.33 GBit/s Min: 1.29 GBit/s Max: 1.35 GBit/s

In userspace:

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdping -s -I enp24s0f1np1 xdp-ebpf-new/base.btf
```

Run with AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(With LTO): Avg: 1.24 GBit/s Min: 1.23 GBit/s Max: 1.24 GBit/s

Run with DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(With LTO): Avg: 1.31 GBit/s Min: 1.28  Max: 1.34 GBit/s

## xdp_tx_iptunnel

Run in kernel:

```sh
sudo  xdp_progs/xdp_tx_iptunnel -i enp24s0f1np1 -a 192.168.1.11 -s 192.168.1.13 -d 192.168.1.13 -m b8:3f:d2:2a:e7:69  -p 1-255 -S
```

- Native mode: Avg: 484.49 MBit/s Min: 484.08 MBit/s  Max: 484.98 MBit/s
- SKB mode: Avg: 458.56 MBit/s  Min: 456.89 MBit/s  Max: 460.06 MBit/s

Run in userspace:

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug    xdp_progs/xdp_tx_iptunnel -i enp24s0f1np1 -a 192.168.1.11 -s 192.168.1.13 -d 192.168.1.13 -m b8:3f:d2:2a:e7:69  -p 1-255 -b xdp-ebpf-new/base.btf
```

## trouble shooting

```console
yunwei@octopus1:~/ebpf-xdp-dpdk$ sudo -E SPDLOG_LEVEL=Debug LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:/home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/lib/libxdp/ /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/build/l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
[2024-03-22 12:25:43.492] [info] [bpftime_shm_internal.cpp:627] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-03-22 12:25:43.492] [info] [llvm_jit_context.cpp:81] Initializing llvm
find eBPF program xdp_pass   60
Ext func not found: _bpf_helper_ext_195896080
INFO [805171]: Global shm destructed
```

The BTF CO-RE has not complete and issue an invalid function call.
