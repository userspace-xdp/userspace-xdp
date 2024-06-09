build:
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O2 -target bpf -g lib/bpf/balancer.bpf.c -c -o balancer.bpf.o

build-aot:
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O2 -g lib-aot/bpf/balancer.bpf.c -c -o balancer.aot.o