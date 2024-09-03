# L4 Load Balancer in DPDK and eBPF

Use [DPDK](https://www.dpdk.org/) and/or [eBPF](https://ebpf.io/) to implement a very simple connection load balancer.

Similarly to the previous exercises you can work either individually or in pairs.

This exercise consists of three distinct steps and some extra optional questions.
To get the full points you are expected to go through step 0, and either step 1 or step 2 (i.e. implement the load balancer using one of the two technologies).
You are more than welcome to do both step 1 and step 2 if you want for bonus points.

### Basic Topology Setup

Instead of using mininet, you will manually setup the network topology using a [Linux bridge](https://wiki.linuxfoundation.org/networking/bridge) and [network namespaces](https://man7.org/linux/man-pages/man7/network_namespaces.7.html).

You are provided with the equivalent scripts to do so in the `scripts` [directory](./scripts).
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

### Step 0.3: Understanding the endgoal

The goal of this exercise is to build a load balancer and enhace the previous topology as in the following picture.

![topo3 targe timage](exe3-target-topo.png "Target topology")

In this topology, the load balancer is a middlebox that listens to `10.0.0.10` and forwards packets from your local machine to the two namespaces based on a hash-basesd load balancing policy.
The load balancer hashes the 5-tuple of the packets coming from `10.0.0.1` and based on the hash value forwards these packets to the equivalent server running inside `h2` and `h3`.
On the opposite direction, it forwards packets coming from `h2` and `h3` back to `10.0.0.1`.
In the previous picture, the green and yellow arrows represent different connections that hash to different backend servers.

## DPDK Load Balancer

DPDK is a framework to implement high-performance networked applications entirely in userspace.
Instead of depending on kernel-based drivers, DPDK gives applications direct access to the NIC by implementing these drivers in userspace, completely bypassing the kernel.
This is a very powerful mechanism widely used in academia and industry to implement not only NFs but also custom and special purpose protocols that run at the endhost.

In this exercise, you will implement a L4 load balancer using the provided DPDK skeleton code found in the `dpdk-lb` [folder](./dpdk-lb).

### Step 1.1: Build and use the provided DPDK skeleton

The provided DPDK skeleton can be built as is and reply to `ARP` requests.

Download the necessary submodules if you haven't already.

```sh
git submodule update --init --recursive
```

Build DPDK from the `dpdk-lb` directory

```sh
make dpdk
```

Build the skeleton code.

```sh
make build
```

Note: if during `make build`, your linker complains about various dpdk functions and PKG_CONFIG complains it could not find the dpdk file, please edit the `build/Makefile` according to the [comment](https://gitlab.doc.ic.ac.uk/networked_systems_2023/netsys-exe3/-/blob/master/dpdk-lb/build/Makefile?ref_type=heads#L23) for the correct PKG_CONFIG_PATH based on your local development environment. The correct location for the pkgconfig file should be printed during the dpdk installation.

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

Are you getting replies back?

### Step 1.2: Implement the load balancer

In this step, you will implement the actual load balancing functionality.
The load balancer should do the following as seen in the previous figure:

* For every TCP packet coming from `10.0.0.1` it should pick one of the target IPs (`10.0.0.2` or `10.0.0.3`), change the source IP to `10.0.0.10`, the destination IP and MAC addresses to the destination addresses accordingly, and forward the packet.
* For every packet that comes from `10.0.0.2` or `10.0.0.3` change the IP and MAC addresses accordingly and forward it to  `10.0.0.1`.

The provided code skeleton implements static ARP, i.e. it is already pre-configured with all the MAC addresses in the LAN based on the network configuration used by the setup scripts.
All the network configuration can be seen in [net-config.h](./dpdk-lb/inc/net-config.h).

Before starting to implement your solution, take some time to browse and understand the provided skeleton.

You should only modify the parts of the code indicated by FIXMEs and nothing more.

#### Deliverables

The modified version of the [net.c](./dpdk-lb/src/net.c) file.

Useful links:

* [Endianess](https://en.wikipedia.org/wiki/Endianness)
* [DPDK Documentation](https://doc.dpdk.org/api-22.11/): Useful for header formats and not only.

### Step 1.3: Test your load balancer

To test your load balancer you will simply use the netcat (`nc`) program both for the client and the server.

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

On which of the two servers do you see the output?

> Both servers should receive some packets.

Execute the same process again several times till you receive packets on both servers.

### Deliverables

In your report, provide a short description of what happens during the above process, and screenshots that show both servers respond to the client for different client connections.

Also, include a screenshot from a packet capture on the bridge, either from wireshark or tcpdump, that shows the packets that are exchanged.

## eBPF Load Balancer

[eBPF](https://ebpf.io/) is an emerging technology in the Linux kernel that enables safe execution of user code inside the kernel.
It has a wide range of usecases from debugging and monitoring to high-performance networking.
eBPF implements an event-based approach, according to which eBPF programs are attached to different hooks inside the kernel and get triggered when the code execution goes through this hook.
In this exercise, we will use eBPF to process incoming packets at the lowest level of the networking stack.
To do so, we will use a special kind of hook called `XDP`.

### Step 2.0: Extend the topology and build the provided code skeleton

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
make
```

After successfully finishing the above step, you should see:

* the `loader` executable: This is a program that will help you load your eBPF program and configure the necessary maps
* the `xdp_lb.bpf.o` object file: This is the eBPF program

To load the eBPF program run the following:

```sh
lb ./loader xdp_lb.bpf.o xdp_lb veth6
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

### Step 2.1: Implement the eBPF load balancer

Use the provided skeleton code to implement a load balancer similar to the previous one using eBPF XDP.
Before starting your implementation, take some time to study and understand the provided code in the `loader.cpp` and `xdp_lb.bpf.c` files.
`loader.cpp` is the one that configures the necessary maps and loads the eBPF program, while `xdp_lb.bfp.c` is the actual eBPF dataplane program that processes all incoming packets.

You should only modify the `xdp_lb.bpf.c` file and not the loader.
The loader is already configures the eBPF maps accordingly based on the needs of this exercise and loads the eBPF program.

Writing eBPF programs can be challenging since the [verifier](https://docs.kernel.org/bpf/verifier.html) needs to guarantee certain properties for the program, such as termination and safe memory accesses.
Thus, we already provide you with certain functionality that you might find useful and challenging to implement, e.g. `compute_tcp_csum()` which computes the tcp checksums.

### Deliverables

The modified `xdp_lb.bpf.c` file that includes the load balancer implementation for this specific topology and usecase.

### Step 2.2: Test your load balancer

You can test your load balancer as in the equivalent step for DPDK using `nc`.

Deliverables: Include a similar packet trace in your report that shows the client opening a connection to `10.0.0.10` and the load balancer forwarding this connection to the backend servers.

### Deliverables

Your load balancer should allow ICMP traffic to go through. Explain why, unlike the DPDK load balancer, the eBPF load balancer can reply to ICMP requests. How could you enable the DPDK load balancer to reply ICMP requests?

## Bonus

Here are three extra deliverables for bonus points.
These exercises are independent from each other and you can choose to implement any combination of them.

### Multiple clients

An important limitation in the previous implementations, both for DPDK and eBPF, is that the load balancer can only handle a single client that comes from a specific IP.
Can you extend your favorite implementation from the previous two to support multiple clients?
What would you have to do to achieve so?
Could this affect the load balancer scalability?

### Direct Server Return (DSR)

Direct Server Return is an approach used in L4 load balancing that allows backend servers to communicate directly with clients and bypass the load balancer on the return path.
This way, the load balancer is only on the critical path for packets from the client to the load balanced service.

You can use Linux [`tc`](https://man7.org/linux/man-pages/man8/tc.8.html) to enable DSR at the servers.

Modify your load balancer accordingly to support DSR.

### Different Load Balancing Policies

Our load balancer only implements random load balancing by hashing the incoming 5-tuple.
Can you implement a more elaborate load balancing policy, e.g. Round-Robin?
How does this affect the state the load balancer has to keep?
