n = int(input())
a = []
ans = 0
for i in range(0, n):
    a.append(int(input()))
a.sort(reverse=True)
for i in range(0, n):
    if a[i] == 4:
        ans = ans + 1
        a.pop(i)
        n = n - 1
    elif a[i] + a[n-i] <= 4 and n - i - i > 0:
        ans = ans + 1
        a.pop(n-i)
        a.pop(i)
        n = n - 2
print(ans, a)
   