LIBBPF_HEADERS := ../external/libbpf/src/install-dir/usr/include
LIBBPF_SOURCE  := ../external/libbpf/src/install-dir/usr/lib64
CXXFLAGS = -I$(LIBBPF_HEADERS) -g -Wall

LOADER := loader
BPF_PROG := xdp_lb.bpf.o

all: $(LOADER) $(BPF_PROG)

libbpf:
	OBJDIR=build DESTDIR=install-dir make -C ../external/libbpf/src install

$(LOADER): loader.o
	g++ -o $@ $^ $(LIBBPF_SOURCE)/libbpf.a -lelf -lz

$(BPF_PROG): xdp_lb.bpf.c
	clang -target bpf -I$(LIBBPF_HEADERS) -g -Wall -Werror -O2 -c $^ -o $@

style:
	find . -name "*.c" | xargs clang-format -i -style=file
	find . -name "*.cpp" | xargs clang-format -i -style=file
	find . -name "*.h" | xargs clang-format -i -style=file

clean:
	rm -f *.o *.s

distclean:
	make clean
	rm -f $(LOADER)
