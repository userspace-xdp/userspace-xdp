#define SIZE 1024

void add_arrays(int *a, int *b, int *result) {
    for (int i = 0; i < SIZE; ++i) {
        result[i] = a[i] + b[i];
    }
}
