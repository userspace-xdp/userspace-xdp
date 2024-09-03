#define EINVAL 22 /* Invalid argument */
#define NULL ((void *)0)

typedef unsigned short uint16_t;
typedef unsigned int uint32_t;
typedef unsigned long long uint64_t;

struct xdp_md_userspace {
	uint64_t data;
	uint64_t data_end;
	uint32_t data_meta;
	uint32_t ingress_ifindex;
	uint32_t rx_queue_index;
	uint32_t egress_ifindex;
	// additional fields
	uint64_t buffer_start; // record the start of the available buffer
	uint64_t buffer_end; // record the end of the available buffer
};

uint64_t bpf_helper_ext_0189(uint64_t _xdp_md, uint64_t offset, uint64_t buf, uint64_t len)
{
    struct xdp_md_userspace *xdp_md = (struct xdp_md_userspace *)_xdp_md;
    // We don't support fragmented packets
    uint64_t data = xdp_md->data + offset;

    // Custom inline memcpy
    char *d = (char *)buf;
    char *s = (char *)data;
    for (uint64_t i = 0; i < len; i++) {
        d[i] = s[i];
    }

    return 0;
}

uint64_t bpf_helper_ext_0190(uint64_t _xdp_md, uint64_t offset, uint64_t buf,
			     uint64_t len)
{
	struct xdp_md_userspace *xdp_md = (struct xdp_md_userspace *)_xdp_md;
	// We don't support fragmented packets
	uint64_t data = xdp_md->data + offset;
	// if (data + len > xdp_md->data_end) {
	// 	return -EINVAL;
	// }
	__builtin_memcpy((void *)(data), (void*)buf, len);
	return 0;
}

uint64_t bpf_helper_ext_0182(uint64_t s1, uint64_t s1_sz, uint64_t s2) {
    const char *str1 = (const char *)s1;
    const char *str2 = (const char *)s2;

    for (uint64_t i = 0; i < s1_sz; i++) {
        if (str1[i] != str2[i] || str1[i] == '\0' || str2[i] == '\0') {
            return (unsigned char)str1[i] - (unsigned char)str2[i];
        }
    }

    return 0;
}