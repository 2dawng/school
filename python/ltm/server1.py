import socket

HOST = '127.0.0.1'
PORT = 9050

if __name__ == '__main__':
    sk= socket.socket(socket.AF_INET, socket.SOCK_DGRAM,proto=0)
    sk.bind((HOST, PORT))
    print(f"UDP server running at {HOST}:{PORT}")
    while True:
        data, addr = sk.recvfrom(1024)
        print(f"Received message: {data.decode('utf-8')} from {addr}")
        if data.decode('utf-8') == 'exit':
            print("Exiting...")
            break
        response = f"Echo: {data.decode('utf-8')}"
        sk.sendto(response.encode('utf-8'), addr)
