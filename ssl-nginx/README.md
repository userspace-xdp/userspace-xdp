# nginx test for sslsniff

This test is to show the performance impact of kernel sslsniff and userspace sslsniff. sslsniff is a tool to intercept the ssl handshake and print the packet content of encrypted ssl handshake. The similar approach is very common in modern observability tools and security tools.

This test shoes that:

1. kernel sslsniff can significantly reduce the performance of nginx, lead to a 2x performance drop.

The test program of sslsniff is from bcc and [bpftime/example/sslsniff](https://github.com/eunomia-bpf/bpftime/tree/master/example/sslsniff). The userspace part modified to not print the packet content out.

## Environment

test env:

```console
$ uname -a
Linux yunwei37server 6.2.0-35-generic #35-Ubuntu SMP PREEMPT_DYNAMIC Tue Oct  3 13:14:56 UTC 2023 x86_64 x86_64 x86_64 GNU/Linux
$ nginx -v
nginx version: nginx/1.22.0 (Ubuntu)
$ ./wrk -v
wrk 4.2.0 [epoll] Copyright (C) 2012 Will Glozer
$ lshw
12th Gen Intel(R) Core(TM) i9-12900H
$ nproc
8
```

Run with 4 threads and 512 connections

## Setup

start nginx server

```sh
sudo nginx -c $(pwd)/nginx.conf -p $(pwd)
```

## Test for no effect

You should test each for 10 seconds, and record the result in test-log.txt. repeated 3 times.

```console
$ make test-log.txt
wrk https://127.0.0.1:4043/index.html -c 512 -t 4 -d 10 >> test-log.txt
wrk https://127.0.0.1:4043/data/example1k.txt -c 512 -t 4 -d 10 >> test-log.txt
wrk https://127.0.0.1:4043/data/example2k.txt -c 512 -t 4 -d 10 >> test-log.txt
...
```

| Data Size | Requests/sec  | Transfer/sec  |
|-----------|--------------|--------------|
| 1K        |      59505.73 |        18.50MB |
| 2K        |      59548.71 |        18.51MB |
| 4K        |      56605.76 |        17.59MB |
| 16K       |      58467.36 |        18.17MB |
| 128K      |      56012.56 |        17.41MB |
| 256K      |      56914.58 |        17.69MB |

## test for kernel uprobe sslsniff

| Data Size | Requests/sec  | Transfer/sec  |
|-----------|--------------|--------------|
| 1K        |      38853.67 |        12.08MB |
| 2K        |      39644.41 |        12.32MB |
| 4K        |      37273.69 |        11.59MB |
| 16K       |      38810.10 |        12.07MB |
| 128K      |      37800.53 |        11.75MB |
| 256K      |      38972.52 |        12.11MB |

## test for userspace sslsniff

Note: you need to config bpftime to:

1. No locks in hash maps and array maps
2. Using ubpf JIT
3. Using LTO

in one console, start userspace sslsniff

```sh
sudo BPFTIME_USE_JIT=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so /home/yunwei/ebpf-xdp-dpdk/bpftime/example/sslsniff/sslsniff

sudo BPFTIME_USE_AOT_INSN=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/syscall-server/libbpftime-syscall-server.so /home/yunwei/ebpf-xdp-dpdk/bpftime/example/sslsniff/sslsniff
```

in another console, restart nginx

```sh
sudo BPFTIME_USE_JIT=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/agent/libbpftime-agent.so  nginx -c $(pwd)/nginx.conf -p $(pwd)

sudo BPFTIME_USE_AOT_INSN=true LD_PRELOAD=/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/runtime/agent/libbpftime-agent.so  nginx -c $(pwd)/nginx.conf -p $(pwd)
```

content:
```
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=ssl_data found at 5
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=start_ns found at 6
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:270] bpf_map_handler name=bufs found at 7
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=8 name=probe_SSL_rw_en
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=9 name=probe_SSL_do_ha
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=10 name=probe_SSL_read_
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=11 name=probe_SSL_write
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=12 name=probe_SSL_read_
[2024-07-06 14:30:09.434] [info] [bpftime_shm_json.cpp:265] find prog fd=13 name=probe_SSL_write
[2024-07-06 14:30:09.435] [info] [bpftime_shm_json.cpp:265] find prog fd=14 name=probe_SSL_do_ha
```

result:

| Data Size | Requests/sec  | Transfer/sec  |
|-----------|--------------|--------------|
| 1K        |      45268.17 |        14.07MB |
| 2K        |      45576.01 |        14.17MB |
| 4K        |      45066.85 |        14.01MB |
| 16K       |      44840.26 |        13.94MB |
| 128K      |      44651.80 |        13.88MB |
| 256K      |      45167.07 |        14.04MB |