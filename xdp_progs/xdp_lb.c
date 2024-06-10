

#include <linux/if_link.h>

#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include <xdp_lb.skel.h>
#include <csignal>

// to unload  lb ip link set dev veth6 xdpgeneric off
#include <stdio.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <unistd.h>

#define ETH_ALEN        6

struct __attribute__((packed)) eth_addr {
	unsigned char addr[ETH_ALEN];
};

struct ip_mac_pair {
	struct eth_addr mac;
	__u32 ip;
};

// static int get_map_fd(bpf_object *obj, const char *name)
// {
// 	auto targets_map = bpf_object__find_map_by_name(obj, name);
// 	if (!targets_map) {
// 		std::cerr << "ERROR - Didn't find map"
// 				  << "\n";
// 		return -1;
// 	}
// 	return bpf_map__fd(targets_map);
// }

static int libbpf_print_fn(enum libbpf_print_level level, const char *format,
			   va_list args)
{
	return vfprintf(stderr, format, args);
}

static int add_to_map(int fd, int key, int suf)
{
	int err;
	struct ip_mac_pair tp = { 0 };

	tp.ip = 0xa000000;
	tp.mac = (struct eth_addr){ 0xde, 0xad, 0xbe, 0xef, 0x0, 0x0 };

	tp.ip += suf;
	tp.mac.addr[5] = suf;

	err = bpf_map_update_elem(fd, &key, &tp, 0);
	if (err) {
		printf("Error while adding to map\n");
		return 1;
	}

	return 0;
}

static int add_to_map_test_bench(int fd, int key, int suf)
{
	int err;
	struct ip_mac_pair tp = { 0 };
	// 192.168.1.0
	tp.ip = 0xc0a80100;
	// b8:3f:d2:2a:e5:11
	tp.mac = (struct eth_addr){ 0xb8, 0x3f, 0xd2, 0x2a, 0xe5, 0x11 };

	tp.ip += suf;

	err = bpf_map_update_elem(fd, &key, &tp, 0);
	if (err) {
		printf("Error while adding to map\n");
		return 1;
	}

	return 0;
}

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Usage: %s <ifname> [bpf_file]\n", argv[0]);
		return 1;
	}

	/* Set up libbpf errors and debug info callback */
	libbpf_set_print(libbpf_print_fn);

	// // Open and load the BPF program
	// auto obj = bpf_object__open(argv[1]);
	// // if (bpf_object__load(obj)) {
	// // 	std::cerr << "Failed to load program\n";
	// // 	return 1;
	// // }

	// auto prog = bpf_object__find_program_by_name(obj, argv[2]);
	// // bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);
	// // auto progFd = bpf_program__fd(prog);
	// // auto progName = bpf_program__name(prog);
	// // std::cout << "Loaded XDP prog with fd " << progFd << " and name "
	// // 		  << progName << '\n';

	LIBBPF_OPTS(bpf_object_open_opts, opts, );
	if (argc == 3)
		opts.btf_custom_path = argv[2];

	struct xdp_lb_bpf *skel = xdp_lb_bpf__open_opts(&opts);
	int res = xdp_lb_bpf__load(skel);
	if (res < 0) {
		printf("Error while loading the program\n");
	}
	auto progFd = bpf_program__fd(skel->progs.xdp_pass);
	printf("progFd: %d\n", progFd);

	// Print all the maps in the program
	// bpf_map *map;
	// bpf_object__for_each_map(map, obj)
	// {
	// 	std::cout << "Map: '" << bpf_map__name(map) << "', ";
	// }
	// std::cout << '\n';

	int targets_map_fd = bpf_map__fd(skel->maps.targets_map);
	if (targets_map_fd < 0)
		return 1;

	int config_map_fd = bpf_map__fd(skel->maps.config_map);
	if (targets_map_fd < 0)
		return 1;

	if (getenv("BASIC_TEST_BENCH_CONFIG")) {
		printf("Running basic test bench config\n");
		for (int i = 0; i < 2; i++) {
			if (add_to_map_test_bench(targets_map_fd, i, 2 + i))
				return 1;
		}
		if (add_to_map_test_bench(config_map_fd, 0, 11))
			return 1;

		if (add_to_map_test_bench(config_map_fd, 1, 13))
			return 1;
	} else {
		/*
		 * Manually populate the targets by hardcoding the MAC and IPs
		 */
		for (int i = 0; i < 2; i++) {
			if (add_to_map(targets_map_fd, i, 2 + i))
				return 1;
		}

		/*
		 * Similarly manually hardcode the local and client config
		 */
		if (add_to_map(config_map_fd, 0, 10))
			return 1;

		if (add_to_map(config_map_fd, 1, 1))
			return 1;
	}

	// Attach the XDP program to the interface
	int ifindex = if_nametoindex(argv[1]);
	if (!ifindex) {
		printf("Error while getting ifindex\n");
		return 1;
	}

	int flag = XDP_FLAGS_UPDATE_IF_NOEXIST;
	if (getenv("SKB_MODE")) {
		flag |= XDP_FLAGS_SKB_MODE;
	} else if (getenv ("DRV_MODE")) {
		flag |= XDP_FLAGS_DRV_MODE;
	}

	int err = bpf_xdp_attach(ifindex, progFd, flag, NULL);
	if (err) {
		printf("Error while attaching bpf program\n");
		return 1;
	}

	return 0;
}
