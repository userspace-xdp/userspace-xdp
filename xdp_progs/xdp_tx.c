#include <stdlib.h>
#include <stdio.h>
#include <linux/if_link.h>

#include <bpf/bpf.h>
#include <bpf/libbpf.h>

#include <csignal>
#include <arpa/inet.h>
#include <net/if.h>
#include <unistd.h>

// vip's definition for lookup
struct vip_definition {
	union {
		__be32 vip;
		__be32 vipv6[4];
	};
	__u16 port;
	__u8 proto;
};

struct flow_key {
  union {
    __be32 src;
    __be32 srcv6[4];
  };
  union {
    __be32 dst;
    __be32 dstv6[4];
  };
  union {
    __u32 ports;
    __u16 port16[2];
  };
  __u8 proto;
};

// where to send client's packet from LRU_MAP
struct real_pos_lru {
  __u32 pos;
  __u64 atime;
};

// result of vip's lookup
struct vip_meta {
	__u32 flags;
	__u32 vip_num;
};

struct ctl_value {
	union {
		__u64 value;
		__u32 ifindex;
		__u8 mac[6];
	};
};

// for LRU's map in map we will support up to this number of cpus
#ifndef MAX_SUPPORTED_CPUS
#define MAX_SUPPORTED_CPUS 128
#endif

// $ sudo bpftool map
// 517: lru_hash  name katran_lru  flags 0x0
//         key 40B  value 16B  max_entries 8000000  memlock 966220096B
//         pids katran_server_g(261219)
// 518: array  name ctl_array  flags 0x0
//         key 4B  value 8B  max_entries 16  memlock 448B
//         btf_id 770
//         pids katran_server_g(261219)
// 519: hash  name vip_map  flags 0x0
//         key 20B  value 8B  max_entries 512  memlock 55744B
//         btf_id 770
//         pids katran_server_g(261219)
// 520: lru_hash  name fallback_cache  flags 0x0
//         key 40B  value 16B  max_entries 1000  memlock 122752B
//         btf_id 770
//         pids katran_server_g(261219)
// 521: array_of_maps  name lru_mapping  flags 0x0
//         key 4B  value 4B  max_entries 128  memlock 1344B
//         pids katran_server_g(261219)
// $ sudo bpftool map dump id 521
// key: 00 00 00 00  inner_map_id: 517
// Found 1 element

static int libbpf_print_fn(enum libbpf_print_level level, const char *format,
			   va_list args)
{
	return vfprintf(stderr, format, args);
}

int main(int argc, char **argv)
{
	if (argc < 3) {
		printf("ERROR - Usage is: ./loader"
		       " <BPF_FILE> <INTERFACE> [btf_file]\n"
		       "\n");
		return 1;
	}
	libbpf_set_print(libbpf_print_fn);
	LIBBPF_OPTS(bpf_object_open_opts, opts, );
	if (argc == 4)
		opts.btf_custom_path = argv[3];
	// Open and load the BPF program
	bpf_object *obj = bpf_object__open_file(argv[1], &opts);
	struct bpf_map *vip_map = NULL;
	struct bpf_map *ctl_array = NULL;
	struct bpf_map *lru_mapping = NULL;
	if (bpf_object__load(obj)) {
		printf("Failed to load program\n");
		return 1;
	}

	bpf_program *prog = bpf_object__find_program_by_name(obj, "xdp_pass");
	if (!prog) {
		// for katran
		prog = bpf_object__find_program_by_name(obj,
							"balancer_ingress");
		if (!prog) {
			printf("Failed to find program\n");
			return 1;
		}
	}
	// update map for katran
	vip_map = bpf_object__find_map_by_name(obj, "vip_map");
	if (vip_map) {
		printf("Found vip map\n");
		struct vip_definition key = { .vip = 218212544,
					      .port = 11798,
					      .proto = 6 };
		struct vip_meta value = {};
		int res = bpf_map__update_elem(vip_map, &key, sizeof(key),
					       &value, sizeof(value), 0);
		if (res) {
			printf("Failed to update vip map\n");
			return 1;
		}
	} else {
		printf("Failed to find vip map, skip\n");
	}
	ctl_array = bpf_object__find_map_by_name(obj, "ctl_array");
	if (ctl_array) {
		printf("Found ctl array\n");
		__u32 key = 0;
		// These magic number are dumped from bpftool
		struct ctl_value value = { .mac = { 184, 63, 210, 42, 229,
						    17 } };
		int res = bpf_map__update_elem(ctl_array, &key, sizeof(key),
					       &value, sizeof(value), 0);
		if (res) {
			printf("Failed to update ctl array\n");
			return 1;
		}
	} else {
		printf("Failed to find ctl array, skip\n");
	}
	lru_mapping = bpf_object__find_map_by_name(obj, "lru_mapping");
	if (lru_mapping) {
		printf("Found lru mapping\n");
		// the same entry as default
		// should be id actually, but works for syscall server
		int cache_size = 2000;
		int value = bpf_map_create(BPF_MAP_TYPE_LRU_HASH, "katran_lru",
					    sizeof(struct flow_key),
					    sizeof(struct real_pos_lru),
					    cache_size, 0);
		printf("cache size %d\n", cache_size);
		if (value < 0) {
			printf("Failed to get katran lru FD\n");
			return 1;
		}
		printf("lru map fd %d\n", value);
		// struct flow_key lru_key = {};
		// struct real_pos_lru lru_value = {};
		// bpf_map_update_elem(value, &lru_key, &lru_value, 0);
		for (__u32 i = 0; i < MAX_SUPPORTED_CPUS; i++) {
			// These magic number are dumped from bpftool
			int res = bpf_map__update_elem(lru_mapping, &i,
						       sizeof(i), &value,
						       sizeof(value), 0);
			if (res) {
				printf("Failed to update lru mapping\n");
				return 1;
			}
		}
	} else {
		printf("Failed to find lru mapping, skip\n");
	}

	bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);
	int prog_fd = bpf_program__fd(prog);
	if (prog_fd < 0) {
		printf("Failed to get prog FD\n");
		return 1;
	}
	const char *progName = bpf_program__name(prog);
	printf("load prog %s", progName);

	// Attach the XDP program to the interface
	int ifindex = if_nametoindex(argv[2]);
	if (!ifindex) {
		printf("failed to if_nametoindex\n");
		return 1;
	}
	int xdp_flags = XDP_FLAGS_UPDATE_IF_NOEXIST;
	if (getenv("SKBMODE")) {
		printf("skb mode\n");
		xdp_flags |= XDP_FLAGS_SKB_MODE;
	} else if (getenv("DRVMODE")) {
		printf("DRV mode\n");
		xdp_flags |= XDP_FLAGS_DRV_MODE;
	} else if (getenv("HWMODE")) {
		printf("HWMODE mode\n");
		xdp_flags |= XDP_FLAGS_HW_MODE;
	} else {
		printf("XDP native mode\n");
	}

	int err = bpf_xdp_attach(ifindex, prog_fd, xdp_flags, nullptr);
	if (err) {
		printf("attach maybe error\n");
	}
	while (1) {
		sleep(1);
	}
	return 0;
}
