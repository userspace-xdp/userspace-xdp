#include "sslsniff.bpf.c"

int bpf_main(void *ctx_base)
{
  return probe_SSL_write_enter((struct pt_regs *)ctx_base);
}
