#include "def.bpf.h"
#include <bpf/bpf_endian.h>
#include <bpf/bpf_helpers.h>
#include "main.h"

struct
{
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 256 * 1024);
} ringbuf SEC(".maps");

static void swap_src_dst_mac(void *data)
{
	unsigned short *p = data;
	unsigned short dst[3];

	dst[0] = p[0];
	dst[1] = p[1];
	dst[2] = p[2];
	p[0] = p[3];
	p[1] = p[4];
	p[2] = p[5];
	p[3] = dst[0];
	p[4] = dst[1];
	p[5] = dst[2];
}

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data = (void *)(long)ctx->data;
	void *data_end = (void *)(long)ctx->data_end;

	// bpf_printk("got something %p %p", data, data_end);

	struct ethhdr *eth = data;
	if (data + sizeof(struct ethhdr) > data_end) {
		bpf_printk("Packet too small in Ethernet header");
		return XDP_PASS;
	}

	if (bpf_ntohs(eth->h_proto) != ETH_P_IP) {
		bpf_printk("Not an IP packet");
		return XDP_PASS;
	}

	struct iphdr *iph = data + sizeof(struct ethhdr);
	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) > data_end) {
		bpf_printk("Packet too small in IP header");
		return XDP_PASS;
	
	}

	if (iph->protocol != IPPROTO_TCP) {
		bpf_printk("Not a TCP packet");
		return XDP_PASS;
	
	}

	struct tcphdr *tcph = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct tcphdr) > data_end) {
		bpf_printk("Packet too small in TCP header");
		return XDP_PASS;
	}

	// bpf_printk("Got TCP packet from %x", tcph->psh);

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
	swap_src_dst_mac(data);
	return XDP_TX;
}

char _license[] SEC("license") = "GPL";