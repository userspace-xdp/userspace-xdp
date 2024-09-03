import sys
import subprocess
import shlex
import os
import shutil
from package import append_to_elf

def main():
    # Retrieve all the arguments passed to the script (excluding the script name)
    args = sys.argv[1:]

    if '-o' in args:
        # Find the index of the output file argument
        output_index = args.index('-o') + 1
        if output_index < len(args):
            output_name = args[output_index]
            llvm_ir_name = output_name + ".ll"
            final_output_name = output_name + "_llvm.o"
            
            # Create a new argument list for generating the LLVM IR
            llvm_args = args + ['-S', '-emit-llvm', '-o', llvm_ir_name]
            
            # Run clang with the modified arguments for generating LLVM IR
            llvm_command = 'clang ' + ' '.join(shlex.quote(arg) for arg in llvm_args)
            subprocess.run(llvm_command, shell=True)

            # Create the third product by copying the binary and appending the LLVM IR
            shutil.copy(output_name, final_output_name)
            with open(llvm_ir_name, 'rb') as llvm_file:
                llvm_ir_content = llvm_file.read()
                append_to_elf(final_output_name, llvm_ir_content, 'llvm_ir')

    # Run clang with the original arguments to generate the specified output
    clang_command = 'clang ' + ' '.join(shlex.quote(arg) for arg in args)
    subprocess.run(clang_command, shell=True)

if __name__ == '__main__':
    main()
