#include "def.bpf.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

uint64_t bpftime_csum_diff(uint64_t r1, uint64_t from_size, uint64_t r3,
			   uint64_t to_size, uint64_t seed);


__s64 _bpf_helper_ext_0028(__be32 *from, __u32 from_size, __be32 *to, __u32 to_size, __wsum seed) {
    return bpftime_csum_diff((__u64)from, (__u64)from_size, (__u64)to, (__u64)to_size, (__u64)seed);
}
