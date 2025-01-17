from queue import Queue
Q = Queue()
x, y = map(int, input().split())
Q.put((x, y))
D = {(x, y)}
while Q.qsize():
    x, y = Q.get()
    if x % 2 == 0 and (y, x//2) not in D:
        Q.put((y, x//2))
        D.add((y, x//2))
    if y % 2 and ((y+1)//2, x) not in D:
        Q.put(((y+1)//2, x))
        D.add(((y+1)//2, x))
print(len(D))
# robot
