import subprocess
import time
import re

def extract_pkt_size():
    find_pkt_size_cmd = [
        "ssh", "yunwei@octopus1.doc.res.ic.ac.uk", "-i", "/home/yunwei/.ssh/id_rsa1",
        "grep 'pkt_size\\s*=' /home/yunwei/ebpf-xdp-dpdk/bench/pktgen/traffic-profile-basic.lua | awk -F '=' '{print $2}' | tr -d '; \\t\\n' | head -n 1"
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

want_pkt_size = 128

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
time.sleep(10)

# Run the socat command in another subprocess
# Note: The input redirection ("<") won't work directly in subprocess.Popen.
# You would need to read the file content and pass it to stdin of the subprocess.
with open('/home/yunwei/ebpf-xdp-dpdk/bench/pktgen/show.lua', 'rb') as file_content:
    socat_process = subprocess.Popen(socat_cmd[:-2], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    socat_output, socat_errors = socat_process.communicate(input=file_content.read())

# Optional: Check outputs or errors
print("SOCAT Output:", socat_output.decode())
if socat_errors:
    print("SOCAT Errors:", socat_errors.decode())
