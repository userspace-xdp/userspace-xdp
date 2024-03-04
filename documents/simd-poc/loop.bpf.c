#define SIZE 1024

struct data {
    int a[SIZE];
    int b[SIZE];
    int c[SIZE];
};

void add_arrays(struct data* d, int size) {
    // test vectorization
    for (int i = 0; i < SIZE; i++) {
        d->c[i] = d->a[i] + d->b[i];
    }
}
