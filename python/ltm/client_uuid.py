import socket
import uuid

host, port = "127.0.0.1", 9050

sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sk.connect((host, port))

# First, receive the welcome message
welcome = sk.recv(1024).decode()
print(welcome.strip())

# Generate a UUID and send it to the server as requested in original requirement
client_id = str(uuid.uuid4())
print(f"Sending UUID: {client_id}")
sk.sendall(f"UPPER:{client_id}".encode())
response = sk.recv(1024).decode()
print(f"Server response: {response}")

sk.close()