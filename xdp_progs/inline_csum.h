#ifndef INLINE_CSUM_H
#define INLINE_CSUM_H


static inline unsigned short from32to16(unsigned int x)
{
	/* add up 16-bit and 16-bit for 16+c bit */
	x = (x & 0xffff) + (x >> 16);
	/* add up carry.. */
	x = (x & 0xffff) + (x >> 16);
	return x;
}

#define USING_OLD_CSUM

#ifdef USING_OLD_CSUM
static inline unsigned int do_csum(const unsigned char *buff, int len)
{
	int odd;
	unsigned int result = 0;

	if (len <= 0)
		goto out;
	odd = 1 & (unsigned long)buff;
	if (odd) {
		// #ifdef __LITTLE_ENDIAN
		result += (*buff << 8);
		// #else
		// 		result = *buff;
		// #endif
		len--;
		buff++;
	}
	if (len >= 2) {
		if (2 & (unsigned long)buff) {
			result += *(unsigned short *)buff;
			len -= 2;
			buff += 2;
		}
		if (len >= 4) {
			const unsigned char *end = buff + ((unsigned)len & ~3);
			unsigned int carry = 0;
			do {
				unsigned int w = *(unsigned int *)buff;
				buff += 4;
				result += carry;
				result += w;
				carry = (w > result);
			} while (buff < end);
			result += carry;
			result = (result & 0xffff) + (result >> 16);
		}
		if (len & 2) {
			result += *(unsigned short *)buff;
			buff += 2;
		}
	}
	if (len & 1)
		// #ifdef __LITTLE_ENDIAN
		result += *buff;
	// #else
	// 		result += (*buff << 8);
	// #endif
	result = from32to16(result);
	if (odd)
		result = ((result >> 8) & 0xff) | ((result & 0xff) << 8);
out:
	return result;
}

static inline __wsum csum_partial(const void *buff, int len, __wsum wsum)
{
	unsigned int sum = (unsigned int)wsum;
	unsigned int result = do_csum((const unsigned char *)buff, len);

	/* add in old sum, and carry.. */
	result += sum;
	if (sum > result)
		result += 1;
	return (__wsum)result;
}

#else
/**
 * ror64 - rotate a 64-bit value right
 * @word: value to rotate
 * @shift: bits to roll
 */
static inline __u64 ror64(__u64 word, unsigned int shift)
{
	return (word >> (shift & 63)) | (word << ((-shift) & 63));
}

static inline __wsum csum_finalize_sum(uint64_t temp64)
{
	return (__wsum)((temp64 + ror64(temp64, 32)) >> 32);
}

static inline unsigned long update_csum_40b(unsigned long sum, const unsigned long m[5])
{
	asm("addq %1,%0\n\t"
	     "adcq %2,%0\n\t"
	     "adcq %3,%0\n\t"
	     "adcq %4,%0\n\t"
	     "adcq %5,%0\n\t"
	     "adcq $0,%0"
		:"+r" (sum)
		:"m" (m[0]), "m" (m[1]), "m" (m[2]),
		 "m" (m[3]), "m" (m[4]));
	return sum;
}

/*
 * Load an unaligned word from kernel space.
 *
 * In the (very unlikely) case of the word being a page-crosser
 * and the next page not being mapped, take the exception and
 * return zeroes in the non-existing part.
 */
static inline unsigned long load_unaligned_zeropad(const void *addr)
{
	return *(const unsigned long *)addr;
}

/*
 * Do a checksum on an arbitrary memory area.
 * Returns a 32bit checksum.
 *
 * This isn't as time critical as it used to be because many NICs
 * do hardware checksumming these days.
 *
 * Still, with CHECKSUM_COMPLETE this is called to compute
 * checksums on IPv6 headers (40 bytes) and other small parts.
 * it's best to have buff aligned on a 64-bit boundary
 */
__wsum csum_partial(const void *buff, int len, __wsum sum)
{
	uint64_t temp64 = (uint64_t)sum;

	/* Do two 40-byte chunks in parallel to get better ILP */
	if (likely(len >= 80)) {
		uint64_t temp64_2 = 0;
		do {
			temp64 = update_csum_40b(temp64, buff);
			temp64_2 = update_csum_40b(temp64_2, buff + 40);
			buff += 80;
			len -= 80;
		} while (len >= 80);

		asm("addq %1,%0\n\t"
		    "adcq $0,%0"
		    :"+r" (temp64): "r" (temp64_2));
	}

	/*
	 * len == 40 is the hot case due to IPv6 headers, so return
	 * early for that exact case without checking the tail bytes.
	 */
	if (len >= 40) {
		temp64 = update_csum_40b(temp64, buff);
		len -= 40;
		if (!len)
			return csum_finalize_sum(temp64);
		buff += 40;
	}

	if (len & 32) {
		asm("addq 0*8(%[src]),%[res]\n\t"
		    "adcq 1*8(%[src]),%[res]\n\t"
		    "adcq 2*8(%[src]),%[res]\n\t"
		    "adcq 3*8(%[src]),%[res]\n\t"
		    "adcq $0,%[res]"
		    : [res] "+r"(temp64)
		    : [src] "r"(buff), "m"(*(const char(*)[32])buff));
		buff += 32;
	}
	if (len & 16) {
		asm("addq 0*8(%[src]),%[res]\n\t"
		    "adcq 1*8(%[src]),%[res]\n\t"
		    "adcq $0,%[res]"
		    : [res] "+r"(temp64)
		    : [src] "r"(buff), "m"(*(const char(*)[16])buff));
		buff += 16;
	}
	if (len & 8) {
		asm("addq 0*8(%[src]),%[res]\n\t"
		    "adcq $0,%[res]"
		    : [res] "+r"(temp64)
		    : [src] "r"(buff), "m"(*(const char(*)[8])buff));
		buff += 8;
	}
	if (len & 7) {
		unsigned int shift = (-len << 3) & 63;
		unsigned long trail;

		trail = (load_unaligned_zeropad(buff) << shift) >> shift;

		asm("addq %[trail],%[res]\n\t"
		    "adcq $0,%[res]"
		    : [res] "+r"(temp64)
		    : [trail] "r"(trail));
	}
	return csum_finalize_sum(temp64);
}
#endif

static inline __s64 _bpf_helper_ext_0028(__be32 *from, __u32 from_size, __be32 *to, __u32 to_size, __wsum seed)
{
	struct bpf_scratchpad sp_data;
	struct bpf_scratchpad *sp = &sp_data;
	uint64_t diff_size = from_size + to_size;
	int i, j = 0;

	/* This is quite flexible, some examples:
	 *
	 * from_size == 0, to_size > 0,  seed := csum --> pushing data
	 * from_size > 0,  to_size == 0, seed := csum --> pulling data
	 * from_size > 0,  to_size > 0,  seed := 0    --> diffing data
	 *
	 * Even for diffing, from_size and to_size don't need to be equal.
	 */
	if ((((from_size | to_size) & (sizeof(__be32) - 1)) ||
	     diff_size > sizeof(sp->diff)))
		return -EINVAL;

	for (i = 0; i < from_size / sizeof(__be32); i++, j++)
		sp->diff[j] = ~from[i];
	for (i = 0; i < to_size / sizeof(__be32); i++, j++)
		sp->diff[j] = to[i];

	return csum_partial(sp->diff, diff_size, seed);
}

#endif // INLINE_CSUM_H
