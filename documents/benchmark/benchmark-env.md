# benchmark in octopus

We have machine octopus1 and octopus3

```txt
+--------+      +--------+
|octopus1|------|octopus3|
|   NF   |------| Pktgen |
+--------+      +--------+
```

## octopus1

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

## octopus3

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

## test connection

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

## Test running

```sh
sudo /home/yunwei/ebpf-xdp-dpdk/external/dpdk/usertools/dpdk-devbind.py --bind=vfio-pci 0000:18:00.1
sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH ./Builddir/app/pktgen  -l 0-4 -n 3 --proc-type auto --socket-mem 256 --file-prefix pg -- -P -m "[1:3].0, [2:4].1"
```