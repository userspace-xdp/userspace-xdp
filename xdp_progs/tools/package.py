import hashlib
import hmac
import argparse
import os

SECRET_KEY = b'your-secret-key'  # Replace this with your own secret key

def append_to_elf(elf_path, content, section_name):
    """
    Append data to the end of the ELF file, along with metadata.
    This is a simplified approach and doesn't modify ELF sections.
    """
    with open(elf_path, 'ab') as elf_file:
        elf_file.write(f"\n###{section_name}###\n".encode())
        elf_file.write(content)
        elf_file.write(f"\n###END_{section_name}###\n".encode())

def extract_from_elf(elf_path, section_name):
    """
    Extract appended data from the ELF file, based on metadata markers.
    """
    with open(elf_path, 'rb') as elf_file:
        content = elf_file.read()
    
    start_marker = f"\n###{section_name}###\n".encode()
    end_marker = f"\n###END_{section_name}###\n".encode()

    start = content.find(start_marker) + len(start_marker)
    end = content.find(end_marker, start)
    
    if start == -1 or end == -1:
        raise ValueError(f"Section {section_name} not found in ELF")

    return content[start:end]

def package_file(file_path, elf_path):
    if not os.path.isfile(file_path) or not os.path.isfile(elf_path):
        raise ValueError("File or ELF not found")

    with open(file_path, 'rb') as f:
        file_data = f.read()

    file_name = os.path.basename(file_path)
    metadata = f"{file_name}:{len(file_data)}".encode()
    signature = hmac.new(SECRET_KEY, file_data + metadata, hashlib.sha256).hexdigest().encode()

    append_to_elf(elf_path, file_data, 'file_data')
    append_to_elf(elf_path, signature + b"\n" + metadata, 'signature')

def extract_file(elf_path):
    try:
        file_data = extract_from_elf(elf_path, 'file_data')
        signature_metadata = extract_from_elf(elf_path, 'signature')
    except ValueError as e:
        print(e)
        return

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
