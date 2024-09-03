import hashlib
import hmac
import argparse
import os
import subprocess
from elftools.elf.elffile import ELFFile

SECRET_KEY = b'your-secret-key'  # Replace this with your own secret key

def append_to_elf(elf_path, content, section_name):
    """
    Append data to an ELF section using llvm-objcopy.
    """
    content_file = f'/tmp/{section_name}.bin'
    try:
        # Write the content to a temporary file
        with open(content_file, 'wb') as temp_file:
            temp_file.write(content)

        # Use llvm-objcopy to add a new section with the content
        subprocess.run(['llvm-objcopy', '--add-section', f'{section_name}={content_file}', elf_path], check=True)
        print(f"Appended content to ELF section '{section_name}'.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to append to ELF using llvm-objcopy: {e}")
        raise
    finally:
        # Clean up temporary file
        if os.path.exists(content_file):
            os.remove(content_file)

def extract_from_elf(elf_path, section_name):
    """
    Extract data from a named section in the ELF file using pyelftools.
    """
    try:
        with open(elf_path, 'rb') as elf_file:
            elf = ELFFile(elf_file)
            section = elf.get_section_by_name(section_name)
            if not section:
                raise ValueError(f"Section {section_name} not found in ELF")

            return section.data()
    except Exception as e:
        print(f"Failed to extract from ELF: {e}")
        raise

def package_file(file_path, elf_path):
    if not os.path.isfile(file_path):
        print(f"File '{file_path}' not found.")
        return
    if not os.path.isfile(elf_path):
        print(f"ELF file '{elf_path}' not found.")
        return

    try:
        with open(file_path, 'rb') as f:
            file_data = f.read()

        file_name = os.path.basename(file_path)
        metadata = f"{file_name}:{len(file_data)}".encode()
        signature = hmac.new(SECRET_KEY, file_data + metadata, hashlib.sha256).hexdigest().encode()

        append_to_elf(elf_path, file_data, 'file_data')
        append_to_elf(elf_path, signature + b"\n" + metadata, 'signature')
    except Exception as e:
        print(f"Failed to package file into ELF: {e}")

def extract_file(elf_path):
    try:
        file_data = extract_from_elf(elf_path, 'file_data')
        signature_metadata = extract_from_elf(elf_path, 'signature')

        signature, metadata = signature_metadata.split(b"\n", 1)
        expected_signature = hmac.new(SECRET_KEY, file_data + metadata, hashlib.sha256).hexdigest().encode()

        if not hmac.compare_digest(expected_signature, signature):
            print("Invalid signature. Extraction failed.")
            return

        file_name, _ = metadata.decode().split(':')

        output_path = os.path.join(os.path.dirname(elf_path), file_name)
        with open(output_path, 'wb') as out_file:
            out_file.write(file_data)
        print(f"File extracted to: {output_path}")
    except ValueError as ve:
        print(ve)
    except Exception as e:
        print(f"Failed to extract file from ELF: {e}")

def main():
    parser = argparse.ArgumentParser(description='Package and extract files to/from ELF with signature verification.')

    subparsers = parser.add_subparsers(dest='command', help='sub-command help')

    package_parser = subparsers.add_parser('package', help='Package a file into an ELF')
    package_parser.add_argument('file', type=str, help='File to package')
    package_parser.add_argument('elf', type=str, help='Target ELF file')

    extract_parser = subparsers.add_parser('extract', help='Extract a file from an ELF')
    extract_parser.add_argument('elf', type=str, help='ELF file to extract from')

    args = parser.parse_args()

    if args.command == 'package':
        package_file(args.file, args.elf)
    elif args.command == 'extract':
        extract_file(args.elf)
    else:
        parser.print_help()

if __name__ == '__main__':
    main()

def package_file(file_path, elf_path):
    if not os.path.isfile(file_path):
        print(f"File '{file_path}' not found.")
        return
    if not os.path.isfile(elf_path):
        print(f"ELF file '{elf_path}' not found.")
        return

    try:
        with open(file_path, 'rb') as f:
            file_data = f.read()

        file_name = os.path.basename(file_path)
        metadata = f"{file_name}:{len(file_data)}".encode()
        signature = hmac.new(SECRET_KEY, file_data + metadata, hashlib.sha256).hexdigest().encode()

        append_to_elf(elf_path, file_data, 'file_data')
        append_to_elf(elf_path, signature + b"\n" + metadata, 'signature')
    except Exception as e:
        print(f"Failed to package file into ELF: {e}")

def extract_file(elf_path):
    try:
        file_data = extract_from_elf(elf_path, 'file_data')
        signature_metadata = extract_from_elf(elf_path, 'signature')

        signature, metadata = signature_metadata.split(b"\n", 1)
        expected_signature = hmac.new(SECRET_KEY, file_data + metadata, hashlib.sha256).hexdigest().encode()

        if not hmac.compare_digest(expected_signature, signature):
            print("Invalid signature. Extraction failed.")
            return

        file_name, _ = metadata.decode().split(':')

        output_path = os.path.join(os.path.dirname(elf_path), file_name)
        with open(output_path, 'wb') as out_file:
            out_file.write(file_data)
        print(f"File extracted to: {output_path}")
    except ValueError as ve:
        print(ve)
    except Exception as e:
        print(f"Failed to extract file from ELF: {e}")

def main():
    parser = argparse.ArgumentParser(description='Package and extract files to/from ELF with signature verification.')

    subparsers = parser.add_subparsers(dest='command', help='sub-command help')

    package_parser = subparsers.add_parser('package', help='Package a file into an ELF')
    package_parser.add_argument('file', type=str, help='File to package')
    package_parser.add_argument('elf', type=str, help='Target ELF file')

    extract_parser = subparsers.add_parser('extract', help='Extract a file from an ELF')
    extract_parser.add_argument('elf', type=str, help='ELF file to extract from')

    args = parser.parse_args()

    if args.command == 'package':
        package_file(args.file, args.elf)
    elif args.command == 'extract':
        extract_file(args.elf)
    else:
        parser.print_help()

if __name__ == '__main__':
    main()
