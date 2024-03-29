all: loop.bpf.o xdp_tx.bpf.o loop1.bpf.o loop2.bpf.o xxhash64.bpf.o xxhash32.bpf.o

loop.bpf.o: loop.bpf.c
	clang -O3 -target bpf -g -c loop.bpf.c -o loop.bpf.o
	clang -O3 -c loop.bpf.c -o loop.o
	clang -S -emit-llvm -c loop.bpf.c -o loop.ll
	objdump -S loop.o > loop.c.S

loop1.bpf.o: loop1.bpf.c
	clang -target bpf -g -c loop1.bpf.c -o loop1.bpf.o
	clang -O3 -c loop1.bpf.c -o loop1.o
	clang -S -emit-llvm -O3 -c loop1.bpf.c -o loop1.ll
	objdump -S loop1.o > loop1.c.S

loop2.bpf.o: loop2.bpf.c
	clang -target bpf -g -c loop2.bpf.c -o loop2.bpf.o
	clang -O3 -c loop2.bpf.c -o loop2.o
	clang -S -emit-llvm -c loop2.bpf.c -o loop2.ll
	objdump -S loop2.o > loop2.c.S

xdp_tx.bpf.o: xdp_tx.bpf.c
	clang -O3 -target bpf -g -c xdp_tx.bpf.c -o xdp_tx.bpf.o
	clang -O3  -mavx -c xdp_tx.bpf.c -o xdp_tx.o
	clang -S -emit-llvm -O3 -c xdp_tx.bpf.c -o xdp_tx.ll
	objdump -S xdp_tx.o > xdp_tx.c.S

xxhash64.bpf.o: xxhash64.c
	clang -O3 -target bpf -g -c xxhash64.c -o xxhash64.bpf.o
	clang -O3 -c xxhash64.c -o xxhash64.o
	clang -S -emit-llvm -O3 -c xxhash64.c -o xxhash64.ll
	objdump -S xxhash64.o > xxhash64.c.S

xxhash32.bpf.o: xxhash32.c
	clang -O3 -target bpf -g -c xxhash32.c -o xxhash32.bpf.o
	clang -O3 -c xxhash32.c -o xxhash32.o
	clang -S -emit-llvm -O3 -c xxhash32.c -o xxhash32.ll
	objdump -S xxhash32.o > xxhash32.c.S

clean:
	rm -f *.o *.S
