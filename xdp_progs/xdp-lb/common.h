#pragma once

#define ETH_ALEN        6

struct __attribute__((packed)) eth_addr {
	unsigned char addr[ETH_ALEN];
};

struct ip_mac_pair {
	struct eth_addr mac;
	__u32 ip;
};
