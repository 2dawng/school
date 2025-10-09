import socket
import select

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
server.bind(('127.0.0.1', 9050))
server.listen()
server.setblocking(False)

sockets = {server}
rooms = {}
who = {}

def send(sock, msg):
    try:
        sock.send((msg + '\n').encode())
    except:
        pass


def board_cast(room, msg, except_sock=None):
    for c  in rooms.get(room, []):
        if c != except_sock:
            send(c, msg)

print("Chat server...")
user_id = 0

while True:
    r, _, _ = select.select(list(sockets), [], [])
    for s in r:
        if s == server:
            # tao ket noi
            c, addr = server.accept()
            c.setblocking(False)
            sockets.add(c)
            user_id += 1
            who[c] = {"room": None, "nick": f'user{user_id}'}
            send(c, f'welcome user {user_id}. Cu phap /join <room> de vao')
            print(f'[IN] user{user_id} connected from {addr}')
        else:
            # xu ly client mess
            try:
                data = s.recv(1024)
                if not data:
                    raise ConnectionError
                for line in data.decode(errors='ignore').strip().splitlines():
                    line = line.strip()
                    if line.startswith('/join'):
                        new_room = line.split(maxsplit=1)[1]
                        old_room = who[s]["room"]
                        # bo room cu
                        if old_room and s in rooms.get(old_room, set()):
                            rooms[old_room].remove(s)
                            board_cast(old_room, f'join {new_room}')
                        # vao room moi
                        rooms.setdefault(new_room, set()).add(s)
                        who[s]["room"] = new_room
                        send(s, f'joined {new_room}')
                        board_cast(new_room, f'{who[s]["nick"]} joined', s)
                    elif line == '/leave':
                        room = who[s]["room"]
                        if room:
                            rooms[room].remove(s)
                            board_cast(room, f'{who[s]["nick"]} left', s)
                            send(s, f'left {room}')
                        else:
                            send(s, 'ban khong o trong room nao')
                    else:
                        room = who[s]["room"]
                        if room:
                            board_cast(room, f'{who[s]["nick"]}: {line}', s)
                        else:
                            send(s, 'ban chua vao room. Cu phap /join <room> de vao')
            except:
                # ngat ket noi
                nick = who.get(s, {}).get("nick", "unknown")
                room = who.get(s, {}).get("room")
                if room and s in rooms.get(room, set()):
                    rooms[room].remove(s)
                    board_cast(room, f'{who[s]["nick"]} left', s)
                print(f'[OUT] {nick} disconnected')
                sockets.discard(s)
                who.pop(s, None)
                s.close()