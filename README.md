# contents

## bpftime load balanth

See [documents/bpftime-lb.md](documents/bpftime-lb.md)

## XDP in userspace eBPF(bpftime) with DPDK

see [ducuments/dpdk-ebpf.md](documents/dpdk-ebpf.md)

## XDP in userspace eBPF(bpftime) with AF_XDP

See [documents/af-xdp-ebpf.md](documents/af-xdp-ebpf.md)

## examples

From Linux source tree and samples, and alo from hXDP, see [xdp_progs](xdp_progs)

- [ ] xdp_drop: parse pkt headers up to TCP, and XDP_DROP valid tcp packets
- [ ] xdp_tx: swap the mac address and XDP_TX
- [ ] xdp_map_access: increment counter for incomping packets
- [ ] xdp_csum: calc the csum of ip and record in a hash map
- [ ] xdping(client): use xdp as ping(ICMP) client
- [ ] xdping(server): use xdp as ping(ICMP) client
- [ ] xdp_fw: output pkt from a specified interface (redirect)
- [ ] tx_ip_tunnel: parse pkt up to L4, encapsulate and XDP_TX
- [ ] xdp_adjust_tail: receive pkt, modify pkt into ICMP pkt and XDP_TX

From other applications

- [ ] [xdp-loadbalancer](xdp-ebpf-new): a simple load balancer using XDP
- [ ] [xdp-observer](https://github.com/hamidrezakhosroabadi/xdp-observer): A simple xdp application to observe tcp connections in userspace
- [ ] [xdp-firewall](https://github.com/acassen/xdp-fw) XDP FW: eXpress Data Path FireWall module
