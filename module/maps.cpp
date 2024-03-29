#include <map>
#include <cstdint>
#include "bpftime_shm.hpp"
#include "lpm_trie.h"

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
