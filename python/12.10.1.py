n = int(input())
queue = []
m = ["0"]*n
queue.append(6 % n)
m[6 % n] = "6"
queue.append(8 % n)
m[8 % n] = "8"
while queue and m[0] == "0":
    u = queue.pop(0)
    v = (10*u+6) % n
    if m[v] == "0":
        m[v] = m[u]+"6"
        queue.append(v)
    v = (10*u+8) % n
    if m[v] == "0":
        m[v] = m[u]+"8"
        queue.append(v)
print(m[0])
# chu so 6 va 8
