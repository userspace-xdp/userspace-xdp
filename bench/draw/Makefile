.PHONY: copy_and_rename plots

plots: plot_mode plot_optimize

plot_mode:
	python3 plot_mode.py

plot_optimize:
	python3 plot_optimize.py

copy_and_rename:
	cp -R ../xdp_lb xdp-load-balancer
	cp -R ../xdp_map_access xdp-counter 
	cp -R ../xdp_firewall xdp_firewall
	cp -R ../xdp-tcpclassify xdp-httpdump
	cp -R ../xdping xdping
