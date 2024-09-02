#ifndef __COMMON_H
#define __COMMON_H

struct event
{
    int sport;
    int dport;
    int sip;
    int dip;
    int syn;
    int fin;
    int rst;
    int psh;
    int ack;
    int http;
    unsigned int len;
    unsigned char data[256];
};

#endif