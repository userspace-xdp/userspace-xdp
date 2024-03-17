# basic benchmark results

We have machine octopus1 and octopus3

```txt
+--------+      +--------+
|octopus1|------|octopus3|
|   NF   |------| Pktgen |
+--------+      +--------+
```

## Table of contents

- [basic benchmark results](#basic-benchmark-results)
  - [Table of contents](#table-of-contents)
  - [steup](#steup)
    - [octopus1 setup](#octopus1-setup)
    - [octopus3 setup](#octopus3-setup)
    - [test connection](#test-connection)
  - [helper commands](#helper-commands)
  - [generated traffic config](#generated-traffic-config)
  - [if calculate on octopus1, overhead](#if-calculate-on-octopus1-overhead)
  - [xdp tx](#xdp-tx)
    - [Generate traffic with 1 thread, udp traffic for ipv6](#generate-traffic-with-1-thread-udp-traffic-for-ipv6)
    - [Generate traffic with 1 thread, icmp traffic for ipv4](#generate-traffic-with-1-thread-icmp-traffic-for-ipv4)
  - [csum](#csum)

## steup

### octopus1 setup

```consoel
yunwei@octopus1:~$ ifconfig
br0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::c0d0:78ff:feb2:aa23  prefixlen 64  scopeid 0x20<link>
        ether 9e:00:f3:84:d8:02  txqueuelen 1000  (Ethernet)
        RX packets 12916  bytes 723840 (723.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3229  bytes 226190 (226.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eno8303: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 146.179.4.8  netmask 255.255.254.0  broadcast 146.179.5.255
        inet6 2a0c:5bc0:80:102:ce96:e5ff:fef4:465a  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::ce96:e5ff:fef4:465a  prefixlen 64  scopeid 0x20<link>
        ether cc:96:e5:f4:46:5a  txqueuelen 1000  (Ethernet)
        RX packets 139944125  bytes 42304973281 (42.3 GB)
        RX errors 0  dropped 1157  overruns 0  frame 0
        TX packets 35698541  bytes 28237492404 (28.2 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 17  

eno8403: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether cc:96:e5:f4:46:5b  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 18  

enp24s0f0np0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether b8:3f:d2:2a:e5:10  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

enp24s0f1np1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::ba3f:d2ff:fe2a:e511  prefixlen 64  scopeid 0x20<link>
        ether b8:3f:d2:2a:e5:11  txqueuelen 1000  (Ethernet)
        RX packets 735928  bytes 149160655 (149.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 302807  bytes 99698562 (99.6 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 678436  bytes 2344018056 (2.3 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 678436  bytes 2344018056 (2.3 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.0.0.1  netmask 255.255.255.0  broadcast 10.0.0.255
        inet6 fe80::dcad:beff:feef:1  prefixlen 64  scopeid 0x20<link>
        ether de:ad:be:ef:00:01  txqueuelen 1000  (Ethernet)
        RX packets 16139  bytes 1130434 (1.1 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 3230  bytes 226196 (226.1 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::5c73:edff:fef5:f9ed  prefixlen 64  scopeid 0x20<link>
        ether 5e:73:ed:f5:f9:ed  txqueuelen 1000  (Ethernet)
        RX packets 3230  bytes 226196 (226.1 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 16139  bytes 1130434 (1.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth3: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::b8b8:a5ff:feb7:cc7  prefixlen 64  scopeid 0x20<link>
        ether ba:b8:a5:b7:0c:c7  txqueuelen 1000  (Ethernet)
        RX packets 3225  bytes 225846 (225.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 16142  bytes 1130584 (1.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth5: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::f030:55ff:fec6:507e  prefixlen 64  scopeid 0x20<link>
        ether f2:30:55:c6:50:7e  txqueuelen 1000  (Ethernet)
        RX packets 3225  bytes 225846 (225.8 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 16141  bytes 1130494 (1.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth7: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fe80::d8b7:3fff:fe6b:4bdc  prefixlen 64  scopeid 0x20<link>
        ether da:b7:3f:6b:4b:dc  txqueuelen 1000  (Ethernet)
        RX packets 3236  bytes 226776 (226.7 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 16132  bytes 1129684 (1.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

veth-basic02: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet6 fc00:dead:cafe:1::1  prefixlen 64  scopeid 0x0<global>
        inet6 fe80::a056:29ff:fe15:df4f  prefixlen 64  scopeid 0x20<link>
        ether a2:56:29:15:df:4f  txqueuelen 1000  (Ethernet)
        RX packets 115  bytes 12034 (12.0 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 91  bytes 10482 (10.4 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

yunwei@octopus1:~$ 
```

Add config for ipv4:

```console
sudo ip addr add 192.168.1.11/24 dev enp24s0f1np1
```

### octopus3 setup

```console
yunwei@octopus3:~$ ifconfig
eno8303: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 146.179.4.14  netmask 255.255.254.0  broadcast 146.179.5.255
        inet6 fe80::ce96:e5ff:fef4:4af2  prefixlen 64  scopeid 0x20<link>
        inet6 2a0c:5bc0:80:102:ce96:e5ff:fef4:4af2  prefixlen 64  scopeid 0x0<global>
        ether cc:96:e5:f4:4a:f2  txqueuelen 1000  (Ethernet)
        RX packets 50588110  bytes 12278958812 (12.2 GB)
        RX errors 0  dropped 469  overruns 0  frame 0
        TX packets 2029384  bytes 222146283 (222.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 17  

eno8403: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        ether cc:96:e5:f4:4a:f3  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 18  

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

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 128443  bytes 34020629 (34.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 128443  bytes 34020629 (34.0 MB)
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

bind DPDK

```console
sudo /home/yunwei/ebpf-xdp-dpdk/external/dpdk/usertools/dpdk-devbind.py --bind=vfio-pci 0000:18:00.1
sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH ./Builddir/app/pktgen  -l 0-4 -n 3 --proc-type auto --socket-mem 256 --file-prefix pg -- -P -m "[1:3].0, [2:4].1"
```

combined the AF_XDP queue:

```sh
sudo ethtool -L enp24s0f1np1 combined 1
```

generate icmp traffic for ipv4:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen file enp24s0f1np1 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin
```

generate udp traffic for ipv6:

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen udp enp24s0f1np1 --dst-mac b8:3f:d2:2a:e5:11 --src-mac b8:3f:d2:2a:e7:69 --dst-addr fe80::ba3f:d2ff:fe2a:e511 --src-addr fe80::ba3f:d2ff:fe2a:e769
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
```

test with nload on octopus3:

```sh
nload enp24s0f1np1
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

## if calculate on octopus1, overhead

1 thread

kernel xdp: Avg: 943.58 MBit/s (Open the BPF_ENABLE_STATS will reduce the performance to 893.64 MBit/s)

## xdp tx

```sh
# load in kernel
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

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, interpreter: Avg: 572.23 MBit/s  Min: 565.92 MBit/s  Max: 576.62 MBit/s
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, ubpf jit:  Avg: 778.46 MBit/s  Min: 774.47 MBit/s  Max: 781.60 MBit/s
- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit: Avg: Avg: 825.15 MBit/s  Min: 810.29 MBit/s  Max: 830.69 MBit/s
  
dpdk xdp:  

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, interpreter: Avg: 985.05 MBit/s Min: 924.11 Max: 1004.02 MBit/s
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, ubpf jit: Avg: 1000.35 MBit/s Min: 987.45 MBit/s Max: 1010.49 MBit/s
- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit: Avg: 1002.87 MBit/s Min: 982.67 MBit/s Max: 1015.69 MBit/s

### Generate traffic with 1 thread, icmp traffic for ipv4

kernel XDP:

- Native mode: AVG: 1.27 GBit/s Min: 857.31 MBit/s  Max: 1.30 GBit/s

AF_XDP:

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit: Avg: 1.17 GBit/s Min: 1.13 GBit/s Max: 1.20 GBit/s

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit: Avg: 1.29 GBit/s Min: 1.26 GBit/s Max: 1.31 GBit/s

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

- `sudo ./xdpsock --l2fwd -i enp24s0f1np1`, llvm jit: Avg: 1.13 GBit/s Min: 1.09 GBit/s  Max: 1.16 GBit/s

DPDK:

- `l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1`, llvm jit: Avg: Avg: 1.29 GBit/s  Min: 1.20 GBit/s Max: 1.31 GBit/s
