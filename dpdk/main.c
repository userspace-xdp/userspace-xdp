#include <stdio.h>
#include <signal.h>
#include <xdp-runtime.h>

#include <rte_lcore.h>

#include <base.h>

volatile bool force_quit;
RTE_DEFINE_PER_LCORE(int, queue_id);

static void signal_handler(int signum)
{
	if (signum == SIGINT || signum == SIGTERM)
	{
		printf("\n\nSignal %d received, preparing to exit...\n",
			   signum);
		force_quit = true;
	}
}

static int thread_main(void *arg)
{
	uint32_t thread_id = (int)(long)(arg);
	printf("Worker main\n");

	/* Start plugging your logic here */
	while (!force_quit)
		dpdk_poll();

	return 0;
}

int main(int argc, char **argv)
{
	int count, lcore_id, ret = 0;

	printf("Hello world\n");
	ebpf_module_init();
	printf("init eBPF runtime success\n");

	dpdk_init(&argc, &argv);

	/* set signal handler for proper exiting */
	force_quit = false;
	signal(SIGINT, signal_handler);
	signal(SIGTERM, signal_handler);

	/* Setup dispatcher workers communication rings */
	count = rte_lcore_count();
	printf("There are %d cores\n", count);

	RTE_LCORE_FOREACH_WORKER(lcore_id)
	{
		rte_eal_remote_launch(thread_main, (void *)(long)count,
							  lcore_id);
		count++;
	}

	thread_main((void *)(long)0);

	RTE_LCORE_FOREACH_WORKER(lcore_id)
	{
		if (rte_eal_wait_lcore(lcore_id) < 0)
		{
			ret = -1;
			break;
		}
	}

	dpdk_terminate();
	return ret;
}
