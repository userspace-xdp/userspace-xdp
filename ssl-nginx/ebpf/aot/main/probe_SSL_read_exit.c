#include "sslsniff.bpf.c"

int bpf_main(void *ctx_base)
{
  return probe_SSL_read_exit((struct pt_regs *)ctx_base);
}
