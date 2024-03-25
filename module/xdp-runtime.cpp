#include "bpf_attach_ctx.hpp"
#include "bpftime_helper_group.hpp"
#include "bpftime_prog.hpp"
#include "bpftime_shm_internal.hpp"
#include "handler/prog_handler.hpp"
#include <bpftime_shm.hpp>
extern "C" {
uint64_t bpftime_csum_diff(uint64_t r1, uint64_t from_size, uint64_t r3,
			   uint64_t to_size, uint64_t seed);
uint64_t bpftime_xdp_adjust_tail(struct xdp_buff *xdp, __u64 offset);
uint64_t bpftime_redirect_map(uint64_t map, __u64 key, __u64 flags);
uint64_t bpftime_xdp_adjust_head(struct xdp_md_userspace * xdp, int offset);
}
#include <cassert>
#include <cstddef>
#include <cstdint>
#include <variant>
#include <vector>

using namespace bpftime;

static int selected_handler_id = -1;

static bpftime_prog *entry_prog = nullptr;
std::vector<bpftime_prog *> prog_list;

union bpf_attach_ctx_holder {
	bpf_attach_ctx ctx;
	bpf_attach_ctx_holder()
	{
	}
	~bpf_attach_ctx_holder()
	{
	}
	void destroy()
	{
		ctx.~bpf_attach_ctx();
	}
	void init()
	{
		new (&ctx) bpf_attach_ctx;
	}
};

static bpf_attach_ctx_holder ctx_holder;

bpftime::bpftime_helper_info csum_diff = { .index = 28,
					   .name = "bpftime_csum_diff",
					   .fn = (void *)bpftime_csum_diff };

bpftime::bpftime_helper_info xdp_adjust_tail = {
	.index = 65,
	.name = "bpf_xdp_adjust_tail",
	.fn = (void *)bpftime_xdp_adjust_tail
};

bpftime::bpftime_helper_info bpf_redirect_map = {
	.index = 51,
	.name = "bpf_redirect_map",
	.fn = (void *)bpftime_redirect_map
};

bpftime::bpftime_helper_info xdp_adjust_head = {
	.index = 44,
	.name = "bpf_xdp_adjust_head",
	.fn = (void *)bpftime_xdp_adjust_head
};

static bool if_enable_jit() {
	char *env = getenv("DISABLE_JIT");
	if (env != nullptr) {
		printf("disable JIT\n");
	}
	return env == nullptr;
}

int get_aot_object(std::vector<uint8_t> &buf)
{
	if (getenv("AOT_OBJECT_NAME") == nullptr) {
		fprintf(stderr, "No AOT object found\n");
		return -1;
	}
	const char *name = getenv("AOT_OBJECT_NAME");
	FILE *fp = fopen(name, "rb");
	if (!fp) {
		fprintf(stderr, "Failed to open file %s\n", name);
		return -1;
	}
	fseek(fp, 0, SEEK_END);
	size_t size = ftell(fp);
	fseek(fp, 0, SEEK_SET);
	buf.resize(size);
	size_t read_size = fread(buf.data(), 1, size, fp);
	if (read_size != size) {
		fprintf(stderr, "Failed to read file %s\n", name);
		return -1;
	}
	fclose(fp);
	return 0;
}

static int load_ebpf_programs()
{
	const handler_manager *manager =
		shm_holder.global_shared_memory.get_manager();
	size_t handler_size = manager->size();

	bool using_aot;
	std::vector<uint8_t> aot_buf;
	if (get_aot_object(aot_buf) == 0) {
		using_aot = true;
	} else {
		using_aot = false;
	}
	// TODO: fix load programs
	for (size_t i = 0; i < manager->size(); i++) {
		if (std::holds_alternative<bpf_prog_handler>(
			    manager->get_handler(i))) {
			const auto &prog = std::get<bpf_prog_handler>(
				manager->get_handler(i));
			// temp work around: we need to create new attach points
			// in the runtime
			// TODO: fix this hard code name
			auto new_prog = new bpftime_prog(prog.insns.data(),
							 prog.insns.size(),
							 prog.name.c_str());
			printf("find eBPF program %s   %d\n", prog.name.c_str(), prog.insns.size());
			prog_list.push_back(new_prog);
			bpftime_helper_group::get_kernel_utils_helper_group()
				.add_helper_group_to_prog(new_prog);
			bpftime_helper_group::get_shm_maps_helper_group()
				.add_helper_group_to_prog(new_prog);
			new_prog->bpftime_prog_register_raw_helper(csum_diff);
			new_prog->bpftime_prog_register_raw_helper(
				xdp_adjust_tail);
			new_prog->bpftime_prog_register_raw_helper(
				bpf_redirect_map);
			new_prog->bpftime_prog_register_raw_helper(
				xdp_adjust_head);
			if (using_aot) {
				int res = new_prog->load_aot_object(aot_buf);
				if (res < 0) {
					fprintf(stderr,
						"Failed to load aot object %s\n",
						prog.name.c_str());
					return -1;
				}
			} else {
				int res = new_prog->bpftime_prog_load(if_enable_jit());
				if (res < 0) {
					fprintf(stderr,
						"Failed to load eBPF program %s\n",
						prog.name.c_str());
					return -1;
				}
			}

			printf("load eBPF program %s\n", prog.name.c_str());
			if (prog.name == "xdp_pass") {
				entry_prog = new_prog;
				printf("set entry program %s\n",
				       prog.name.c_str());
			}
			return 0;
		}
	}
	return 0;
}

extern bpftime::bpftime_map_ops dev_map_ops;
extern bpftime::bpftime_map_ops lpm_map_ops;

static int register_maps()
{
	bpftime_register_map_ops(
		(int)bpftime::bpf_map_type::BPF_MAP_TYPE_DEVMAP, &dev_map_ops);
  bpftime_register_map_ops(
    (int)bpftime::bpf_map_type::BPF_MAP_TYPE_LPM_TRIE, &lpm_map_ops);
	return 0;
}

extern "C" int ebpf_module_init()
{
	bpftime_initialize_global_shm(shm_open_type::SHM_OPEN_ONLY);
	ctx_holder.init();
	load_ebpf_programs();
	register_maps();
	return -1;
}

extern "C" int ebpf_module_run_at_handler(void *mem, uint64_t mem_size,
					  uint64_t *ret)
{
	if (!entry_prog) {
		fprintf(stderr, "No prog found\n");
		return 0;
	}
	return entry_prog->bpftime_prog_exec(mem, mem_size, ret);
}