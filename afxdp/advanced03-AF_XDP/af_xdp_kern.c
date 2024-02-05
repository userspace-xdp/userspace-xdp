// SPDX-License-Identifier: GPL-2.0
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#define MAX_SOCKS 4

#define SOCKET_NAME "sock_cal_bpf_fd"
#define MAX_NUM_OF_CLIENTS 10

#define CLOSE_CONN  1

typedef __u64 u64;
typedef __u32 u32;

/* This XDP program is only needed for the XDP_SHARED_UMEM mode.
 * If you do not use this mode, libbpf can supply an XDP program for you.
 */

struct {
	__uint(type, BPF_MAP_TYPE_XSKMAP);
	__uint(max_entries, MAX_SOCKS);
	__uint(key_size, sizeof(int));
	__uint(value_size, sizeof(int));
} xsks_map SEC(".maps");

static unsigned int rr;

SEC("xdp") int xdp_sock_prog(struct xdp_md *ctx)
{
	rr = (rr + 1) & (MAX_SOCKS - 1);

	return bpf_redirect_map(&xsks_map, rr, XDP_DROP);
}