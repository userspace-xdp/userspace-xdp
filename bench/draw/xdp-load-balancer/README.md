# xdp load balancer

see xdp-ebpf-new

- access array map for config
- use xxhash

```c

SEC("xdp")
int xdp_pass(struct xdp_md *ctx)
{
	void *data_end = (void *)ctx->data_end;
	void *data = (void *)ctx->data;
	// bpf_printk("received packet %p %p\n", data, data_end);
	struct hash_and_sum hash_and_sum_res;

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
		// bpf_printk("received tcp packet\n");

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

		if (client_cfg->ip == bpf_ntohl(ip->saddr))
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

		ip->daddr = bpf_htonl(dst->ip);
		ip->saddr = bpf_htonl(src->ip);

		//   /* FIX IP checksum */
		ip->check = 0;
		ip->check = ~csum_reduce_helper(bpf_csum_diff(0, 0, (__be32 *)ip, sizeof(struct iphdr), 0));

		if (data + 1200 < data_end)
			return XDP_PASS;
		if (data + 60 > data_end)
			return XDP_PASS;
		hash_and_sum_res.sum = calculate_checksum(data, 60);
		// calc the xxhash32 based on the sum
		hash_and_sum_res.xxhash64_res = xxhash32(data, 60, hash_and_sum_res.sum);
		// simulate the destination payload
		__builtin_memcpy(((void*)ip + sizeof(*ip)), &hash_and_sum_res, sizeof(hash_and_sum_res));

		return XDP_TX;
	}
	// bpf_printk("pass\n");
	return XDP_PASS;
}
```
