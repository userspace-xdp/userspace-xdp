#include "test.hpp"
#include <stdio.h>

int print(int a) {
    printf("Hello, World!\n");
    printf("a = %d\n", globalVariable);
    printf("a = %d\n", globalVariable2);
    return 0;
}