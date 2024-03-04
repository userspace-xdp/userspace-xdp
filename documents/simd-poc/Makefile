all: loop.bpf.o loop.c.S

loop.bpf.o: loop.bpf.c
	clang -O3 -target bpf -c loop.bpf.c -o loop.bpf.o

loop.o: loop.bpf.c
	clang -O3 -c loop.bpf.c -o loop.o

loop.c.S: loop.o
	objdump -S loop.o > loop.c.S
