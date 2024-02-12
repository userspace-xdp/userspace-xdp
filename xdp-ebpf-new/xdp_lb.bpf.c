#define BPF_NO_GLOBAL_DATA

#ifndef BPF_NO_PRESERVE_ACCESS_INDEX
#pragma clang attribute push (__attribute__((preserve_access_index)), apply_to = record)
#endif

typedef signed char __s8;
typedef unsigned char __u8;
typedef short int __s16;
typedef short unsigned int __u16;
typedef int __s32;
typedef unsigned int __u32;
typedef long long int __s64;
typedef long long unsigned int __u64;
typedef __s8 s8;
typedef __u8 u8;
typedef __s16 s16;
typedef __u16 u16;
typedef __s32 s32;
typedef __u32 u32;
typedef __s64 s64;
typedef __u64 u64;

enum {
	false = 0,
	true = 1,
};

typedef __u16 __be16;
typedef __u32 __be32;
typedef __u64 __be64;
typedef __u32 __wsum;
typedef __u32 uint32_t;
typedef __u16 uint16_t;
typedef u8 uint8_t;
typedef u64 uint64_t;
typedef __u16 __sum16;

struct ethhdr {
	unsigned char h_dest[6];
	unsigned char h_source[6];
	__be16 h_proto;
};

struct iphdr {
	__u8 ihl: 4;
	__u8 version: 4;
	__u8 tos;
	__be16 tot_len;
	__be16 id;
	__be16 frag_off;
	__u8 ttl;
	__u8 protocol;
	__sum16 check;
	union {
		struct {
			__be32 saddr;
			__be32 daddr;
		};
		struct {
			__be32 saddr;
			__be32 daddr;
		} addrs;
	};
};

// here we use a sightly different one than kernel
// BTF can help us
struct xdp_md {
	__u64 data;
	__u64 data_end;
	__u32 data_meta;
	__u32 ingress_ifindex;
	__u32 rx_queue_index;
	__u32 egress_ifindex;
};

// struct xdp_md {
// 	__u32 data;
// 	__u32 data_end;
// 	__u32 data_meta;
// 	__u32 ingress_ifindex;
// 	__u32 rx_queue_index;
// 	__u32 egress_ifindex;
// };

enum xdp_action {
	XDP_ABORTED = 0,
	XDP_DROP = 1,
	XDP_PASS = 2,
	XDP_TX = 3,
	XDP_REDIRECT = 4,
};


struct tcphdr {
	__be16 source;
	__be16 dest;
	__be32 seq;
	__be32 ack_seq;
	__u16 res1: 4;
	__u16 doff: 4;
	__u16 fin: 1;
	__u16 syn: 1;
	__u16 rst: 1;
	__u16 psh: 1;
	__u16 ack: 1;
	__u16 urg: 1;
	__u16 ece: 1;
	__u16 cwr: 1;
	__be16 window;
	__sum16 check;
	__be16 urg_ptr;
};


enum {
	IPPROTO_IP = 0,
	IPPROTO_ICMP = 1,
	IPPROTO_IGMP = 2,
	IPPROTO_IPIP = 4,
	IPPROTO_TCP = 6,
	IPPROTO_EGP = 8,
	IPPROTO_PUP = 12,
	IPPROTO_UDP = 17,
	IPPROTO_IDP = 22,
	IPPROTO_TP = 29,
	IPPROTO_DCCP = 33,
	IPPROTO_IPV6 = 41,
	IPPROTO_RSVP = 46,
	IPPROTO_GRE = 47,
	IPPROTO_ESP = 50,
	IPPROTO_AH = 51,
	IPPROTO_MTP = 92,
	IPPROTO_BEETPH = 94,
	IPPROTO_ENCAP = 98,
	IPPROTO_PIM = 103,
	IPPROTO_COMP = 108,
	IPPROTO_L2TP = 115,
	IPPROTO_SCTP = 132,
	IPPROTO_UDPLITE = 136,
	IPPROTO_MPLS = 137,
	IPPROTO_ETHERNET = 143,
	IPPROTO_RAW = 255,
	IPPROTO_MPTCP = 262,
	IPPROTO_MAX = 263,
};


enum bpf_map_type {
	BPF_MAP_TYPE_UNSPEC = 0,
	BPF_MAP_TYPE_HASH = 1,
	BPF_MAP_TYPE_ARRAY = 2,
	BPF_MAP_TYPE_PROG_ARRAY = 3,
	BPF_MAP_TYPE_PERF_EVENT_ARRAY = 4,
	BPF_MAP_TYPE_PERCPU_HASH = 5,
	BPF_MAP_TYPE_PERCPU_ARRAY = 6,
	BPF_MAP_TYPE_STACK_TRACE = 7,
	BPF_MAP_TYPE_CGROUP_ARRAY = 8,
	BPF_MAP_TYPE_LRU_HASH = 9,
	BPF_MAP_TYPE_LRU_PERCPU_HASH = 10,
	BPF_MAP_TYPE_LPM_TRIE = 11,
	BPF_MAP_TYPE_ARRAY_OF_MAPS = 12,
	BPF_MAP_TYPE_HASH_OF_MAPS = 13,
	BPF_MAP_TYPE_DEVMAP = 14,
	BPF_MAP_TYPE_SOCKMAP = 15,
	BPF_MAP_TYPE_CPUMAP = 16,
	BPF_MAP_TYPE_XSKMAP = 17,
	BPF_MAP_TYPE_SOCKHASH = 18,
	BPF_MAP_TYPE_CGROUP_STORAGE_DEPRECATED = 19,
	BPF_MAP_TYPE_CGROUP_STORAGE = 19,
	BPF_MAP_TYPE_REUSEPORT_SOCKARRAY = 20,
	BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE_DEPRECATED = 21,
	BPF_MAP_TYPE_PERCPU_CGROUP_STORAGE = 21,
	BPF_MAP_TYPE_QUEUE = 22,
	BPF_MAP_TYPE_STACK = 23,
	BPF_MAP_TYPE_SK_STORAGE = 24,
	BPF_MAP_TYPE_DEVMAP_HASH = 25,
	BPF_MAP_TYPE_STRUCT_OPS = 26,
	BPF_MAP_TYPE_RINGBUF = 27,
	BPF_MAP_TYPE_INODE_STORAGE = 28,
	BPF_MAP_TYPE_TASK_STORAGE = 29,
	BPF_MAP_TYPE_BLOOM_FILTER = 30,
	BPF_MAP_TYPE_USER_RINGBUF = 31,
	BPF_MAP_TYPE_CGRP_STORAGE = 32,
	__MAX_BPF_MAP_TYPE = 33,
};


#ifndef BPF_NO_PRESERVE_ACCESS_INDEX
#pragma clang attribute pop
#endif

#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#include "common.h"

#define MAX_OPT_WORDS 10 // 40 bytes for options
#define MAX_TARGET_COUNT 64
#define CHECK_OUT_OF_BOUNDS(PTR, OFFSET, END) (((void*) PTR) + OFFSET > ((void*) END))

struct ipv4_psd_header {
  uint32_t src_addr; /* IP address of source host. */
  uint32_t dst_addr; /* IP address of destination host. */
  uint8_t  zero;     /* zero. */
  uint8_t  proto;    /* L4 protocol type. */
  uint16_t len;      /* L4 length. */
};

/**
 * Map that holds the information for the target servers
 * You can assume that this map will always have two elements populated when
 * loading the XDP program
 */
struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __type(key, __u32);
    __type(value, struct ip_mac_pair);
    __uint(max_entries, MAX_TARGET_COUNT);
} targets_map SEC(".maps");

/**
 * Map that holds the IP and MAC address of the load balancer and the client.
 * The IP and MAC of the load balancer are in the first cell
 * and the information for the client are in the second cell.
 * This map is also populated when loading the XDP program.
 */
struct {
    __uint(type, BPF_MAP_TYPE_ARRAY);
    __type(key, __u32);
    __type(value, struct ip_mac_pair);
    __uint(max_entries, MAX_TARGET_COUNT);
} config_map SEC(".maps");


static __always_inline __u16 csum_reduce_helper(__u32 csum)
{
	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);
	csum = ((csum & 0xffff0000) >> 16) + (csum & 0xffff);

	return csum;
}

static __always_inline int compute_tcp_csum(struct iphdr *ip, struct tcphdr *tcp, void * data_end)
{
  struct ipv4_psd_header psdh;
  uint32_t csum;
  int ret = 0;

  tcp->check = 0;
  csum = bpf_csum_diff(0, 0, (__be32 *)tcp, sizeof(struct tcphdr), 0);
  psdh.src_addr = ip->saddr;
	psdh.dst_addr = ip->daddr;
	psdh.zero = 0;
	psdh.proto = IPPROTO_TCP;
	psdh.len = bpf_htons(bpf_ntohs(ip->tot_len) - sizeof(struct iphdr));
	csum = bpf_csum_diff(0, 0, (__be32*)&psdh, sizeof(struct ipv4_psd_header),
			csum);
  uint32_t tcphdrlen = tcp->doff * 4;

  if (tcphdrlen == sizeof(struct tcphdr))
    goto OUT;

  /* There are TCP options */
  uint32_t *opt = (uint32_t *)(tcp + 1);
  uint32_t parsed = sizeof(struct tcphdr);
  for (int i=0;i<MAX_OPT_WORDS;i++) {
    if ((void *)(opt + 1) > data_end) {
      ret = -1;
      goto OUT;
    }

    csum = bpf_csum_diff(0, 0, (__be32 *)opt, sizeof(uint32_t), csum);

    parsed += sizeof(uint32_t);
    if (parsed == tcphdrlen)
      break;
    opt++;
  }

OUT:
  tcp->check = ~csum_reduce_helper(csum);
  return ret;
}

static uint32_t get_target_key(uint32_t src_ip, uint16_t src_port,
    uint16_t dst_port)
{
  uint32_t key = (src_ip ^ src_port ^ dst_port) & 0x1;

  return key;
}

SEC("xdp")
int xdp_pass(struct xdp_md* ctx) {
    void* data_end = (void*) ctx->data_end;
    void* data = (void*) ctx->data;
    bpf_printk("received packet %p %p\n", data, data_end);

    struct ethhdr *eth = data;
    if (CHECK_OUT_OF_BOUNDS(data, sizeof(struct ethhdr), data_end)){
      bpf_printk("Out of bounds ethhdr\n");
      return XDP_DROP;
    }

    struct iphdr* ip = data + sizeof(struct ethhdr);
    if (CHECK_OUT_OF_BOUNDS(ip, sizeof(struct iphdr), data_end)){
      bpf_printk("Out of bounds iphdr\n");
      return XDP_DROP;
    }

    /* FIXME: Implement the load balancer logic */

    if (ip->protocol == IPPROTO_TCP) {
      struct tcphdr* tcp = data + sizeof(struct ethhdr) + sizeof(struct iphdr);
      bpf_printk("received tcp packet\n");

      if (CHECK_OUT_OF_BOUNDS(tcp, sizeof(struct tcphdr), data_end)) {
        bpf_printk("Out of bounds tcphdr\n");
        return XDP_DROP;
      }
	
      uint32_t key = 1;
      struct ip_mac_pair *client_cfg = bpf_map_lookup_elem(&config_map, &key);
      if (!client_cfg) {
        bpf_printk("Client config not found\n");
        return XDP_ABORTED;
      }

      struct ip_mac_pair *dst, *src;

      if (client_cfg->ip == bpf_ntohl(ip->saddr)) {
        /* FIXME: Load balance the decision */
        // key = 0;
        key = get_target_key(ip->saddr, tcp->source, tcp->dest);
        dst = bpf_map_lookup_elem(&targets_map, &key);
        if (!dst)
          return XDP_ABORTED;

        key = 0;
        src = bpf_map_lookup_elem(&config_map, &key);
        if (!src)
          return XDP_ABORTED;
      } else {
        key = 1;
        dst = bpf_map_lookup_elem(&config_map, &key);
        if (!dst)
          return XDP_ABORTED;

        key = 0;
        src = bpf_map_lookup_elem(&config_map, &key);
        if (!src)
          return XDP_ABORTED;
      }

      __builtin_memcpy(eth->h_dest, &dst->mac, 6);
      __builtin_memcpy(eth->h_source, &src->mac, 6);

      ip->daddr = bpf_htonl(dst->ip);
      ip->saddr = bpf_htonl(src->ip);

    //   /* FIX IP checksum */
      ip->check = 0;
      ip->check = ~csum_reduce_helper(bpf_csum_diff(0, 0, (__be32 *)ip, sizeof(struct iphdr), 0));

    //   /* FIX TCP chksum */
      if (compute_tcp_csum(ip, tcp, data_end))
        return XDP_DROP;
	  bpf_printk("sending packet to %d\n", key);
      return XDP_TX;
    }
	bpf_printk("pass\n");
    return XDP_PASS;
}

char LICENSE[] SEC("license") = "GPL";
