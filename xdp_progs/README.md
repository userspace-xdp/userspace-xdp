# xdp progs

## how to run

xdp_map_access:

```sh
./xdp_map_access -S ens33
./xdp_csum -S ens33
```

## remove xdp

```sh
sudo ip link set dev ens33 xdp off
```
