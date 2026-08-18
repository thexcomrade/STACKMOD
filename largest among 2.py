# #enter a value from user, print as zero / non zero

# a = int(input('enter the value a :' ))
# if(a==0):
#     print((a),'is zero')
# else:
#     print((a),'is non zero')

a=int(input("enter a: "))
b=int(input("enter b: "))
c=int(input("enter c: "))
if a>c:
    if a>b:
        print("a greatest")
    elif b>c:
        print("b greatest")
else:
    print("c greatest")