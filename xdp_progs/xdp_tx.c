#include <stdlib.h>
#include <stdio.h>
#include <linux/if_link.h>

#include <bpf/bpf.h>
#include <bpf/libbpf.h>

#include <csignal>
#include <arpa/inet.h>
#include <net/if.h>
#include <unistd.h>

static int libbpf_print_fn(enum libbpf_print_level level, const char *format,
			   va_list args)
{
	return vfprintf(stderr, format, args);
}

int main(int argc, char **argv)
{
	if (argc < 3) {
		printf("ERROR - Usage is: ./loade"
				  " <BPF_FILE> <INTERFACE> [btf_file]\n"
				  "\n");
		return 1;
	}
    libbpf_set_print(libbpf_print_fn);
	LIBBPF_OPTS(bpf_object_open_opts , opts,
	);
	if (argc == 4)
		opts.btf_custom_path = argv[3];
	// Open and load the BPF program
	bpf_object* obj = bpf_object__open_file(argv[1], &opts);

	if (bpf_object__load(obj)) {
		printf( "Failed to load program\n");
		return 1;
	}

	bpf_program* prog = bpf_object__find_program_by_name(obj, "xdp_pass");
	bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);
	int prog_fd = bpf_program__fd(prog);
	const char* progName = bpf_program__name(prog);
	printf("load prog %s", progName);

	// Attach the XDP program to the interface
	int ifindex = if_nametoindex(argv[2]);
	if (!ifindex) {
		printf("failed to if_nametoindex\n");
		return 1;
	}

	int err = bpf_xdp_attach(ifindex, prog_fd,
							 XDP_FLAGS_UPDATE_IF_NOEXIST | XDP_FLAGS_SKB_MODE,
							 nullptr);
	if (err) {
		printf("attach maybe error\n");
	}
	while (1) {
		sleep(1);
	}
	return 0;
}
