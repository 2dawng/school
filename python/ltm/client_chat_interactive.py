import socket
import threading
import sys

host, port = "127.0.0.1", 9050

def receive_messages(sock):
    """Thread to continuously receive and print messages from server"""
    while True:
        try:
            data = sock.recv(1024).decode(errors='ignore')
            if not data:
                print("\n[Disconnected from server]")
                break
            print(f"\n{data.strip()}")
            print("> ", end="", flush=True)
        except Exception as e:
            print(f"\n[Error receiving: {e}]")
            break

def main():
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    try:
        sock.connect((host, port))
        print("Connected to chat server!")
        print("Commands:")
        print("  /join <room>  - Join a chat room")
        print("  /leave        - Leave current room")
        print("  <message>     - Send message to current room")
        print("  quit          - Exit\n")
        
        # Start receiver thread
        receiver = threading.Thread(target=receive_messages, args=(sock,), daemon=True)
        receiver.start()
        
        # Main input loop
        while True:
            try:
                message = input("> ")
                if message.lower() == 'quit':
                    print("Exiting...")
                    break
                if message.strip():
                    sock.send((message + '\n').encode())
            except KeyboardInterrupt:
                print("\nExiting...")
                break
            except Exception as e:
                print(f"Error sending: {e}")
                break
    finally:
        sock.close()

if __name__ == '__main__':
    main()
