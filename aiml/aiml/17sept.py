import numpy as np

# 1. Finding Index
arr1 = np.array([10, 20, 30, 40, 50, 30])
print(np.where(arr1 == 30))

# 2. Unique Values
arr2 = np.array([10, 20, 20, 30, 40, 30, 50, 50])
print(np.unique(arr2))

#  3. Concatenation
A = np.array([10, 20, 30])
B = np.array([40, 50, 60])
print(np.concatenate((A, B)))

# 4. Vertical Stacking
C = np.array([[1, 2], [3, 4]])
D = np.array([[5, 6], [7, 8]])
print(np.vstack((C,D)))

# 5. Horizontal Stacking
C = np.array([[1, 2], [3, 4]])
D = np.array([[5, 6], [7, 8]])
print(np.hstack((C,D)))

# 6. Splitting Array
x = np.array([10, 20, 30, 40, 50, 60])
print(np.split(x,3))

# 7. Sorting Array
y=np.array([50, 10, 40, 20, 30])
print(np.sort(y))

# 8. Filtering Array
z=np.array([10, 25, 30, 45, 50, 65])
print(z[z > 40])

# 9. Boolean Indexing
y=np.array([50, 10, 40, 20, 30])
condition = y > 25
print(condition)

# 10. Student Marks

marks=np.array([45, 78, 32, 90, 56, 88, 25, 67])
# Values above 50
print("Values above 50:", marks[marks > 50])
# Values below 40
print("Values below 40:", marks[marks < 40])
# Index positions of values above 80
print("Index positions of values above 80:", np.where(marks > 80))
# Unique values
print("unique mark",np.unique(marks))
# Sorted marks
print("sorted mark",np.sort(marks))

# 11. Employee Salary

salary = np.array([25000, 35000, 28000, 45000, 50000, 35000, 28000])
# Unique salaries
print("unique salary : ",np.unique(salary))
# Salaries above 30,000
print("salary above 30k : ",salary[salary > 30000])
# Index positions of 35,000
print("index position of 35k", np.where(salary == 35000))
# Sorted salaries
print("sorted salary : ", np.sort(salary))
# Number of salaries above 30,000
print("No of salaries above 30k:", np.sum(salary > 30000))

# 12. Combined Arrays
array = np.array([[10, 25, 30],
              [45, 50, 15],
              [60, 20, 70]])
print(array[array > 40])