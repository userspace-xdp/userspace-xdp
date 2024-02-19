# xdp progs

See [documents/bpftime-lb.md](../documents/bpftime-lb.md) for setup.

build:

```sh
make -C xdp_progs/
```

## xdp_map_access

## xdp_tx

test with xdp_tx in kernel

```sh
xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o veth6
```

test in userspace:

```sh
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o veth6 xdp-ebpf-new/base.btf
```

and start af_xdp:

```sh
./af_xdp_user veth6
```

ping result:

```console
# ping 10.0.0.10
PING 10.0.0.10 (10.0.0.10) 56(84) bytes of data.
From 10.0.0.1 icmp_seq=1 Destination Host Unreachable
From 10.0.0.1 icmp_seq=2 Destination Host Unreachable
From 10.0.0.1 icmp_seq=3 Destination Host Unreachable
From 10.0.0.1 icmp_seq=4 Destination Host Unreachable
From 10.0.0.1 icmp_seq=8 Destination Host Unreachable
From 10.0.0.1 icmp_seq=9 Destination Host Unreachable
From 10.0.0.1 icmp_seq=10 Destination Host Unreachable
From 10.0.0.1 icmp_seq=14 Destination Host Unreachable
From 10.0.0.1 icmp_seq=15 Destination Host Unreachable

--- 10.0.0.10 ping statistics ---
18 packets transmitted, 0 received, +9 errors, 100% packet loss, time 17396ms
pipe 4
```

## xdp_drop

Test in kernel:

```sh
xdp_progs/xdp_drop xdp_progs/.output/xdp_drop.bpf.o veth6
```

run in userspace:

```sh
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_drop xdp_progs/.output/xdp_drop.bpf.o veth6 xdp-ebpf-new/base.btf
```

and start af_xdp:

```sh
./af_xdp_user veth6
```

ping:

```console
# ping 10.0.0.10
PING 10.0.0.10 (10.0.0.10) 56(84) bytes of data.
^C
--- 10.0.0.10 ping statistics ---
23 packets transmitted, 0 received, 100% packet loss, time 22505ms
```

## remove xdp

```sh
sudo ip link set dev veth6 xdp off
```
