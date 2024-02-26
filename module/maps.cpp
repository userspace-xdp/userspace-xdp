#include <map>
#include <cstdint>
#include "bpftime_shm.hpp"

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
    .elem_delete = elem_delete_static,
	.elem_lookup = elem_lookup_static,
	.elem_update = elem_update_static,
    .map_get_next_key = elem_get_next_key_static,
};
