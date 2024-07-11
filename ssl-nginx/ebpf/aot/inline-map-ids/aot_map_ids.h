// automatically generated by the bpftime aot tool
// do not edit
#ifndef BPF_MAP_IDS_H
#define BPF_MAP_IDS_H

#include "common_map_helpers.h"

static const unsigned long long perf_SSL_events_id = ((unsigned long long)4 << 32);
static const unsigned long long ssl_data_id = ((unsigned long long)5 << 32);
static const unsigned long long start_ns_id = ((unsigned long long)6 << 32);
static const unsigned long long bufs_id = ((unsigned long long)7 << 32);

struct __probe_SSL_data_t {
    unsigned long long timestamp_ns;
    unsigned long long delta_ns;
    unsigned int pid;
    unsigned int tid;
    unsigned int uid;
    unsigned int len;
    unsigned int fd;
    int buf_filled;
    int rw;
    char comm[16];
    unsigned char buf[8192];
    int is_handshake;
};

struct __probe_SSL_data_t __ssl_data_map[1];

static __always_inline void* bpf_map_lookup_elem_aot(const unsigned long long* map, const void* key) {
  if (*map == ssl_data_id)
    return &__ssl_data_map[0];
  return _bpf_helper_ext_0001(*map, key);
}
static __always_inline int bpf_map_delete_elem_aot(const unsigned long long* map, const void* key) {
  return _bpf_helper_ext_0003(*map, key);
}
static __always_inline int bpf_map_update_elem_aot(const unsigned long long* map, void* key, void* value, unsigned long long flags) {
  return _bpf_helper_ext_0002(*map, key, value, flags);
}

#endif // BPF_MAP_IDS_H