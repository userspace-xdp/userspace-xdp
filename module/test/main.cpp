#include "lpm_trie.h"
#include <iostream>

int main() {
    trie_t ipv4_trie;

    // Initialize the trie
    trie_init(&ipv4_trie);

    // IP address and CIDR notation
    uint8_t ip[4] = {192, 168, 1, 0};
    uint8_t cidr = 24;
    int as = 123;

    // Insert IP address into the trie
    trie_node_put(&ipv4_trie, ip, cidr, as);

    // Search for an IP address
    uint8_t search_ip[4] = {192, 168, 1, 1};
    int found_as;
    uint8_t found = trie_node_search(&ipv4_trie, search_ip, 32, &found_as);

    if (found) {
        std::cout << "Found AS: " << found_as << std::endl;
    } else {
        std::cout << "IP address not found." << std::endl;
    }

    // Clean up
    trie_destroy(&ipv4_trie);

    return 0;
}
