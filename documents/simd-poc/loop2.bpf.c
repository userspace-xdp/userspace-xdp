int add_arrays(char *data) {
    for (int i = 0; i < 64; i++) {
        data[i] = data[i + 64] + 1;
    }
    return 0;
}
