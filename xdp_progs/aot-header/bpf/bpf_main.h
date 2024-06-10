#ifndef BPF_MAIN_AOT_H
#define BPF_MAIN_AOT_H
struct xdp_md;

int xdp_pass(struct xdp_md *xdp);

int bpf_main(void *ctx_base)
{
  struct xdp_md *ctx = (struct xdp_md *)ctx_base;
  return xdp_pass(ctx);
}

#endif // BPF_MAIN_AOT_H
