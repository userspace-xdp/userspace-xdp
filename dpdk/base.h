#pragma once

#include <rte_mbuf.h>

/* DPDK functionality */
void dpdk_init(int *argc, char ***argv);
void dpdk_terminate(void);
void dpdk_poll(void);
void dpdk_out(struct rte_mbuf *pkt);

RTE_DECLARE_PER_LCORE(int, queue_id);
