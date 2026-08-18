#1
a = [1,2,3,4,5,6,7,8,9]
if 6 in a:
    print("it exists")
else:
    print("it does not exist")

#2
if a[0] > a[-1]:
    print("first greatest")
else:
    print("last greatest")

#3
if len(a) > 5:
    print("size is greater than 5")
else : 
    print("size is less")

#4
if 10 in a:
    print("10 ondu")
else :
    print("10 illa")

#5
if a[0]+a[1] > a[-1]:
    print("sum aanu valuth")
else :
    print("last aanu valuth")

#6
if all(a>0 for a in a):
    print("all positive")
else :
    print("not all positive")

#7
if (len(a)==0):
    print ("list empty aanu")
else :
    print("list empty alla")

#8   list [], tuple (), set {}, dict {}
b = (1,2,3,4,5,6,7,8,9)
if 6 in b:
    print("it exists")
else:
    print("it does not exist")

#9
if (b[0] == b[-1]):
    print("namml same")
else :
    print("namml verey!")

#10
if (len(b) > 3):
    print("size greater than 3")
else :
    print("size less than 3")

#11
if (len(b) == 0):
    print("tuple empty aanu")
else:
    print("tuple empty alla")

#12 
s=(12,45,276,24)
if (max(s) > 50):
    print("max value greater than 50")
else:
    print("max value less than 50")

#13
if(s[1] % 2 == 0):
    print("2nd is even")
else:
    print("2nd even alla")

#14
myset = {23, 45, 67, 89, 12}
if (49 in myset):
    print("49 exists")
else :
    print("49 illa")

#15
if (len(myset) > 4):
    print("size greater than 4")
else :
    print("size less than 4")

#16
ab = {23, 45, 67, 89, 12}
bc = {23, 45, 76, 89, 12}
if (ab==bc):
    print("both equal")
else:
    print("ab!=bc")

#17
k = {23, 45, 67, 89, 12}
if (5 in k):
    print("5 exists")
else : 
    print("5 illa")

#18
if(len(k) == 0):
    print("set empty aanu")
else:
    print("set empty alla")

#19
x = {12,45,23,67,29}
y = {45,67}
if (y.issubset(x)):
    print("y subset of x")
else :
    print("y subset alla x")

#20
m = {"deva": "boy", "sivya":"girl", "shiva":"boy", "ganesha":"boy"}
if "sivya" in m:
    print("sivya ondu")
else :
    print("sivya illa")

#21
m = {"deva": "boy", "sivya":"girl", "shiva":"boy", "ganesha":"boy"}
if len(m) == 0:
    print("dict empty aanu")
else:
    print("dict empty alla")

#22
d = {"name":"DEVA","age":22,"sex":"male"}
if (d["age"]>50):
    print("age greater than 50")
else:
    print("age less than 50")

#23
r = {"name":"DEVA","age":22,"sex":"male"}
if "name" in r:
    print("name exists")
else:
    print("name illa")

#24
r = {"name":"DEVA","age":22,"sex":"male"}
u = {"name":"SIVYA","age":21,"sex":"female"}
if (r==u):
    print("both equal") 
else :
    print("r not equal 2 u")

#25
r = {"name":"DEVA","age":22,"sex":"male"}
if (len(r) > 3):
    print("size greater than 3")
else :
    print("size less than 3")