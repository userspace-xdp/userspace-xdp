// SPDX-License-Identifier: GPL-2.0
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_core_read.h> /* bpf_core_type_id_local */

#define MAX_SOCKS 4


/* This XDP program is only needed for the XDP_SHARED_UMEM mode.
 * If you do not use this mode, libbpf can supply an XDP program for you.
 */

struct {
	__uint(type, BPF_MAP_TYPE_XSKMAP);
	__uint(max_entries, MAX_SOCKS);
	__uint(key_size, sizeof(int));
	__uint(value_size, sizeof(int));
} xsks_map SEC(".maps");

SEC("xdp") int xdp_sock_prog(struct xdp_md *ctx)
{
	/* Let network stack handle ARP and IPv6 Neigh Solicitation */
	return bpf_redirect_map(&xsks_map, ctx->rx_queue_index, XDP_DROP);
}