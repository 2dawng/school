import socket
import ipaddress as ip

CLASS_C_ADDR = "192.168.0.0"
if __name__ == "__main__":
    not_config = True
    while not_config:
        prefix=input("Enter the prefix length (e.g., 24 for /24): ")
        prefix = int(prefix)
        if prefix not in range(23, 31):
            print("Invalid prefix length. Please enter a value between 23 and 30.")
        net_addr = CLASS_C_ADDR + "/" + str(prefix)
        print("Network address:", net_addr)
        try:
            network = ip.ip_network(net_addr)
        except:
            raise ValueError("Invalid network address format.") 
        print("Number of valid hosts:", network.num_addresses)
        print("Network address:", network.network_address)
        print("Subnet mask:", network.netmask)
        print("Broadcast address:", network.broadcast_address)
        hosts = list(network.hosts())
        if hosts:
            print("First host:", hosts[0])
            print("Last host:", hosts[-1])
        else:
            print("No valid hosts in this network.")
        # not_config = False