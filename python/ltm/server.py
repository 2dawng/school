from queue import Queue
import socket
import threading

host, port = "127.0.0.1", 9050
WORKERS = 4
task = Queue()

def process_command(command):
    """Process text commands: UPPER:text, REVERSE:text, COUNT:text or echo plain text"""
    # If no colon, treat as plain text and echo it back
    if ':' not in command:
        return f"Echo: {command}"
    
    cmd, text = command.split(':', 1)
    cmd = cmd.strip().upper()
    
    if cmd == "UPPER":
        return text.upper()
    elif cmd == "REVERSE":
        return text[::-1]
    elif cmd == "COUNT":
        return str(len(text))
    else:
        return "ERROR: Unknown command"

def worker():
    while True:
        client_socket, addr = task.get()
        if client_socket is None:
            break
        try:
            with client_socket:
                client_socket.sendall(f"Welcome to the pool\n".encode('utf-8'))
                while True:
                    data=client_socket.recv(1024).decode('utf-8')
                    if not data:
                        break
                    result = process_command(data)
                    client_socket.sendall(result.encode('utf-8'))
        finally:
            task.task_done()

    

def main():
    for _ in range(WORKERS):
        t = threading.Thread(target=worker, daemon=True).start()
    sk=socket.socket(socket.AF_INET,socket.SOCK_STREAM)
    sk.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)
    sk.bind((host,port))
    sk.listen(5)
    print(f"[LISTENING] Server is listening on {host}:{port}")
    try:
        while True:
            client_socket,addr=sk.accept()
            task.put((client_socket, addr))
    except KeyboardInterrupt:
        print("[SHUTTING DOWN] Server is shutting down.")
    finally:
        for _ in range(WORKERS):
            task.put((None, None))

if __name__ == '__main__':
    main()