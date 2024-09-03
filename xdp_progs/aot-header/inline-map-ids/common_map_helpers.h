#ifndef COMMON_MAP_HELPERS_H
#define COMMON_MAP_HELPERS_H

/* Avoid 'linux/stddef.h' definition of '__always_inline'. */
#undef __always_inline
#define __always_inline inline __attribute__((always_inline))

#define CONCATENATE_DETAIL(x, y) x##y

void* _bpf_helper_ext_0001();
#define bpf_map_lookup_elem(a, b) bpf_map_lookup_elem_aot(CONCATENATE_DETAIL(a, _id), b)
#define bpf_map_lookup_elem_dyn _bpf_helper_ext_0001

int _bpf_helper_ext_0002();
#define bpf_map_update_elem(a, b, c, d) bpf_map_update_elem_aot(CONCATENATE_DETAIL(a, _id), b, c, d)
#define bpf_map_update_elem_dyn _bpf_helper_ext_0002

int _bpf_helper_ext_0003();
#define bpf_map_delete_elem(a, b) bpf_map_delete_elem_aot(CONCATENATE_DETAIL(a, _id), b)
#define bpf_map_delete_elem_dyn _bpf_helper_ext_0003

int _bpf_helper_ext_0130();
#define bpf_ringbuf_output(a, b, c, d) bpf_ringbuf_output_aot(CONCATENATE_DETAIL(a, _id), b, c, d)
static __always_inline long bpf_ringbuf_output_aot(const unsigned long long* map, void *data, unsigned long long size, unsigned long long flags) {
  return _bpf_helper_ext_0130(*map, data, size, flags);
}

#endif // COMMON_MAP_HELPERS_H
