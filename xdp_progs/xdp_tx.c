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

// result of vip's lookup
struct vip_meta {
	__u32 flags;
	__u32 vip_num;
};

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
	struct bpf_map *vip_map = nullptr;
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
		bpf_map__update_elem(vip_map, &key, sizeof(key), &value,
				     sizeof(value), 0);
	} else {
		printf("Failed to find vip map, skip\n");
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
