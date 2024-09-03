# L4 Load Balancer virtual env in DPDK and eBPF

Use [DPDK](https://www.dpdk.org/) and/or [eBPF](https://ebpf.io/) to implement a very simple connection load balancer.

- [L4 Load Balancer virtual env in DPDK and eBPF](#l4-load-balancer-virtual-env-in-dpdk-and-ebpf)
  - [Basic Topology Setup](#basic-topology-setup)
    - [Understanding the endgoal](#understanding-the-endgoal)
  - [DPDK Load Balancer](#dpdk-load-balancer)
    - [Test load balancer](#test-load-balancer)
  - [eBPF Load Balancer](#ebpf-load-balancer)
    - [Extend the topology and build the provided code skeleton](#extend-the-topology-and-build-the-provided-code-skeleton)


## Basic Topology Setup

Instead of using mininet, you will manually setup the network topology using a [Linux bridge](https://wiki.linuxfoundation.org/networking/bridge) and [network namespaces](https://man7.org/linux/man-pages/man7/network_namespaces.7.html).

You are provided with the equivalent scripts to do so in the `scripts` [directory](../scripts).
You are free to explore those scripts, but their exact functionality is beyond the scope of this project.

To setup the topology run:

```sh
sudo ./testbed-setup.sh
```

To destroy the topology run:

```sh
sudo ./testbed-teardown.sh
```

These scripts create a topology.

This topology consists of a local area network with one interface on your machine with IP address `10.0.0.1` and two attached network namespaces, which can be considered as different machines.

To verify that the topology is setup properly, try `ping`ing the different interfaces.
From your local machine you can ping `10.0.0.2` and `10.0.0.3`.
Use the aliases to ping other interfaces from within the namespaces similar to mininet.

```sh
source ./aliases.sh
```

and

```sh
h2 ping 10.0.0.1
```

and

```sh
h3 ping 10.0.0.2
```

> IN 23.10 my computer, if:

```console
$ h2 ping 10.0.0.1
PING 10.0.0.1 (10.0.0.1) 56(84) bytes of data.
^C
--- 10.0.0.1 ping statistics ---
7 packets transmitted, 0 received, 100% packet loss, time 6128ms
$ sudo ip netns exec h2 ip addr show
sudo ip netns exec h2 ip link show
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
15: veth2@if14: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP group default qlen 1000
    link/ether de:ad:be:ef:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
    inet 10.0.0.2/24 brd 10.0.0.255 scope global veth2
       valid_lft forever preferred_lft forever
    inet6 fe80::dcad:beff:feef:2/64 scope link 
       valid_lft forever preferred_lft forever
1: lo: <LOOPBACK> mtu 65536 qdisc noop state DOWN mode DEFAULT group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
15: veth2@if14: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue state UP mode DEFAULT group default qlen 1000
    link/ether de:ad:be:ef:00:02 brd ff:ff:ff:ff:ff:ff link-netnsid 0
```

Then it needs:

```sh
sudo ip netns exec h2 ip link set lo up
```

> another prolem, if:

```console
$ sudo iptables -L
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy DROP)
target     prot opt source               destination         
DOCKER-USER  all  --  anywhere             anywhere            
DOCKER-ISOLATION-STAGE-1  all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere             ctstate RELATED,ESTABLISHED
DOCKER     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            
ACCEPT     all  --  anywhere             anywhere            

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain DOCKER (1 references)
target     prot opt source               destination         

Chain DOCKER-ISOLATION-STAGE-1 (1 references)
target     prot opt source               destination         
DOCKER-ISOLATION-STAGE-2  all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-ISOLATION-STAGE-2 (1 references)
target     prot opt source               destination         
DROP       all  --  anywhere             anywhere            
RETURN     all  --  anywhere             anywhere            

Chain DOCKER-USER (1 references)
target     prot opt source               destination         
RETURN     all  --  anywhere             anywhere  
```

Then:

```sh
sudo iptables -P FORWARD ACCEPT
```

### Understanding the endgoal

The goal of this is to build a load balancer and enhace the previous topology as in the following picture.

Here’s a basic text representation of the described topology with the load balancer:

```txt
   +------------------+
   |  Local Machine   |
   |  IP: 10.0.0.1    |
   +--------+---------+
            |
            |
            |
   +--------+---------+
   |   Load Balancer  |
   |  IP: 10.0.0.10   |
   +--------+---------+
            |
    +-------+-------+
    |               |
    |               |
+---+---+       +---+---+
|  h2   |       |  h3   |
| IP:   |       | IP:   |
| 10.0.0.2      | 10.0.0.3 
+-------+       +-------+
```

In this topology, the load balancer is a middlebox that listens to `10.0.0.10` and forwards packets from your local machine to the two namespaces based on a hash-basesd load balancing policy.
The load balancer hashes the 5-tuple of the packets coming from `10.0.0.1` and based on the hash value forwards these packets to the equivalent server running inside `h2` and `h3`.
On the opposite direction, it forwards packets coming from `h2` and `h3` back to `10.0.0.1`.

## DPDK Load Balancer

DPDK is a framework to implement high-performance networked applications entirely in userspace.
Instead of depending on kernel-based drivers, DPDK gives applications direct access to the NIC by implementing these drivers in userspace, completely bypassing the kernel.
This is a very powerful mechanism widely used in academia and industry to implement not only NFs but also custom and special purpose protocols that run at the endhost.

DPDK requires huge pages, so run the equivalent script to enable them.

```sh
sudo ./hugepages.sh
```

To make sure everything works correctly run the middlebox

```sh
sudo ./build/base-server -l 0 --vdev=net_tap0,iface=tapdpdk
```

In this configuration, DPDK uses a [TAP interface](https://en.wikipedia.org/wiki/TUN/TAP) instead of an actual NIC.
So, every time you run the load balancer, you need to connect this TAP interface to the bridge.
To do so, use the provided script.

```sh
sudo scripts/link-dpdk.sh
```

From your machine try `arp`ing the middlebox.

```sh
sudo arping 10.0.0.10
```

### Test load balancer

To test load balancer you will simply use the netcat (`nc`) program both for the client and the server.

In two different terminals run two netcat servers in the two namespaces

```sh
h2 nc -l 8080
```

```sh
h3 nc -l 8080
```

From your machine run to connect to one of the servers and send some messages.

```sh
nc 10.0.0.10 8080
```

Both servers should receive some packets.

Execute the same process again several times till you receive packets on both servers.


## eBPF Load Balancer

[eBPF](https://ebpf.io/) is an emerging technology in the Linux kernel that enables safe execution of user code inside the kernel.
It has a wide range of usecases from debugging and monitoring to high-performance networking.
eBPF implements an event-based approach, according to which eBPF programs are attached to different hooks inside the kernel and get triggered when the code execution goes through this hook.
In this exercise, we will use eBPF to process incoming packets at the lowest level of the networking stack.
To do so, we will use a special kind of hook called `XDP`.

### Extend the topology and build the provided code skeleton

Unlike the DPDK load balancer that used a TAP interface, eBPF is part of the Linux kernel.
So, we need to add another endpoint in the provided topology that will play the role of the load balancer.

To do so, as before run the provided script:

```sh
sudo ./testbed-setup.sh ebpf
```

This script will add another network namespace with an interface attached to the same bridge.
This interface is at `10.0.0.10`.

To work with eBPF you will need [`libbpf`](https://github.com/libbpf/libbpf).
This library is a submodule in your project.
So, to fetch it, if you haven't already,  run:

```sh
git submodule update --init --recursive
```

To build the provided code run in xdp-ebpf directory:

```sh
make -C xdp_progs/xdp-lb
```

To load the eBPF program run the following:

```sh
xdp_lb veth6
```

Note: make sure you have run `source alias.sh` before, so that `lb` make sense.
As before, this alias allows you to execute commands in the load balancer network namespace.

To make sure that everything works well, the provided eBPF skeleton drops all incoming TCP and ICMP packets.
Trying running `ping 10.0.0.10` before and after loading the eBPF program.
When the eBPF program is loaded you should not get any ICMP responses.

To unload the eBPF program run:

```sh
lb ip link set dev veth6 xdpgeneric off
```
