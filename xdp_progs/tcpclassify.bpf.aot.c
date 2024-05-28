#include "def.bpf.h"
#include <bpf/bpf_endian.h>

struct event
{
    int sport;
    int dport;
    int sip;
    int dip;
    int syn;
    int fin;
    int rst;
    int psh;
    int ack;
    int http;
    unsigned int len;
    unsigned char data[256];
};

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

// bpf_ringbuf_output
long _bpf_helper_ext_0130(unsigned long long ringbuf, void *data, u64 size, u64 flags);

long bpf_strncmp(const char *s1, u32 n, const char *s2) {
	if (n == 4) {
        // Cast the pointers to `unsigned int*` and compare the integers.
        unsigned int i1 = *(unsigned int*)s1;
        unsigned int i2 = *(unsigned int*)s2;

        if (i1 != i2) {
            // If they are not equal, find the first differing character.
            for (int i = 0; i < n; i++) {
                if (s1[i] != s2[i]) {
                    return (unsigned char)s1[i] - (unsigned char)s2[i];
                }
            }
        }
        return 0; // Strings are equal.
    } else {
        // Fallback to the normal comparison for other lengths.
        while (n--) {
            if (*s1 != *s2) {
                return *(unsigned char *)s1 - *(unsigned char *)s2;
            }
            if (*s1 == '\0') {
                break;
            }
            s1++;
            s2++;
        }
        return 0;
    }
}

long bpf_xdp_load_bytes(struct xdp_md *xdp_md, __u32 offset, void *buf, __u32 len) {
	void *data = xdp_md->data + offset;
	__builtin_memcpy(buf, data, len);
	return 0;
}

int bpf_main(void *ctx_base)
{
	struct xdp_md *ctx = (struct xdp_md *)ctx_base;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	// bpf_printk("got something %p %p", data, data_end);

	struct ethhdr *eth = data;
	if (data + sizeof(struct ethhdr) > data_end) {
		// bpf_printk("Packet too small in Ethernet header");
		return XDP_PASS;
	}

	if (bpf_ntohs(eth->h_proto) != ETH_P_IP) {
		// bpf_printk("Not an IP packet");
		return XDP_PASS;
	}

	struct iphdr *iph = data + sizeof(struct ethhdr);
	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) > data_end) {
		// bpf_printk("Packet too small in IP header");
		return XDP_PASS;
	
	}

	if (iph->protocol != IPPROTO_TCP) {
		// bpf_printk("Not a TCP packet");
		return XDP_PASS;
	}

	struct tcphdr *tcph = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

	if (data + sizeof(struct ethhdr) + sizeof(struct iphdr) + sizeof(struct tcphdr) > data_end) {
		// bpf_printk("Packet too small in TCP header");
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
	e.len = data_end - data;
	// help indetify http packets
	void* tcp_paload = (void*)tcph + tcph->doff * 4;
	if (tcp_paload + 4 < data_end) {
		// because we cannot let helpers access packet, need copy 
		bpf_xdp_load_bytes(ctx, 0, e.data, 4);
		// demosntrate how to use bpf_strncmp
		if (bpf_strncmp(e.data, 4, "HTTP") == 0) {
			e.http = 1;
		} else {
			e.http = 0;
		}
	}
	// cpoy the buffer
	if (data + 60 < data_end)
		bpf_xdp_load_bytes(ctx, 0, &e.data, 60);

	// it's 4 after relocation
	_bpf_helper_ext_0130(((unsigned long long)4) << 32, &e, sizeof(e), 0);
	swap_src_dst_mac(data);
	return XDP_TX;
}

