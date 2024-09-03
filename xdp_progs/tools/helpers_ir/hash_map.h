#ifndef BPFTIME_HASH_MAP_H
#define BPFTIME_HASH_MAP_H
// The same version and algorithm of the hash map impl in bpftime

#define DEFINE_BPFTIME_HASH_MAP(name, num_buckets, key_size, value_size) \
    unsigned char name##_data[(num_buckets) * (4 + (key_size) + (value_size))] = {0}; \
    bpftime_hash_map_t name = {num_buckets, key_size, value_size, name##_data}

typedef struct {
    unsigned int num_buckets;
    unsigned int key_size;
    unsigned int value_size;
    unsigned char *data_buffer;
} bpftime_hash_map_t;

static inline unsigned int get_elem_offset(const bpftime_hash_map_t *map, unsigned int index) {
    return index * (4 + map->key_size + map->value_size);
}

static unsigned int hash_func(const void *key, unsigned int key_size) {
    unsigned int hash = 0;
    for (unsigned int i = 0; i < key_size; i++) {
        hash = hash * 31 + ((unsigned char *)key)[i];
    }
    return hash;
}

static inline int is_empty(const bpftime_hash_map_t *map, unsigned int index) {
    return *(unsigned int *)&map->data_buffer[get_elem_offset(map, index)] == 0;
}

static inline void set_empty(bpftime_hash_map_t *map, unsigned int index) {
    *(unsigned int *)&map->data_buffer[get_elem_offset(map, index)] = 0;
}

static inline void set_filled(bpftime_hash_map_t *map, unsigned int index) {
    *(unsigned int *)&map->data_buffer[get_elem_offset(map, index)] = 1;
}

static inline void *get_key(const bpftime_hash_map_t *map, unsigned int index) {
    return &map->data_buffer[get_elem_offset(map, index) + 4];
}

static inline void *get_value(const bpftime_hash_map_t *map, unsigned int index) {
    return &map->data_buffer[get_elem_offset(map, index) + 4 + map->key_size];
}

static void *elem_lookup(bpftime_hash_map_t *map, const void *key) {
    unsigned int index = hash_func(key, map->key_size) % map->num_buckets;
    unsigned int start_index = index;
    do {
        if (is_empty(map, index)) {
            return 0;
        }
        unsigned char *elem_key = (unsigned char *)get_key(map, index);
        int match = 1;
        for (unsigned int i = 0; i < map->key_size; ++i) {
            if (elem_key[i] != ((unsigned char *)key)[i]) {
                match = 0;
                break;
            }
        }
        if (match) {
            return get_value(map, index);
        }
        index = (index + 1) % map->num_buckets;
    } while (index != start_index);
    return 0;
}

static int elem_update(bpftime_hash_map_t *map, const void *key, const void *value) {
    unsigned int index = hash_func(key, map->key_size) % map->num_buckets;
    unsigned int start_index = index;
    do {
        unsigned char *elem_key = (unsigned char *)get_key(map, index);
        int match = is_empty(map, index);
        if (!match) {
            match = 1;
            for (unsigned int i = 0; i < map->key_size; ++i) {
                if (elem_key[i] != ((unsigned char *)key)[i]) {
                    match = 0;
                    break;
                }
            }
        }
        if (match) {
            for (unsigned int i = 0; i < map->key_size; ++i) {
                elem_key[i] = ((unsigned char *)key)[i];
            }
            unsigned char *elem_value = (unsigned char *)get_value(map, index);
            for (unsigned int i = 0; i < map->value_size; ++i) {
                elem_value[i] = ((unsigned char *)value)[i];
            }
            set_filled(map, index);
            return 1;
        }
        index = (index + 1) % map->num_buckets;
    } while (index != start_index);
    return 0; // Hash map is full
}

static int elem_delete(bpftime_hash_map_t *map, const void *key) {
    unsigned int index = hash_func(key, map->key_size) % map->num_buckets;
    unsigned int start_index = index;
    do {
        if (is_empty(map, index)) {
            return 0; // Key not found
        }
        unsigned char *elem_key = (unsigned char *)get_key(map, index);
        int match = 1;
        for (unsigned int i = 0; i < map->key_size; ++i) {
            if (elem_key[i] != ((unsigned char *)key)[i]) {
                match = 0;
                break;
            }
        }
        if (match) {
            set_empty(map, index);
            return 1;
        }
        index = (index + 1) % map->num_buckets;
    } while (index != start_index);
    return 0; // Key not found
}

static unsigned int get_elem_count(const bpftime_hash_map_t *map) {
    unsigned int count = 0;
    for (unsigned int i = 0; i < map->num_buckets; ++i) {
        if (!is_empty(map, i)) {
            ++count;
        }
    }
    return count;
}

#endif // BPFTIME_HASH_MAP_H
