n = int(input())
a = []
for i in range(n):
    q = []
    ans = 0
    formula = input().strip()
    for i in formula:
        if i == '(':
            q.append(0)
        elif i == 'C':
            q.append(12)
        elif i == 'H':
            q.append(1)
        elif i == 'O':
            q.append(16)
        elif i == ')':
            temp = 0
            while q[-1] != 0:
                temp += q.pop()
            q.pop()
            q.append(temp)
        else:
            q[-1] *= int(i)
    a.append(sum(q))
print(*a, sep='\n')
# khoi luong hoa chat
