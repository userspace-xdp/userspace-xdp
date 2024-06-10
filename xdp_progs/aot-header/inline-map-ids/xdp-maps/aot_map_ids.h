// automatically generated by the bpftime aot tool
// do not edit
#ifndef BPF_MAP_IDS_H
#define BPF_MAP_IDS_H

#include "../common_map_helpers.h"
#include "hash_map.h"

static const unsigned long long packet_size_distribute_id = ((unsigned long long)4 << 32);

DEFINE_BPFTIME_HASH_MAP(__packet_size_distribute, 128, 16, 32);

static __always_inline void* bpf_map_lookup_elem_aot(const unsigned long long* map, const void* key) {
  if (*map == packet_size_distribute_id)
    return elem_lookup(&__packet_size_distribute, key);
  return _bpf_helper_ext_0001(*map, key);
}
static __always_inline int bpf_map_delete_elem_aot(const unsigned long long* map, const void* key) {
    if (*map == packet_size_distribute_id)
        return elem_delete(&__packet_size_distribute, key);
  return _bpf_helper_ext_0003(*map, key);
}
static __always_inline int bpf_map_update_elem_aot(const unsigned long long* map, void* key, void* value, unsigned long long flags) {
    if (*map == packet_size_distribute_id)
        return elem_update(&__packet_size_distribute, key, value);
  return _bpf_helper_ext_0002(*map, key, value, flags);
}

#endif // BPF_MAP_IDS_H