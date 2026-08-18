# a = 7
# b = 5
# # and
# print(a & b)

# a = 7
# b = 5
# print(a | b) #or
# print(a & b) #and
# print(~a)     # not
# print(a ^ b)  # xor
# print(~a)     # not
# print(a << 1) # left shift
# print(a >> 1) # right shift

# Write a Python program to check whether a number is positive, negative, or zero.
a=int(input("enter a no : "))
if a>0:
    print("no is +ve")
elif a<0:
    print("no is -ve")
else:
    print("no is zero")
# Write a program to check whether a given number is even or odd.
a=int(input("enter a no : "))
if a%2==0 :
    print("no is even")
else:
    print("no is odd") 
# Write a program to find the largest of two numbers using if-else.
a=int(input("enter a: "))
b=int(input("enter b: "))
if (a>b):
    print("a is largest")
else:
    print("b is largest")
# Write a program to check whether a person is eligible to vote (age ≥ 18).
a=int(input("enter age: "))
if a>=18:
    print("user eligible to vote")
else:
    print("ninak vote illa")
# Write a program to check whether a given character is a vowel or consonant.
a=input("enter a chara:")
if a in ('a','e','i','o','u'):
    print("it's vowel")
else:
    print("consonant")
# Write a program to check whether a year is a leap year or not.
n = int(input('enter the year :'))
if (n%400==0 or n%4==0 and n%100!=0):
    print((n),'is a leap year')
else:
    print((n),'is not a leap year')
# Write a program to calculate student grade based on marks:
# ≥ 90 → A
# ≥ 75 → B
# ≥ 60 → C
# < 60 → Fail
# Write a program to check whether a number is divisible by 5 and 11.
# Write a program to check whether a given number is a multiple of 3 or 7.
# Write a program to find whether a given number is greater than 100.

# Write a program to find the largest of three numbers using nested if.
a=int(input("enter a: "))
b=int(input("enter b: "))
c=int(input("enter c: "))
if a>b:
    if a>c:
        print("a greatest")
    else:
        print("c greatest")
else:
    if b>c:
        print("b greatest")
    else:
        print("c greatest")

# Write a program to check whether a student has passed or failed:
# If marks ≥ 40 → Pass
# If passed and marks ≥ 75 → Distinction

mark = int(input("enter mark: "))
if mark >= 40:
    if mark >= 75:
        print("distinction")
    else:
        print("pass")
else :
    print("failed")

    # Write a program to check whether a person is eligible for a loan:
    #   Age ≥ 21
    #   Salary ≥ 25,000

    # Write a program to calculate electricity bill using nested if:
    #    Units ≤ 100 → ₹2/unit
    #    Units ≤ 200 → ₹3/unit
    #    Units > 200 → ₹5/unit

    # Write a program to check whether a given year is a leap year using nested if.

    # Write a program to find whether a number is divisible by both 3 and 5, else check divisible by only one.

    # Write a program to calculate bonus:
    #   If experience > 5 years
    #    Salary > 50,000 → 10% bonus
    #    Else → 5% bonus

    # Write a program to check login validation:
    #  If username is correct
    #   Check password

    # Write a program to find the type of triangle:

