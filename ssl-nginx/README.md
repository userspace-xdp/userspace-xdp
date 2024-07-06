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
nginx -c $(pwd)/nginx.conf -p $(pwd)
```

## Test for no effect

You should test each for 10 seconds, and record the result in test-log.txt. repeated 3 times.

```console
$ make test-log.txt
wrk/wrk https://127.0.0.1:4043/index.html -c 512 -t 4 -d 10 >> test-log.txt
wrk/wrk https://127.0.0.1:4043/data/example1k.txt -c 512 -t 4 -d 10 >> test-log.txt
wrk/wrk https://127.0.0.1:4043/data/example2k.txt -c 512 -t 4 -d 10 >> test-log.txt
...
```

| Data Size | Requests/sec | Transfer/sec |
|-----------|--------------|--------------|
| 1K        |      12302.14 |        15.05MB |
| 2K        |      11328.92 |        24.89MB |
| 4K        |      10883.19 |        45.12MB |
| 16K       |       7263.48 |       115.01MB |
| 128K      |       2869.12 |       358.33MB |
| 256K      |       1757.73 |       438.65MB |

## Test for kernel sslsniff

In one console, it will hook nginx:

```console
$ sudo ./sslsniff 
OpenSSL path: /lib/x86_64-linux-gnu/libssl.so.3
GnuTLS path: /lib/x86_64-linux-gnu/libgnutls.so.30
NSS path: /lib/x86_64-linux-gnu/libnspr4.so
FUNC         TIME(s)            COMM             PID     LEN    
lost 194 events on CPU #2
lost 61 events on CPU #3
^CTotal events: 260335 
```

This sslsniff is from bpftime/example/sslsniff/sslsniff. The userspace part modified to not print the packet content out.

| Data Size | Requests/sec | Transfer/sec |
|-----------|--------------|--------------|
| 1K        |       5344.41 |         6.54MB |
| 2K        |       5880.44 |        12.92MB |
| 4K        |       5620.01 |        23.30MB |
| 16K       |       3688.97 |        58.42MB |
| 128K      |       1925.22 |       240.46MB |
| 256K      |       1242.59 |       310.10MB |

## test for userspace sslsniff

Note: you need to config bpftime to:

1. No locks in hash maps and array maps
2. Using ubpf JIT
3. Using LTO

in one console, start userspace sslsniff

```sh
sudo BPFTIME_USE_JIT=true LD_PRELOAD=build/runtime/syscall-server/libbpftime-syscall-server.so example/sslsniff/sslsniff
```

in another console, restart nginx

```sh
sudo BPFTIME_USE_JIT=true LD_PRELOAD=build/runtime/agent/libbpftime-agent.so nginx -c nginx.conf -p benchmark/ssl-nginx
# or sudo LD_PRELOAD=build/runtime/agent/libbpftime-agent.so nginx -c nginx.conf -p benchmark/ssl-nginx
```

| Data Size | Requests/sec | Transfer/sec |
|-----------|--------------|--------------|
| 1K        |       9311.06 |        11.39MB |
| 2K        |       9528.57 |        20.93MB |
| 4K        |       9504.57 |        39.40MB |
| 16K       |       6473.85 |       102.50MB |
| 128K      |       2567.10 |       320.62MB |
| 256K      |       1657.66 |       413.66MB |
