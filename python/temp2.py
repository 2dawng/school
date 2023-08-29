a = input()
while(a != '#'):
    b = input()
    for i in range(len(a)):
        if a[i] == '?':
            q = 0
            c : str =''
            e = 0
            for j in range(i, len(a)):
                if a[j] == '?':
                    q = q + 1
                    c = c + b[j]
                elif int(a[j]) > int(b[j]):
                    for k in range(j, len(a)):
                        if a[k] == '?':
                            q = q + 1
                            c = c + '0'
                    break
                elif int(a[j]) < int(b[j]): 
                    e = 1
                    for k in range(j, len(a)):
                        if a[k] == '?':
                            q = q + 1
                            c = c + '9'
                    break
            print(pow(10, q) - int(c) - 1 + e)
            break
        elif int(a[i]) < int(b[i]):
            print(0)
            break
        elif int(a[i]) > int(b[i]):
            ans = 0
            for j in range(i, len(a)):
                if a[j] == '?':
                    ans = ans + 1
            print(pow(10, ans))
            break
    a = input()