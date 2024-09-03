import sys
import subprocess
import shlex
import os
import shutil
from package import append_to_elf

def main():
    args = sys.argv[1:]

    if '-o' in args:
        output_index = args.index('-o') + 1
        if output_index < len(args):
            output_name = args[output_index]
            llvm_ir_name = output_name + ".ll"
            final_output_name = output_name + "_llvm.o"

            # Generate LLVM IR
            llvm_args = args + ['-S', '-emit-llvm', '-o', llvm_ir_name]
            llvm_command = 'clang ' + ' '.join(shlex.quote(arg) for arg in llvm_args)
            result = subprocess.run(llvm_command, shell=True)
            
            if result.returncode != 0:
                print("Failed to generate LLVM IR.")
                sys.exit(1)

            # Check if the output file was created
            if not os.path.exists(output_name):
                print(f"Output file {output_name} was not created.")
                sys.exit(1)

            # Create the third product by copying the binary and appending the LLVM IR
            shutil.copy(output_name, final_output_name)
            with open(llvm_ir_name, 'rb') as llvm_file:
                llvm_ir_content = llvm_file.read()
                append_to_elf(final_output_name, llvm_ir_content, 'llvm_ir')

    # Compile the source code
    clang_command = 'clang ' + ' '.join(shlex.quote(arg) for arg in args)
    result = subprocess.run(clang_command, shell=True)

    if result.returncode != 0:
        print("Compilation failed.")
        sys.exit(1)

if __name__ == '__main__':
    main()
