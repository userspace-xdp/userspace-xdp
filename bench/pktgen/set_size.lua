package.path = package.path ..";?.lua;test/?.lua;app/?.lua;../?.lua"

require "Pktgen";

sendport	= 0;
pkt_size	= 64;
pktgen.set(sendport, "size", pkt_size);
