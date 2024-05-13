import re

# Sample data
output_data = """
1715573433.008508953: balancer_ingress()@exit[TX]: packet size 75 bytes, captured 75 bytes on if_index 25, rx queue 0, id 10
  0x0000:  de ad be ef 00 10 de ad be ef 00 01 08 00 45 00  ..............E.
  0x0010:  00 3d 00 00 00 00 40 04 af 02 ac 10 15 a9 0a 00  .=....@.........
  0x0020:  00 02 45 00 00 29 8f 7a 40 00 40 11 ce 7f 0a 00  ..E..).z@.@.....
  0x0030:  00 01 0a c8 c8 01 a8 15 26 94 00 15 dc f0 48 65  ........&.....He
  0x0040:  6c 6c 6f 20 53 65 72 76 65 72 21                 llo Server!
"""
# 

input_data = """
1715592828.037947142: balancer_ingress()@entry: packet size 55 bytes, captured 55 bytes on if_index 12, rx queue 0, id 10
  0x0000:  de ad be ef 00 10 de ad be ef 00 01 08 00 45 00  ..............E.
  0x0010:  00 29 28 99 40 00 40 11 35 61 0a 00 00 01 0a c8  .)(.@.@.5a......
  0x0020:  c8 01 e5 47 26 94 00 15 dc f0 48 65 6c 6c 6f 20  ...G&.....Hello 
  0x0030:  53 65 72 76 65 72 21                             Server!
"""
# sudo ./xdpdump -i veth6 -v -x

# Extract hex bytes from the log
hex_data = re.findall(r'\s0x[0-9a-fA-F]+:\s+([0-9a-fA-F ]+)', input_data)

# Join all hex bytes into a single string
hex_string = ''.join(hex_data).replace(' ', '')

# Convert hex string to binary data
binary_data = bytes.fromhex(hex_string)

# Write binary data to a file
with open('udp.bin', 'wb') as f:
    f.write(binary_data)

print("Data written to 'udp.bin'")
