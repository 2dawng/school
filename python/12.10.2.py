n = int(input())
a = list(map(int, input().split()))
result = [-1] * n
stack = []
for i in range(n):
    while stack and a[i] > a[stack[-1]]:
        temp = stack.pop()
        result[temp] = i
    stack.append(i)
stack = []
result2 = [-1] * n
a.reverse()
for i in range(n):
    while stack and a[i] > a[stack[-1]]:
        temp = stack.pop()
        result2[temp] = i
    stack.append(i)
result2.reverse()
for i in range(n):
    if result2[i] != -1:
        result2[i] = n - 1 - result2[i]
final_result = [-1] * n
for i in range(n):
    if result[i] == -1:
        final_result[i] = result2[i]
    elif result2[i] == -1:
        final_result[i] = result[i]
    else:
        dist_right = result[i] - i
        dist_left = i - result2[i]
        if dist_left <= dist_right:
            final_result[i] = result2[i]
        else:
            final_result[i] = result[i]
print(*final_result)
# chao tan k59
