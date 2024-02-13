#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <rte_eal.h>
#include <rte_ethdev.h>
#include <rte_ether.h>
#include <rte_mbuf.h>
#include <rte_timer.h>

#include <base.h>
#include <config.h>

struct rte_mempool *pktmbuf_pool;
static uint8_t port_id = 0;

void dpdk_init(int *argc, char ***argv)
{
	int ret, nb_ports, i;
	uint16_t nb_rx_q;
	uint16_t nb_tx_q;
	uint16_t nb_tx_desc = ETH_DEV_TX_QUEUE_SZ;
	uint16_t nb_rx_desc = ETH_DEV_RX_QUEUE_SZ;
	struct rte_eth_link link;

	const struct rte_eth_conf port_conf = {
		.rxmode =
			{
				/* Disable next 2 fields for debugging on the tap interface */
				//.mtu = RTE_ETHER_MAX_LEN,
				//.offloads = DEV_RX_OFFLOAD_IPV4_CKSUM |
				// DEV_RX_OFFLOAD_KEEP_CRC,
				.mq_mode = RTE_ETH_MQ_RX_RSS,
			},
		.rx_adv_conf =
			{
				.rss_conf =
					{
						.rss_hf = RTE_ETH_RSS_NONFRAG_IPV4_TCP |
								  RTE_ETH_RSS_NONFRAG_IPV4_UDP,
					},
			},
		.txmode =
			{
				.mq_mode = RTE_ETH_MQ_TX_NONE,
			},
	};

	ret = rte_eal_init(*argc, *argv);
	if (ret < 0)
		rte_exit(EXIT_FAILURE, "Invalid EAL arguments\n");
	*argc -= ret;
	*argv += ret;

	/* create the mbuf pool */
	pktmbuf_pool =
		rte_pktmbuf_pool_create("mbuf_pool", NB_MBUF, MEMPOOL_CACHE_SIZE, 0,
								RTE_MBUF_DEFAULT_BUF_SIZE, rte_socket_id());
	if (pktmbuf_pool == NULL)
		rte_exit(EXIT_FAILURE, "Cannot init mbuf pool\n");

	nb_ports = rte_eth_dev_count_avail();
	if (nb_ports == 0)
		rte_exit(EXIT_FAILURE, "No Ethernet ports - bye\n");

	printf("I found %" PRIu8 " ports\n", nb_ports);

	struct rte_eth_dev_info info;
	for (i = 0; i < nb_ports; i++) {
		/* check the link */
		rte_eth_dev_info_get(i, &info);
		printf("Driver is: %s\n", info.driver_name);
		if (!strcmp(info.driver_name, "net_tap")) {
			port_id = i;
			printf("I found the tap driver\n");
			break;
		}
	}

	nb_rx_q = rte_lcore_count();
	nb_tx_q = nb_rx_q;

	/* Configure the device */
	ret = rte_eth_dev_configure(port_id, nb_rx_q, nb_tx_q, &port_conf);

	for (i = 0; i < nb_rx_q; i++) {
		printf("setting up RX queues...\n");
		ret = rte_eth_rx_queue_setup(port_id, i, nb_rx_desc,
									 rte_eth_dev_socket_id(port_id), NULL,
									 pktmbuf_pool);

		if (ret < 0)
			rte_exit(EXIT_FAILURE, "rte_eth_rx_queue_setup:err=%d, port=%u\n",
					 ret, (unsigned)port_id);
	}

	for (i = 0; i < nb_tx_q; i++) {
		printf("setting up TX queues...\n");
		ret = rte_eth_tx_queue_setup(port_id, i, nb_tx_desc,
									 rte_eth_dev_socket_id(port_id), NULL);

		if (ret < 0)
			rte_exit(EXIT_FAILURE, "rte_eth_tx_queue_setup:err=%d, port=%u\n",
					 ret, (unsigned)port_id);
	}

	/* start the device */
	ret = rte_eth_dev_start(port_id);
	if (ret < 0)
		printf("ERROR starting device at port %d\n", port_id);
	else
		printf("started device at port %d\n", port_id);

	/* check the link */
	rte_eth_link_get(port_id, &link);

	if (!link.link_status)
		printf("eth:\tlink appears to be down, check connection.\n");
	else
		printf("eth:\tlink up - speed %u Mbps, %s\n", (uint32_t)link.link_speed,
			   (link.link_duplex == RTE_ETH_LINK_FULL_DUPLEX)
				   ? ("full-duplex")
				   : ("half-duplex\n"));
}

void dpdk_terminate(void)
{
	printf("Closing port %d...", port_id);
	rte_eth_dev_stop(port_id);
	rte_eth_dev_close(port_id);
}

void dpdk_poll(void)
{
	int ret = 0;
	struct rte_mbuf *rx_pkts[BATCH_SIZE];

	ret =
		rte_eth_rx_burst(port_id, RTE_PER_LCORE(queue_id), rx_pkts, BATCH_SIZE);
	if (!ret)
		return;

	for (int i = 0; i < ret; i++)
		eth_in(rx_pkts[i]);
}

void dpdk_out(struct rte_mbuf *pkt)
{
	int ret = 0;

	while (1) {
		ret = rte_eth_tx_burst(port_id, RTE_PER_LCORE(queue_id), &pkt, 1);
		if (ret == 1)
			break;
	}
}
