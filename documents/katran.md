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

(Test in my machine, the dev is ens33)

For the katran code fixed some compile issues, see <https://github.com/yunwei37/katran>

See <https://github.com/facebookincubator/katran/blob/main/EXAMPLE.md> for how the example works.

First, config kernel and local env. There are four steps:

1. MAC address of default gateway: `192.168.174.2` `00:50:56:fa:70:cc`
2. You need to know how many receive queues your NIC has and what the mapping between them and cpus
3. collect CPU to NUMA node mapping
4. Disable Receive Offload

```console
$  ip route  | grep default
default via 192.168.174.2 dev ens33 proto dhcp src 192.168.174.128 metric 100 
$ ip n show | grep 192.168.174.2
192.168.174.254 dev ens33 lladdr 00:50:56:fd:a7:be REACHABLE 
192.168.174.2 dev ens33 lladdr 00:50:56:fa:70:cc REACHABLE
$ ifconfig
docker0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 172.17.0.1  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:63:37:9b:b8  txqueuelen 0  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ens33: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 192.168.174.128  netmask 255.255.255.0  broadcast 192.168.174.255
        inet6 fe80::20c:29ff:feef:9fa6  prefixlen 64  scopeid 0x20<link>
        ether 00:0c:29:ef:9f:a6  txqueuelen 1000  (Ethernet)
        RX packets 1591144  bytes 2162127921 (2.1 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 370590  bytes 54742464 (54.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 352932  bytes 52887229 (52.8 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 352932  bytes 52887229 (52.8 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

yunwei@yunwei37server:~/katran/example_grpc$ sudo ethtool -l ens33
netlink error: Operation not supported
yunwei@yunwei37server:~/katran/example_grpc$ sudo systemctl stop irqbalance
yunwei@yunwei37server:~/katran/example_grpc$ sudo systemctl disable irqbalance
Synchronizing state of irqbalance.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install disable irqbalance
Removed "/etc/systemd/system/multi-user.target.wants/irqbalance.service".
yunwei@yunwei37server:~/katran/example_grpc$ cat /proc/interrupts  | grep ens33
  19:          0          0          0          0          0          0         39     639058   IO-APIC   19-fasteoi   ens33
yunwei@yunwei37server:~/katran/example_grpc$ cd /proc/irq/19
yunwei@yunwei37server:/proc/irq/19$ sudo  sh -c "echo 1 > smp_affinity"  
yunwei@yunwei37server:/proc/irq/19$ sudo ip link add name ipip0 type ipip external
yunwei@yunwei37server:/proc/irq/19$ sudo ip link add name ipip60 type ip6tnl external
yunwei@yunwei37server:/proc/irq/19$ sudo ip link set up dev ipip0
yunwei@yunwei37server:/proc/irq/19$ sudo ip link set up dev ipip60
yunwei@yunwei37server:/proc/irq/19$ sudo /usr/sbin/ethtool --offload ens33  lro off
```

build grpc client:

```c
cd example_grpc
./build_grpc_client.sh
```

start katran:

```console
~/katran$ sudo ./_build/build/example_grpc/katran_server_grpc -balancer_prog ./_build/deps/bpfprog/bpf/balancer.bpf.o -default_mac 00:50:56:fa:70:cc -forwarding_cores=0 -intf=ens33 -hc_forwarding=false
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

1. MAC address of default router is 00:50:56:fa:70:cc
2. Only cpu 0 is configured for forwarding (by IRQ affinity).
3. We are using ens33 interface for load balancing (packets would be received on this interface).
4. disable health checking

## Test of connection

Topology:

```sh
<client> ---- <net> ---- <katran> ---- <net> ---- <server>
```

Packet flow looks like this:

1. From "client" to "katran" (which advertises VIP reachability to the network) it's IP packets with a src of "client" and dst of the VIP.
2. When "katran" receives this packets, it encapsulates them and sends to the real. this packets are going to be IPIP encapsulated. inner header would state the same ("client" -> "VIP"). The outer header contains specifically crafted src address and destination would be address of the "server".
3. When server receives this IPIP packet - it removes outer ip header, and processes original packet and while sending replies - it sends it directly from the "VIP" to the "client".

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
