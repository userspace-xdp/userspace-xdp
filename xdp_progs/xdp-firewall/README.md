# xdp-firewall

run in kenel:

```console
xdp-firewall/xdp_firewall  xdp-firewall/.output/xdp_firewall.bpf.o enp24s0f1np1
```

run in userspace:

```console
LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug  xdp-firewall/xdp_firewall  xdp-firewall/.output/xdp_firewall.bpf.o enp24s0f1np1 xdp-ebpf-new/base.btf
```

A blacklist firewall using XDP.
