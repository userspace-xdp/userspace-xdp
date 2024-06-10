-- CGCS Demo script
--
-- SPDX-License-Identifier: BSD-3-Clause

package.path = package.path .. ";?.lua;test/?.lua;app/?.lua;../?.lua"

require "Pktgen";

sendport = 0;
recvport = 0;
pkt_size	= 64;
local dstip = "192.168.1.13";
local srcip = "192.168.1.11";
local netmask = "/24";
local total_time = 60;

-- Stop the port sending and reset to
pktgen.stop(sendport);
sleep(2);  -- Wait for stop to happen (not really needed)

pktgen.set_ipaddr(sendport, "dst", dstip);
pktgen.set_ipaddr(sendport, "src", srcip .. netmask);
pktgen.set_mac(sendport, "dst", "b8:3f:d2:2a:e7:69")
pktgen.set_proto(sendport .. "," .. recvport, "tcp");
-- v is the table to values created by the Set(x,y) functio
pktgen.set(sendport, "size", pkt_size);

pktgen.range.src_ip(sendport, "start", "192.168.1.11");
pktgen.range.src_ip(sendport, "inc", "0.0.0.0");
pktgen.range.src_ip(sendport, "min", "192.168.1.11");
pktgen.range.src_ip(sendport, "max", "192.168.1.11");
pktgen.range.src_port(sendport, "start", 0);
pktgen.range.src_port(sendport, "inc", 1);
pktgen.range.src_port(sendport, "min", 0);

-- modify this to set the range of src port
pktgen.range.src_port(sendport, "max", 1000);

pktgen.range.dst_ip(sendport, "start", "192.168.1.13");
pktgen.range.dst_ip(sendport, "inc", "0.0.0.0");
pktgen.range.dst_ip(sendport, "min", "192.168.1.13");
pktgen.range.dst_ip(sendport, "max", "192.168.1.13");
pktgen.range.dst_port(sendport, "start", 5678);
pktgen.range.dst_port(sendport, "inc", 0);
pktgen.range.dst_port(sendport, "min", 5678);
pktgen.range.dst_port(sendport, "max", 5678);
pktgen.range.dst_mac(sendport, "start", "b8:3f:d2:2a:e7:69");
pktgen.range.dst_mac(sendport, "inc", "00:00:00:00:00:00");
pktgen.range.dst_mac(sendport, "min", "b8:3f:d2:2a:e7:69");
pktgen.range.dst_mac(sendport, "max", "b8:3f:d2:2a:e7:69");
pktgen.set_range(sendport, "on");

printf("   Percent 100 load  %d seconds\n", total_time);

-- Set the rate to the new value
pktgen.set(sendport, "rate", 100);

-- If not sending packets start sending them
printf("\n**** Traffic Profile start\n");

pktgen.start(sendport);

-- Sleep until we need to move to the next rate and timeout
sleep(total_time);

-- Stop the port and do some cleanup
pktgen.stop(sendport);

printf("\n*** Traffic Profile Done (Total Time %d) ***\n", total_time);
