import socket
hostname = socket.gethostname()
print("Hostname:", hostname)
ip_address = socket.gethostbyname(hostname)
print("IP Address:", ip_address)
import ipaddress

ip_addrs =["192.168.1.1","2001:db8::1","300.168.1.1"]
for ip in ip_addrs:
    try:
        ip_obj = ipaddress.ip_address(ip)
        print(f"{ip} is a valid {ip_obj.version} address.")
    except ValueError:
        print(f"{ip} is not a valid IP address.")