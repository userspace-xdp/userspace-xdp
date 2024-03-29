# test framework

## run all

```
sudo ./test_all.sh xdp_map_access
```

## generate

```bash
NAME=xdp_map_access python3 /home/yunwei/ebpf-xdp-dpdk/bench/plot_mode.py
```

## make

example:

```sh
sudo BASIC_XDP_NAME=xdp_csum make xdp_csum/dpdk_llvm_aot
```