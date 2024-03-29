struct xdp_md
{
	void* data;
	void* data_end;
};

#define BUFFER_SIZE 64

int add_arrays(struct xdp_md *ctx) {
    char *data_end = ctx->data_end;
	char *data = ctx->data;
    char buffer[BUFFER_SIZE];
    int size = data_end - data;
    if (size < BUFFER_SIZE) {
        return -1;
    }
    // test vectorization
    for (int i = 0; i < BUFFER_SIZE; i++) {
        buffer[i] = data[i] + 1;
    }
    for (int i = 0; i < BUFFER_SIZE; i++) {
        data[i] = buffer[i];
    }
    return 0;
}
