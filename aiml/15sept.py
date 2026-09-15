import numpy as np

# 23-27 | 15/09

# 1. Statistical Functions – Practical Questions

# Create a NumPy array containing the marks of 10 students. Find the mean of the marks.
mark = np.array([67,75,78,80,75,76,87,80,67,70])
print("Average:", np.mean(mark))

# Create an array of student marks and calculate the sum of all marks.
print("Sum:", np.sum(mark))

# Create an array of numbers and find the median.
print("Median:", np.median(mark))

# Create an array of exam marks and calculate the standard deviation.
print("Standard Deviation:", np.std(mark))

# Create an array of employee salaries and find the minimum and maximum salary.
salary=np.array([30000,32500,33000,45000,41000,34500])
print("Maximum:", np.max(salary))
print("Minimum:", np.min(salary))


# Create an array containing repeated values and find the mode.
from statistics import mode
num=np.array([12,34,21,24,54,34,2,24])
print("Mode:",mode(num))
      

# Create an array of monthly sales and calculate the variance.
sales=np.array([30000,32500,33000,45000,41000,34500])
print("Sales Variance:", np.var(sales))


# 2. flatten() – Practical Questions

# Create a 2D array (3×3) and convert it into a 1D array using flatten().

arr1=np.array([
    [
        [6,2,5],
        [5,9,2]
    ],
    [
        [2,3,4],
        [5,6,7]
    ]
])
print(arr1.flatten())

# Create a 2×4 array and convert it into a 1D array.

arr2=np.array([
    [6,2,5,6],
    [5,9,2,1]
    ])
print(arr2.flatten())


# 3. reshape() – Practical Questions
# Create an array containing numbers from 1 to 12 and reshape it into a 3×4 array.
arr3=np.array([1,2,3,4,5,6,7,8,9,10,11,12])
print(arr3.reshape(3,4))

# Create numbers from 1 to 9 and reshape them into a 3×3 array.
arr4=np.array([1,2,3,4,5,6,7,8,9])
print(arr4.reshape(3,3))

# Create numbers from 1 to 12 and reshape them into 2×2×3.
arr4=np.array([1,2,3,4,5,6,7,8,9,10,11,12])
print(arr4.reshape(2,2,3))

# Create a 1D array containing 20 values and reshape it into a 4×5 matrix.
arr5=np.array([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20])
print(arr5.reshape(4,5))

# 4. transpose() – Practical Questions

# Create a 2×3 matrix and find its transpose.
arr6 = np.array([
    [1, 2, 3],
    [4, 5, 6]
])
print(arr6.T)
# Create a student marks matrix with 3 students and 4 subjects. Transpose the matrix.
stud = np.array([
    [78, 85, 90, 88],
    [65, 72, 80, 75],
    [90, 95, 92, 89]
])
print(stud.T)

# Create a 2D array and compare the original array and transposed array shapes.
arr8 = np.array([
    [1,2,3],
    [4,5,6]
])

print("Original shape:", arr8.shape)
print("Transposed shape:", arr8.T.shape)

print("Original array:\n", arr8)
print("Transposed array:\n", arr8.T)