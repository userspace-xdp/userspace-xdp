# xdp-firewall

run in kenel:

```console
xdp-firewall/xdp_firewall  xdp-firewall/.output/xdp_firewall.bpf.o veth6
```

run in userspace:

```console
LD_PRELOAD=/home/yunwei37/dpdk-startingpoint/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug  xdp-firewall/xdp_firewall  xdp-firewall/.output/xdp_firewall.bpf.o veth6 xdp-ebpf-new/base.btf
```