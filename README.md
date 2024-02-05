# XDP in userspace eBPF with DPDK

## XDP examples: libbpf-bootstrap

Use libbpf-bootsrap to load xdp program in userspace.

### Get the syscall for load xdp

`xdp` is an example written in Rust (using libbpf-rs). It attaches to
the ingress path of networking device and logs the size of each packet,
returning `XDP_PASS` to allow the packet to be passed up to the kernel’s
networking stack.

```shell
$ cd libbpf-bootstrap/examples/rust
$ sudo ./target/release/xdp 1
..........
```

The `xdp` output in `/sys/kernel/debug/tracing/trace_pipe` should look
something like this:

```shell
$ sudo cat /sys/kernel/debug/tracing/trace_pipe
           <...>-823887  [000] d.s1 602386.079100: bpf_trace_printk: packet size: 75
           <...>-823887  [000] d.s1 602386.079141: bpf_trace_printk: packet size: 66
           <...>-2813507 [000] d.s1 602386.696702: bpf_trace_printk: packet size: 77
           <...>-2813507 [000] d.s1 602386.696735: bpf_trace_printk: packet size: 66
```

load into userspace:

```console
$ sudo SPDLOG_LEVEL=Debug LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so ./target/release/xdp 1
[2024-01-29 00:36:14.781] [info] [syscall_context.hpp:84] manager constructed
[2024-01-29 00:36:14.782] [info] [syscall_server_utils.cpp:24] Initialize syscall server
...
[2024-01-29 00:36:14][debug][239359] Loaded program `libbpf_nametest` id=4
[2024-01-29 00:36:14][debug][239359] Closing fd 4
[2024-01-29 00:36:14][debug][239359] SYS_BPF 0 140730514784464 72 140378836147558 0 17179869186
[2024-01-29 00:36:14][debug][239359] Creating map
[2024-01-29 00:36:14][debug][239359] Create map with type 2
[2024-01-29 00:36:14][debug][239359] Created map 4, type=2, name=libbpf_mmap, key_size=4, value_size=4
[2024-01-29 00:36:14][debug][239359] Closing fd 4
[2024-01-29 00:36:14][debug][239359] SYS_BPF 0 140730514783968 72 1 0 17179869186
[2024-01-29 00:36:14][debug][239359] Creating map
[2024-01-29 00:36:14][debug][239359] Create map with type 2
[2024-01-29 00:36:14][debug][239359] Created map 4, type=2, name=libbpf_global, key_size=4, value_size=32
[2024-01-29 00:36:14][debug][239359] SYS_BPF 5 140730514783968 128 5 0 0
[2024-01-29 00:36:14][debug][239359] Loading program `` license `GPL` prog_type `1` attach_type 1616363456 map_type 1
[2024-01-29 00:36:14][debug][239359] Set handler fd 5 to bpf_prog_handler, name , prog_type 1, insn_cnt 5
[2024-01-29 00:36:14][debug][239359] Loaded program `` id=5
[2024-01-29 00:36:14][debug][239359] Closing fd 4
[2024-01-29 00:36:14][debug][239359] Closing fd 5
[2024-01-29 00:36:14][debug][239359] SYS_BPF 0 140730514783952 72 1 140730514784192 17179869186
[2024-01-29 00:36:14][debug][239359] Creating map
[2024-01-29 00:36:14][debug][239359] Create map with type 2
[2024-01-29 00:36:14][debug][239359] Created map 4, type=2, name=xdppass_.rodata, key_size=4, value_size=16
[2024-01-29 00:36:14][debug][239359] SYS_BPF 2 140730514784272 32 140378836147558 0 4
[2024-01-29 00:36:14][debug][239359] Updating map
[2024-01-29 00:36:14][debug][239359] SYS_BPF 22 140730514784272 4 1 1 4
[2024-01-29 00:36:14][debug][239359] Calling bpf map freeze, but we didn't implement this
[2024-01-29 00:36:14][debug][239359] SYS_BPF 5 140730514781920 128 2 140730514782144 140730514782144
[2024-01-29 00:36:14][debug][239359] Loading program `` license `GPL` prog_type `9` attach_type 1616361520 map_type 9
[2024-01-29 00:36:14][debug][239359] Set handler fd 5 to bpf_prog_handler, name , prog_type 9, insn_cnt 2
[2024-01-29 00:36:14][debug][239359] Loaded program `` id=5
[2024-01-29 00:36:14][debug][239359] Closing fd 5
[2024-01-29 00:36:14][debug][239359] SYS_BPF 5 140730514782208 128 9 140730514782512 140730514782512
[2024-01-29 00:36:14][debug][239359] Loading program `xdp_pass` license `GPL` prog_type `6` attach_type 2755110320 map_type 6
```

Expected the progs for eBPF, see `documents/xdp_basic.json`.

### run with xdp-basic

```sh
cd xdp-basic
sudo SPDLOG_LEVEL=Debug LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so ./target/release/xdp 1
```

and start the dpdk server

```sh
$ sudo SPDLOG_LEVEL=Debug  /home/yunwei37/dpdk-startingpoint/build/base-server  -l 0 --vdev=net_tap0,iface=tapdpdk
Hello world
[2024-01-29 14:17:54.060] [info] [bpftime_shm_internal.cpp:617] Global shm constructed. shm_open_type 1 for bpftime_maps_shm
...
eth:    link up - speed 10000 Mbps, full-duplex
There are 1 cores
Worker main
received packet, send data to eBPF module
recived packet
packet size: 90
received packet, send data to eBPF module
recived packet
packet size: 90
received packet, send data to eBPF module
```

### run with xdp-maps

```sh
cd xdp-maps
sudo SPDLOG_LEVEL=Debug LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so ./target/release/xdp 1
```

and start the dpdk server

```sh
$ sudo SPDLOG_LEVEL=Debug  /home/yunwei37/dpdk-startingpoint/build/base-server  -l 0 --vdev=net_tap0,iface=tapdpdk
...
recived packet
already recived 0 packets for size 90
received packet, send data to eBPF module
recived packet
already recived 1 packets for size 90
received packet, send data to eBPF module
recived packet
already recived 0 packets for size 86
received packet, send data to eBPF module
recived packet
already recived 2 packets for size 90
received packet, send data to eBPF module
```

These examples are using libbpf-rs to develop and load into kernel or userspace. It should be compatible with kernel xdp.

## XDP example: xdp tutorial

libxdp requires a xdp dispatch program, which is more difficult to load into userspace.

```console
$ sudo strace /home/yunwei37/dpdk-startingpoint/xdp-tutorial/basic01-xdp-pass/xdp_pass_user  --dev lo 2>syscall.txt
Success: Loading XDP prog name:xdp_prog_simple(id:192) on device:lo(ifindex:1)
```

See ./documents/bpftime.md for userspace errors.

## Compile and run

To get and build dpdk from the root project directory:

(Also add bpftime in the directory)

```sh
git submodule update --init --recursive
make dpdk
```

build bpftime library

```sh
export PKG_CONFIG_PATH=<the path of the pkgconfig directory inside dpdk>
cmake -B build-bpftime .
make -C  build-bpftime
```

To build the dpdk-based server:

```sh
export PKG_CONFIG_PATH=<the path of the pkgconfig directory inside dpdk>
# e.g. export PKG_CONFIG_PATH=/home/yunwei37/dpdk-startingpoint/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig
make build
```

To run a very simple test:

In one terminal window

```sh
sudo ./build/base-server -l 0 --vdev=net_tap0,iface=tapdpdk
```

In another terminal window:

```sh
sudo ./scripts/testbed-setup.sh
sudo arping -i veth0 1.2.3.4
```

## clean up share memory

```sh
sudo build-bpftime/bpftime/tools/bpftimetool/bpftimetool remove
```

## hugepages

For 2MB page, you can activate hugepages while booting or at anytime after system is booted. Define hugepages setting in /etc/default/grub to activate it while booting, or overwrite the number of 2MB hugepages as following.

```sh
$ echo 1024 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
```