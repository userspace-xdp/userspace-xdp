package.path = package.path ..";?.lua;test/?.lua;app/?.lua;../?.lua"

require "Pktgen";

sendport	= 0;

statRx = pktgen.portStats("0", "port");
prints("DEBUG portStats", statRx);
pktgen.quit();
-- log the results to file in /home/yunwei/ebpf-xdp-dpdk/bench/tmp_res_dir/pktgen
