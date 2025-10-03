import socket
import threading
from time import sleep
import uuid

host, port = "127.0.0.1", 9050

def run_client(idx):
    sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM,0)
    sk.connect((host, port))
    welcome = sk.recv(1024).decode()
    print(f"[Client {idx}] {welcome.strip()}")
    
    # Test different commands
    commands = [
        f"UPPER:hello from client {idx}",
        f"REVERSE:world {idx}",
        f"COUNT:testing text length for client {idx}",
        f"INVALID:this should cause an error"
    ]
    
    for i, command in enumerate(commands):
        sk.sendall(command.encode())
        result = sk.recv(1024).decode().strip()
        print(f"[Client {idx}] Command: '{command}' -> Result: '{result}'")
        if i < len(commands) - 1:  # Don't sleep after the last command
            sleep(1)

threads = [threading.Thread(target=run_client, args=(i,)) for i in range(2)]
for t in threads:
    t.start()
for t in threads:
    t.join()