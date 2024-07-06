// SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause)
// Copyright (c) 2023 Yusheng Zheng
//
// Based on sslsniff from BCC by Adrian Lopez & Mark Drayton.
// 15-Aug-2023   Yusheng Zheng   Created this.
#ifndef __SSLSNIFF_H
#define __SSLSNIFF_H

#define MAX_BUF_SIZE 8192
#define TASK_COMM_LEN 16

struct probe_SSL_data_t {
    unsigned long long timestamp_ns;
    unsigned long long delta_ns;
    unsigned int pid;
    unsigned int tid;
    unsigned int uid;
    unsigned int len;
    unsigned int fd;
    int buf_filled;
    int rw;
    char comm[TASK_COMM_LEN];
    unsigned char buf[MAX_BUF_SIZE];
    int is_handshake;
};

#endif /* __SSLSNIFF_H */
