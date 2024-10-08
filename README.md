# XDP Deployments in Userspace with DPDK and AF_XDP

> **Note! The code in this repo is a Research Prototype for experiment. It's not for production usage. The component will be maintained in [bpftime](https://github.com/eunomia-bpf/bpftime) repo later, and we are trying to make it better!**

**Userspace XDP** is a novel system that allows eBPF XDP-based network functions (NFs) to execute in userspace, leveraging kernel bypassing techniques. This approach significantly enhances performance while maintaining compatibility with existing eBPF control-plane application, making it possible to achieve superior throughput without modifying the original eBPF programs.

Key Features:

- **Userspace Execution:** Seamlessly runs eBPF XDP-based NFs in userspace, overcoming performance limitations inherent to in-kernel execution.
- **No Code Modifications Required:** Userspace XDP supports the execution of unmodified eBPF programs, ensuring ease of adoption.
- **Performance Optimizations:** Includes several userspace-specific compilation optimizations, improving the efficiency of complex network functions.
- **Enhanced Portability:** Enables the execution of XDP programs even in environments where kernel eBPF is unavailable or disabled.

This project is using [bpftime](https://github.com/eunomia-bpf/bpftime) as Userspace eBPF runtime, and [DPDK](https://www.dpdk.org/) and [AF_XDP](https://www.kernel.org/doc/html/latest/networking/af_xdp.html) as the underlying network stack.

Currently, the project only supports `l2fwd`, which is mainly `XDP_DROP` and `XDP_TX` packets.

- [XDP Deployments in Userspace with DPDK and AF\_XDP](#xdp-deployments-in-userspace-with-dpdk-and-af_xdp)
  - [Components](#components)
  - [Build the project](#build-the-project)
    - [Prerequisites](#prerequisites)
    - [Build all configurations for benchmark](#build-all-configurations-for-benchmark)
    - [Build specific configuration](#build-specific-configuration)
  - [Usage and documentation](#usage-and-documentation)
  - [Examples and Usecases](#examples-and-usecases)
  - [Optimizations](#optimizations)
  - [Benchmark](#benchmark)
  - [License](#license)

## Components

- [bpftime](bpftime): Used as loader library, and support maps and helpers for the runtime.
  - `JIT/AOT`: The project supports using [llvmbpf](https://github.com/eunomia-bpf/llvmbpf) or [uBPF](https://github.com/iovisor/ubpf) as the JIT/AOTbackend, the optimization is based on `llvmbpf`.
  - The [module](module) is the addons based on the bpftime library, which supports maps such as `lpm_trie`, `lrucache`, some helpers and runtime optimizations maps implementation.
- l2fwd userspace network runtime:
  - [afxdp](afxdp): The `AF_XDP` userspace runtime, which supports using `AF_XDP` as the XDP driver in userspace eBPF runtime.
  - [dpdk](dpdk): The `DPDK` userspace runtime, which supports `DPDK` as the XDP driver.
- [xdp_progs](xdp_progs): The example or test programs for the userspace eBPF runtime.

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

The bpftime is used as a library, so in order to build the runtime, you need to build the bpftime library first. You can use flags such as `-DBPFTIME_LLVM_JIT=0` to control the backend of the bpftime library.

```sh
cmake -B build .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo
make -C build
```

Then build the selected runtime. For AF_XDP:

```sh
make -C afxdp/l2fwd
```

For DPDK:

```sh
make -C dpdk
```

## Usage and documentation

There are typically two steps to run the userspace eBPF runtime. First, load the eBPF program in userspace and create the related maps and meta data; second, run the dpdk or afxdp runtime to receive the packets and process them. For example:

Run bpftime loader to load the eBPF program for observe TCP packet in userspace:

```sh
LD_PRELOAD=build/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp-observer/main veth6 base.btf
```

Run the dpdk runtime:

```sh
sudo dpdk/dpdk_llvm -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
```

Or run the AF_XDP runtime:

```sh
cd afxdp/l2fwd
sudo ./xdpsock_llvm --l2fwd -i veth6
```

The documentation is in the [documents](documents) directory.

- [Step by step to use Userspace XDP for ebpf load balancer with virtual env](documents/userspace-xdp-lb.md)
- [Run katran in userspace XDP with virtual env](documents/katran.md)
- [Bench and optimize katran on userspace eBPF](documents/katran-bench.md)
- [The detail of the test venv](documents/venv-details.md)
- [Detail list of examples](documents/benchmark/examples.md)

## Examples and Usecases

ALL the examples can be found in [xdp_progs](xdp_progs) directory.

Basic examples from Linux kernel samples or write by ourselves:

- [X] xdp_drop: parse pkt headers up to TCP, and XDP_DROP valid tcp packets
- [X] xdp_tx: swap the mac address and XDP_TX
- [X] xdp_csum: calc the csum of ip and record in a hash map
- [X] xdping(server): use xdp as ping(ICMP) server
- [X] xdp_fw: output pkt from a specified interface (redirect)
- [X] tx_ip_tunnel: parse pkt up to L4, encapsulate and XDP_TX
- [X] xdp_adjust_tail: receive pkt, modify pkt into ICMP pkt and XDP_TX

Write by our self:

- [X] [xdp-loadbalancer](xdp_progs/xdp-lb): a simple load balancer using XDP
- [X] xdp-acl: use lpm tries to implement a acl list in xdp
- [X] xdp-maps: use hash map to summary the length of incoming packets

From other opensource applications

- [X] [xdp-observer](https://github.com/hamidrezakhosroabadi/xdp-observer): A simple xdp application to observe tcp connections in userspace. Include parse tcp headers and print the result to userspace with ring buffer. The code is in [xdp-observer](xdp-observer)
- [X] [xdp-firewall](https://github.com/acassen/xdp-fw) XDP firewall: eXpress Data Path FireWall module

Katran: a high-performance layer 4 load balancer

- [X] [xdp_map_access](https://github.com/facebookincubator/katran/blob/main/katran/lib/bpf/xdp_pktcntr.c): increment counter for incomping packets in array maps
- [X] [katran main](xdp_progs/katran)

Run `make -C xdp_progs` to build all the examples and the optimized results.

## Optimizations

The Userspace XDP Runtime implements optimizations to enhance the execution efficiency of eBPF programs. These optimizations, though designed for userspace, could also benefit kernel eBPF with suitable modifications. Key optimizations include inlining and leveraging richer LLVM IR during compilation, which reduce overhead and improve performance.

- **Inline Optimizations:** Userspace XDP Runtime inlines helper functions and map accesses directly into the eBPF bytecode during JIT/AOT compilation. This eliminates the overhead of function calls, enabling LLVM to perform optimizations like constant folding and loop unrolling. Inline map accesses treat maps as global variables in LLVM IR, allowing direct optimization by the compiler, further reducing overhead.
- **LLVM IR Optimizations:** By using LLVM IR during compilation, the Userspace XDP Runtime retains more semantic information, enabling better register allocation and optimized data layouts, which are lost when converting to eBPF bytecode. The runtime packages LLVM IR with eBPF bytecode, allowing for more backend optimizations at runtime. This approach improves the efficiency of native code, leveraging advanced hardware features like SIMD instructions.

For the minimal example and usage in eBPF runtime, please see <https://github.com/eunomia-bpf/llvmbpf?tab=readme-ov-file#optimizaion>

For the llvm IR, see [xdp_progs/.llvm_ir](xdp_progs/.llvm_ir) directory: `xxx.bpf.ll` is the basic llvm IR generated by the llvmbpf compiler, and `xxx.bpf.inline.ll` is the inline optimized llvm IR rom the IR generated by llvmbpf compiler. `xxx.aot.ll` is the optimized llvm IR from the C code, and `xxx.inline.aot.ll` is the inline optimized llvm IR from the IR generated by llvmbpf compiler. We keep it here to avoid the compiler difference and for reference.

After optimize the AOT code, you can use `AOT_OBJECT_NAME=$(BASIC_XDP_AOT_RES_NAME)` to load the AOT results into the runtime, for example:

```sh
sudo -E AOT_OBJECT_NAME=xdp_progs/.output/xdping.base.aot.o dpdk/dpdk_llvm -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
```

## Benchmark

We have machine octopus1 and octopus3

```txt
+--------+       +--------+
|octopus1|------>|octopus3|
| Pktgen |<------|   NFs  |
+--------+       +--------+
```

- The traffic is generated by `pktgen` on octopus1 and received by NFs on octopus3. The NFs are running on octopus3, forwards the packets back to octopus1. The traffic generator and measurement tools are `Pktgen-dpdk`.
- The reuslts are measured by the received packets on octopus1. The results are averaged over `60` seconds.
- The controler script is also running on octopus2, use ssh to control the pktgen and get the data from octopus1.
- 100G NICs are used for the test.

For the detailed results and test steps, see [bench](bench/README.md).

## License

This project is licensed under the [MIT License](LICENSE).
