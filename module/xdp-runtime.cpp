#include "bpf_attach_ctx.hpp"
#include "bpftime_helper_group.hpp"
#include "bpftime_prog.hpp"
#include "bpftime_shm_internal.hpp"
#include "handler/prog_handler.hpp"
#include <bpftime_shm.hpp>
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <variant>

using namespace bpftime;

static int selected_handler_id = -1;

static bpftime_prog *prog;

union bpf_attach_ctx_holder
{
  bpf_attach_ctx ctx;
  bpf_attach_ctx_holder() {}
  ~bpf_attach_ctx_holder() {}
  void destroy() { ctx.~bpf_attach_ctx(); }
  void init() { new (&ctx) bpf_attach_ctx; }
};

static bpf_attach_ctx_holder ctx_holder;

extern "C" int ebpf_module_init()
{
  bpftime_initialize_global_shm(shm_open_type::SHM_OPEN_ONLY);
  ctx_holder.init();

  const handler_manager *manager =
      shm_holder.global_shared_memory.get_manager();
  // TODO: fix load programs
  for (size_t i = 0; i < manager->size(); i++)
  {
    if (std::holds_alternative<bpf_prog_handler>(manager->get_handler(i)))
    {
      const auto &prog = std::get<bpf_prog_handler>(manager->get_handler(i));
      // temp work around: we need to create new attach points in the runtime
      // TODO: fix this hard code name
      if (prog.name == "xdp_pass")
      {
        ::prog = new bpftime_prog(prog.insns.data(), prog.insns.size(),
                                  prog.name.c_str());
        bpftime_helper_group::get_kernel_utils_helper_group()
            .add_helper_group_to_prog(::prog);
        bpftime_helper_group::get_shm_maps_helper_group()
            .add_helper_group_to_prog(::prog);
        ::prog->bpftime_prog_load(false);
        printf("load eBPF program xdp_pass\n");
        return 0;
      }
    }
  }
  return -1;
}

extern "C" int ebpf_module_run_at_handler(void *mem, uint64_t mem_size,
                                     uint64_t *ret)
{
  if (!prog) {
    fprintf(stderr, "No prog found\n");
    return 0;
  }
  return prog->bpftime_prog_exec(mem, mem_size, ret);
}