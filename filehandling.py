# 2. File Handling

# Q7. Write a program to create a text file notes.txt and write 3 lines to it.

    #ni notes.txt
    #code notes.txt

# Q8. Read notes.txt and print its content line by line using a for loop.

# file = open("notes.txt", "r")
# for line in file:
#     print(line.strip())
# file.close()

# Q9. Append a new line to notes.txt without deleting existing content.

# file = open("notes.txt", "a")
# file.write("hai how are you?")
# file.close()

# file = open("notes.txt", "r")
# content = file.read()
# print(content)
# file.close()


# Q10. Write a program that counts the number of words and lines in a text file.

file = open("notes.txt", "r")
content = file.read()
lines = content.splitlines()
word_count = len(content.split())
len_lines = len(lines)
print("Number of lines:", len_lines)
print("Number of words:", word_count)

#to count letters from notes.txt

letter_count = sum(c.isalpha() for c in content)
print("Number of letters:", letter_count)

# Q11. Write a program to copy the content of one file into another file.

file = open("notes.txt", "r")
content = file.read()


# Q12. Write a program using with open(...) (context manager) to read a file — explain why with is
# preferred over open()/close().
# Q13. Write a program that reads a file and writes only lines containing a specific keyword into a new file.
# Q14. Write a program to count how many times a given word appears in a file.