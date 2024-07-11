#include "hash_map.h"

DEFINE_BPFTIME_HASH_MAP(__packet_size_distribute, 128, 16, 32);

unsigned long long bpf_helper_ext_0001(unsigned long long map, unsigned long long key) {
    return (unsigned long long)elem_lookup(&__packet_size_distribute, (const void*)key);
}

unsigned long long bpf_helper_ext_0002(unsigned long long map, unsigned long long key, unsigned long long value, unsigned long long flags) {
    return elem_update(&__packet_size_distribute, (const void*)key, (const void*)value);
}

unsigned long long bpf_helper_ext_0003(unsigned long long map, unsigned long long key) {
    return (unsigned long long)elem_delete(&__packet_size_distribute, (const void*)key);
}
