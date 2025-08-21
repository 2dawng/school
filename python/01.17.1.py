def checkBracket(string):
    stack = []
    for i in string:
        if i == '(':
            stack.append(i)
        elif i == ')':
            if len(stack) == 0:
                return False
            stack.pop()
    return len(stack) == 0


a = input()
print(checkBracket(a))
