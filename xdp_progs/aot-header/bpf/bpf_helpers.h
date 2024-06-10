/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */
#ifndef __BPF_HELPERS__
#define __BPF_HELPERS__

/*
 * Note that bpf programs need to include either
 * vmlinux.h (auto-generated from BTF) or linux/types.h
 * in advance since bpf_helper_defs.h uses such types
 * as __u64.
 */
#include "bpf_main.h"
#include "aot_map_ids.h"

#define __uint(name, val) int (*name)[val]
#define __type(name, val) typeof(val) *name
#define __array(name, val) typeof(val) *name[]

/*
 * Helper macro to place programs, maps, license in
 * different sections in elf_bpf file. Section names
 * are interpreted by libbpf depending on the context (BPF programs, BPF maps,
 * extern variables, etc).
 * To allow use of SEC() with externs (e.g., for extern .maps declarations),
 * make sure __attribute__((unused)) doesn't trigger compilation warning.
 */
#if __GNUC__ && !__clang__

/*
 * Pragma macros are broken on GCC
 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=55578
 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90400
 */
#define SEC(name) __attribute__((section(name), used))

#else

#define SEC(name) 		    

#endif

/* Avoid 'linux/stddef.h' definition of '__always_inline'. */
#undef __always_inline
#define __always_inline inline __attribute__((always_inline))

#ifndef __noinline
#define __noinline __attribute__((noinline))
#endif
#ifndef __weak
#define __weak __attribute__((weak))
#endif

/* helper macro to print out debug messages */
#define bpf_printk(fmt, ...)                                   \
  ({                                                           \
    char ____fmt[] = fmt;                                      \
    bpf_trace_printk(____fmt, sizeof(____fmt), ##__VA_ARGS__); \
  })

int _bpf_helper_ext_0005();
#define bpf_ktime_get_ns _bpf_helper_ext_0005
int _bpf_helper_ext_0006();
#define bpf_trace_printk _bpf_helper_ext_0006
int _bpf_helper_ext_0008();
#define bpf_get_smp_processor_id _bpf_helper_ext_0008
int _bpf_helper_ext_0028();
#define bpf_csum_diff _bpf_helper_ext_0028
int _bpf_helper_ext_0044();
#define bpf_xdp_adjust_head _bpf_helper_ext_0044
int _bpf_helper_ext_0065();
#define bpf_xdp_adjust_tail _bpf_helper_ext_0065
int _bpf_helper_ext_0182();
#define bpf_strncmp _bpf_helper_ext_0182
int _bpf_helper_ext_0189();
#define bpf_xdp_load_bytes _bpf_helper_ext_0189
int _bpf_helper_ext_0190();
#define bpf_xdp_store_bytes _bpf_helper_ext_0190

#ifndef NULL
#define NULL ((void *)0)
#endif

#endif
