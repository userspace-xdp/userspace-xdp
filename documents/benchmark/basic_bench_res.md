# basic benchmark results

diable xdp

```sh
sudo ip link set dev enp24s0f1np1 xdpgeneric off
```

## xdp tx

```sh
# generate traffic
sudo /home/yunwei/ebpf-xdp-dpdk/afxdp/lib/xdp-tools/xdp-trafficgen/xdp-trafficgen udp enp24s0f1np1 --dst-mac b8:3f:d2:2a:e5:11 --src-mac b8:3f:d2:2a:e7:69 --dst-addr fe80::ba3f:d2ff:fe2a:e511 --src-addr fe80::ba3f:d2ff:fe2a:e769

sudo xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1

LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o enp24s0f1np1 xdp-ebpf-new/base.btf
cd ebpf-xdp-dpdk/afxdp/src
sudo ./af_xdp_user enp24s0f1np1
```

test with nload on octopus3:

- kernel xdp: Avg: 943.58 MBit/s (Open the BPF_ENABLE_STATS will reduce the performance to 893.64 MBit/s)
