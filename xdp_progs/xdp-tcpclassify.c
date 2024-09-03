#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <linux/bpf.h>
#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include "xdp-tcpclassify.h"
#include "xdp-tcpclassify.skel.h"
#include <linux/if_link.h>
#include <arpa/inet.h>
#include <net/if.h>

void handle_sigint(int sig)
{
    printf("Terminating\n");
    exit(0);
}

int handle_event(void *ctx, void *data, size_t len)
{
    struct event *e = (struct event *)data;
    printf("%u.%u.%u.%u ", e->sip & 0xFF, e->sip >> 8 & 0xFF, e->sip >> 16 & 0xFF, e->sip >> 24 & 0xFF);
    printf("%u.%u.%u.%u ", e->dip & 0xFF, e->dip >> 8 & 0xFF, e->dip >> 16 & 0xFF, e->dip >> 24 & 0xFF);

    printf("%d %d %d %d %d %d %d\n", e->sport, e->dport, e->syn, e->fin, e->rst, e->psh, e->ack);
    return 0;
}

static int libbpf_print_fn(enum libbpf_print_level level, const char *format,
			   va_list args)
{
	return vfprintf(stderr, format, args);
}

int main(int argc, char *argv[])
{
    int err;
    unsigned int ifindex = -1;

    if (argc < 2)
    {
        printf("Provide interface name\n");
        return 1;
    }
	LIBBPF_OPTS(bpf_object_open_opts , opts,
	);
	if (argc == 3)
		opts.btf_custom_path = argv[2];
    libbpf_set_print(libbpf_print_fn);

    signal(SIGINT, handle_sigint);

    struct xdp_tcpclassify_bpf *skel = xdp_tcpclassify_bpf__open_opts(&opts);
    if (!skel)
    {
        fprintf(stderr, "Failed to open BPF skeleton\n");
        return 1;
    }

    err = xdp_tcpclassify_bpf__load(skel);
    if (err)
    {
        fprintf(stderr, "Failed to load and verify BPF skeleton\n");
        return 1;
    }

    // struct bpf_link *link = bpf_program__attach_xdp(skel->progs.xdp_pass, ifindex);
    // if (!link)
    // {
    //     fprintf(stderr, "bpf_program__attach_xdp\n");
    //     return 1;
    // }
    int prog_fd = bpf_program__fd(skel->progs.xdp_pass);
    int xdp_flags = XDP_FLAGS_UPDATE_IF_NOEXIST;
	if (getenv("SKBMODE")) {
		printf("skb mode\n");
		xdp_flags |= XDP_FLAGS_SKB_MODE;
	} else if (getenv("DRVMODE")) {
		printf("DRV mode\n");
		xdp_flags |= XDP_FLAGS_DRV_MODE;
	} else if (getenv("HWMODE")) {
		printf("HWMODE mode\n");
		xdp_flags |= XDP_FLAGS_HW_MODE;
	} else {
		printf("XDP native mode\n");
	}

    ifindex = if_nametoindex(argv[1]);
    if (ifindex == 0)
    {
        fprintf(stderr, "Invalid interface\n");
        return 1;
    }
	err = bpf_xdp_attach(ifindex, prog_fd,
							 xdp_flags,
							 nullptr);
	if (err) {
		printf("attach maybe error\n");
	}

    struct bpf_map *ringbuf_map = bpf_object__find_map_by_name(skel->obj, "ringbuf");
    if (!ringbuf_map)
    {
        fprintf(stderr, "Failed to get ring buffer map\n");
        return 1;
    }

    struct ring_buffer *ringbuf = ring_buffer__new(bpf_map__fd(ringbuf_map), handle_event, NULL, NULL);
    if (!ringbuf)
    {
        fprintf(stderr, "Failed to create ring buffer\n");
        return 1;
    }

    printf("Successfully started! Please Ctrl+C to stop.\n");
    printf("\033[1;31m");
    printf("Source IP, Destination IP, Source Port, Destination Port, SIN, FIN, RST, PSH, ACK \n");
    printf("\033[0m");
    while (1)
    {
        if (ring_buffer__poll(ringbuf, 1000) < 0)
        {
            fprintf(stderr, "Error polling ring buffer\n");
            break;
        }
    }

    return 0;
}
