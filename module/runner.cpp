#include <string>

int bpftime_run_xdp_program(int id,
			     const std::string &data_in_file, int repeat_N, const std::string &run_type);

int main(int argc, char **argv) {
    if (argc != 5) {
        printf("Usage: %s <id> <data_in_file> <repeat N> <run type>\n", argv[0]);
        return 1;
    }

    int id = std::stoi(argv[1]);
    std::string data_in_file = argv[2];
    int repeat_N = std::stoi(argv[3]);
    std::string run_type = argv[4];

    return bpftime_run_xdp_program(id, data_in_file, repeat_N, run_type);
}
