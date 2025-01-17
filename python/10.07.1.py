import queue
S = queue.LifoQueue()
n = int(input())
a = map(int, input().split())
res = 0
for x in a:
    while S.qsize() > 0 and S.queue[-1][0] < x:
        res += S.get()[1]
    if S.qsize() > 0 and S.queue[-1][0] == x:
        res += S.queue[-1][1]+(S.qsize() > 1)
        S.queue[-1][1] += 1
    else:
        res += S.qsize() > 0
        S.put([x, 1])
print(res)
