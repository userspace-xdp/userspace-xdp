#define EINVAL 22 /* Invalid argument */
#define NULL ((void *)0)
typedef unsigned short uint16_t;
typedef unsigned long long uint64_t;

// From https://github.com/microsoft/ebpf-for-windows
uint64_t inline bpftime_csum_diff(const void *from, int from_size,
				  const void *to, int to_size, int seed)
{
	int csum_diff = -EINVAL;

	if ((from_size % 4 != 0) || (to_size % 4 != 0)) {
		// size of buffers should be a multiple of 4.
		goto Exit;
	}

	csum_diff = seed;
	if (to != NULL) {
		for (int i = 0; i < to_size / 2; i++) {
			csum_diff += (uint16_t)(*((uint16_t *)to + i));
		}
	}
	if (from != NULL) {
		for (int i = 0; i < from_size / 2; i++) {
			csum_diff += (uint16_t)(~*((uint16_t *)from + i));
		}
	}

	// Adding 16-bit unsigned integers or their one's complement will
	// produce a positive 32-bit integer, unless the length of the buffers
	// is so long, that the signed 32 bit output overflows and produces a
	// negative result.
	if (csum_diff < 0) {
		csum_diff = -EINVAL;
	}
Exit:
	return csum_diff;
}

uint64_t _bpf_helper_ext_0028(uint64_t from, uint64_t from_size, uint64_t to,
			      uint64_t to_size, uint64_t seed)
{
	return bpftime_csum_diff((const void *)from, (int)from_size,
				 (const void *)to, (int)to_size, (int)seed);
}
