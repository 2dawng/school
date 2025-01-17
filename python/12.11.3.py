n, m, k = map(int, input().split())
q = []
q.append((0, 0))
a = {(0, 0): 0}
flag = True
while q:
    temp = q.pop(0)
    x, y = temp
    if x == k or y == k:
        print(a[temp])
        flag = False
        break
    z = x+y
    if (x, 0) not in a:
        a[(x, 0)] = a[temp]+1
        q.append((x, 0))
    if (0, y) not in a:
        a[(0, y)] = a[temp]+1
        q.append((0, y))
    if (n, y) not in a:
        a[(n, y)] = a[temp]+1
        q.append((n, y))
    if (x, m) not in a:
        a[(x, m)] = a[temp]+1
        q.append((x, m))
    if (max(z-m, 0), min(z, m)) not in a:
        a[(max(z-m, 0), min(z, m))] = a[temp]+1
        q.append((max(z-m, 0), min(z, m)))
    if (min(z, n), max(z-n, 0)) not in a:
        a[(min(z, n), max(z-n, 0))] = a[temp]+1
        q.append((min(z, n), max(z-n, 0)))
if flag:
    print("Khong dong duoc nuoc")
# Dong nuoc
