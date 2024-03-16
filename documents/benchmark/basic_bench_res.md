# basic benchmark results

diable xdp

```sh
sudo ip link set dev enp24s0f1np1 xdpgeneric off
```

## xdp tx

```sh
# generate traffic
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen file enp24s0f1np1 /home/yunwei/ebpf-xdp-dpdk/documents/benchmark/icmp.bin

sudo xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1

LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1 xdp-ebpf-new/base.btf

cd ebpf-xdp-dpdk/afxdp/src
sudo ./af_xdp_user enp24s0f1np1

sudo -E LD_LIBRARY_PATH=/home/yunwei/ebpf-xdp-dpdk/external/dpdk/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/libbpf/: /home/yunwei/ebpf-xdp-dpdk/dpdk_l2fwd/build/l2fwd -l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
```

test with nload on octopus3:


test with nload on octopus3:

```sh
nload enp24s0f1np1
```

- kernel xdp: Avg: 943.58 MBit/s (Open the BPF_ENABLE_STATS will reduce the performance to 893.64 MBit/s)
