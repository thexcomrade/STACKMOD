# i = 1
# while(i>10):
#   print('Deva')
#   i = i+1


# print('sdfghjk')
# a=1
# while (a<=10):
#     print(a)
#     a=a+1
# a=10
# while (a>0):
#     print(a)
#     a=a-1

#1-10+ sum
# a=1
# while (a<=10):
#   print(a)
#   a=a+a   // 1,2,4,8

# sum=0
# a=1
# while a<=10:
#   sum = sum+a
#   a=a+1
# print(sum)

#1-100,even no sum
# sum=0
# a=1
# while a<=100:
#   if (a%2==0):
#     sum = sum+a
#   a=a+1
# print(sum)

#1-100, even & odd sum
# even=0
# odd=0
# a=1
# while a<=100:
#   if (a%2==0):
#     even = even+a
#   else:
#     odd = odd+a
#   a=a+1
#   sum = even+odd
# print('even sum :',even)
# print('odd sum :',odd)
# print('total sum :',sum)

# mark = [56,79,64,52,90]
# i=0
# sum=0
# while i<5:
#     sum = sum + mark[i]
#     i=i+1
# print('total mark :',sum)


#432,sum 4+3+2 (any value from user)

# n = (int(input('enter a number :')))
# sum = 0
# while 0<n:
#     total = n%10       #432 % 10 = 2 , 43 %10 = 3
#     sum = sum+total
#     n = n//10 # // to remove the last digit
# print("sum of digits =",sum)

#COUNT NO OF DIGITS

# n = (int(input('enter a number :')))
# count = 0
# while n!=0:
#     n = n//10
#     count+=1
# print("sum of digits =",count)

#MAXIMUM DIGIT

# n = (int(input('enter a number :')))
# max = 0
# while n!=0:
#     digit=n%10
#     if digit>max:
#         max=digit
#     n=n//10
# print("largest digit =",max)

#MAXIMUM DIGIT

# list = [56,79,94,64,52,90]
# i=0
# max = 0
# for i in list:
#     if i>max:
#         max = i
# print("largest digit =",max)

#MINIMUM DIGIT

# list = [56,79,94,64,52,90]
# i=0
# min = 10000000
# for i in list:
#     if i<min:
#         min = i
# print("minm digit =",min)

#TAKE AVG & PRINT DIGITS ABOVE IT

# list = [56,79,94,57,23,64,52,90]
# i=0
# avg = sum(list)/ len(list)

# print('average value :',avg)
# for i in list:
#     if i>avg:
#         avg = i
#         print(i)

#COUNT NO OF DIGITS, SUM OF EVEN & ODD

# list = [56,79,94,57,23,64,52,90]
# count = 0
# even = 0
# odd = 0
# evencount=0
# oddcount=0
# for i in list:
#   count+=1
#   if (i%2==0):
#     even = even+i
#     evencount+=1
#   else:
#     odd = odd+i
#     oddcount+=1
#   sum = even+odd
# print('even count :',evencount)
# print('even sum :',even)
# print('odd count :',oddcount)
# print('odd sum :',odd)
# print('total count :',count)
# print('total sum :',sum)
