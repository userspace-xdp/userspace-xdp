#pragma once

#include <linux/if_ether.h>

struct __attribute__((packed)) eth_addr {
	unsigned char addr[ETH_ALEN];
};

struct ip_mac_pair {
	struct eth_addr mac;
	__u32 ip;
};
