#pragma once

#define MEMPOOL_CACHE_SIZE 64
#define NB_MBUF 1024 - 1
#define ETH_DEV_TX_QUEUE_SZ 128
#define ETH_DEV_RX_QUEUE_SZ 128
#define BATCH_SIZE 32

#define DEBUG_OUTPUT 0

#define DEBUG_PRINT(fmt, args...) \
    do { if (DEBUG_OUTPUT) fprintf(stderr, fmt, ##args); } while (0)
