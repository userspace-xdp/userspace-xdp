#include <stdio.h>
#include <string.h>
#include <errno.h>
#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include <net/if.h>
#include <linux/if_link.h>
#include <arpa/inet.h>
#include <dirent.h>

#define IFNAME "enp1s0f1"

#define PATH "./standard_acl_kern.o"

struct bpf_object *bpf_object_open(char *path)
{
    return bpf_object__open(path);
}

const char *bpf_object_name(const struct bpf_object *obj)
{
    return bpf_object__name(obj);
}

void bpf_object_print_name(const struct bpf_object *obj)
{
    const char *name = bpf_object_name(obj);
    if (name)
    {
        printf("The object name is: %s\n", name);
    }
    else
    {
        printf("There was an error getting the name for this BPF object!\n");
        // should print error
    }
}

void bpf_object_load(struct bpf_object *obj)
{
    int loaded = bpf_object__load(obj);
    if (!loaded)
    {
        printf("The BPF object was loaded successfully!\n");
    }
    else
    {
        printf("There was an error loading the BPF object!\n");
        // should print error
    }
    bpf_object_print_name(obj);
}

struct bpf_program *bpf_object_find_program_by_name(const struct bpf_object *obj, const char *name)
{
    struct bpf_program *bprog = bpf_object__find_program_by_name(obj, name);
    if (!bprog)
    {
        printf("No BPF program with name %s is found in BPF object provided!\n", name);
        bpf_object_print_name(obj);
        // should print error
    }
    return bprog;
}

int bpf_program_fd(const struct bpf_program *prog)
{
    int fd = bpf_program__fd(prog);
    if (!fd)
    {
        printf("There was an error getting the file descriptor for the BPF provided!\n");
        // should print error
    }
    return fd;
}

void bpf_xdp_attach_SKB_simple(int ifindex, int prog_fd)
{
    int attached = bpf_xdp_attach(ifindex, prog_fd, XDP_FLAGS_SKB_MODE, 0);
    if (attached)
    {
        printf("There was an error attaching the BPF program with file descriptor %d to interface %d!\n", prog_fd, ifindex);
        // should print error
    }
}

void bpf_xdp_attach_DRV_simple(int ifindex, int prog_fd)
{
    int attached = bpf_xdp_attach(ifindex, prog_fd, XDP_FLAGS_DRV_MODE, 0);
    if (attached)
    {
        printf("There was an error attaching the BPF program with file descriptor %d to interface %d!\n", prog_fd, ifindex);
        // should print error
    }
}

void bpf_xdp_attach_HW_simple(int ifindex, int prog_fd)
{
    int attached = bpf_xdp_attach(ifindex, prog_fd, XDP_FLAGS_HW_MODE, 0);
    if (attached)
    {
        printf("There was an error attaching the BPF program with file descriptor %d to interface %d!\n", prog_fd, ifindex);
        // should print error
    }
}


void bpf_object_pin_maps(struct bpf_object *obj, const char *path)
{
    DIR *dir = opendir(path);
    if (dir)
    {
        int unpinned = bpf_object__unpin_maps(obj, path);
        if (unpinned)
        {
            printf("There was an error un-pinning (done before pinning) the maps for the given BPF object!\n");
            bpf_object_print_name(obj);
            // should print error
        }
    }
    int pinned = bpf_object__pin_maps(obj, path);
    if (pinned)
    {
        printf("There was an error pinning the maps for the given BPF object!\n");
        bpf_object_print_name(obj);
        // should print error
    }
}

int main(int argc, char **argv)
{
    int ifindex, bprog_fd;

    struct bpf_object *bobj;
    struct bpf_program *bprog;

    ifindex = if_nametoindex(IFNAME);

    bobj = bpf_object_open(PATH);

    bpf_object_load(bobj);

    bprog = bpf_object_find_program_by_name(bobj, "xdp_standard_acl");

    bprog_fd = bpf_program_fd(bprog);

    // bpf_xdp_attach_SKB_simple(ifindex, bprog_fd);
    bpf_xdp_attach_DRV_simple(ifindex, bprog_fd);

    bpf_object_pin_maps(bobj, "/sys/fs/bpf/xdp_standard_acl/");

    // bpf_xdp_detach(ifindex, XDP_FLAGS_SKB_MODE, 0);
    // bpf_xdp_detach(ifindex, XDP_FLAGS_DRV_MODE, 0);

    bpf_object__close(bobj);

    return 0;
}

// clang -Wall -o load_standard_acl.out load_standard_acl.c -lbpf -lelf
// OR, if you haven't copied the build artifacts under /usr/local/include and /usr/local/lib:
// clang -Wall -I ../../libbpf/include -o load_standard_acl.out load_standard_acl.c -L ../../libbpf/src -lbpf -lelf