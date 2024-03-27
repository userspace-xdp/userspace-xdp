import subprocess
import time
import argparse
import re

# Setup command-line argument parsing
parser = argparse.ArgumentParser(description="Run pktgen with specified packet size and save SOC output.")
parser.add_argument("pkt_size", type=int, help="The desired packet size for pktgen.")
parser.add_argument("output_file", type=str, help="The file to save SOC output.")
args = parser.parse_args()

# The other script will be executed on the remote machine with 10 seconds
wait_seconds = 20
run_seconds = 10

def extract_pkt_size():
    find_pkt_size_cmd = [
        "ssh", "yunwei@octopus1.doc.res.ic.ac.uk", "-i", "/home/yunwei/.ssh/id_rsa1",
        "grep -m 1 'pkt_size\\s*=' /home/yunwei/ebpf-xdp-dpdk/bench/pktgen/traffic-profile-basic.lua | awk -F '=' '{print $2}' | tr -d '; \\t\\n'"
    ]

    try:
        result = subprocess.run(find_pkt_size_cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        pkt_size_output = result.stdout.strip()
        print("Output from remote command:", pkt_size_output)
        return pkt_size_output
    except subprocess.CalledProcessError as e:
        print("Failed to extract pkt_size:", e.stderr)
        exit(1)

def modify_pkt_size(new_size):
    modify_cmd = [
        "ssh", "yunwei@octopus1.doc.res.ic.ac.uk", "-i", "/home/yunwei/.ssh/id_rsa1",
        f"sed -i '/pkt_size\\s*=\\s*/c\\pkt_size\\t= {new_size};' /home/yunwei/ebpf-xdp-dpdk/bench/pktgen/traffic-profile-basic.lua"
    ]

    try:
        subprocess.run(modify_cmd, check=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        print(f"pkt_size successfully updated to {new_size}.")
    except subprocess.CalledProcessError as e:
        print("Failed to modify pkt_size:", e.stderr)
        exit(1)

# Example usage:
pkt_size = extract_pkt_size()
print(f"Extracted pkt_size: {pkt_size}")

# Use the command-line argument for packet size
want_pkt_size = args.pkt_size

# Example modification (change the value as needed):
modify_pkt_size(want_pkt_size)

# Command to run pktgen via SSH
ssh_cmd = [
    "ssh", "-t", "yunwei@octopus1.doc.res.ic.ac.uk", "-i", "/home/yunwei/.ssh/id_rsa1",
    "cd ~/ebpf-xdp-dpdk/Pktgen-DPDK && sudo -E LD_LIBRARY_PATH=/home/yunwei/install-dir/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH ./Builddir/app/pktgen -l 0-2 -n 4 -a 18:00.1 -- -P -m \"[1-2].0\" -f /home/yunwei/ebpf-xdp-dpdk/bench/pktgen/traffic-profile-basic.lua -g 146.179.4.8:0x5606"
]

# Command to run socat after waiting
socat_cmd = [
    "socat", "-",
    "TCP4:146.179.4.8:22022",
    "<", "/home/yunwei/ebpf-xdp-dpdk/bench/pktgen/show.lua"
]

# Run the SSH command in a subprocess
ssh_process = subprocess.Popen(ssh_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE)

# Wait for 10 seconds
time.sleep(wait_seconds)

# Run the socat command in another subprocess
# Note: The input redirection ("<") won't work directly in subprocess.Popen.
# You would need to read the file content and pass it to stdin of the subprocess.
with open('/home/yunwei/ebpf-xdp-dpdk/bench/pktgen/show.lua', 'rb') as file_content:
    socat_process = subprocess.Popen(socat_cmd[:-2], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    socat_output, socat_errors = socat_process.communicate(input=file_content.read())

# Optional: Check outputs or errors
# print("SOCAT Output:", socat_output.decode())
# save the output to a file
with open(args.output_file, 'wb') as f:
    f.write(socat_output)

def parse_file(file_path):
    """
    Parse the given file to extract the 'ipackets' metric.
    """
    ipackets_pattern = re.compile(r'\["ipackets"\]\s*=\s*(\d+)')
    with open(file_path, 'r') as file:
        content = file.read()
        match = ipackets_pattern.search(content)
        if match:
            ipackets = int(match.group(1))
        else:
            ipackets = 0  # Default to 0 if not found
        ipackets = ipackets / run_seconds
    return ipackets

print("Output saved to:", args.output_file)
print("pkt_size:", pkt_size)
print("parse_file ipackets:", parse_file(args.output_file))

# if socat_errors:
#     print("SOCAT Errors:", socat_errors.decode())
