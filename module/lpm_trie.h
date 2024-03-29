#ifndef LPM_TRIE_H
#define LPM_TRIE_H

#include <stdint.h>
#include <stddef.h>
#include <stdlib.h>
#include <stdio.h>
#include <linux/ipv6.h>
#include <linux/types.h>

typedef __u64 u64;
typedef __u32 u32;
typedef __u16 u16;
typedef __u8 u8;

// lpm trie implementation from https://github.com/dzolo/lpm/tree/master
/*
 * FIT VUT - PDS PROJECT 2012/2013 - LONGEST PREFIX MATCH
 * (c) Ondrej Fibich <xfibic01@stud.fit.vutbr.cz>
 */
/*
 * Tree for storing prefixes and searching for longest match on stored prefixes.
 */

#ifdef __cplusplus
extern "C" {
#endif

/**
 * Node of tree
 */
typedef struct _node_t {
	/** Left children */
	struct _node_t *l;
	/** Right children */
	struct _node_t *r;
	/** Network ID (value) */
	int as;
	/** Indicator: is as loaded? (not empty) */
	uint8_t as_in;
} node_t;

#define TRIE_MEMORY_CELL_SIZE 32768

/**
 * Memory stack for nodes
 */
typedef struct _trie_memory_t {
	/** Count of used memory cells */
	int ln;
	/** Next memory cell */
	struct _trie_memory_t *next;
	/** Memory cells */
	node_t cells[TRIE_MEMORY_CELL_SIZE];
} trie_memory_t;

/**
 * Trie tree
 */
typedef struct _trie_t {
	/** Root node */
	node_t *root;
	/** First memory cell */
	trie_memory_t *first;
	/** Current memory cell */
	trie_memory_t *last;
} trie_t;

/**
 * Initializes the trie tree
 *
 * @param t
 */
static void trie_init(trie_t *t);

/**
 * Destroys allocated memory
 *
 * @param t
 */
static void trie_destroy(trie_t *t);

/**
 * Puts the given network address to prefix tree
 *
 * @param t trie tree
 * @param ip IP of subnet
 * @param cidr subnet length
 * @param as value
 */
static void trie_node_put(trie_t *t, uint8_t *ip, uint8_t cidr, int as);

/**
 * Searches for network for the given IP address
 *
 * @param t trie tree
 * @param ip IP of subnet
 * @param ln length of IP (32/128)
 * @param as store value to
 * @return if success than >0 else 0
 */
static uint8_t trie_node_search(trie_t *t, uint8_t *ip, uint8_t ln, int *as);

/*
 * Tree for storing prefixes and searching for longest match on stored prefixes.
 */

/**
 * Allocates memory for a node and initializes it
 *
 * @param t tree
 * @return node
 */
static node_t *_node_malloc(trie_t *t)
{
	node_t *n;

	// add new memory cell
	if (t->last == NULL || t->last->ln + 1 == TRIE_MEMORY_CELL_SIZE) {
		trie_memory_t *pom = t->last;
		t->last = (trie_memory_t *)malloc(sizeof(trie_memory_t));

		if (t->last == NULL) {
			fprintf(stderr, "Cannot allocate memory\n");
			exit(EXIT_FAILURE);
		}

		t->last->ln = 0;
		t->last->next = NULL;

		if (pom != NULL) {
			pom->next = t->last;
		}
	}
	// get node
	n = &(t->last->cells[t->last->ln]);
	t->last->ln++; // next cell
	n->as_in = 0;
	n->l = NULL;
	n->r = NULL;
	// return
	return n;
}

/**
 * Initializes the trie tree
 *
 * @param t
 */
static void trie_init(trie_t *t)
{
	t->first = t->last = NULL;
	t->root = _node_malloc(t);
	t->first = t->last;
}

/**
 * Destroys allocated memory
 *
 * @param t
 */
static void trie_destroy(trie_t *t)
{
	trie_memory_t *current = t->first, *pom;

	while (current != NULL) {
		pom = current->next;
		free(current);
		current = pom;
	}
}

/**
 * Puts the given network address to prefix tree
 *
 * @param t tree
 * @param ip IP of subnet
 * @param cidr subnet length
 * @param as value
 */
static void trie_node_put(trie_t *t, uint8_t *ip, uint8_t cidr, int as)
{
	node_t *current = t->root;
	int i;

	// add each bit of address prefix to tree
	for (i = 0; i < cidr; i++) {
		// bit is 1 => go right
		if (((ip[i / 8] >> (7 - i % 8)) & 1) > 0) {
			// create path if not exists
			if (current->r == NULL) {
				current->r = _node_malloc(t);
			}
			// next
			current = current->r;
		}
		// bit is 0 => go left
		else {
			// create path if not exists
			if (current->l == NULL) {
				current->l = _node_malloc(t);
			}
			// next
			current = current->l;
		}
		// last bit => add value to node
		if ((i + 1) == cidr) {
			if (!current->as_in) {
				current->as_in = 1;
				current->as = as;
			} else if (current->as != as) {
				fprintf(stderr,
					"Some network collides: %d and %d",
					current->as, as);
			}
		}
	}
}

/**
 * Searches for network for the given IP address
 *
 * @param t trie tree
 * @param ip IP of subnet
 * @param ln length of IP (32/128)
 * @param as store value to
 * @return if success than >0 else 0
 */
static uint8_t trie_node_search(trie_t *t, uint8_t *ip, uint8_t ln, int *as)
{
	node_t *current = t->root;
	uint8_t found = 0;
	int i, u;

	for (i = 0; i < ln; i++) {
		for (u = 7; u >= 0; u--) {
			// search right
			if (((ip[i] >> u) & 1) > 0) {
				current = current->r;
			}
			// search left
			else {
				current = current->l;
			}
			// end of road
			if (current == NULL) {
				return found;
			}
			// change last network
			if (current->as_in) {
				*as = current->as;
				found = 1;
			}
		}
	}

	return found;
}

#ifdef __cplusplus
}
#endif

struct ipv4_lpm_key {
	__u32 prefixlen;
	__u32 data;
};

struct ipv6_lpm_key {
	__u32 prefixlen;
	struct in6_addr *data;
};

#endif // LPM_TRIE_H
