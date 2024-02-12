/* SPDX-License-Identifier: GPL-2.0 */

#include <assert.h>
#include <errno.h>
#include <getopt.h>
#include <locale.h>
#include <poll.h>
#include <pthread.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/resource.h>
#include <getopt.h>

#include <arpa/inet.h>
#include <net/if.h>
#include <linux/if_link.h>
#include <linux/if_ether.h>
#include <linux/ipv6.h>
#include <linux/ip.h>
#include <linux/icmpv6.h>
#include <xdp-runtime.h>

#include "../libbpf/src/bpf.h"
#include "../libbpf/src/libbpf.h"
#include "../libbpf/src/xsk.h"

#define NUM_FRAMES 4096
#define FRAME_SIZE XSK_UMEM__DEFAULT_FRAME_SIZE
#define RX_BATCH_SIZE 64
#define INVALID_UMEM_FRAME UINT64_MAX
#define MAX_CPUS 64

struct xsk_umem_info
{
    struct xsk_ring_prod fq;
    struct xsk_ring_cons cq;
    struct xsk_umem *umem;
    void *buffer;
};

struct xsk_socket_info
{
    struct xsk_ring_cons rx;
    struct xsk_ring_prod tx;
    struct xsk_umem_info *umem;
    struct xsk_socket *xsk;

    uint64_t umem_frame_addr[NUM_FRAMES];
    uint32_t umem_frame_free;

    uint32_t outstanding_tx;
};

struct thread_info
{
    int id;
    struct xsk_socket_info *xsk;
};

const struct option opts[] =
    {
        {"dev", required_argument, NULL, 'i'},
        {"sockets", required_argument, NULL, 'c'},
        {"skb", no_argument, NULL, 's'},
        {NULL, 0, NULL, 0}};

static int keep_running = 1;
static int progfd;
uint32_t xdp_flags = XDP_FLAGS_DRV_MODE;

void ShutDown(int tmp)
{
    keep_running = 0;
}

static inline __u32 xsk_ring_prod__free(struct xsk_ring_prod *r)
{
    r->cached_cons = *r->consumer + r->size;
    return r->cached_cons - r->cached_prod;
}

static struct xsk_umem_info *configure_xsk_umem(void *buffer, uint64_t size)
{
    struct xsk_umem_info *umem;
    int ret;

    umem = calloc(1, sizeof(*umem));
    if (!umem)
    {
        return NULL;
    }

    ret = xsk_umem__create(&umem->umem, buffer, size, &umem->fq, &umem->cq,
                           NULL);
    if (ret)
    {
        errno = -ret;
        return NULL;
    }

    umem->buffer = buffer;
    return umem;
}

static uint64_t xsk_alloc_umem_frame(struct xsk_socket_info *xsk)
{
    uint64_t frame;
    if (xsk->umem_frame_free == 0)
        return INVALID_UMEM_FRAME;

    frame = xsk->umem_frame_addr[--xsk->umem_frame_free];
    xsk->umem_frame_addr[xsk->umem_frame_free] = INVALID_UMEM_FRAME;
    return frame;
}

static void xsk_free_umem_frame(struct xsk_socket_info *xsk, uint64_t frame)
{
    assert(xsk->umem_frame_free < NUM_FRAMES);

    xsk->umem_frame_addr[xsk->umem_frame_free++] = frame;
}

static uint64_t xsk_umem_free_frames(struct xsk_socket_info *xsk)
{
    return xsk->umem_frame_free;
}

static struct xsk_socket_info *xsk_configure_socket(struct xsk_umem_info *umem, int rxqueue, int ifidx, const char *dev)
{
    struct xsk_socket_config xsk_cfg;
    struct xsk_socket_info *xsk_info;
    uint32_t idx;
    uint32_t prog_id = 0;
    int i;
    int ret;

    xsk_info = calloc(1, sizeof(*xsk_info));
    if (!xsk_info)
        return NULL;

    xsk_info->umem = umem;
    xsk_cfg.rx_size = XSK_RING_CONS__DEFAULT_NUM_DESCS;
    xsk_cfg.tx_size = XSK_RING_PROD__DEFAULT_NUM_DESCS;
    xsk_cfg.libbpf_flags = 0;
    xsk_cfg.xdp_flags = xdp_flags;
    xsk_cfg.bind_flags = XDP_COPY;
    ret = xsk_socket__create(&xsk_info->xsk, dev, rxqueue, umem->umem, &xsk_info->rx, &xsk_info->tx, &xsk_cfg);
    if (ret)
        goto error_exit;

    ret = bpf_get_link_xdp_id(ifidx, &prog_id, XDP_FLAGS_DRV_MODE);
    if (ret)
        goto error_exit;

    printf("Initialize umem frame allocation \n");

    for (i = 0; i < NUM_FRAMES; i++)
        xsk_info->umem_frame_addr[i] = i * FRAME_SIZE;

    xsk_info->umem_frame_free = NUM_FRAMES;

    /* Stuff the receive path with buffers, we assume we have enough */
    ret = xsk_ring_prod__reserve(&xsk_info->umem->fq,
                                 XSK_RING_PROD__DEFAULT_NUM_DESCS,
                                 &idx);

    if (ret != XSK_RING_PROD__DEFAULT_NUM_DESCS)
        goto error_exit;

    for (i = 0; i < XSK_RING_PROD__DEFAULT_NUM_DESCS; i++)
        *xsk_ring_prod__fill_addr(&xsk_info->umem->fq, idx++) =
            xsk_alloc_umem_frame(xsk_info);

    xsk_ring_prod__submit(&xsk_info->umem->fq,
                          XSK_RING_PROD__DEFAULT_NUM_DESCS);

    return xsk_info;

error_exit:
    errno = -ret;
    return NULL;
}

int find_map_fd(struct bpf_object *bpf_obj, const char *mapname)
{
    struct bpf_map *map;
    int fd = -1;

    map = bpf_object__find_map_by_name(bpf_obj, mapname);
    if (!map)
    {
        fprintf(stderr, "Error finding eBPF map: %s\n", mapname);

        goto out;
    }

    fd = bpf_map__fd(map);

out:
    return fd;
}

struct bpf_object *load_bpf_object_file__simple(const char *filename)
{
    int first_prog_fd = -1;
    struct bpf_object *obj;
    int err;

    err = bpf_prog_load_opts(filename, BPF_PROG_TYPE_XDP, &obj, &first_prog_fd);
    if (err)
    {
        fprintf(stderr, "Error loading XDP program. File => %s. Error => %s. Error Num => %d\n", filename, strerror(-err), err);
    }

    progfd = first_prog_fd;
    return obj;
}

static int xdp_detach(int ifindex, uint32_t xdp_flags)
{
    int err;

    err = bpf_set_link_xdp_fd(ifindex, -1, xdp_flags);
    if (err < 0)
    {
        fprintf(stderr, "Error detaching XDP program. Error => %s. Error Num => %.d\n", strerror(-err), err);
        return -1;
    }
    return EXIT_SUCCESS;
}

static int xdp_attach(int ifindex, uint32_t xdp_flags, int prog_fd)
{
    int err;

    err = bpf_set_link_xdp_fd(ifindex, prog_fd, xdp_flags);

    if (err == -EEXIST && !(xdp_flags & XDP_FLAGS_UPDATE_IF_NOEXIST))
    {

        uint32_t oldflags = xdp_flags;

        xdp_flags &= ~XDP_FLAGS_MODES;
        xdp_flags |= (oldflags & XDP_FLAGS_SKB_MODE) ? XDP_FLAGS_DRV_MODE : XDP_FLAGS_SKB_MODE;

        err = bpf_set_link_xdp_fd(ifindex, -1, xdp_flags);

        if (!err)
        {
            err = bpf_set_link_xdp_fd(ifindex, prog_fd, oldflags);
        }
    }

    if (err < 0)
    {
        fprintf(stderr, "Error attaching XDP program. Error => %s. Error Num => %d. IfIndex => %d.\n", strerror(-err), -err, ifindex);

        switch (-err)
        {
        case EBUSY:

        case EEXIST:
        {
            xdp_detach(ifindex, xdp_flags);
            fprintf(stderr, "Additional: XDP already loaded on device.\n");
            break;
        }

        case EOPNOTSUPP:
            fprintf(stderr, "Additional: XDP-native nor SKB not supported? Not sure how that's possible.\n");

            break;

        default:
            break;
        }

        return -1;
    }

    return EXIT_SUCCESS;
}

static void complete_tx(struct xsk_socket_info *xsk)
{
    unsigned int completed;
    uint32_t idx_cq;

    if (!xsk->outstanding_tx)
        return;

    sendto(xsk_socket__fd(xsk->xsk), NULL, 0, MSG_DONTWAIT, NULL, 0);

    /* Collect/free completed TX buffers */
    completed = xsk_ring_cons__peek(&xsk->umem->cq,
                                    XSK_RING_CONS__DEFAULT_NUM_DESCS,
                                    &idx_cq);

    if (completed > 0)
    {
        for (int i = 0; i < completed; i++)
            xsk_free_umem_frame(xsk,
                                *xsk_ring_cons__comp_addr(&xsk->umem->cq,
                                                          idx_cq++));

        xsk_ring_cons__release(&xsk->umem->cq, completed);
        xsk->outstanding_tx -= completed < xsk->outstanding_tx ? completed : xsk->outstanding_tx;
    }
}

static inline __sum16 csum16_add(__sum16 csum, __be16 addend)
{
    uint16_t res = (uint16_t)csum;

    res += (__u16)addend;
    return (__sum16)(res + (res < (__u16)addend));
}

static inline __sum16 csum16_sub(__sum16 csum, __be16 addend)
{
    return csum16_add(csum, ~addend);
}


unsigned short compute_ip_checksum(struct iphdr* iphdrp) {
    unsigned long sum = 0;
    const unsigned short* ptr = (const unsigned short*)iphdrp;

    for (size_t i = 0; i < sizeof(struct iphdr) / 2; ++i) {
        sum += *ptr++;
    }

    while (sum >> 16) {
        sum = (sum & 0xFFFF) + (sum >> 16);
    }

    return (unsigned short)(~sum);
}

struct __attribute__((packed)) eth_addr {
	unsigned char addr[ETH_ALEN];
};

static bool process_packet(struct xsk_socket_info *xsk,
                           uint64_t addr, uint32_t len)
{
    uint8_t *pkt = xsk_umem__get_data(xsk->umem->buffer, addr);

	/* Lesson#3: Write an IPv6 ICMP ECHO parser to send responses
	 *
	 * Some assumptions to make it easier:
	 * - No VLAN handling
	 * - Only if nexthdr is ICMP
	 * - Just return all data with MAC/IP swapped, and type set to
	 *   ICMPV6_ECHO_REPLY
	 * - Recalculate the icmp checksum */
	int ret;
	uint32_t tx_idx = 0;
	uint8_t tmp_mac[ETH_ALEN];
	// struct in6_addr tmp_ip;
	struct ethhdr *eth = (struct ethhdr *)pkt;

    // Ensure the packet is IPv4
    if (ntohs(eth->h_proto) != ETH_P_IP)
        return false;

    struct iphdr *ip = (struct iphdr *)(pkt + sizeof(struct ethhdr));

    // Print received packet information
	char addr_str[INET_ADDRSTRLEN];
    char src_ip[INET_ADDRSTRLEN];
    char dst_ip[INET_ADDRSTRLEN];
    inet_ntop(AF_INET, &(ip->saddr), src_ip, INET_ADDRSTRLEN);
    inet_ntop(AF_INET, &(ip->daddr), dst_ip, INET_ADDRSTRLEN);
    printf("Received packet: SRC IP: %s, DST IP: %s\n", src_ip, dst_ip);
	struct eth_addr mac = {0xde, 0xad, 0xbe, 0xef, 0x0, 0x0};

    // Change the destination IP address to 10.0.0.3
	if (ip->saddr == inet_addr("10.0.0.2")) {
		ip->daddr = inet_addr("10.0.0.3");
		ip->saddr = inet_addr("10.0.0.10");
		mac.addr[5] = 3;
		memcpy(eth->h_dest, mac.addr, ETH_ALEN);
		printf("Change the destination IP address to 10.0.0.3");
	} else if (ip->saddr == inet_addr("10.0.0.3")) {
		ip->daddr = inet_addr("10.0.0.2");
		ip->saddr = inet_addr("10.0.0.10");
		mac.addr[5] = 2;
		memcpy(eth->h_dest, mac.addr, ETH_ALEN);
		printf("Change the destination IP address to 10.0.0.2");
	} else {
		printf("Unknown source IP address, drop\n");
		return false;
	}
	mac.addr[5] = 10;
	memcpy(eth->h_source, mac.addr, ETH_ALEN);
    // Recalculate the IP checksum
    ip->check = 0; // Reset checksum to 0 before recalculating
    ip->check = compute_ip_checksum(ip);
	// struct ipv6hdr *ipv6 = (struct ipv6hdr *)(eth + 1);
	// struct icmp6hdr *icmp = (struct icmp6hdr *)(ipv6 + 1);

	// if (ntohs(eth->h_proto) != ETH_P_IPV6 ||
	// 	len < (sizeof(*eth) + sizeof(*ipv6) + sizeof(*icmp)) ||
	// 	ipv6->nexthdr != IPPROTO_ICMPV6 ||
	// 	icmp->icmp6_type != ICMPV6_ECHO_REQUEST)
	// 	return false;

	// memcpy(tmp_mac, eth->h_dest, ETH_ALEN);
	// memcpy(eth->h_dest, eth->h_source, ETH_ALEN);
	// memcpy(eth->h_source, tmp_mac, ETH_ALEN);

	// memcpy(&tmp_ip, &ipv6->saddr, sizeof(tmp_ip));
	// memcpy(&ipv6->saddr, &ipv6->daddr, sizeof(tmp_ip));
	// memcpy(&ipv6->daddr, &tmp_ip, sizeof(tmp_ip));

	// icmp->icmp6_type = ICMPV6_ECHO_REPLY;

	// csum_replace2(&icmp->icmp6_cksum,
	// 			  htons(ICMPV6_ECHO_REQUEST << 8),
	// 			  htons(ICMPV6_ECHO_REPLY << 8));

	printf("received packet %p, send data to eBPF module len %d\n", pkt, len);
    // uint64_t bpf_ret = 0;
    // struct xdp_md data;
    // data.data = (unsigned int)pkt;
    // data.data_end = data.data + len;
    // /* FIXME: Start your logic from here */
    // ebpf_module_run_at_handler(&data, sizeof(data), &bpf_ret);
    // switch (bpf_ret)
    // {
    // case XDP_DROP:
    //     // TODO
    //     return false;
    // case XDP_PASS:
    //     // TODO
    //     return true;
    // case XDP_TX:
    //     // continue sending packet out
    //     break;
    // case XDP_REDIRECT:
    //     // TODO
    //     return true;
    // default:
    //     return false;
    // }

    /* Here we sent the packet out of the receive port. Note that
     * we allocate one entry and schedule it. Your design would be
     * faster if you do batch processing/transmission */
    ret = xsk_ring_prod__reserve(&xsk->tx, 1, &tx_idx);
    if (ret != 1)
    {
        /* No more transmit slots, drop the packet */
        return false;
    }

    xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->addr = addr;
    xsk_ring_prod__tx_desc(&xsk->tx, tx_idx)->len = len;
    xsk_ring_prod__submit(&xsk->tx, 1);
    xsk->outstanding_tx++;

    // xsk->stats.tx_bytes += len;
    // xsk->stats.tx_packets++;
    return true;
}

static void handle_receive_packets(struct xsk_socket_info *xsk)
{
    unsigned int rcvd, stock_frames, i;
    uint32_t idx_rx = 0, idx_fq = 0;
    int ret;

    rcvd = xsk_ring_cons__peek(&xsk->rx, RX_BATCH_SIZE, &idx_rx);
    if (!rcvd)
        return;

    /* Stuff the ring with as much frames as possible */
    stock_frames = xsk_prod_nb_free(&xsk->umem->fq,
                                    xsk_umem_free_frames(xsk));

    if (stock_frames > 0)
    {

        ret = xsk_ring_prod__reserve(&xsk->umem->fq, stock_frames,
                                     &idx_fq);

        /* This should not happen, but just in case */
        while (ret != stock_frames)
            ret = xsk_ring_prod__reserve(&xsk->umem->fq, rcvd,
                                         &idx_fq);

        for (i = 0; i < stock_frames; i++)
            *xsk_ring_prod__fill_addr(&xsk->umem->fq, idx_fq++) =
                xsk_alloc_umem_frame(xsk);

        xsk_ring_prod__submit(&xsk->umem->fq, stock_frames);
    }

    /* Process received packets */
    for (i = 0; i < rcvd; i++)
    {
        uint64_t addr = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx)->addr;
        uint32_t len = xsk_ring_cons__rx_desc(&xsk->rx, idx_rx++)->len;

        if (!process_packet(xsk, addr, len))
            xsk_free_umem_frame(xsk, addr);

        // xsk->stats.rx_bytes += len;
    }

    xsk_ring_cons__release(&xsk->rx, rcvd);
    // xsk->stats.rx_packets += rcvd;

    /* Do we need to wake up the kernel for transmission */
    complete_tx(xsk);
}

void *poll_xsk(void *data)
{
    struct thread_info *ti = (struct thread_info *)data;

    struct pollfd fds[2];
    int ret, nfds = 1;

    memset(fds, 0, sizeof(fds));
    fds[0].fd = xsk_socket__fd(ti->xsk->xsk);
    fds[0].events = POLLIN;

    while (keep_running)
    {
        ret = poll(fds, nfds, -1);
        if (ret <= 0 || ret > 1)
            continue;

        uint32_t idx_rx = 0;

        handle_receive_packets(ti->xsk);
    }

    xsk_socket__delete(ti->xsk->xsk);
    xsk_umem__delete(ti->xsk->umem->umem);
    free(ti);

    pthread_exit(NULL);
}

int main(int argc, char **argv)
{
    int ret;
    int ifidx;
    int xsks_map_fd;
    void *packet_buffer;
    uint64_t packet_buffer_size;
    struct rlimit rlim = {RLIM_INFINITY, RLIM_INFINITY};
    struct bpf_object *bpf_obj = NULL;

    int cpus = 1;
    char *dev = "ens18";

    int c = -1;
    while (optind < argc)
    {
        if ((c = getopt_long(argc, argv, "d:c:s", opts, NULL)) != -1)
        {
            switch (c)
            {
            case 'd':
                dev = optarg;
                break;
            case 'c':
                cpus = atoi(optarg);
                break;
            case 's':
                xdp_flags = XDP_FLAGS_SKB_MODE;
                break;
            }
        }
        else
        {
            optind++;
        }
    }

    ebpf_module_init();
    printf("init eBPF runtime success\n");

    ifidx = if_nametoindex(dev);
    if (ifidx < 1)
    {
        fprintf(stderr, "Error finding device: %s\n", dev);
        exit(EXIT_FAILURE);
    }

    /* Global shutdown handler */
    signal(SIGINT, ShutDown);
    xdp_detach(ifidx, xdp_flags);

    /* Load custom program if configured */
    struct bpf_map *map;

    bpf_obj = load_bpf_object_file__simple("src/afxdp_kern.o");
    if (!bpf_obj)
    {
        fprintf(stderr, "Error opening BPF object file.");
        exit(EXIT_FAILURE);
    }

    if (xdp_attach(ifidx, xdp_flags, progfd) != 0)
    {
        fprintf(stderr, "Error attaching XDP program: %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    /* We also need to load the xsks_map */
    map = bpf_object__find_map_by_name(bpf_obj, "xsks_map");
    xsks_map_fd = bpf_map__fd(map);
    if (xsks_map_fd < 0)
    {
        fprintf(stderr, "ERROR: no xsks map found: %s\n", strerror(xsks_map_fd));
        exit(EXIT_FAILURE);
    }

    if (setrlimit(RLIMIT_MEMLOCK, &rlim))
    {
        fprintf(stderr, "ERROR: setrlimit(RLIMIT_MEMLOCK) \"%s\"\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    /* Allocate memory for NUM_FRAMES of the default XDP frame size */
    packet_buffer_size = NUM_FRAMES * FRAME_SIZE;
    if (posix_memalign(&packet_buffer, getpagesize(), packet_buffer_size))
    {
        fprintf(stderr, "ERROR: Can't allocate buffer memory \"%s\"\n", strerror(errno));
        exit(EXIT_FAILURE);
    }

    struct xsk_umem_info *umem[MAX_CPUS];
    struct xsk_socket_info *xsk_socket[MAX_CPUS];
    for (int i = 0; i < cpus; i++)
    {
        /* Initialize shared packet_buffer for umem usage */
        umem[i] = configure_xsk_umem(packet_buffer, packet_buffer_size);
        if (umem[i] == NULL)
        {
            fprintf(stderr, "ERROR: Can't create umem \"%s\"\n", strerror(errno));
            continue;
        }
        /* Open and configure the AF_XDP (xsk) socket */
        xsk_socket[i] = xsk_configure_socket(umem[i], i, ifidx, (const char *)dev);
        if (xsk_socket[i] == NULL)
        {
            fprintf(stderr, "ERROR: Can't setup AF_XDP socket \"%s\"\n", strerror(errno));
            continue;
        }

        struct thread_info *ti = malloc(sizeof(struct thread_info));
        ti->id = i;
        ti->xsk = xsk_socket[i];

        pthread_t tid;
        pthread_create(&tid, NULL, poll_xsk, (void *)ti);
        fprintf(stdout, "Created thread %d\n", i);
    }

    fprintf(stdout, "Starting program...\n");
    while (keep_running)
    {
        sleep(1);
    }

    /* Cleanup */
    xdp_detach(ifidx, xdp_flags);
    for (int i = 0; i < cpus; i++)
    {
        if (xsk_socket[i] != NULL)
        {
            xsk_socket__delete(xsk_socket[i]->xsk);
        }
        if (umem[i] != NULL)
        {
            xsk_umem__delete(umem[i]->umem);
        }
    }
    return EXIT_SUCCESS;
}
