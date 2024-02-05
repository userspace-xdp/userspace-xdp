CC = clang

objects += src/afxdp_user.o

libbpf_static_objects += libbpf/src/staticobjs/bpf.o libbpf/src/staticobjs/btf.o libbpf/src/staticobjs/libbpf_errno.o libbpf/src/staticobjs/libbpf_probes.o
libbpf_static_objects += libbpf/src/staticobjs/libbpf.o libbpf/src/staticobjs/netlink.o libbpf/src/staticobjs/nlattr.o libbpf/src/staticobjs/str_error.o
libbpf_static_objects += libbpf/src/staticobjs/hashmap.o libbpf/src/staticobjs/bpf_prog_linfo.o libbpf/src/staticobjs/xsk.o

ROOTDIR=$(shell git rev-parse --show-toplevel)
LDFLAGS += -lpthread  -L$(ROOTDIR)/build-bpftime/bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(ROOTDIR)/build-bpftime/bpftime/vm \
			-L$(ROOTDIR)/build-bpftime/bpftime/third_party/spdlog \
			-L$(ROOTDIR)/build-bpftime/bpftime/FridaGum-prefix/src/FridaGum/ \
			-lruntime -lxdp-bpftime $(DPDK_LIBS) \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lvm-bpf -lspdlogd -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 
CFLAGS += -I$(ROOTDIR)/ -I$(ROOTDIR)/module

all: afxdp_loader

src/afxdp_user.o: src/afxdp_user.c
	clang -Wall -Wextra -O2 $(CFLAGS) -c src/afxdp_user.c -o src/afxdp_user.o

afxdp_loader: libbpf $(objects) src/afxdp_kern.o
	clang $(libbpf_static_objects) $(objects) $(LDFLAGS) -o afxdp_loader 

src/afxdp_kern.o:
	clang -O2 -target bpf -g -c src/afxdp_kern.c -o src/afxdp_kern.o

libbpf:
	$(MAKE) -C libbpf/src

clean:
	$(MAKE) -C libbpf/src clean
	rm -f src/*.o src/*.bc
	rm -f afxdp_loader

.PHONY: libbpf all
.DEFAULT: all