#define BPF_NO_GLOBAL_DATA
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <netinet/in.h>

#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

#include "common.h"

#define MAX_OPT_WORDS 10 // 40 bytes for options
#define MAX_TARGET_COUNT 64
#define CHECK_OUT_OF_BOUNDS(PTR, OFFSET, END) (((void *)PTR) + OFFSET > ((void *)END))

struct ipv4_psd_header
{
  uint32_t src_addr; /* IP address of source host. */
  uint32_t dst_addr; /* IP address of destination host. */
  uint8_t zero;      /* zero. */
  uint8_t proto;     /* L4 protocol type. */
  uint16_t len;      /* L4 length. */
};

/**
 * Map that holds the information for the target servers
 * You can assume that this map will always have two elements populated when
 * loading the XDP program
 */
struct
{
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
struct
{
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

// static __always_inline int compute_tcp_csum(struct iphdr *ip, struct tcphdr *tcp, void *data_end)
// {
//   struct ipv4_psd_header psdh;
//   uint32_t csum;
//   int ret = 0;

//   tcp->check = 0;
//   csum = bpf_csum_diff(0, 0, (__be32 *)tcp, sizeof(struct tcphdr), 0);
//   psdh.src_addr = ip->saddr;
//   psdh.dst_addr = ip->daddr;
//   psdh.zero = 0;
//   psdh.proto = IPPROTO_TCP;
//   psdh.len = htons(ntohs(ip->tot_len) - sizeof(struct iphdr));
//   csum = bpf_csum_diff(0, 0, (__be32 *)&psdh, sizeof(struct ipv4_psd_header),
//                        csum);
//   uint32_t tcphdrlen = tcp->doff * 4;

//   if (tcphdrlen == sizeof(struct tcphdr))
//     goto OUT;

//   /* There are TCP options */
//   uint32_t *opt = (uint32_t *)(tcp + 1);
//   uint32_t parsed = sizeof(struct tcphdr);
//   for (int i = 0; i < MAX_OPT_WORDS; i++)
//   {
//     if ((void *)(opt + 1) > data_end)
//     {
//       ret = -1;
//       goto OUT;
//     }

//     csum = bpf_csum_diff(0, 0, (__be32 *)opt, sizeof(uint32_t), csum);

//     parsed += sizeof(uint32_t);
//     if (parsed == tcphdrlen)
//       break;
//     opt++;
//   }

// OUT:
//   tcp->check = ~csum_reduce_helper(csum);
//   return ret;
// }

static uint32_t get_target_key(uint32_t src_ip, uint16_t src_port,
                               uint16_t dst_port)
{
  uint32_t key = (src_ip ^ src_port ^ dst_port) & 0x1;

  return key;
}

SEC("xdp")
int xdp_lb(struct xdp_md *ctx)
{
  void *data_end = (void *)(long)ctx->data_end;
  void *data = (void *)(long)ctx->data;

  struct ethhdr *eth = data;
  if (CHECK_OUT_OF_BOUNDS(data, sizeof(struct ethhdr), data_end))
  {
    bpf_printk("Out of bounds ethhdr\n");
    return XDP_DROP;
  }

  struct iphdr *ip = data + sizeof(struct ethhdr);
  if (CHECK_OUT_OF_BOUNDS(ip, sizeof(struct iphdr), data_end))
  {
    bpf_printk("Out of bounds iphdr\n");
    return XDP_DROP;
  }

  /* FIXME: Implement the load balancer logic */

  if (ip->protocol == IPPROTO_TCP)
  {
    struct tcphdr *tcp = data + sizeof(struct ethhdr) + sizeof(struct iphdr);

    if (CHECK_OUT_OF_BOUNDS(tcp, sizeof(struct tcphdr), data_end))
    {
      bpf_printk("Out of bounds tcphdr\n");
      return XDP_DROP;
    }

    uint32_t key = 1;
    struct ip_mac_pair *client_cfg = bpf_map_lookup_elem(&config_map, &key);
    if (!client_cfg)
    {
      bpf_printk("Client config not found\n");
      return XDP_ABORTED;
    }

    struct ip_mac_pair *dst, *src;

    if (client_cfg->ip == ntohl(ip->saddr))
    {
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
    }
    else
    {
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

    ip->daddr = htonl(dst->ip);
    ip->saddr = htonl(src->ip);

    /* FIX IP checksum */
    ip->check = 0;
    ip->check = ~csum_reduce_helper(bpf_csum_diff(0, 0, (__be32 *)ip, sizeof(struct iphdr), 0));

    /* FIX TCP chksum */
    // if (compute_tcp_csum(ip, tcp, data_end))
    //   return XDP_DROP;
    tcp->check = 1234;
    bpf_printk("sending packet to %d\n", key);
    return XDP_TX;
  }
  bpf_printk("pass\n");
  return XDP_PASS;
}

char LICENSE[] SEC("license") = "GPL";
