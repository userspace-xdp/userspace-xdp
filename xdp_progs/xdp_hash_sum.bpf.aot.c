/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */
#include "def.bpf.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

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


struct hash_and_sum
{
	uint32_t sum;
	uint32_t xxhash64_res;
};

// Simplified checksum calculation to demonstrate auto-vectorization
static inline uint32_t calculate_checksum(const u8 *data, uint32_t len) {
    uint32_t sum = 0;
    for (uint32_t i = 0; i < len; ++i) {
        sum += data[i];
    }
    return sum;
}

#define PRIME1 0x9E3779B1U
#define PRIME2 0x85EBCA77U
#define PRIME3 0xC2B2AE3DU
#define PRIME4 0x27D4EB2FU
#define PRIME5 0x165667B1U

static __always_inline uint32_t rotl (uint32_t x, int r) {
    return ((x << r) | (x >> (32 - r)));
}
// Normal stripe processing routine.
static __always_inline uint32_t round_xxhash(uint32_t acc, const uint32_t input) {
    return rotl(acc + (input * PRIME2), 13) * PRIME1;
}

static __always_inline uint32_t avalanche_step (const uint32_t h, const int rshift, const uint32_t prime) {
    return (h ^ (h >> rshift)) * prime;
}
// Mixes all bits to finalize the hash.
static __always_inline uint32_t avalanche (const uint32_t h) {
    return avalanche_step(avalanche_step(avalanche_step(h, 15, PRIME2), 13, PRIME3), 16, 1);
}

static __always_inline uint32_t endian32 (const char *v) {
    return (uint32_t)((uint8_t)(v[0]))|((uint32_t)((uint8_t)(v[1])) << 8)
            |((uint32_t)((uint8_t)(v[2])) << 16)|((uint32_t)((uint8_t)(v[3])) << 24);
}

static __always_inline uint32_t fetch32 (const char *p, const uint32_t v) {
    return round_xxhash(v, endian32(p));
}

// Processes the last 0-15 bytes of p.
static uint32_t finalize (const uint32_t h, const char *p, uint32_t len) {
    return
        (len >= 4) ? finalize(rotl(h + (endian32(p) * PRIME3), 17) * PRIME4, p + 4, len - 4) :
        (len > 0)  ? finalize(rotl(h + ((uint8_t)(*p) * PRIME5), 11) * PRIME1, p + 1, len - 1) :
        avalanche(h);
}

static uint32_t h16bytes_4 (const char *p, uint32_t len, const uint32_t v1, const uint32_t v2, const uint32_t v3, const uint32_t v4) {
    return
        (len >= 16) ? h16bytes_4(p + 16, len - 16, fetch32(p, v1), fetch32(p+4, v2), fetch32(p+8, v3), fetch32(p+12, v4)) :
        rotl(v1, 1) + rotl(v2, 7) + rotl(v3, 12) + rotl(v4, 18);
}

static __always_inline uint32_t h16bytes_3 (const char *p, uint32_t len, const uint32_t seed) {
    return h16bytes_4(p, len, seed + PRIME1 + PRIME2, seed + PRIME2, seed, seed - PRIME1);
}

static inline  uint32_t xxhash32 (const char *input, uint32_t len, uint32_t seed) {
    return finalize((len >= 16 ? h16bytes_3(input, len, seed) : seed + PRIME5) + len, (input) + (len & ~0xF), len & 0xF);
}

int bpf_main(void *ctx_base)
{
	struct xdp_md *ctx = (struct xdp_md *)ctx_base;
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;
	u64 nh_off;
	u16 h_proto;
	struct hash_and_sum hash_and_sum_res;
	struct iphdr *iph;

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return XDP_PASS;

	h_proto = eth->h_proto;
	if (h_proto != bpf_htons(ETH_P_IP)) {
		return XDP_PASS;
	}
	iph = data + sizeof(struct ethhdr);
	if (iph + 1 > data_end)
		return XDP_PASS;

	// we only measure pkt size < 1200
	if (data + 1200 < data_end)
		return XDP_PASS;
	if (data + 60 > data_end)
		return XDP_PASS;
	if ((void*)iph + sizeof(struct iphdr) + sizeof(hash_and_sum_res) > data_end)
		return XDP_PASS;
	// calc the add sum
	hash_and_sum_res.sum = calculate_checksum(data, 60);
	// calc the xxhash32 based on the sum
	hash_and_sum_res.xxhash64_res = xxhash32(data, 60, hash_and_sum_res.sum);
	// store the result in the ip payload to avoid optimization out
	__builtin_memcpy(((void*)iph + sizeof(*iph)), &hash_and_sum_res, sizeof(hash_and_sum_res));
	
	swap_src_dst_mac(data);
	return XDP_TX;
}

char _license[] SEC("license") = "GPL";