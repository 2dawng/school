import socket
import threading
import time

host, port = "127.0.0.1", 9050

class ChatClient:
    def __init__(self, name):
        self.name = name
        self.sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        self.running = True
        self.messages = []
        
    def connect(self):
        self.sock.connect((host, port))
        # Start receiving messages
        threading.Thread(target=self.receive, daemon=True).start()
        time.sleep(0.5)  # Wait for welcome message
        
    def receive(self):
        """Receive and store messages"""
        while self.running:
            try:
                data = self.sock.recv(1024).decode(errors='ignore')
                if not data:
                    break
                msg = data.strip()
                if msg:
                    self.messages.append(msg)
                    print(f"[{self.name}] Received: {msg}")
            except:
                break
                
    def send(self, message):
        """Send a message to the server"""
        try:
            self.sock.send((message + '\n').encode())
            print(f"[{self.name}] Sent: {message}")
            time.sleep(0.3)  # Small delay between messages
        except Exception as e:
            print(f"[{self.name}] Error: {e}")
            
    def close(self):
        self.running = False
        self.sock.close()

def test_chat_scenario():
    """Automated test scenario for the chat server"""
    print("=== Starting automated chat test ===\n")
    
    # Create two clients
    client1 = ChatClient("Alice")
    client2 = ChatClient("Bob")
    
    try:
        # Connect both clients
        print("--- Connecting clients ---")
        client1.connect()
        client2.connect()
        time.sleep(1)
        
        # Test 1: Both join the same room
        print("\n--- Test 1: Join same room ---")
        client1.send("/join room1")
        time.sleep(0.5)
        client2.send("/join room1")
        time.sleep(1)
        
        # Test 2: Send messages in the room
        print("\n--- Test 2: Send messages ---")
        client1.send("Hello everyone!")
        time.sleep(0.5)
        client2.send("Hi Alice!")
        time.sleep(1)
        
        # Test 3: Client 1 leaves and joins another room
        print("\n--- Test 3: Leave and join different room ---")
        client1.send("/leave")
        time.sleep(0.5)
        client1.send("/join room2")
        time.sleep(0.5)
        client1.send("Anyone here in room2?")
        time.sleep(1)
        
        # Test 4: Client 2 sends message in room1 (Client 1 shouldn't see it)
        print("\n--- Test 4: Message in different room ---")
        client2.send("Alice left us!")
        time.sleep(1)
        
        # Test 5: Client 2 joins room2
        print("\n--- Test 5: Join room2 ---")
        client2.send("/join room2")
        time.sleep(0.5)
        client2.send("I'm here now!")
        time.sleep(1)
        
        # Test 6: Try sending without being in a room
        print("\n--- Test 6: Leave all rooms ---")
        client1.send("/leave")
        time.sleep(0.5)
        client1.send("Can anyone hear me?")
        time.sleep(1)
        
        print("\n=== Test complete ===")
        
    except Exception as e:
        print(f"Error during test: {e}")
    finally:
        print("\n--- Closing connections ---")
        client1.close()
        client2.close()
        time.sleep(1)
        
    # Print summary
    print("\n=== Message Summary ===")
    print(f"\nAlice received {len(client1.messages)} messages:")
    for msg in client1.messages:
        print(f"  {msg}")
    print(f"\nBob received {len(client2.messages)} messages:")
    for msg in client2.messages:
        print(f"  {msg}")

if __name__ == '__main__':
    test_chat_scenario()
