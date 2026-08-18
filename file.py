#file read line by line
# file = open("file.txt","r")
# content = file.read()
# print(content)
# file.close()

with open("file.txt","r") as file:
    content = file.read()
    print(content)