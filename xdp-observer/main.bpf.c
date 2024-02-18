#include <stddef.h>
#include <linux/bpf.h>
#include <linux/in.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <bpf/bpf_endian.h>
#include <bpf/bpf_helpers.h>
#include "main.h"

struct
{
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 256 * 1024);
} ringbuf SEC(".maps");

SEC("xdp")
int xdp_observ_prog(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;

	bpf_printk("got something");

	struct ethhdr *eth = data;
	if (data + sizeof(struct ethhdr) > data_end)
		return XDP_ABORTED;

	if (bpf_ntohs(eth->h_proto) != ETH_P_IP)
		return XDP_PASS;

	struct iphdr *iph = data + sizeof(struct ethhdr);
	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) > data_end)
		return XDP_ABORTED;

	if (iph->protocol != IPPROTO_TCP)
		return XDP_PASS;

	struct tcphdr *tcph = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct tcphdr) > data_end)
		return XDP_ABORTED;

	bpf_printk("Got TCP packet from %x", tcph->psh);

	struct event e;

	e.sip = iph->saddr;
	e.dip = iph->daddr;
	e.sport = bpf_ntohs(tcph->source);
	e.dport = bpf_ntohs(tcph->dest);
	e.syn = tcph->syn;
	e.fin = tcph->fin;
	e.rst = tcph->rst;
	e.psh = tcph->psh;
	e.ack = tcph->ack;

	bpf_ringbuf_output(&ringbuf, &e, sizeof(e), 0);

	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";