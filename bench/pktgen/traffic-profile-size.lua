-- CGCS Demo script
--
-- SPDX-License-Identifier: BSD-3-Clause

package.path = package.path ..";?.lua;test/?.lua;app/?.lua;../?.lua"

require "Pktgen";

local time_step = 10;		-- seconds
local pcnt_size = { 64, 128, 256, 512, 1024};

sendport	= 0;
recvport	= 0;
local dstip = "192.168.1.13";
local srcip = "192.168.1.11";
local netmask = "/24";
total_time = 0;

-- Take two lists and create one table with a merged value of the tables.
-- Return a set or table = { { timo, size }, ... }
function Set(step, list)
	local	set = { };		-- Must have a empty set first.

	for i,v in ipairs(list) do
		set[i] = { timo = step, size = v };
	end

	return set;
end

function main()
	local sending = 0;
	local trlst = Set(time_step, pcnt_size);

	-- Stop the port sending and reset to
	pktgen.stop(sendport);
	sleep(2);					-- Wait for stop to happen (not really needed)

	-- Set up the default packet size fixed value for now.


	pktgen.set_ipaddr(sendport, "dst", dstip);
	pktgen.set_ipaddr(sendport, "src", srcip..netmask);
	pktgen.set_mac(sendport, "dst", "b8:3f:d2:2a:e7:69")
	pktgen.set_proto(sendport..","..recvport, "tcp");

	total_time = 0;
	-- v is the table to values created by the Set(x,y) function
	for _,v in pairs(trlst) do

		printf("   Size load %d for %d seconds\n", v.size, v.timo);

		-- Set the Size to the new value
		pktgen.set(sendport, "size", v.size);

		-- If not sending packets start sending them
		if ( sending == 0 ) then
			pktgen.start(sendport);
			sending = 1;
		end

		-- Sleep until we need to move to the next Size and timeout
		sleep(v.timo);
		total_time = total_time + v.timo;

	end

	-- Stop the port and do some cleanup
	pktgen.stop(sendport);
	sending = 0;
end

main();
printf("\n*** Traffic Profile Done (Total Time %d) ***\n", total_time);
