import json
import sys

def generate_hash_map_def(name, num_buckets, key_size, value_size):
    template = f"""#include "hash_map.h"

DEFINE_BPFTIME_HASH_MAP({name}, {num_buckets}, {key_size}, {value_size});

unsigned long long bpf_helper_ext_0001(unsigned long long map, unsigned long long key) {{
    return (unsigned long long)elem_lookup(&{name}, (const void*)key);
}}

unsigned long long bpf_helper_ext_0002(unsigned long long map, unsigned long long key, unsigned long long value, unsigned long long flags) {{
    return elem_update(&{name}, (const void*)key, (const void*)value);
}}

unsigned long long bpf_helper_ext_0003(unsigned long long map, unsigned long long key) {{
    return (unsigned long long)elem_delete(&{name}, (const void*)key);
}}
"""
    return template

def generate_array_map_def(name, num_buckets, value_size):
    template = f"""#include "hash_map.h"

char {name}[{value_size} * {num_buckets}];
"""
    return template

def process_json(json_data):
    c_code = ""
    for key, value in json_data.items():
        for sub_key, sub_value in value.items():
            if 'attr' in sub_value:
                name = sub_value['name']
                num_buckets = sub_value['attr']['max_entries']
                key_size = sub_value['attr']['key_size']
                value_size = sub_value['attr']['value_size']
                map_type = sub_value['attr']['map_type']

                if map_type == 1:
                    c_code += generate_hash_map_def(name, num_buckets, key_size, value_size)
                else:
                    c_code += generate_array_map_def(name, num_buckets, value_size)
                c_code += "\n"
    return c_code

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <your_json_file.json>")
        sys.exit(1)

    json_file = sys.argv[1]

    # Load JSON data
    with open(json_file, 'r') as f:
        data = json.load(f)

    # Generate C code
    c_code = process_json(data)

    # Print or save the generated C code
    print(c_code)
    # Optionally, you can save it to a file
    # with open('output.c', 'w') as f:
    #     f.write(c_code)
