# index

build bpftime library

```sh
cmake -B build-bpftime .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo
## with llvm jit:
cmake -B build-bpftime .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DBPFTIME_LLVM_JIT=1
make -C  build-bpftime -j
```

The scripts and graphs used to benchmark the performance of the XDP programs implemented in this project are written in Makefile.

## bpftime load balanth

See [documents/bpftime-lb.md](documents/bpftime-lb.md)

## XDP in userspace eBPF(bpftime) with DPDK

see [ducuments/dpdk-ebpf.md](documents/dpdk-ebpf.md)

## XDP in userspace eBPF(bpftime) with AF_XDP

See [documents/af-xdp-ebpf.md](documents/af-xdp-ebpf.md)

## examples

For the details of each example, see the README.md in each directory and [examples.md](documents/examples.md)

From Linux source tree and samples, and alo from hXDP, see [xdp_progs](xdp_progs)

- [X] xdp_drop: parse pkt headers up to TCP, and XDP_DROP valid tcp packets
- [X] xdp_tx: swap the mac address and XDP_TX
- [X] xdp_map_access: increment counter for incomping packets in array maps
- [X] xdp_csum: calc the csum of ip and record in a hash map
<!-- - [ ] xdping(client): use xdp as ping(ICMP) client -->
- [X] xdping(server): use xdp as ping(ICMP) server
- [X] xdp_fw: output pkt from a specified interface (redirect)
- [X] tx_ip_tunnel: parse pkt up to L4, encapsulate and XDP_TX
- [X] xdp_adjust_tail: receive pkt, modify pkt into ICMP pkt and XDP_TX

Prev examples:

- [X] xdp-acl: use lpm tries to implement a acl list in xdp
- [X] xdp_maps: use hash map to summary the length of incoming packets

From other applications

- [X] [xdp-loadbalancer](xdp-ebpf-new): a simple load balancer using XDP
- [X] [xdp-observer](https://github.com/hamidrezakhosroabadi/xdp-observer): A simple xdp application to observe tcp connections in userspace. Include parse tcp headers and print the result to userspace with ring buffer. The code is in [xdp-observer](xdp-observer)
- [X] [xdp-firewall](https://github.com/acassen/xdp-fw) XDP firewall: eXpress Data Path FireWall module
