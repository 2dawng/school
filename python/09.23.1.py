n = int(input())

shoes = {}

for _ in range(n):
    shoe = input()
    side= shoe[0]
    size = int(shoe[1:])
    if size in shoes:
        shoes[size] += 1
    else:
        shoes[size] = 1

pairs = 0

for size, count in shoes.items():
    pairs += count // 2

print(pairs)
