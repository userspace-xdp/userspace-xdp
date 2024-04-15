# basic benchmark results

<!-- TOC -->

- [basic benchmark results](#basic-benchmark-results)
  - [steup](#steup)
    - [octopus1 setup](#octopus1-setup)
    - [octopus3 setup](#octopus3-setup)
    - [test connection](#test-connection)
  - [helper commands](#helper-commands)
  - [if calculate on octopus1, overhead](#if-calculate-on-octopus1-overhead)
  - [test config](#test-config)
  - [Test with tcp4 traffic](#test-with-tcp4-traffic)
    - [xdp tx](#xdp-tx)
    - [array map access](#array-map-access)
  - [csum with map access helper](#csum-with-map-access-helper)
  - [xdp\_tx\_iptunnel](#xdp_tx_iptunnel)
  - [ICMP traffic](#icmp-traffic)
    - [xdping](#xdping)
  - [trouble shooting](#trouble-shooting)
  - [eplain the results](#eplain-the-results)

## steup

### octopus1 setup

```consoel
yunwei@octopus1:~$ ifconfig
enp24s0f1np1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::ba3f:d2ff:fe2a:e511  prefixlen 64  scopeid 0x20<link>
        ether b8:3f:d2:2a:e5:11  txqueuelen 1000  (Ethernet)
        RX packets 735928  bytes 149160655 (149.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 302807  bytes 99698562 (99.6 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Add config for ipv4:

```console
sudo ip addr add 192.168.1.11/24 dev enp24s0f1np1
```

### octopus3 setup

```console
yunwei@octopus3:~$ ifconfig
enp24s0f0np0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether b8:3f:d2:2a:e7:68  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp24s0f1np1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::ba3f:d2ff:fe2a:e769  prefixlen 64  scopeid 0x20<link>
        ether b8:3f:d2:2a:e7:69  txqueuelen 1000  (Ethernet)
        RX packets 274072  bytes 53074048 (53.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 122343  bytes 40295058 (40.2 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Add config for ipv4:

```console
sudo ip addr add 192.168.1.13/24 dev enp24s0f1np1
```

### test connection

on octopus3:

```console
yunwei@octopus3:~$ ping  192.168.1.11
PING 192.168.1.11 (192.168.1.11) 56(84) bytes of data.
64 bytes from 192.168.1.11: icmp_seq=1 ttl=64 time=0.271 ms
64 bytes from 192.168.1.11: icmp_seq=2 ttl=64 time=0.258 ms
64 bytes from 192.168.1.11: icmp_seq=3 ttl=64 time=0.230 ms
64 bytes from 192.168.1.11: icmp_seq=4 ttl=64 time=0.213 ms
^C
--- 192.168.1.11 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3070ms
rtt min/avg/max/mdev = 0.213/0.243/0.271/0.022 ms
```

on octopus1:

```console
yunwei@octopus1:~$ ping 192.168.1.13
PING 192.168.1.13 (192.168.1.13) 56(84) bytes of data.
64 bytes from 192.168.1.13: icmp_seq=1 ttl=64 time=0.201 ms
64 bytes from 192.168.1.13: icmp_seq=2 ttl=64 time=0.258 ms
^C
--- 192.168.1.13 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1033ms
rtt min/avg/max/mdev = 0.201/0.229/0.258/0.028 ms
```

trouble shooting:

```console
yunwei@octopus3:~$ arp -a
? (192.168.1.11) at b8:3f:d2:2a:e5:11 [ether] PERM on enp24s0f1np1
vl-3102-dcsk-rt1.net.ic.ac.uk (146.179.5.254) at 0c:59:9c:cf:58:88 [ether] on eno8303
octopus1.doc.res.ic.ac.uk (146.179.4.8) at cc:96:e5:f4:46:5a [ether] on eno8303
vl-3102-gw.net.ic.ac.uk (146.179.4.1) at 00:00:5e:00:01:00 [ether] on eno8303
octopus2.doc.res.ic.ac.uk (146.179.4.13) at cc:96:e5:f4:0a:ca [ether] on eno8303
yunwei@octopus3:~$ ip route show
default via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
146.179.4.0/23 dev eno8303 proto kernel scope link src 146.179.4.14 metric 100 
146.179.4.1 dev eno8303 proto dhcp scope link src 146.179.4.14 metric 100 
155.198.3.11 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
155.198.3.12 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
155.198.3.13 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
155.198.3.14 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
155.198.142.7 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
155.198.142.8 via 146.179.4.1 dev eno8303 proto dhcp src 146.179.4.14 metric 100 
192.168.1.0/24 dev enp24s0f1np1 proto kernel scope link src 192.168.1.13 
```

## helper commands

diable xdp for enp24s0f1np1:

```sh
sudo ip link set dev enp24s0f1np1 xdp off
sudo ip link set dev enp24s0f1np1 xdpgeneric off
```

Run with DPDK-pktgen

```sh
sudo /home/yunwei/Pktgen-DPDK/usr/local/bin/pktgen  -l 0-1 -n 4 -a 18:00.1 -- -P -m "[1].0"
sudo /home/yunwei/Pktgen-DPDK/usr/local/bin/pktgen -l 0-2 -n 4 -a 18:00.1 -- -P -m "[1-2].0"
set 0 dst mac b8:3f:d2:2a:e5:11
set 0 rate 5%
start 0
```

bind DPDK

```console
sudo /home/yunwei/ebpf-xdp-dpdk/external/dpdk/usertools/dpdk-devbind.py --bind=vfio-pci 0000:18:00.1
sudo -E LD_LIBRARY_PATH=/home/yunwei/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH Pktgen-DPDK/Builddir/app/pktgen  -l 0-2 -n 4 -a 18:00.1 -- -P -m "[1-2].0" -f /home/yunwei/ebpf-xdp-dpdk/Pktgen-DPDK/scripts/traffic-profile.lua
```

combined the AF_XDP queue:

```sh
sudo ethtool -L enp24s0f1np1 combined 1
```

start af_xdp_user:

```sh
cd ebpf-xdp-dpdk/afxdp/l2fwd
sudo ./xdpsock --l2fwd -i enp24s0f1np1
```

start l2fw in dpdk:

```sh
export PKG_CONFIG_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig
make -C dpdk_l2fwd/

sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/: /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/build/l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1

sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:/home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/lib/libxdp/ /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/build/l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1

sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:/home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/lib/libxdp/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/libbpf AOT_OBJECT_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp-firewall/.output/xdp_firewall.aot.o /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/dpdk_l2fwd_llvm -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1

sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:/home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/lib/libxdp/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/libbpf /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/dpdk_l2fwd_llvm -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1

# Start the process in the background
```

test with nload on octopus3:

```sh
nload enp24s0f1np1
```

## if calculate on octopus1, overhead

1 thread

kernel xdp: Avg: 943.58 MBit/s (Open the BPF_ENABLE_STATS will reduce the performance to 893.64 MBit/s)

## test config

RelwithDebInfo build:

```sh
## with llvm jit:
cmake -B build-bpftime .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DBPFTIME_LLVM_JIT=1
make -C  build-bpftime -j
```

Using LTO. LTO is powerful.

## Test with tcp4 traffic

generated with pktgen on octopus3:

```txt
TCP Seq/Ack         :           74616/74640
Pattern Type        :               abcd...
Tx Count/% Rate     :         Forever /100%
Pkt Size/Rx:Tx Burst:           64 / 64: 64
TTL/Port Src/Dest   :        64/ 1234/ 5678
Pkt Type:VLAN ID    :       IPv4 / TCP:0001
802.1p CoS/DSCP/IPP :             0/  0/  0
VxLAN Flg/Grp/vid   :      0000/    0/    0
IP  Destination     :           192.168.1.1
    Source          :        192.168.0.1/24
MAC Destination     :     b8:3f:d2:2a:e5:11
    Source          :     b8:3f:d2:2a:e7:69
NUMA/Vend:ID/PCI    :   0/15b3:101d/18:00.1
```

The basic rate is:

```txt
Pkts/s Rx           :                     0                    0
       Tx           :            47,932,160           47,932,160
```

### xdp tx

```sh
# load in kernel
sudo xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1

# load in userspace
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1 xdp-ebpf-new/base.btf
```

measure with nload on octopus3, by redirecting the traffic from octopus1 back to octopus3. test with 10 seconds and get the average.

Instruction count 20.

kernel XDP:

- SKB_MODE: Pkts/s Rx 2,164,583  Tx  48,403,200
- DRV_MODE: Pkts/s Rx 13,742,371 Tx  48,638,848

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, interpreter(Without LTO): 
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, ubpf jit(Without LTO): 
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1 -N`, llvm jit(Without LTO), native mode: RX 1,854,719 Tx  48,638,848
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1 -S`, llvm jit(Without LTO), skb mode: RX 1,385,468  Tx  48,638,848
  
dpdk xdp:  

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, interpreter(Without LTO): 
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, ubpf jit(Without LTO): 
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO): Rx 33,432,764 Tx 33,447,040

### array map access

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_map_access  enp24s0f1np1 xdp-ebpf-new/base.btf
```

kernel eBPF:

```sh
sudo xdp_progs/xdp_map_access  enp24s0f1np1 -N
```

- Native mode: Rx 13,827,390  Tx 48,695,424
- SKB mode: Rx 2,148,225 Tx 48,432,000

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1 -N`, llvm jit(With LTO), native mode: Rx 1,701,698 Tx 47,885,696

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(With LTO): Rx 20,563,882 Tx 37,582,336

## csum with map access helper

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_csum enp24s0f1np1 xdp-ebpf-new/base.btf
```

Generate traffic with 1 thread, icmp traffic for ipv4.

kernel XDP:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/xdp_progs/xdp_csum enp24s0f1np1
```

- Native mode: Rx 1,031,770 Tx 47,924,864
- Native mode: Rx 1,732,224 Tx 47,519,104

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit(Without LTO): 
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1 -N`, llvm jit(With LTO): Rx 762,048 Tx 48,282,112

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(Without LTO): 
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit(With LTO): Rx  1,310,560 Tx 46,579,712

## xdp_tx_iptunnel

Run in kernel:

```sh
sudo  xdp_progs/xdp_tx_iptunnel -i enp24s0f1np1 -a 192.168.1.11 -s 192.168.1.13 -d 192.168.1.13 -m b8:3f:d2:2a:e7:69  -p 1-255 -S
```

- Native mode: 
- SKB mode: 

Run in userspace:

```sh
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug    xdp_progs/xdp_tx_iptunnel -i enp24s0f1np1 -a 192.168.1.11 -s 192.168.1.13 -d 192.168.1.13 -m b8:3f:d2:2a:e7:69  -p 1-255 -b xdp-ebpf-new/base.btf
```

## ICMP traffic

### xdping

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

## eplain the results

AF_XDP perf data, run with xdp_tx:

```txt
    88.88%    88.54%  xdpsock_llvm  xdpsock_llvm          [.] l2fwd_all
            |          
            |--88.23%--l2fwd_all
            |          
             --0.65%--0x7f654a0e7000

     9.83%     9.48%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7012
            |          
             --9.48%--0x7f654a0e7014

     9.53%     0.05%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7014
            |          
             --9.49%--0x7f654a0e7014

     0.65%     0.00%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7000
            |          
             --0.65%--0x7f654a0e7000

     0.52%     0.12%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e701b
     0.45%     0.40%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7018
     0.35%     0.14%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7025
     0.35%     0.35%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e700c
     0.32%     0.30%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7031
     0.26%     0.22%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7022
     0.25%     0.11%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e7029
     0.17%     0.04%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e701e
     0.12%     0.01%  xdpsock_llvm  [JIT] tid 585771      [.] 0x00007f654a0e702c
     0.09%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] entry_SYSCALL_64_after_hwframe
     0.09%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] do_syscall_64
     0.05%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] handle_mm_fault
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __handle_mm_fault
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] asm_sysvec_apic_timer_interrupt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] sysvec_apic_timer_interrupt
     0.04%     0.00%  xdpsock_llvm  libc.so.6             [.] __GI___setsockopt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __x64_sys_setsockopt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __sys_setsockopt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] do_sock_setsockopt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] xsk_setsockopt
     0.04%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] xdp_umem_create
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __sysvec_apic_timer_interrupt
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] hrtimer_interrupt
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] pin_user_pages
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __gup_longterm_locked
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __get_user_pages
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __hrtimer_run_queues
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] tick_nohz_highres_handler
     0.03%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] do_anonymous_page
     0.02%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] asm_exc_page_fault
     0.02%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __x64_sys_sendto
     0.02%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] __sys_sendto
     0.02%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] tick_sched_handle
     0.02%     0.00%  xdpsock_llvm  [kernel.kallsyms]     [k] update_process_times
```

