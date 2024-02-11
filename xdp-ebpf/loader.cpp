#include <chrono>
#include <iostream>
#include <sstream>
#include <thread>
#include <vector>

#include <linux/if_link.h>

#include <bpf/bpf.h>
#include <bpf/libbpf.h>

#include <csignal>

// to unload  lb ip link set dev veth6 xdpgeneric off

extern "C" {
#include "common.h"
#include <arpa/inet.h>
#include <net/if.h>
#include <unistd.h>
}

static int get_map_fd(bpf_object *obj, const char *name)
{
	auto targets_map = bpf_object__find_map_by_name(obj, name);
	if (!targets_map) {
		std::cerr << "ERROR - Didn't find map"
				  << "\n";
		return -1;
	}
	return bpf_map__fd(targets_map);
}

static int add_to_map(int fd, int key, int suf)
{
	int err;
	ip_mac_pair tp = {0};

	tp.ip = 0xa000000;
	tp.mac = {0xde, 0xad, 0xbe, 0xef, 0x0, 0x0};

	tp.ip += suf;
	tp.mac.addr[5] = suf;

	err = bpf_map_update_elem(fd, &key, &tp, 0);
	if (err) {
		std::cerr << "Error while adding to map\n";
		return 1;
	}

	return 0;
}

int main(int argc, char **argv)
{
	if (argc < 4) {
		std::cerr << "ERROR - Usage is: " << argv[0]
				  << " <BPF_FILE> <PROG_NAME> <INTERFACE>"
				  << "\n";
		return 1;
	}

	// Open and load the BPF program
	auto obj = bpf_object__open(argv[1]);
	if (bpf_object__load(obj)) {
		std::cerr << "Failed to load program\n";
		return 1;
	}

	auto prog = bpf_object__find_program_by_name(obj, argv[2]);
	bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);
	auto progFd = bpf_program__fd(prog);
	auto progName = bpf_program__name(prog);
	std::cout << "Loaded XDP prog with fd " << progFd << " and name "
			  << progName << '\n';

	// Print all the maps in the program
	bpf_map *map;
	bpf_object__for_each_map(map, obj)
	{
		std::cout << "Map: '" << bpf_map__name(map) << "', ";
	}
	std::cout << '\n';

	int targets_map_fd = get_map_fd(obj, "targets_map");
	if (targets_map_fd < 0)
		return 1;

	int config_map_fd = get_map_fd(obj, "config_map");
	if (targets_map_fd < 0)
		return 1;

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

	// Attach the XDP program to the interface
	int ifindex = ::if_nametoindex(argv[3]);
	if (!ifindex) {
		std::cerr << "Cannot resolve ifindex for interface name '" << argv[3]
				  << "'\n";
		return 1;
	}

	int err = bpf_xdp_attach(ifindex, progFd,
							 XDP_FLAGS_UPDATE_IF_NOEXIST | XDP_FLAGS_SKB_MODE,
							 nullptr);
	if (err) {
		std::cerr << "Error while loading bpf program\n";
		return 1;
	}

	return 0;
}
