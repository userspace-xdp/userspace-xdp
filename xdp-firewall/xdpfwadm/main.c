/*
 * Soft:        xdp_fw stand for XDP Firewall. It offers a simple layer3
 *              packet filtering. Operation are really fast since it
 *              doesnt travel/traverse kernel to apply kernel rules unlike
 *              netfilter. Initial goal for this module is to provide a packet
 *              isolation/filtering for Keepalived VRRP framework.
 *
 * Part:        Userspace xdp_fw utility.
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
 * Copyright (C) 2019 Alexandre Cassen, <acassen@gmail.com>
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <string.h>
#include <getopt.h>
#include <errno.h>
#include <net/if.h>
#include <sys/stat.h>
#include <sys/statfs.h>
#include <libgen.h>
#include <sys/resource.h>
#include <arpa/inet.h>
#include <linux/if_ether.h>
#include "bpf_standalone.h"
#include "xdp_fw.h"

/* Local stuff */
static char *bpf_file = NULL;
static char *ip_str = NULL;
static int ifindex = 0;
static int vrrp_vrid = 0;
static int action = 0;

/*
 *	BPF related
 */
static void
xdpfw_unload(int ifindex)
{
	int i;

	fprintf(stderr, "Removing XDP program on ifindex:%d\n", ifindex);
	bpf_set_link_xdp_fd(ifindex, -1, 0);

	/* Remove all exported map file */
	for (i = 0; i < XDPFW_MAP_CNT; i++) {
		if (unlink(xdpfw_exported_maps[i].path) < 0) {
			fprintf(stderr, "WARN: cannot unlink map(%s) file:%s errno:%d (%m)\n"
				      , map_data[0].name
				      , xdpfw_exported_maps[i].path
				      , errno);
		}
	}
}

/* Verify BPF-filesystem is mounted on given file path */
static int
bpf_fs_check_path(const char *path)
{
	struct statfs st_fs;
	char *dname, *dir;
	int err = 0;

	if (path == NULL)
		return -EINVAL;

	dname = strdup(path);
	if (dname == NULL)
		return -ENOMEM;

	dir = dirname(dname);
	if (statfs(dir, &st_fs)) {
		fprintf(stderr, "ERR: failed to statfs %s: errno:%d (%m)\n",
			dir, errno);
		err = -errno;
	}
	free(dname);

	if (!err && st_fs.f_type != BPF_FS_MAGIC) {
		fprintf(stderr, "ERR: specified path %s is not on BPF FS\n\n"
			        " You need to mount the BPF filesystem type like:\n"
			        "  mount -t bpf bpf /sys/fs/bpf/\n\n"
			      , path);
		err = -EINVAL;
	}

	return err;
}

/* Load existing map via filesystem, if possible */
int
load_map_file(const char *file, struct bpf_map_data *map_data)
{
	int fd;

	if (bpf_fs_check_path(file) < 0) {
		exit(-1);
	}

	fd = bpf_obj_get(file);
	if (fd > 0) {		/* Great: map file already existed use it */
		// FIXME: Verify map size etc is the same before returning it!
		// data available via map->def.XXX and fdinfo
		printf(" - Loaded bpf-map:%-30s from file:%s\n", map_data->name,
		       file);
		return fd;
	}

	return -1;
}

/* This callback gets invoked for every map in ELF file */
int
pre_load_maps_via_sysfs(struct bpf_map_data *map_data, int idx)
{
	char *path = xdpfw_exported_maps[idx].path;
	int fd;

	fd = load_map_file(path, map_data);
	if (fd > 0) {
		/* Makes bpf_load.c skip creating map */
		map_data->fd = fd;
		xdpfw_exported_maps[idx].loaded = true;
		return 0;
	}

	return -1;
}

static int
xdpfw_map_export(int idx)
{
	char *path = xdpfw_exported_maps[idx].path;

	/* Export map as a file */
	if (bpf_obj_pin(map_fd[idx], path) != 0) {
		fprintf(stderr, "ERR: Cannot pin map(%s) file:%s errno:%d (%m)\n"
			      , map_data[idx].name, path, errno);
		return -1;
	}

	printf(". Exporting bpf-map:%-30s to file:%s\n", map_data[idx].name,
	       path);
	return 0;
}

void
xdpfw_map_load(void)
{
	int i;

	for (i = 0; i < XDPFW_MAP_CNT; i++) {
		if (xdpfw_exported_maps[i].loaded)
			continue;
		xdpfw_map_export(i);
	}
}

/*
 *	Action
 */
static int
xdpfw_load(void)
{
	struct rlimit r = { RLIM_INFINITY, RLIM_INFINITY };
	int ret;

	/* Setting rlimit */
	if (setrlimit(RLIMIT_MEMLOCK, &r)) {
		fprintf(stderr, "Cant setrlimit !!!\n");
	}

	ret = bpf_load_from_file(bpf_file, pre_load_maps_via_sysfs);
	if (ret < 0) {
		fprintf(stderr, "Cant load eBPF file\n");
		exit(-1);
	}

	xdpfw_map_load();

	ret = bpf_set_link_xdp_fd(ifindex, prog_fd[0], 0);
	if (ret < 0) {
		fprintf(stderr, "Cant set link with XDP program!\n");
	}

	return 0;
}

static int
xdpfw_rule(int action)
{
	unsigned char buf[sizeof (struct in6_addr)];
	unsigned int nr_cpus = bpf_num_possible_cpus();
	__u64 values[nr_cpus];
	struct flow_key key;
	int family, ret, fd;

	family = (strchr(ip_str, ':')) ? AF_INET6 : AF_INET;
	ret = inet_pton(family, ip_str, buf);
	if (!ret) {
		fprintf(stderr, "IP address [%s] is not valid !\n", ip_str);
		return -1;
	}

	/* Create key */
	memset(&key, 0, sizeof (struct flow_key));
	if (family == AF_INET) {
		key.proto = ETH_P_IP;
		key.addr = ((struct in_addr *) buf)->s_addr;
	} else if (family == AF_INET6) {
		key.proto = ETH_P_IPV6;
		key.addr6[0] = ((struct in6_addr *) buf)->s6_addr32[0];
		key.addr6[1] = ((struct in6_addr *) buf)->s6_addr32[1];
		key.addr6[2] = ((struct in6_addr *) buf)->s6_addr32[2];
		key.addr6[3] = ((struct in6_addr *) buf)->s6_addr32[3];
	}

	/* Open sysfs bpf map */
	fd = bpf_obj_get(xdpfw_exported_maps[0].path);
	if (fd < 0) {
		fprintf(stderr, "Cant open bpf_map[%s] errno:%d (%m)\n"
			      , xdpfw_exported_maps[0].path, errno);
		return -1;
	}

	if (action == XDPFW_RULE_ADD)
		ret = bpf_map_update_elem(fd, &key, values, BPF_NOEXIST);
	else if (action == XDPFW_RULE_DEL)
		ret = bpf_map_delete_elem(fd, &key);
	if (ret != 0) {
		fprintf(stderr, "Cant Add filtering rule for IP address [%s] (%m)!\n"
			      , ip_str);
		close(fd);
		return -1;
	}

	close(fd);
	return 0;
}

static int
xdpfw_rule_list(void)
{
	struct flow_key key, next_key;
	char addr_str[INET6_ADDRSTRLEN];
	void *addr_ip;
	int family, fd;

	/* Open sysfs bpf map */
	fd = bpf_obj_get(xdpfw_exported_maps[0].path);
	if (fd < 0) {
		fprintf(stderr, "Cant open bpf_map[%s] errno:%d (%m)\n"
			      , xdpfw_exported_maps[0].path, errno);
		return -1;
	}

	printf("IPFW rulset :\n");
	while (bpf_map_get_next_key(fd, &key, &next_key) == 0) {
		key = next_key;
		family = (key.proto == ETH_P_IP) ? AF_INET : AF_INET6;
		addr_ip = &key.addr;
		if (!inet_ntop(family, addr_ip, addr_str, INET6_ADDRSTRLEN)) {
			fprintf(stderr, "Error parsing Key IP address...\n");
			close(fd);
			return -1;
		}

		printf(". [IPv%d] %s\n", (family == AF_INET) ? 4 : 6, addr_str);
	}

	close(fd);
	return 0;
}

static int
xdpfw_vrid(int action)
{
	unsigned int nr_cpus = bpf_num_possible_cpus();
	struct vrrp_filter vrrp_rule[nr_cpus];
	__u32 vrid = vrrp_vrid;
	int ret, fd, i;

	/* Open sysfs bpf map */
	fd = bpf_obj_get(xdpfw_exported_maps[1].path);
	if (fd < 0) {
		fprintf(stderr, "Cant open bpf_map[%s] errno:%d (%m)\n"
			      , xdpfw_exported_maps[1].path, errno);
		return -1;
	}

	/* PERCPU rule update */
	for (i = 0; i < nr_cpus; i++) {
		memset(&vrrp_rule[i], 0, sizeof(struct vrrp_filter));
		vrrp_rule[i].action = (action == XDPFW_VRID_ADD) ? 1 : 0;
	}

	ret = bpf_map_update_elem(fd, &vrid, vrrp_rule, 0);
	if (ret != 0) {
		fprintf(stderr, "Cant Update VRRP VRID filtering rule for VRID(%d) (%m)!\n"
			      , vrrp_vrid);
		close(fd);
		return -1;
	}

	close(fd);
	return 0;
}

static int
xdpfw_vrid_get_stats_percpu(int fd, __u32 key, __u32 *action, __u64 *drop_packets,
			    __u64 *total_packets, __u64 *drop_bytes,
			    __u64 *total_bytes)
{
	unsigned int nr_cpus = bpf_num_possible_cpus();
	struct vrrp_filter vrrp_rule[nr_cpus];
	int i, ret;

	ret = bpf_map_lookup_elem(fd, &key, vrrp_rule);
	if (ret != 0)
		return -1;

	for (i = 0; i < nr_cpus; i++) {
		*action = vrrp_rule[i].action;
		*drop_packets += vrrp_rule[i].drop_packets;
		*total_packets += vrrp_rule[i].total_packets;
		*drop_bytes += vrrp_rule[i].drop_bytes;
		*total_bytes += vrrp_rule[i].total_bytes;
	}

	return 0;
}

static int
xdpfw_vrid_list(void)
{
	__u64 drop_packets, total_packets, drop_bytes, total_bytes;
	__u32 action;
	int fd, i;

	/* Open sysfs bpf map */
	fd = bpf_obj_get(xdpfw_exported_maps[1].path);
	if (fd < 0) {
		fprintf(stderr, "Cant open bpf_map[%s] errno:%d (%m)\n"
			      , xdpfw_exported_maps[1].path, errno);
		return -1;
	}

	printf("VRRP VRID rulset :\n");
	for (i = 0; i < 256; i++) {
		action = drop_packets = total_packets = drop_bytes = total_bytes = 0;
		xdpfw_vrid_get_stats_percpu(fd, i, &action, &drop_packets, &total_packets,
					    &drop_bytes, &total_bytes);
		if (drop_packets != 0 || total_packets != 0 || drop_bytes != 0 ||
		    total_bytes != 0) {
			printf(". VRID(%d): action:%s dp:%lld tp:%lld db:%lld tb:%lld\n"
			       , i, action ? "ACCEPT" : "DENY"
			       , drop_packets, total_packets, drop_bytes, total_bytes);
		}
	}

	close(fd);
	return 0;
}

static int
xdpfw_action(void)
{
	switch (action) {
	case XDPFW_LOAD_BPF:
		xdpfw_load();
		break;
	case XDPFW_UNLOAD_BPF:
		xdpfw_unload(ifindex);
		break;
	case XDPFW_RULE_ADD:
	case XDPFW_RULE_DEL:
		xdpfw_rule(action);
		break;
	case XDPFW_RULE_LIST:
		xdpfw_rule_list();
		break;
	case XDPFW_VRID_ADD:
	case XDPFW_VRID_DEL:
		xdpfw_vrid(action);
		break;
	case XDPFW_VRID_LIST:
		xdpfw_vrid_list();
		break;
	default:
		exit(0);
	}

	return 0;
}

/*
 *	Usage function
 */
static void
usage(const char *prog)
{
	fprintf(stderr, "Usage: %s [OPTION...]\n", prog);
	fprintf(stderr, "  -l, --load-bpf		Load a BPF prog\n");
	fprintf(stderr, "  -u, --unload-bpf		Unload a BPF prog\n");
	fprintf(stderr, "  -i, --ifindex		Net device ifindex to bind BPF prog to\n");
	fprintf(stderr, "  -a, --rule-add		Add a filtering rule\n");
	fprintf(stderr, "  -d, --rule-del		Delete a filtering rule\n");
	fprintf(stderr, "  -L, --rule-list		Display Rules list\n");
	fprintf(stderr, "  -A, --vrid-add		Add a VRRP VRID\n");
	fprintf(stderr, "  -D, --vrid-del		Delete a VRRP VRID\n");
	fprintf(stderr, "  -V, --vrid-list		Display VRRP VRID bitmaps\n");
	fprintf(stderr, "  -h, --help			Display this help message\n");
}

/*
 *	Command line parser
 */
static int
parse_cmdline(int argc, char **argv)
{
	int c, longindex, curind;
	int bad_option = 0;

	struct option long_options[] = {
		{"load-bpf", required_argument, NULL, 'l'},
		{"unload-bpf", required_argument, NULL, 'u'},
		{"ifindex", required_argument, NULL, 'i'},
		{"rule-add", required_argument, NULL, 'a'},
		{"rule-del", required_argument, NULL, 'd'},
		{"rule-list", no_argument, NULL, 'L'},
		{"vrid-add", required_argument, NULL, 'A'},
		{"vrid-del", required_argument, NULL, 'D'},
		{"vrid-list", no_argument, NULL, 'V'},
		{"help", no_argument, NULL, 'h'},
		{NULL, 0, NULL, 0}
	};

	curind = optind;
	while (longindex = -1, (c = getopt_long(argc, argv, "hLVl:u:i:a:d:A:D:",
					        long_options, &longindex)) != -1) {
		if (longindex >= 0 && long_options[longindex].has_arg == required_argument &&
		    optarg && !optarg[0]) {
			c = ':';
			optarg = NULL;
		}

		switch (c) {
		case 'h':
			usage(argv[0]);
			exit(0);
			break;
		case 'l':
			action = XDPFW_LOAD_BPF;
			bpf_file = optarg;
			break;
		case 'u':
			action = XDPFW_UNLOAD_BPF;
			bpf_file = optarg;
			break;
		case 'i':
			ifindex = atoi(optarg);
			break;
		case 'a':
			action = XDPFW_RULE_ADD;
			ip_str = optarg;
			break;
		case 'd':
			action = XDPFW_RULE_DEL;
			ip_str = optarg;
			break;
		case 'L':
			action = XDPFW_RULE_LIST;
			break;
		case 'A':
			action = XDPFW_VRID_ADD;
			vrrp_vrid = atoi(optarg);
			break;
		case 'D':
			action = XDPFW_VRID_DEL;
			vrrp_vrid = atoi(optarg);
			break;
		case 'V':
			action = XDPFW_VRID_LIST;
			break;
		case '?':
			if (optopt && argv[curind][1] != '-')
				fprintf(stderr, "Unknown option -%c\n", optopt);
			else
				fprintf(stderr, "Unknown option --%s\n",
					argv[curind]);
			bad_option = 1;
			break;
		case ':':
			if (optopt && argv[curind][1] != '-')
				fprintf(stderr,
					"Missing parameter for option -%c\n",
					optopt);
			else
				fprintf(stderr,
					"Missing parameter for option --%s\n",
					long_options[longindex].name);
			bad_option = 1;
			break;
		default:
			exit(1);
			break;
		}
		curind = optind;
	}

	if (optind < argc) {
		printf("Unexpected argument(s): ");
		while (optind < argc)
			printf("%s ", argv[optind++]);
		printf("\n");
	}

	if (bad_option) {
		fprintf(stderr, "Bad options...\n");
		usage(argv[0]);
		exit(1);
	}

	/* So far so good... */
	xdpfw_action();
	return 0;
}

/*
 *	Main point
 */
int
main(int argc, char **argv)
{
	parse_cmdline(argc, argv);
	exit(0);
}
