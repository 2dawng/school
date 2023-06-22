s = input()
def reverse(s):
    if len(s) == 0:
        return s
    else:
        return reverse(s[1:]) + s[0]
if s == reverse(s):
    print('Yes')
else:
    print('No')
