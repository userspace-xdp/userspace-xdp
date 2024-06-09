#include <stdio.h>
#include <assert.h>
#include <string.h>
#include "hash_map.h"

DEFINE_BPFTIME_HASH_MAP(my_map, 128, 16, 32); // Create a hash map with 128 buckets, 16-byte keys, and 32-byte values

void test_insert_and_lookup() {
    const char key1[16] = "key1";
    const char value1[32] = "value1";
    const char key2[16] = "key2";
    const char value2[32] = "value2";

    // Insert key1
    assert(elem_update(&my_map, key1, value1) == 1 && "Failed to insert key1");

    // Insert key2
    assert(elem_update(&my_map, key2, value2) == 1 && "Failed to insert key2");

    // Lookup key1
    char *retrieved_value1 = (char *)elem_lookup(&my_map, key1);
    assert(retrieved_value1 != NULL && "Key1 not found");
    assert(memcmp(retrieved_value1, value1, 32) == 0 && "Value for key1 is incorrect");

    // Lookup key2
    char *retrieved_value2 = (char *)elem_lookup(&my_map, key2);
    assert(retrieved_value2 != NULL && "Key2 not found");
    assert(memcmp(retrieved_value2, value2, 32) == 0 && "Value for key2 is incorrect");
}

void test_delete() {
    const char key1[16] = "key1";

    // Delete key1
    assert(elem_delete(&my_map, key1) == 1 && "Failed to delete key1");

    // Attempt to lookup deleted key1
    char *retrieved_value1 = (char *)elem_lookup(&my_map, key1);
    assert(retrieved_value1 == NULL && "Key1 found after deletion");
}

void test_count() {
    // After deletion of key1, only key2 should remain
    assert(get_elem_count(&my_map) == 1 && "Element count is incorrect after deletion");
}

int main() {
    test_insert_and_lookup();
    test_delete();
    test_count();

    printf("All tests passed successfully.\n");

    return 0;
}

