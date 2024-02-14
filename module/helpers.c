/* SPDX-License-Identifier: GPL-2.0 */
#include <assert.h>
#include <errno.h>
#include <getopt.h>
#include <locale.h>
#include <poll.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#include <sys/resource.h>

#include <arpa/inet.h>
#include <net/if.h>
#include <netinet/tcp.h>
#include "xdp-runtime.h"

#include <net/if_arp.h>


typedef __u16 __bitwise __le16;
typedef __u16 __bitwise __be16;
typedef __u32 __bitwise __le32;
typedef __u32 __bitwise __be32;
typedef __u64 __bitwise __le64;
typedef __u64 __bitwise __be64;

typedef __u16 __bitwise __sum16;
typedef __u32 __bitwise __wsum;


#define MAX_BPF_STACK 512
struct bpf_scratchpad
{
	union
	{
		__be32 diff[MAX_BPF_STACK / sizeof(__be32)];
		__u8 buff[MAX_BPF_STACK];
	};
};

static inline unsigned short from32to16(unsigned int x)
{
	/* add up 16-bit and 16-bit for 16+c bit */
	x = (x & 0xffff) + (x >> 16);
	/* add up carry.. */
	x = (x & 0xffff) + (x >> 16);
	return x;
}

static unsigned int do_csum(const unsigned char *buff, int len)
{
	int odd;
	unsigned int result = 0;

	if (len <= 0)
		goto out;
	odd = 1 & (unsigned long)buff;
	if (odd)
	{
		// #ifdef __LITTLE_ENDIAN
		result += (*buff << 8);
		// #else
		// 		result = *buff;
		// #endif
		len--;
		buff++;
	}
	if (len >= 2)
	{
		if (2 & (unsigned long)buff)
		{
			result += *(unsigned short *)buff;
			len -= 2;
			buff += 2;
		}
		if (len >= 4)
		{
			const unsigned char *end = buff + ((unsigned)len & ~3);
			unsigned int carry = 0;
			do
			{
				unsigned int w = *(unsigned int *)buff;
				buff += 4;
				result += carry;
				result += w;
				carry = (w > result);
			} while (buff < end);
			result += carry;
			result = (result & 0xffff) + (result >> 16);
		}
		if (len & 2)
		{
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

static __wsum csum_partial(const void *buff, int len, __wsum wsum)
{
	unsigned int sum = (unsigned int)wsum;
	unsigned int result = do_csum((const unsigned char *)buff, len);

	/* add in old sum, and carry.. */
	result += sum;
	if (sum > result)
		result += 1;
	return (__wsum)result;
}

uint64_t bpftime_csum_diff(uint64_t r1, uint64_t from_size, uint64_t r3, uint64_t to_size, uint64_t seed)
{
	struct bpf_scratchpad sp_data;
	struct bpf_scratchpad *sp = &sp_data;
	uint64_t diff_size = from_size + to_size;
	__be32 *from = (__be32 *)(long)r1;
	__be32 *to = (__be32 *)(long)r3;
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
