# Port katran

The record for porting katran, include:

- What features katran is using
- How to run katran example in my machine
- How to test it's functionality with a simple example
- How to run it in userspace

## Required features for katran

This is the analysis for katran program:

```console
$ sudo bpftool prog
...
82: xdp  name balancer_ingress  tag d8fa0fcd48f4bd5f  gpl
        loaded_at 2024-05-12T14:50:41+0000  uid 0
        xlated 18848B  jited 10305B  memlock 20480B  map_ids 20,28,22,21,29,24,23,27,26,19,25,33,31
        btf_id 127
        pids katran_server_g(318559)
```

And the related maps:

```console
$ sudo bpftool map
18: lru_hash  name katran_lru  flags 0x0
        key 40B  value 16B  max_entries 8000000  memlock 448000000B
        pids katran_server_g(318559)
19: array  name ctl_array  flags 0x0
        key 4B  value 8B  max_entries 16  memlock 4096B
        btf_id 127
        pids katran_server_g(318559)
20: hash  name vip_map  flags 0x0
        key 20B  value 8B  max_entries 512  memlock 16384B
        btf_id 127
        pids katran_server_g(318559)
21: lru_hash  name fallback_cache  flags 0x0
        key 40B  value 16B  max_entries 1000  memlock 57344B
        btf_id 127
        pids katran_server_g(318559)
22: array_of_maps  name lru_mapping  flags 0x0
        key 4B  value 4B  max_entries 128  memlock 4096B
        pids katran_server_g(318559)
23: array  name ch_rings  flags 0x0
        key 4B  value 4B  max_entries 33554944  memlock 268439552B
        btf_id 127
        pids katran_server_g(318559)
24: array  name reals  flags 0x0
        key 4B  value 20B  max_entries 4096  memlock 98304B
        btf_id 127
        pids katran_server_g(318559)
25: percpu_array  name reals_stats  flags 0x0
        key 4B  value 16B  max_entries 4096  memlock 8421376B
        btf_id 127
        pids katran_server_g(318559)
26: percpu_array  name lru_miss_stats  flags 0x0
        key 4B  value 4B  max_entries 4096  memlock 4227072B
        btf_id 127
        pids katran_server_g(318559)
27: array  name vip_miss_stats  flags 0x0
        key 4B  value 20B  max_entries 1  memlock 4096B
        btf_id 127
        pids katran_server_g(318559)
28: percpu_array  name stats  flags 0x0
        key 4B  value 16B  max_entries 1024  memlock 2105344B
        btf_id 127
        pids katran_server_g(318559)
29: percpu_array  name quic_stats_map  flags 0x0
        key 4B  value 104B  max_entries 1  memlock 16384B
        btf_id 127
        pids katran_server_g(318559)
30: percpu_array  name decap_vip_stats  flags 0x0
        key 4B  value 16B  max_entries 512  memlock 1052672B
        btf_id 127
        pids katran_server_g(318559)
31: array  name server_id_map  flags 0x0
        key 4B  value 4B  max_entries 16777214  memlock 134217728B
        btf_id 127
        pids katran_server_g(318559)
32: percpu_array  name tpr_stats_map  flags 0x0
        key 4B  value 32B  max_entries 1  memlock 8192B
        btf_id 127
        pids katran_server_g(318559)
33: percpu_array  name server_id_stats  flags 0x0
        key 4B  value 16B  max_entries 512  memlock 1052672B
        btf_id 127
        pids katran_server_g(318559)
```

For the disassembly bytecode, see [dump_katran.txt](dump_katran.txt)

New Helpers:

- bpf_get_smp_processor_id
- bpf_xdp_adjust_head

New Map types

- BPF_MAP_TYPE_LRU_HASH
- BPF_MAP_TYPE_ARRAY_OF_MAPS
- BPF_MAP_TYPE_LPM_TRIE

## Run katran in kernel with local example

For the katran code fixed some compile issues, see <https://github.com/yunwei37/katran>

See <https://github.com/facebookincubator/katran/blob/main/EXAMPLE.md> for how the example works.

(Test in my machine)

Start with the environment in repo:

```sh
scripts/testbed-setup.sh ebpf
source scripts/aliases.sh
lb bash
```

Allow forward:

```sh
sudo iptables -P FORWARD ACCEPT
sudo ip netns exec h2 ip link set lo up
```

First, config kernel and local env. There are four steps:

1. MAC address of default gateway: `10.0.0.2` `de:ad:be:ef:00:02`
2. You need to know how many receive queues your NIC has and what the mapping between them and cpus
3. collect CPU to NUMA node mapping
4. Disable Receive Offload

```console
# ip route
10.0.0.0/24 dev veth6 proto kernel scope link src 10.0.0.10 
# ip n show
10.0.0.3 dev veth6 lladdr de:ad:be:ef:00:03 STALE 
10.0.0.2 dev veth6 lladdr de:ad:be:ef:00:02 STALE 
# ifconfig
veth6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.10  netmask 255.255.255.0  broadcast 10.0.0.255
        inet6 fe80::dcad:beff:feef:10  prefixlen 64  scopeid 0x20<link>
        ether de:ad:be:ef:00:10  txqueuelen 1000  (Ethernet)
        RX packets 38  bytes 2728 (2.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 22  bytes 1664 (1.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
#  sudo ethtool -l veth6
Channel parameters for veth6:
Pre-set maximums:
RX:             128
TX:             128
Other:          n/a
Combined:       n/a
Current hardware settings:
RX:             1
TX:             1
Other:          n/a
Combined:       n/a
# sudo systemctl stop irqbalance
# sudo systemctl disable irqbalance
Synchronizing state of irqbalance.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable irqbalance
Removed "/etc/systemd/system/multi-user.target.wants/irqbalance.service".
$ # do this for physical device
$ # cat /proc/interrupts  | grep ens33
  19:          0          0          0          0          0          0         39     639058   IO-APIC   19-fasteoi   ens33
$ # cd /proc/irq/19
$ # sudo  sh -c "echo 1 > smp_affinity"  
$ sudo ip link add name ipip0 type ipip external
# sudo ip link add name ipip60 type ip6tnl external
# sudo ip link set up dev ipip0
# sudo ip link set up dev ipip60
$ # sudo /usr/sbin/ethtool --offload ens33  lro off
```

build grpc client:

```c
cd example_grpc
./build_grpc_client.sh
```

start katran:

```console
~/katran$ sudo ./_build/build/example_grpc/katran_server_grpc -balancer_prog ./_build/deps/bpfprog/bpf/balancer.bpf.o -default_mac de:ad:be:ef:00:02 -forwarding_cores=0 -intf=veth6 -hc_forwarding=false
I20240512 14:50:40.829821 318559 KatranGrpcService.cpp:69] Starting Katran
libbpf: elf: skipping unrecognized data section(17) .eh_frame
libbpf: elf: skipping relo section(18) .rel.eh_frame for section(17) .eh_frame
libbpf: elf: skipping unrecognized data section(17) .eh_frame
libbpf: elf: skipping relo section(18) .rel.eh_frame for section(17) .eh_frame
libbpf: loading ./_build/deps/bpfprog/bpf/balancer.bpf.o
libbpf: elf: section(3) xdp, size 17984, link 0, flags 6, type=1
libbpf: sec 'xdp': found program 'balancer_ingress' at insn offset 0 (0 bytes), code size 2248 insns (17984 bytes)
libbpf: elf: section(4) .relxdp, size 832, link 21, flags 0, type=9
libbpf: elf: section(5) license, size 4, link 0, flags 3, type=1
....
verification time 30932 usec
stack depth 200
processed 52961 insns (limit 1000000) max_states_per_insn 13 total_states 2563 peak_states 801 mark_read 36
-- END PROG LOAD LOG --
Server listening on 0.0.0.0:50051
```

In this example:

1. MAC address of default router is de:ad:be:ef:00:02
2. Only cpu 0 is configured for forwarding (by IRQ affinity).
3. We are using veth6 interface for load balancing (packets would be received on this interface).
4. disable health checking

## Test of connection

Topology:

```sh
# client is 10.0.0.1
# katran is on 10.0.0.10
# vip is 10.200.200.1
<client> ---- <net> ---- <katran> ---- <net> ---- <server>
```

Packet flow looks like this:

1. From "client" to "katran" (which advertises VIP reachability to the network) it's IP packets with a src of "client" and dst of the VIP.
2. When "katran" receives this packets, it encapsulates them and sends to the real. this packets are going to be IPIP encapsulated. inner header would state the same ("client" -> "VIP"). The outer header contains specifically crafted src address and destination would be address of the "server".
3. When server receives this IPIP packet - it removes outer ip header, and processes original packet and while sending replies - it sends it directly from the "VIP" to the "client".

Enter lb:

```sh
source scripts/aliases.sh
lb bash
```

Create ipip interfaces on the server:

```sh
sudo ip link add name ipip0 type ipip external
sudo ip link add name ipip60 type ip6tnl external
sudo ip link set up dev ipip0
sudo ip link set up dev ipip60
```

Specific to the linux is that for ipip interface to work:

```sh
sudo ip a a 127.0.0.42/32 dev ipip0
```

Disable rp_filter feature:

```console
$ for sc in $(sudo sysctl -a | awk '/\.rp_filter/ {print $1}'); do  echo $sc ; sudo sysctl ${sc}=0; done
net.ipv4.conf.all.rp_filter
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.docker0.rp_filter
net.ipv4.conf.docker0.rp_filter = 0
net.ipv4.conf.ens33.rp_filter
net.ipv4.conf.ens33.rp_filter = 0
net.ipv4.conf.ip6tnl0.rp_filter
net.ipv4.conf.ip6tnl0.rp_filter = 0
net.ipv4.conf.ipip0.rp_filter
net.ipv4.conf.ipip0.rp_filter = 0
net.ipv4.conf.ipip60.rp_filter
net.ipv4.conf.ipip60.rp_filter = 0
net.ipv4.conf.lo.rp_filter
net.ipv4.conf.lo.rp_filter = 0
net.ipv4.conf.tunl0.rp_filter
net.ipv4.conf.tunl0.rp_filter = 0
```

VIP must be configured on the real:

```console
sudo ip a a 10.200.200.1/32 dev lo
```

Configure a VIP. In our case we are interested in traffic Towards ip 10.200.200.1 and destination port 80/tcp (http). To interact with katran we are using go based client, you can run it w/ --help flag to see what options it supports.

```console
$ sudo ip link set lo up
$ ./example_grpc/goclient/bin/main -A -t 10.200.200.1:80
2024/05/12 15:17:39 Adding service: 10.200.200.1:80 6
2024/05/12 15:17:39 Vip modified
exiting
```

Add a real to this VIP. In this case: ip address of the real would be 10.0.0.2. As in our example VIP will have only single real - we will not configure any weight for this real.

```console
$ ./example_grpc/goclient/bin/main -a -t 10.200.200.1:80 -r 10.0.0.2
2024/05/12 15:19:29 Reals modified
exiting
```

list the config:

```sh
$ ./example_grpc/goclient/bin/main -l
2024/05/12 16:03:39 vips len 1
VIP:         10.200.200.1 Port:     80 Protocol: tcp
Vip's flags: 
 ->10.0.0.2          weight: 1 flags: 
exiting
```

start a server on h2:

```sh
source scripts/aliases.sh
h2 bash
python3 -m http.server
```

Set route and curl in root ns:

```sh
$ sudo ip route add 10.200.200.1 via 10.0.0.10
$ ping 10.200.200.1
PING 10.200.200.1 (10.200.200.1) 56(84) bytes of data.
64 bytes from 10.200.200.1: icmp_seq=1 ttl=64 time=9.87 ms
64 bytes from 10.200.200.1: icmp_seq=2 ttl=64 time=0.114 ms
...
$ curl 10.200.200.1
```

Observe the lru results:

```sh
$ ./example_grpc/goclient/bin/main  -s -lru
summary: 0 pkts/sec. lru hit: 0.00% lru miss: 0.00% (tcp syn: 0.00% tcp non-syn: 0.00% udp: 0.00%) fallback lru hit: 0 pkts/sec
summary: 9 pkts/sec. lru hit: 88.89% lru miss: 11.11% (tcp syn: 0.11% tcp non-syn: 0.00% udp: 0.00%) fallback lru hit: 0 pkts/sec
summary: 0 pkts/sec. lru hit: 0.00% lru miss: 0.00% (tcp syn: 0.00% tcp non-syn: 0.00% udp: 0.00%) fallback lru hit: 0 pkts/sec
summary: 2 pkts/sec. lru hit: 100.00% lru miss: 0.00% (tcp syn: 0.00% tcp non-syn: 0.00% udp: 0.00%) fallback lru hit: 0 pkts/sec
```

You can also use udp traffic:

```sh
# See https://github.com/eunomia-bpf/xdp-pktgen in test
$ ./udp_client # generate traffic
$ sudo ./xdpdump -i veth6 -v --rx-capture exit -x
1715573433.008508953: balancer_ingress()@exit[TX]: packet size 75 bytes, captured 75 bytes on if_index 25, rx queue 0, id 10
  0x0000:  de ad be ef 00 02 de ad be ef 00 10 08 00 45 00  ..............E.
  0x0010:  00 3d 00 00 00 00 40 04 af 02 ac 10 15 a9 0a 00  .=....@.........
  0x0020:  00 02 45 00 00 29 8f 7a 40 00 40 11 ce 7f 0a 00  ..E..).z@.@.....
  0x0030:  00 01 0a c8 c8 01 a8 15 26 94 00 15 dc f0 48 65  ........&.....He
  0x0040:  6c 6c 6f 20 53 65 72 76 65 72 21                 llo Server!
```

## Run in userspace

```sh
sudo BPFTIME_RUN_WITH_KERNEL=true BPFTIME_ALLOW_EXTERNAL_MAPS=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/bpftime/build/runtime/syscall-server/libbpftime-syscall-server.so ./_build/build/example_grpc/katran_server_grpc -balancer_prog ./_build/deps/bpfprog/bpf/balancer.bpf.o -default_mac de:ad:be:ef:00:02 -forwarding_cores=0 -intf=veth6 -hc_forwarding=false
```

This include:

- load katran xdp programs and maps into the kernel, Track and dump the BPF instructions
- Block the program from attaching to xdp interfaces
- "Unload" the program and maps, record the info in share memory, attach them in userspace

Another approach is just load it in userspace share memory, so no kernel eBPF support is needed(May be buggy):

```sh
sudo BPFTIME_ALLOW_EXTERNAL_MAPS=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/bpftime/build/runtime/syscall-server/libbpftime-syscall-server.so ./_build/build/example_grpc/katran_server_grpc -balancer_prog ./_build/deps/bpfprog/bpf/balancer.bpf.o -default_mac de:ad:be:ef:00:02 -forwarding_cores=0 -intf=veth6 -hc_forwarding=false
```

The map access for katran, for example, like the rpc client does `./example_grpc/goclient/bin/main -A -u 10.200.200.1:9876` will go through userspace maps in shared memory.

Dump with json:

```sh
$ sudo /home/yunwei/ebpf-xdp-dpdk/bpftime/build/tools/bpftimetool/bpftimetool export res.json
[2024-05-13 04:20:23.707] [info] [bpftime_shm_internal.cpp:658] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
[2024-05-13 04:20:23.707] [info] [bpftime_shm_internal.cpp:29] Global shm initialized
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:265] find prog fd=15 name=balancer_ingres
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=ctl_array found at 334
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=vip_map found at 335
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=fallback_cache found at 336
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=lru_mapping found at 337
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=ch_rings found at 338
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=reals found at 339
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=reals_stats found at 340
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=lru_miss_stats found at 341
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=vip_miss_stats found at 342
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=stats found at 343
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=quic_stats_map found at 344
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=decap_vip_stats found at 345
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=server_id_map found at 346
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=tpr_stats_map found at 347
[2024-05-13 04:20:23.709] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=server_id_stats found at 348
INFO [392027]: Global shm destructed
```

See the json file [katran.json](katran.json) for the detail config and instructions.

Setup the environment as described before.

Run dpdk:

```console
$ sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/:/home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/lib/libxdp/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/libbpf /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/dpdk_l2fwd_llvm -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1

load eBPF program xdp_pass
set entry program xdp_pass
init eBPF runtime success
EAL: Detected CPU lcores: 48
EAL: Detected NUMA nodes: 1
EAL: Detected static linkage of DPDK
EAL: Multi-process socket /var/run/dpdk/rte/mp_socket
EAL: Selected IOVA mode 'PA'
```

Run AF_XDP:

```sh
cd ebpf-xdp-dpdk/afxdp/l2fwd
sudo ./xdpsock_llvm --l2fwd -i enp24s0f1np1
```
