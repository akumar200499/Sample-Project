# Recursion
# a function calling itself is recursion
# factorial of 5! --> 5 x 4 x 3 x 2 x 1
'''factorial = 1 
for i in range(1,6):
    factorial = factorial * i
print(factorial)'''


def factorial(n):
    if n == 0 or n==1:
        return 1
    else:
        return n * (factorial(n-1))
print(factorial(5))