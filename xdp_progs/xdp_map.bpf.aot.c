#include "def.bpf.h"

#define NULL ((void *)0)

static void swap_src_dst_mac(void *data)
{
	unsigned short *p = (unsigned short *)data;
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

// struct
// {
// 	__uint(type, BPF_MAP_TYPE_HASH);
// 	__uint(max_entries, 8192);
// 	__type(key, int);
// 	__type(value, int);
// } packet_size_distribute SEC(".maps");

// use array to simulate hash map
#define MAP_SIZE 8192

typedef struct {
    int key;
    int value;
    int used;
} HashMapEntry;

HashMapEntry packet_size_distribute[MAP_SIZE] = {0};

// A more robust hash function using bit manipulation and a prime number
unsigned int hash(int key) {
    key ^= (key >> 20) ^ (key >> 12);
    key = key ^ (key >> 7) ^ (key >> 4);
    return key * 2654435761u % MAP_SIZE;  // 2654435761 is the golden prime used in hash functions
}

// Looks up an element in the hash map
inline int* bpf_map_lookup_elem(HashMapEntry *map, int *key) {
    int index = hash(*key);
    for (int i = 0; i < MAP_SIZE; i++) {
        int probe = (index + i) % MAP_SIZE;
        if (map[probe].used && map[probe].key == *key) {
            return &map[probe].value;
        }
        if (!map[probe].used) {
            return NULL; // Not found
        }
    }
    return NULL; // Map full, though not expected if the map is properly sized and the hash function is good
}

// Updates an element in the hash map
inline int bpf_map_update_elem(HashMapEntry *map, int *key, int *value, int flags) {
    int index = hash(*key);
    for (int i = 0; i < MAP_SIZE; i++) {
        int probe = (index + i) % MAP_SIZE;
        if (map[probe].used && map[probe].key == *key) {
            map[probe].value = *value; // Update existing
            return 0;
        } else if (!map[probe].used) {
            map[probe].key = *key;
            map[probe].value = *value;
            map[probe].used = 1;
            return 0; // New insertion
        }
    }
    return -1; // Map full
}

int bpf_main(void *ctx_base)
{
	struct xdp_md *ctx = (struct xdp_md *)ctx_base;
	unsigned char *data = (unsigned char *)(long)ctx->data;
	unsigned char *data_end = (unsigned char *)(long)ctx->data_end;
	int pkt_sz = (data_end - data);
	struct ethhdr *eth = (struct ethhdr *)data;
	u64 nh_off;

	int count = 0;
	int *value = bpf_map_lookup_elem(&packet_size_distribute, &pkt_sz);
	if (value)
		count = *value + 1;
	bpf_map_update_elem(&packet_size_distribute, &pkt_sz, &count, 0);

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return XDP_DROP;

	swap_src_dst_mac(data);
	return XDP_TX;
}

