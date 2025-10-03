import socket
import threading
from time import sleep

host, port = "127.0.0.1", 9050

def run_client(idx):
    sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM, 0)
    sk.connect((host, port))
    welcome = sk.recv(1024).decode()
    print(f"[Client {idx}] {welcome.strip()}")
    
    for i in range(3):
        message = f"Message {i} from client {idx}"
        sk.sendall(message.encode())
        print(f"[Client {idx}] <- {sk.recv(1024).decode().strip()}")
        sleep(2)
    
    sk.close()

# Create 4 concurrent clients
threads = [threading.Thread(target=run_client, args=(i,)) for i in range(4)]
for t in threads:
    t.start()
for t in threads:
    t.join()

print("All clients finished.")