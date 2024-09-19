import math
a, b, c = map(float, input().split())
if a == 0:
    if b == 0:
        if c == 0:
            print("vo so nghiem")
        else:
            print("vo nghiem")
    else:
        x = -c / b
        print(f"{x:.3f}")
else:
    delta = b**2 - 4*a*c
    if delta < 0:
        print("vo nghiem")
    elif delta == 0:
        x = -b / (2 * a)
        print(f"{x:.3f}")
    else:
        x1 = (-b - math.sqrt(delta)) / (2 * a)
        x2 = (-b + math.sqrt(delta)) / (2 * a)
        if x1 > x2:
            x1, x2 = x2, x1
        print(f"{x1:.3f}")
        print(f"{x2:.3f}")
