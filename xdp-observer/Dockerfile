FROM ubuntu:22.04

WORKDIR /tmp/xdb-observer

ADD . .

RUN apt update && apt install -y linux-headers-$(uname -r) libbpfcc-dev libbpf-dev llvm clang gcc-multilib build-essential linux-tools-$(uname -r) linux-tools-common linux-tools-generic git iproute2 curl

RUN git clone https://github.com/libbpf/libbpf.git
RUN cd libbpf/src && make install

RUN clang -O2 -g -target bpf -c main.bpf.c -o main.bpf.o
RUN bpftool gen skeleton main.bpf.o > main.skel.h
RUN gcc -o main main.c -lbpf