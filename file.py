#file read line by line

# file = open("file.txt","r")
# content = file.read()
# print(content)
# file.close()

# with open("file.txt","r") as file:
#     content = file.read()
#     print(content)

# 11.Write a function to reverse a string.

# a = input("enter the string : ")
# print(a[::-1])

# 12.Write a function to check whether a string is a palindrome.

# if (a == a[::-1]):
#     print("palindrome")
# else:
#     print("not palindrome")

# 13.Write a function to count vowels in a string.

# vowels = ('a','e','i','o','u','A','E','I','O','U')
# count=0
# for char in a:
#     if char in vowels:
#         count=count+1
# print(count)

# 14.Write a function to generate Fibonacci series up to n terms.

# a = int(input("enter number : "))
# f1=0
# f2=1
# print(f1)
# print(f2)
# for i in range(2,a):
#     f3=f1+f2
#     f1=f2
#     f2=f3
#     print(f3)

# 15.Write a function to find the sum of elements in a list.

def find_sum(n):
    sum = 0
    for i in range(1, n + 1):
        sum = sum + i
    print("Sum =", sum)
a = int(input("Enter number: "))
find_sum(a)


# 16.Write a function to find the maximum element in a list.

# 17.Write a function to remove duplicates from a list.

# 18.Write a function to sort a list without using built-in functions.

# 19.Write a function to count frequency of elements in a list.

# Write a function to check whether two strings are anagrams.