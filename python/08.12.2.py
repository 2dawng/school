import socket
import netifaces2 as netifaces

if __name__ == "__main__":
    hostname = socket.gethostname()
    ip_addr = socket.gethostbyname(hostname)
    print("hostname: {0}, ip address: {1}".format(hostname, ip_addr))
    
    ifaces = netifaces.interfaces()
    for i in ifaces:
        ipaddress = netifaces.ifaddresses(i)
        if netifaces.AF_INET in ipaddress:
            ipaddr_desc = ipaddress[netifaces.AF_INET][0]
            print("network interface: {0}".format(i))
            print("\t ip address: {0}".format(ipaddr_desc['addr']))
            print("\t netmask: {0}".format(ipaddr_desc['netmask']))
    
    gateways = netifaces.gateways()
    if 'default' in gateways and netifaces.AF_INET in gateways['default']:
        print("default gateway: {0}".format(gateways['default'][netifaces.AF_INET][0]))