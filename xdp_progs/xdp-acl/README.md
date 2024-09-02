# xdp ebpf acl

```sh
sudo LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug BPFTIME_ALLOW_EXTERNAL_MAPS=1   xdp_progs/xdp_tx /home/yunwei/ebpf-xdp-dpdk/xdp-ebpf-acl/.output/standard_acl.bpf.o enp24s0f1np1
```

run:

```sh
sudo -E LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug BPFTIME_ALLOW_EXTERNAL_MAPS=1  xdp-ebpf-acl/standard_acl /home/yunwei/ebpf-xdp-dpdk/xdp-ebpf-acl/.output/standard_acl.bpf.o
```
