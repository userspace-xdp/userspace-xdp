/*
 * Soft:        This is a tiny BPF library implementing XDP program loading.
 *              It has been designed to be stand-alone with limited system
 *              dependencies.
 *
 * Author:      Alexandre Cassen, <acassen@keepalived.org>
 *
 *              This program is distributed in the hope that it will be useful,
 *              but WITHOUT ANY WARRANTY; without even the implied warranty of
 *              MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *              See the GNU General Public License for more details.
 *
 *              This program is free software; you can redistribute it and/or
 *              modify it under the terms of the GNU General Public License
 *              as published by the Free Software Foundation; either version
 *              2 of the License, or (at your option) any later version.
 *
 * Copyright (C) 2019 Alexandre Cassen, <acassen@keepalived.org>
 */

#ifndef __XDP_FW_H
#define __XDP_FW_H

enum {
	XDPFW_LOAD_BPF = 0,
	XDPFW_UNLOAD_BPF,
	XDPFW_RULE_ADD,
	XDPFW_RULE_DEL,
	XDPFW_RULE_LIST,
	XDPFW_VRID_ADD,
	XDPFW_VRID_DEL,
	XDPFW_VRID_LIST,
};

#define XDPFW_MAP_CNT 2
static struct {
	char *path;
	bool loaded;
} xdpfw_exported_maps[XDPFW_MAP_CNT] = {
	{ "/sys/fs/bpf/xdpfw_l3_filter"		, false},
	{ "/sys/fs/bpf/xdpfw_vrrp_vrid_filter"	, false}
};

struct flow_key {
	union {
		__u32 addr;
		__u32 addr6[4];
	};
	__u32	proto;
} __attribute__ ((__aligned__(8)));

struct vrrp_filter {
	__u32	action;
	__u64	drop_packets;
	__u64	total_packets;
	__u64	drop_bytes;
	__u64	total_bytes;
} __attribute__ ((__aligned__(8)));

#endif
