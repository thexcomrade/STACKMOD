#dictionary

dict = {'Name': 'John', 'Age': 25, 'City': 'New York'}
# print(dict['Name'])  # Output: John
# print(dict.get('City'))  # Output: New York

# #printing all keys and values
# for key, value in dict.items():
#     print(key, value)

# #print only keys
# for key in dict.keys():
#     print(key)

# print(dict.keys()) #keys
# print(dict.values()) #values
# print(dict.items()) #key&value
# print(dict.get('Age')) #get value of key


# #updating values
# dict['Age'] = 26
# print(dict)

# print(dict.update({'City':'Kazhakootam'}))
# print(dict)

# #pop
# print(dict.pop('Age'))
# print(dict)

# print(len(dict)) #length

# #adding new key-value pair
# # dict['Country'] = 'USA'
# # print(dict)

print(dict.setdefault('Country', 'USA'))
print(dict)

# dict.clear()
# print(dict) #clear all values

# print(dict.clear()) #clear all values

