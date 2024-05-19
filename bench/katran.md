# Bench and optimize katran on userspace eBPF

## Setup configuration

### Workflow of katran and testbed

1. katran receives packet
2. Checks if the destination of the packet is configured as a
VIP (virtual IP address - IP address of the service).
3. For an incoming packet toward a VIP - katran is checking if it saw packet from the same
session before, and if it has - it sends the packet to the same real (actual server/l7 lb
which then processes/terminates the TCP session).
4. If it's a new session - from 5 tuples in the packet, calculate a hash value.
5. Using this hash value - pick a real server.
6. Update session table with this lookup information so that katran can simply
lookup this information for the next packet in the session and not calculate the hash again.
7. Encapsulate packet in another IP packet and send to the real.


Topology:

```sh
# client is octopus1, with pktgen-dpdk
# katran is octopus3
<client> ---- <net> ---- <server:katran> ---- <net> ---- <client>
```

Packet flow looks like this:

1. From "client" to "katran" (which advertises VIP reachability to the network) it's IP packets with a src of "client" and dst of the VIP.
2. When "katran" receives this packets, it encapsulates them and sends to the real. this packets are going to be IPIP encapsulated. inner header would state the same ("client" -> "VIP"). The outer header contains specifically crafted src address and destination would be address of the "server".
3. When server receives this IPIP packet - it removes outer ip header, and processes original packet and while sending replies - it sends it directly from the "VIP" to the "client".

### config katran: same section

- Default Mac address(Octopus1): b8:3f:d2:2a:e5:11
- Ipv4 Dest: 192.168.1.13:5678

Config system:

```
sudo systemctl stop irqbalance
sudo systemctl disable irqbalance
sudo ethtool --offload enp24s0f1np1  lro off
sudo ethtool --offload enp24s0f1np1  gro off
```

Set the ip:

```sh
./example_grpc/goclient/bin/main -A -t 192.168.1.13:5678
./example_grpc/goclient/bin/main -a -t 192.168.1.13:5678 -r 192.168.1.11
```

check result:

```console
./example_grpc/goclient/bin/main -l
2024/05/19 13:49:34 vips len 1
VIP:         192.168.1.13 Port:   5678 Protocol: tcp
Vip's flags: 
 ->192.168.1.11      weight: 1 flags: 
exiting
yunwei@octopus3:~/katran$ ./example_grpc/goclient/bin/main  -s -lru
summary: 373360644 pkts/sec. lru hit: 100.00% lru miss: 0.00% (tcp syn: 0.00% tcp non-syn: 0.00% udp: 1.00%) fallback lru hit: 373364861 pkts/sec
```

We have test traffic generator configurations for:

- src port range: 0-0:   lru hit: 100.00% lru miss: 0.00% (only single session)
- src port range: 0-100: lru hit: 100.00% lru miss: 0.00% 
- src port range: 0-1000 lru hit: 85.43% lru miss: 14.57%
- src port range: 0-2000 lru hit: 64.80% lru miss: 35.20%
- src port range: 0-6000 lru hit: 52.85% lru miss: 47.15%
- src port range: 0-8000 lru hit: 28.56% lru miss: 71.44%

## test in kernel

Run katran:

```sh
sudo /home/yunwei/katran/_build/build/example_grpc/katran_server_grpc -balancer_prog /home/yunwei/katran/_build/deps/bpfprog/bpf/balancer.bpf.o -default_mac b8:3f:d2:2a:e5:11 -forwarding_cores=0 -intf=enp24s0f1np1 -hc_forwarding=false
```

## test in userspace


