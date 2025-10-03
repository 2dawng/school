import socket

host, port = "127.0.0.1", 9050

sk = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sk.connect((host, port))

# Receive welcome message
welcome = sk.recv(1024).decode()
print(f"Server: {welcome.strip()}")

# Send a simple test message
test_message = "Hello World"
sk.sendall(test_message.encode())
response = sk.recv(1024).decode()
print(f"Sent: '{test_message}' -> Received: '{response}'")

sk.close()
print("Connection closed.")