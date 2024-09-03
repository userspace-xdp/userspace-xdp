# XDP Deployments in Userspace with DPDK and AF_XDP

**Userspace XDP** is a novel system that allows eBPF XDP-based network functions (NFs) to execute in userspace, leveraging kernel bypassing techniques. This approach significantly enhances performance while maintaining compatibility with existing eBPF control-plane application, making it possible to achieve superior throughput without modifying the original eBPF programs.

Key Features:

- **Userspace Execution:** Seamlessly runs eBPF XDP-based NFs in userspace, overcoming performance limitations inherent to in-kernel execution.
- **No Code Modifications Required:** Userspace XDP supports the execution of unmodified eBPF programs, ensuring ease of adoption.
- **Performance Optimizations:** Includes several userspace-specific compilation optimizations, improving the efficiency of complex network functions.
- **Enhanced Portability:** Enables the execution of XDP programs even in environments where kernel eBPF is unavailable or disabled.

This project is using [bpftime](https://github.com/eunomia-bpf/bpftime) as Userspace eBPF runtime, and [DPDK](https://www.dpdk.org/) and [AF_XDP](https://www.kernel.org/doc/html/latest/networking/af_xdp.html) as the underlying network stack.

Currently, the project only supports `l2fwd`, which is mainly `XDP_DROP` and `XDP_TX` packets.

## Components

- [bpftime](bpftime): Used as loader library, and support maps and helpers for the runtime.
  - `JIT/AOT`: The project supports using [llvmbpf](https://github.com/eunomia-bpf/llvmbpf) or [uBPF](https://github.com/iovisor/ubpf) as the JIT/AOTbackend, the optimization is based on `llvmbpf`.
  - The [module](module) is the addons based on the bpftime library, which supports maps such as `lpm_trie`, `lrucache`, some helpers and runtime optimizations maps implementation.
- l2fwd userspace network drivers:
  - [afxdp](afxdp): The `AF_XDP` userspace runtime, which supports using `AF_XDP` as the XDP driver in userspace eBPF runtime.
  - [dpdk](dpdk): The `DPDK` userspace runtime, which supports `DPDK` as the XDP driver.
- [xdp_progs](xdp_progs): The example or test programs for the userspace eBPF runtime.

## Examples and Usecases

## Build the project

### Prerequisites

Init the repo:

```sh
git submodule update --init --recursive
```

Install the dependencies:

- See <https://doc.dpdk.org/guides/linux_gsg/build_dpdk.html> for more details about how to build `DPDK`.
- See <https://eunomia.dev/bpftime/documents/build-and-test/> for more details about how to build `bpftime`.

Build the DPDK library:

```sh
make dpdk
```

### Build all configurations for benchmark

build all runtimes with different config:

```sh
make bench-bin
```

This will include:

- The `AF_XDP` userspace eBPF runtime in [afxdp/l2fwd/xdpsock_llvm](afxdp/l2fwd/xdpsock_llvm) and [afxdp/l2fwd/xdpsock_ubpf](afxdp/l2fwd/xdpsock_ubpf), with LLVM or uBPF as the backend.
- The `DPDK` userspace eBPF runtime in [dpdk/dpdk_llvm](dpdk/dpdk_llvm) and [dpdk/dpdk_ubpf](dpdk/dpdk_ubpf), with LLVM or uBPF as the backend.

The bpftime loader library:

- [libbpftime-syscall-server.so](build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so): the bpftime loader library for the userspace eBPF runtime.

### Build specific configuration

The bpftime is used as a library, so in order to build the runtime, you need to build the bpftime library first.

```sh
cmake -B build .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo
make -C build
```

Then build the selected runtime. For AF_XDP:

```sh
```

For DPDK:

```sh
```

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

- <https://github.com/zebaz/xpress-dns/blob/master/src/xdp_dns_kern.c>
