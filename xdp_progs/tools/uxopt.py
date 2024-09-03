import subprocess
import sys
import json
import os
import tempfile
from generate_maps import process_json

def generate_helper_and_map_definitions(json_file):
    with open(json_file, 'r') as f:
        data = json.load(f)
    return process_json(data)

def compile_c_to_llvm_ir(c_code, output_filename):
    # Save the generated C code to a temporary file
    with tempfile.NamedTemporaryFile(delete=False, suffix='.c') as temp_c_file:
        temp_c_file.write(c_code.encode('utf-8'))
        temp_c_file_path = temp_c_file.name
    
    # Compile the C code to LLVM IR
    llvm_ir_file = output_filename + ".ll"
    subprocess.run(['clang', '-S', '-emit-llvm', '-o', llvm_ir_file, temp_c_file_path], check=True)
    
    # Cleanup
    os.remove(temp_c_file_path)
    
    return llvm_ir_file

def link_llvm_ir_files(input_ir, helper_ir, output_ir):
    # Link the two LLVM IR files
    subprocess.run(['llvm-link', '-S', input_ir, helper_ir, '-o', output_ir], check=True)

def mark_functions_inline(llvm_ir_file, output_ir_file):
    with open(llvm_ir_file, 'r') as ir_file:
        ir_content = ir_file.read()

    # Mark all functions for inlining by adding `alwaysinline` attribute
    inlined_ir_content = ir_content.replace('define ', 'define alwaysinline ')

    with open(output_ir_file, 'w') as out_file:
        out_file.write(inlined_ir_content)

def uxopt_main(input_ir, json_file, output_ir):
    # Step 1: Generate helper and map definitions
    c_code = generate_helper_and_map_definitions(json_file)
    
    # Step 2: Compile generated C code to LLVM IR
    helper_ir_file = compile_c_to_llvm_ir(c_code, "helper_ir")

    # Step 3: Link the provided LLVM IR with the generated LLVM IR
    linked_ir_file = "linked_ir.ll"
    link_llvm_ir_files(input_ir, helper_ir_file, linked_ir_file)

    # Step 4: Mark functions as always inline and produce the final output LLVM IR
    mark_functions_inline(linked_ir_file, output_ir)

    # Cleanup
    os.remove(helper_ir_file)
    os.remove(linked_ir_file)

    print(f"Optimization and inlining complete. Output written to {output_ir}")

def main():
    if len(sys.argv) != 4:
        print("Usage: python3 uxopt.py <input_ir.ll> <json_file> <output_ir.ll>")
        sys.exit(1)
    
    input_ir = sys.argv[1]
    json_file = sys.argv[2]
    output_ir = sys.argv[3]

    uxopt_main(input_ir, json_file, output_ir)

if __name__ == "__main__":
    main()
