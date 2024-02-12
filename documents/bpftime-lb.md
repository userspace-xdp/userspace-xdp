# use bpftime for ebpf load balancer

For details on how to setup the test bed, see [l4lb-ebpf.md](l4lb-ebpf.md)

```sh
scripts/testbed-setup.sh
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
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/bpftime/build/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=trace xdp-ebpf-new/xdp_lb veth6
```
