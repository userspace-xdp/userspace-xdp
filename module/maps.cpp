#include <map>
#include <cstdint>
#include "bpftime_shm.hpp"
#include "lpm_trie.h"
#include "LRUCache11.hpp"

static std::map<int, int> dev_hash_map = {};

static void *elem_lookup_static(int id, const void *key, bool from_syscall)
{
	auto k = *(int *)key;
	auto it = dev_hash_map.find(k);
	if (it == dev_hash_map.end())
		return nullptr;
	return &it->second;
}

static long elem_update_static(int id, const void *key, const void *value,
			       uint64_t flags, bool from_syscall)
{
	auto k = *(int *)key;
	auto v = *(int *)value;
	dev_hash_map[k] = v;
	return 0;
}

static long elem_delete_static(int id, const void *key, bool from_syscall)
{
    auto k = *(int *)key;
    auto it = dev_hash_map.find(k);
    if (it == dev_hash_map.end())
        return -1;
    dev_hash_map.erase(it);
    return 0;
}

static int elem_get_next_key_static(int id, const void *key, void *next_key, bool from_syscall)
{
    auto k = *(int *)key;
    auto it = dev_hash_map.upper_bound(k);
    if (it == dev_hash_map.end())
        return -1;
    *(int *)next_key = it->first;
    return 0;
}

bpftime::bpftime_map_ops dev_map_ops{
	.elem_lookup = elem_lookup_static,
	.elem_update = elem_update_static,
    .elem_delete = elem_delete_static,
    .map_get_next_key = elem_get_next_key_static,
};

trie_t trie = {};
bpftime::bpf_map_attr trie_attr;

int lpm_alloc_map(int id, const char *name, bpftime::bpf_map_attr attr) {
    trie_init(&trie);
    trie_attr = attr;
    return 0;
}

long lpm_elem_delete(int id, const void *key, bool from_syscall) {
    // As this implementation doesn't provide a delete function, we can't implement one.
    return -1;
}

int as;
void *lpm_elem_lookup(int id, const void *key, bool from_syscall) {
    int res = trie_node_search(&trie, (uint8_t *)key, trie_attr.key_size, &as);
    if (res == 0)
        return nullptr;
    return &as;
}

long lpm_elem_update(int id, const void *key, const void *value, uint64_t flags, bool from_syscall) {
    trie_node_put(&trie, (uint8_t *)key, trie_attr.key_size, *(int *)value);
    return 0;
}

bpftime::bpftime_map_ops lpm_map_ops{
    .alloc_map = lpm_alloc_map,
	.elem_lookup = lpm_elem_lookup,
	.elem_update = lpm_elem_update,
    .elem_delete = lpm_elem_delete,
    .map_get_next_key = nullptr,
};

#include <iostream>
#include "LRUCache11.hpp"
#include <functional>

// Define the flow_key structure
struct flow_key {
    union {
        uint32_t src;
        uint32_t srcv6[4];
    };
    union {
        uint32_t dst;
        uint32_t dstv6[4];
    };
    union {
        uint32_t ports;
        uint16_t port16[2];
    };
    uint8_t proto;

    // Define equality operator for flow_key
    bool operator==(const flow_key& other) const {
        return src == other.src &&
               dst == other.dst &&
               ports == other.ports &&
               proto == other.proto;
    }
};

// Define the real_pos_lru structure
struct real_pos_lru {
    uint32_t pos;
    uint64_t atime;
};

namespace std {
    template <>
    struct hash<flow_key> {
        std::size_t operator()(const flow_key& key) const {
            using std::size_t;
            using std::hash;

            size_t h1 = hash<uint32_t>()(key.src);
            size_t h2 = hash<uint32_t>()(key.dst);
            size_t h3 = hash<uint32_t>()(key.ports);
            size_t h4 = hash<uint8_t>()(key.proto);

            return h1 ^ (h2 << 1) ^ (h3 << 2) ^ (h4 << 3);
        }
    };
}

lru11::Cache<flow_key, real_pos_lru> cache(8000000, 1000);

// lru map
void *lru_hash_map_elem_lookup(int id, const void *key, bool from_syscall) {
    printf("runtime: lru_hash_map_elem_lookup\n");
    static real_pos_lru value_local;
    bool success = cache.tryGetRef(*(flow_key *)key, value_local);
    printf("hit: %d\n", success);
    if (!success)
        return nullptr;
    return &value_local;
}

long lru_hash_map_elem_update(int id, const void *key, const void *value, uint64_t flags, bool from_syscall) {
    printf("runtime: lru_hash_map_elem_update\n");
    cache.insert(*(flow_key *)key, *(real_pos_lru *)value);
    return 0;
}

long lru_hash_map_elem_delete(int id, const void *key, bool from_syscall) {
    printf("lru_hash_map_elem_delete\n");
    return 0;
}

int lru_hash_map_get_next_key(int id, const void *key, void *next_key, bool from_syscall) {
    printf("lru_hash_map_get_next_key\n");
    return 0;
}

bpftime::bpftime_map_ops lru_hash_map_ops{
    .elem_lookup = lru_hash_map_elem_lookup,
    .elem_update = lru_hash_map_elem_update,
    .elem_delete = lru_hash_map_elem_delete,
    .map_get_next_key = lru_hash_map_get_next_key,
};
