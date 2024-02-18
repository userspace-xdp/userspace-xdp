# xdp-observer

A simple xdp application to observe tcp connections in userspace.

## How to run?

```
docker build . -t xdp-observer:latest
docker run -it --privileged xdp-observer:latest bash
/lib64/ld-linux-x86-64.so.2 --library-path /lib64 ./main eth0
```

### Screenshot

![alt text](sc.png)
