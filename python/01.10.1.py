n = int(input())


def soChinhPhuong(n):

    sqrt_n = int(n**0.5)
    if sqrt_n**2 == n:
        return True
    else:
        return False


def soDoiXung(str_n):
    for i in range(len(str_n)):
        if str_n[i] == str_n[-1-i]:
            continue
        else:
            return False
    else:
        return True


str_n = str(n)
if soDoiXung(str_n):
    print("La so doi xung")
else:
    print("Khong phai la so doi xung")

sum = 0
for i in range(1, n//2+1):
    if n % i == 0:
        sum += i
if sum == n:
    print("La so hoan hao")
else:
    print("Khong phai la so hoan hao")

new_n = ""
for i in range(len(str_n)):
    if str_n[i] != "0":
        new_n += str_n[i]
if soDoiXung(new_n):
    print("La so dac biet")
else:
    print("Khong phai la so dac biet")
