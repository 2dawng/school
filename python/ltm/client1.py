import socket

HOST = '127.0.0.1'
PORT = 9050

if __name__ == '__main__':
    sk= socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    data = b'Hello, UDP Server!'
    sk.sendto(data, (HOST, PORT))
