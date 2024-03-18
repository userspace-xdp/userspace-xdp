struct xdp_md
{
	void* data;
	void* data_end;
};


int add_arrays(struct xdp_md *ctx) {
    char *data_end = ctx->data_end;
	char *data = ctx->data;
    int size = data_end - data;
    // test vectorization
    for (int i = 0; i < size; i++) {
        data[i] = data[i] + 1;
    }
    return 0;
}
