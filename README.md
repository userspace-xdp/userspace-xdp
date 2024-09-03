# XDP Deployments in Userspace with DPDK and AF_XDP

**Userspace XDP** is a novel system that allows eBPF XDP-based network functions (NFs) to execute in userspace, leveraging kernel bypassing techniques. This approach significantly enhances performance while maintaining compatibility with existing eBPF control-plane application, making it possible to achieve superior throughput without modifying the original eBPF programs.

Key Features:

- **Userspace Execution:** Seamlessly runs eBPF XDP-based NFs in userspace, overcoming performance limitations inherent to in-kernel execution.
- **No Code Modifications Required:** uXDP supports the execution of unmodified eBPF programs, ensuring ease of adoption.
- **Performance Optimizations:** Includes several userspace-specific compilation optimizations, improving the efficiency of complex network functions.
- **Enhanced Portability:** Enables the execution of XDP programs even in environments where kernel eBPF is unavailable or disabled.

## Build the project

Init the 

build all runtimes with different config

```sh
make bench-bin
```

This will include:

- The `AF_XDP` userspace eBPF runtime in [afxdp/l2fwd/xdpsock_llvm](afxdp/l2fwd/xdpsock_llvm) and 
- 

## Benchmark

## License

This project is licensed under the [MIT License](LICENSE).


## bpftime load bala

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

Some might be useful examples:

- https://github.com/zebaz/xpress-dns/blob/master/src/xdp_dns_kern.c