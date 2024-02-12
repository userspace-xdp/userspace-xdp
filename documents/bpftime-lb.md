# use bpftime for ebpf load balancer

For details on how to setup the test bed, see [l4lb-ebpf.md](l4lb-ebpf.md)

DPDK:

```sh
scripts/testbed-setup.sh
```

eBPF:

```sh
scripts/testbed-setup.sh ebpf
```

And also

```sh
sudo iptables -P FORWARD ACCEPT
sudo ip netns exec h2 ip link set lo up
```

## default: use kernel xdp load balance

To build the provided code run in xdp-ebpf directory:

```sh
make
```

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

## run with AF_XDP and bpftime

build bpftime library

```sh
cmake -B build-bpftime .  -DBUILD_BPFTIME_DAEMON=0
make -C  build-bpftime -j
```

load the eBPF XDP program into shared memory

```sh
scripts/testbed-setup.sh ebpf
source scripts/aliases.sh
lb bash
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=trace xdp-ebpf-new/xdp_lb veth6
```

(ignore the error message)

And run the xd_xdp_user application in the testbed:

```sh
source scripts/aliases.sh
lb bash
cd afxdp/advanced03-AF_XDP
./af_xdp_user -d veth6
```

test:

In two different terminals run two netcat servers in the two namespaces

```sh
h2 bash
python3 -m http.server
```

```sh
h3 bash
python3 -m http.server
```

From your machine run to connect to one of the servers and send some messages.

```sh
curl -vv 10.0.0.10:8000
```

Then you will get the data in both terminals.

problem: data in xdp_md is 32 bit, while kernel will convert it into 64 bit.

The xdp_md is:

```c
struct xdp_md {
    __u32 data;
    __u32 data_end;
    __u32 data_meta;
    __u32 ingress_ifindex;
    __u32 rx_queue_index;
    __u32 egress_ifindex;
};
```

it will cause in userspace:

```txt
received packet 0x7fea635ee100, send data to eBPF module len 42
received packet 0x635ee100 0x635ee12a
Segmentation fault (core dumped)
```

However, our jit doesn't do that.

see <https://lists.iovisor.org/g/iovisor-dev/topic/question_about_struct_xdp_md/21385959?p=>

Solution: let BTF help us.

This is kernel BTF relocation, run with the above command:

```txt
libbpf: prog 'xdp_pass': relo #0: <byte_off> [19] struct xdp_md.data (0:0 @ offset 0)
libbpf: prog 'xdp_pass': relo #0: matching candidate #0 <byte_off> [6034] struct xdp_md.data (0:0 @ offset 0)
libbpf: prog 'xdp_pass': relo #0: patched insn #0 (LDX/ST/STX) off 0 -> 0
libbpf: prog 'xdp_pass': relo #0: patched insn #0 (LDX/ST/STX) mem_sz 8 -> 4
libbpf: prog 'xdp_pass': relo #1: <byte_off> [19] struct xdp_md.data_end (0:1 @ offset 8)
libbpf: prog 'xdp_pass': relo #1: matching candidate #0 <byte_off> [6034] struct xdp_md.data_end (0:1 @ offset 4)
libbpf: prog 'xdp_pass': relo #1: patched insn #1 (LDX/ST/STX) off 8 -> 4
libbpf: prog 'xdp_pass': relo #1: patched insn #1 (LDX/ST/STX) mem_sz 8 -> 4
libbpf: CO-RE relocating [24] struct iphdr: found target candidate [11775] struct iphdr in [vmlinux]
```

This is for usespace CO-RE commands:

```txt
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=trace xdp-ebpf-new/xdp_lb veth6 /home/yunwei37/dpdk-startingpoint/xdp-ebpf-new/base.btf
```
