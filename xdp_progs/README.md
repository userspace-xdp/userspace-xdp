# xdp progs

See [documents/bpftime-lb.md](../documents/bpftime-lb.md) for setup.

build:

```sh
make -C xdp_progs/
```

- [xdp progs](#xdp-progs)
  - [xdp\_tx](#xdp_tx)
  - [xdp\_drop](#xdp_drop)
  - [xdp csum](#xdp-csum)
  - [xdp\_map\_access](#xdp_map_access)
  - [xdping server](#xdping-server)
  - [xdp\_tx\_iptunnel](#xdp_tx_iptunnel)
  - [xdp\_adjust\_tail](#xdp_adjust_tail)
  - [xdp\_fw](#xdp_fw)
  - [remove xdp](#remove-xdp)

## xdp_tx

test with xdp_tx in kernel

```sh
xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o veth6
```

test in userspace:

```sh
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_tx xdp_progs/.output/xdp_tx.bpf.o veth6 xdp-ebpf-new/base.btf
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
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_drop xdp_progs/.output/xdp_drop.bpf.o veth6 xdp-ebpf-new/base.btf
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

## xdp csum

```sh
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_csum  veth6 xdp-ebpf-new/base.btf
```

## xdp_map_access

```console
# LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_map_access  veth6 xdp-ebpf-new/base.btf

[2024-02-19 11:40:13.821] [info] [syscall_context.hpp:86] manager constructed
....
libbpf: map 0 is "xdp_map_.bss"
libbpf: map 'xdp_map_.rodata' (global data): at sec_idx 5, offset 0, flags 80.
libbpf: map 1 is "xdp_map_.rodata"
libbpf: sec '.relxdp': collecting relocation for section(3) 'xdp'
libbpf: sec '.relxdp': relo #0: insn #4 against 'counter'
libbpf: prog 'xdp_pass': found data map 0 (xdp_map_.bss, sec 4, off 0) for insn 4
libbpf: sec '.relxdp': relo #1: insn #9 against '.rodata'
libbpf: prog 'xdp_pass': found data map 1 (xdp_map_.rodata, sec 5, off 0) for insn 9
libbpf: map 'xdp_map_.bss': created successfully, fd=4
libbpf: map 'xdp_map_.rodata': created successfully, fd=5
libbpf: sec 'xdp': found 2 CO-RE relocations
libbpf: CO-RE relocating [2] struct xdp_md: found target candidate [23] struct xdp_md in [vmlinux]
libbpf: prog 'xdp_pass': relo #0: <byte_off> [2] struct xdp_md.data_end (0:1 @ offset 4)
libbpf: prog 'xdp_pass': relo #0: matching candidate #0 <byte_off> [23] struct xdp_md.data_end (0:1 @ offset 8)
libbpf: prog 'xdp_pass': relo #0: patched insn #0 (LDX/ST/STX) off 4 -> 8
libbpf: prog 'xdp_pass': relo #0: patched insn #0 (LDX/ST/STX) mem_sz 4 -> 8
libbpf: prog 'xdp_pass': relo #1: <byte_off> [2] struct xdp_md.data (0:0 @ offset 0)
libbpf: prog 'xdp_pass': relo #1: matching candidate #0 <byte_off> [23] struct xdp_md.data (0:0 @ offset 0)
libbpf: prog 'xdp_pass': relo #1: patched insn #1 (LDX/ST/STX) off 0 -> 0
libbpf: prog 'xdp_pass': relo #1: patched insn #1 (LDX/ST/STX) mem_sz 4 -> 8
Failed to attach BPF skeleton
counter 0
counter 0
counter 0
counter 0
counter 1
counter 3
```

## xdping server

run in kernel

```sh
xdp_progs/xdping -s -I veth6 
```

test with ping

```sh
ping 10.0.0.10
```

run in userspace:

```sh
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdping -s -I veth6 xdp-ebpf-new/base.btf
```

And start af_xdp:

```console
afxdp/src# ./af_xdp_user veth6
```

## xdp_tx_iptunnel

Usage:

```console
# xdp_progs/xdp_tx_iptunnel
Missing argument -i
Start a XDP prog which encapsulates incoming packets
in an IPv4/v6 header and XDP_TX it out.  The dst <VIP:PORT>
is used to select packets to encapsulate

Usage: xdp_progs/xdp_tx_iptunnel [...]
    -i <ifname|ifindex> Interface
    -a <vip-service-address> IPv4 or IPv6
    -p <vip-service-port> A port range (e.g. 433-444) is also allowed
    -s <source-ip> Used in the IPTunnel header
    -d <dest-ip> Used in the IPTunnel header
    -m <dest-MAC> Used in sending the IP Tunneled pkt
    -T <stop-after-X-seconds> Default: 0 (forever)
    -P <IP-Protocol> Default is TCP
    -S use skb-mode
    -N enforce native mode
    -F Force loading the XDP prog
    -h Display this help
    -b <btf-file> BTF type file
```

test running in kernel:

```console
# xdp_progs/xdp_tx_iptunnel -i veth6 -a 10.0.0.10 -p 1-256 -s 10.0.0.1 -d 10.0.0.2 -m DE:AD:BE:EF:00:00
proto 6: sum:         1 pkts, rate:         0 pkts/s
proto 6: sum:         2 pkts, rate:         1 pkts/s
proto 6: sum:         2 pkts, rate:         1 pkts/s
```

Then you can test it with curl and http server.

Test running in userspace:

```sh
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug  xdp_progs/xdp_tx_iptunnel -i veth6 -a 10.0.0.10 -p 1-256 -s 10.0.0.1 -d 10.0.0.2 -m DE:AD:BE:EF:00:00 -b xdp-ebpf-new/base.btf
```

## xdp_adjust_tail

example application to use the xdp_adjust_tail helper

```c
/*
 * bpf_xdp_adjust_tail
 *
 *  Adjust (move) *xdp_md*\ **->data_end** by *delta* bytes. It is
 *  possible to both shrink and grow the packet tail.
 *  Shrink done via *delta* being a negative integer.
 *
 *  A call to this helper is susceptible to change the underlying
 *  packet buffer. Therefore, at load time, all checks on pointers
 *  previously done by the verifier are invalidated and must be
 *  performed again, if the helper is used in combination with
 *  direct packet access.
 *
 * Returns
 *  0 on success, or a negative error in case of failure.
 */
static long (*bpf_xdp_adjust_tail)(struct xdp_md *xdp_md, int delta) = (void *) 65;
```

run in kernel and test

```console
# xdp_progs/xdp_adjust_tail
Missing argument -i
Start a XDP prog which send ICMP "packet too big" 
messages if ingress packet is bigger then MAX_SIZE bytes
Usage: xdp_progs/xdp_adjust_tail [...]
    -i <ifname|ifindex> Interface
    -T <stop-after-X-seconds> Default: 0 (forever)
    -P <MAX_PCKT_SIZE> Default: 600
    -S use skb-mode
    -N enforce native mode
    -F force loading prog
    -h Display this help

# xdp_progs/xdp_adjust_tail -i veth6 -P 600 -N
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          0 pkts
icmp "packet too big" sent:          2 pkts
icmp "packet too big" sent:          4 pkts
icmp "packet too big" sent:          6 pkts
```

use ping to generate trafic:

```console
# ping -s 650 10.0.0.10
PING 10.0.0.10 (10.0.0.10) 650(678) bytes of data.
^C
--- 10.0.0.10 ping statistics ---
7 packets transmitted, 0 received, 100% packet loss, time 6121ms
```

run in userspace:

```sh
LD_PRELOAD=/home/yunwei37/ebpf-xdp-dpdk/build-bpftime/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp_adjust_tail -i veth6 xdp-ebpf-new/base.btf
```

## xdp_fw

use `bpf_redirect_map`:

```c
/*
 * bpf_redirect_map
 *
 *  Redirect the packet to the endpoint referenced by *map* at
 *  index *key*. Depending on its type, this *map* can contain
 *  references to net devices (for forwarding packets through other
 *  ports), or to CPUs (for redirecting XDP frames to another CPU;
 *  but this is only implemented for native XDP (with driver
 *  support) as of this writing).
 *
 *  The lower two bits of *flags* are used as the return code if
 *  the map lookup fails. This is so that the return value can be
 *  one of the XDP program return codes up to **XDP_TX**, as chosen
 *  by the caller. The higher bits of *flags* can be set to
 *  BPF_F_BROADCAST or BPF_F_EXCLUDE_INGRESS as defined below.
 *
 *  With BPF_F_BROADCAST the packet will be broadcasted to all the
 *  interfaces in the map, with BPF_F_EXCLUDE_INGRESS the ingress
 *  interface will be excluded when do broadcasting.
 *
 *  See also **bpf_redirect**\ (), which only supports redirecting
 *  to an ifindex, but doesn't require a map to do so.
 *
 * Returns
 *  **XDP_REDIRECT** on success, or the value of the two lower bits
 *  of the *flags* argument on error.
 */
static long (*bpf_redirect_map)(void *map, __u64 key, __u64 flags) = (void *) 51;
```

test in kernel

```sh
xdp_progs/xdp_fw veth6
```

userpsace is similar.

## remove xdp

```sh
sudo ip link set dev veth6 xdp off
```
