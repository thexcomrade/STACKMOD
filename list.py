#insert (append)

x = [56,78,46,23,86]
x.append(567)
print(x)  #limitation : last mathre add aakan pattu (not possible in exact location)

x.insert(2, 100)  #insert (exact location)
print(x)

x.extend([23,34,45,56,67])
print(x)    #can't insert @ the middle of the list, but can add multiple values at the end

x.pop(2)  # index value koduthal that position value will remove
print(x)  # pop removes element at index 2
print(x)
x.remove(23)  #value koduthal that value will remove


del x[:5] #index value 5 vare ullathu delete aakum
print(x)

len(x) #used to print the length size of list
print(len(x))

x.index(56)
print(x.index(56)) #index value koduthal that value nta index number print aakum

