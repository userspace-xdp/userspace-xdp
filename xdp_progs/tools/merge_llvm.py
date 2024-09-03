import sys
import subprocess

def merge_llvm_ir(output_file, file1, file2):
    try:
        # Run the llvm-link command
        subprocess.run(['llvm-link', '-S', '-o', output_file, file1, file2], check=True)
        print(f"Merged {file1} and {file2} into {output_file}")
    except subprocess.CalledProcessError as e:
        print(f"Error while merging files: {e}")
        sys.exit(1)

if __name__ == '__main__':
    if len(sys.argv) != 4:
        print("Usage: python merge_llvm_ir.py <output.ll> <file1.ll> <file2.ll>")
        sys.exit(1)

    output_file = sys.argv[1]
    file1 = sys.argv[2]
    file2 = sys.argv[3]

    merge_llvm_ir(output_file, file1, file2)
