# test run with moongen

In a new vm(In Vmware), start a 18.04 instance.

## create dev

If by "create dev," you're referring to creating a virtual network device or interface for testing or development purposes without affecting the physical network interface (`ens33` in your case), then yes, it's possible on Linux systems. One common approach is to use network namespaces and virtual ethernet (veth) pairs, or you could use a tap interface depending on your requirements. Here's a brief overview of both methods:

### Using Network Namespaces and veth Pairs

Network namespaces provide isolation of network environments. You can create a new network namespace and then create a `veth` pair to connect your default namespace with the new one. This allows you to simulate network devices and configurations without impacting your main network interface.

1. **Create a New Network Namespace**:
   ```bash
   sudo ip netns add testns
   ```

2. **Create a veth Pair**:
   ```bash
   sudo ip link add veth0 type veth peer name veth1
   ```

3. **Move One End of the Pair to the New Namespace**:
   ```bash
   sudo ip link set veth1 netns testns
   ```

4. **Configure the Interfaces**:
   - In the default namespace:
     ```bash
     sudo ip addr add 192.168.1.1/24 dev veth0
     sudo ip link set veth0 up
     ```
   - In the new namespace:
     ```bash
     sudo ip netns exec testns ip addr add 192.168.1.2/24 dev veth1
     sudo ip netns exec testns ip link set veth1 up
     sudo ip netns exec testns ip link set lo up
     ```

5. **Testing**:
   - You can now ping `veth1` from your default namespace (and vice versa) to simulate network traffic:
     ```bash
     ping 192.168.1.2
     ```

### guide

The issue you're encountering is that while you've successfully set up a network namespace (`testns`) and configured a pair of virtual ethernet (veth) devices to communicate between the namespace and the default network namespace, the namespace does not have a route to external networks. Specifically, your `testns` namespace cannot reach `192.168.88.131` because it doesn't know how to get beyond its local network (`192.168.1.0/24`).

To enable the network namespace to access external networks, including the Internet, you need to enable IP forwarding on your host and set up NAT (Network Address Translation) using `iptables`. This allows packets from the `testns` namespace to be forwarded to the wider network and NAT ensures that replies can come back to the namespace.

Here are the steps to fix the issue:

#### Step 1: Enable IP Forwarding

Edit the sysctl configuration to enable IP forwarding. Open `/etc/sysctl.conf` and ensure the following line is uncommented or add it if it does not exist:

```plaintext
net.ipv4.ip_forward=1
```

Apply the changes:

```bash
sudo sysctl -p
```

#### Step 2: Set Up NAT

Assuming your main network interface (the one connected to the network you're trying to reach, likely `ens33` based on your `ip link show` output) is `ens33`, set up NAT for the namespace. This command tells `iptables` to masquerade (hide behind a single IP address) packets coming from the `192.168.1.0/24` network (your namespace network) when they go out through `ens33`:

```bash
sudo iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o ens33 -j MASQUERADE
```

#### Note

- If `192.168.88.131` is outside your local network, this setup assumes that your host (`ens33`) has a route to `192.168.88.131` and that any intermediate firewalls or routers are configured to allow the traffic.
- If you're still experiencing issues, double-check the `iptables` rules and ensure your network interface (`ens33`) is correct and has Internet connectivity.
- The setup might vary depending on specific network configurations or restrictions imposed by your network environment.

By following these steps, you're essentially configuring your system to act as a router for the network namespace, using NAT to manage IP addresses and routing for packets entering and leaving the namespace.

### add ip route

```sh
sudo ip netns exec testns ip route add default via 192.168.1.1
```

### Scripts

see ebpf-xdp-dpdk/scripts/moongen-setup.sh

### success

```console
yunwei37@ubuntu18:~$ sudo ip netns exec testns ping 192.168.88.131
PING 192.168.88.131 (192.168.88.131) 56(84) bytes of data.
64 bytes from 192.168.88.131: icmp_seq=1 ttl=63 time=1.07 ms
64 bytes from 192.168.88.131: icmp_seq=2 ttl=63 time=0.659 ms
^C
--- 192.168.88.131 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1000ms
rtt min/avg/max/mdev = 0.659/0.866/1.074/0.209 ms
```

## run moongen