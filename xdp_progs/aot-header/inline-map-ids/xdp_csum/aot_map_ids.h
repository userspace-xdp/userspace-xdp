// automatically generated by the bpftime aot tool
// do not edit
#ifndef BPF_MAP_IDS_H
#define BPF_MAP_IDS_H

#include "../common_map_helpers.h"


static const unsigned long long rxcnt_id = ((unsigned long long)4 << 32);

static unsigned int __rxcnt[256] = {0};

static __always_inline void* bpf_map_lookup_elem_aot(const unsigned long long* map, const void* key) {
  if (*map == rxcnt_id)
    return &__rxcnt[*(unsigned int*)key];
  return _bpf_helper_ext_0001(*map, key);
}

#endif // BPF_MAP_IDS_H