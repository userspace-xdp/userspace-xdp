-- CGCS Demo script
--
-- SPDX-License-Identifier: BSD-3-Clause

package.path = package.path .. ";?.lua;test/?.lua;app/?.lua;../?.lua"

require "Pktgen";

sendport = 0;
recvport = 0;
pkt_size	= 256;
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
pktgen.set_proto(sendport, "icmp");
-- v is the table to values created by the Set(x,y) functio

pktgen.set(sendport, "size", pkt_size);

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
