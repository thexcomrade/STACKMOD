# x = ('deva','sivya','lek') 

# #slice cheyyan [] thanne aanu use cheyane
# print(x[::2])

# #tuple is immutable, so no new insertion/deletion

# y = {23,6,77,3,34,3,57}  #set
# print(y)  #unordered,no duplicates,mutable

# y.add(567) #addition
# print(y)

# y.update('hai') #update
# print(y) #chara by chara

# y.discard(23) #remove
# print(y)

# y.discard('h') #remove
# print(y)

# y.pop() #remove random element
# print(y)

# y.clear() #remove all elements
# print(y)

# y = {23,6,77,3,34,45,68,14,57}   #set1
# print(y)
# x = {35,35,3,68,65,98,12,43,67}   #set2
# y.union(x)
# print(y.union(x))  #union

# y.intersection(x)
# print(y.intersection(x))  #intersection


x = {'deva':'xyz','sivya':'rty','lek':'fhjh'} #dictionary : it has word & meaning (key meaning pair)
print(x)

#feature : ordered,index value ordered alla key order pair aavum

print(x['lek']) #key de value print aavan

print(x.keys()) #key print aavan

print(x.values()) #values print aavan

print(x['lek'])

x['mahima'] = 'dcfgh'
print(x['mahima'])
print(x)

x['mahima'] = 'sdfgh'  #update an exting value
print(x)

print(x.pop('sivya')) #pop removes the key value pair
print(x)

print(x.popitem()) #popitem removes the last key value pair
print(x)



