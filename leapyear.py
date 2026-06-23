# n = int(input('enter the year :'))
# if (n%400==0 or n%4==0 and n%100!=0):
#     print((n),'is a leap year')
# else:
#     print((n),'is not a leap year')
n = int(input('enter the year :'))
if (n%4==0):
    if (n%400==0):
        print((n),'is a leap year')
    else:
        print((n),'is not a leap year')
else:
    if (n%100==0):
        print((n),'is a leap year')
    else:
        print((n),'is not a leap year')


