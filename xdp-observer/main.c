#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <linux/bpf.h>
#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include <arpa/inet.h>
#include <net/if.h>
#include "main.h"
#include "main.skel.h"

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
    ifindex = if_nametoindex(argv[1]);
    if (ifindex == 0)
    {
        fprintf(stderr, "Invalid interface\n");
        return 1;
    }
    libbpf_set_print(libbpf_print_fn);

    signal(SIGINT, handle_sigint);

    struct main_bpf *skel = main_bpf__open_opts(&opts);
    if (!skel)
    {
        fprintf(stderr, "Failed to open BPF skeleton\n");
        return 1;
    }

    err = main_bpf__load(skel);
    if (err)
    {
        fprintf(stderr, "Failed to load and verify BPF skeleton\n");
        return 1;
    }

    struct bpf_link *link = bpf_program__attach_xdp(skel->progs.xdp_pass, ifindex);
    if (!link)
    {
        fprintf(stderr, "bpf_program__attach_xdp\n");
        return 1;
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