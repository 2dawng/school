from collections import Counter
from queue import PriorityQueue
Q = PriorityQueue()
D = Counter(input())
for x in D.values():
    Q.put(x)
res = 0
while Q.qsize() > 1:
    a = Q.get()+Q.get()
    res += a
    Q.put(a)
print(res)
# Huffman
