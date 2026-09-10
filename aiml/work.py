import numpy as np

# 1. linspace() – Practical Questions

# Create 5 equally spaced numbers between 0 and 20.
a = np.linspace(0,20,5)
print(a)

# Create 10 equally spaced numbers between 1 and 100.
b = np.linspace(1,100,20)
print(b)

# Generate 5 equally spaced decimal values between 2 and 10.
c = np.linspace(2,10,5)
print(c)

# 2. Random Integer – randint()

# Generate 5 random integers between 1 and 50.
d=np.random.randint(1,50,5)
print(d)

# Generate 10 random integers between 10 and 100.
e=np.random.randint(10,100,5)
print(e)

# Generate 5 random numbers representing students' marks between 0 and 100.
f=np.random.randint(0,100,5)
print(f)

# 5. Positive Indexing in NumPy

# Create an array containing 10, 20, 30, 40, 50. Access the first element using its index.
arr=([10, 20, 30, 40, 50])
print(arr[1])

# Access the third element from the same array.
print(arr[3])

# Access the last element using positive indexing.
print(arr[4])

# Create an array of 6 numbers and access the element at index 3.
r=([10, 20, 30, 40, 50,60])
print(r[3])

# Create a 2D array and access the element from the second row and third column using positive indexing.
r = np.array([
    [10, 20, 30],
    [40, 50,60]
    ])
print(r[1][2])



# 6. Negative Indexing in NumPy

# Create an array containing 10, 20, 30, 40, 50. Access the last element using negative indexing.
m=np.array([10, 20, 30, 40, 50])
print(m[-1])
# Access the second-last element using negative indexing.
print(m[-2])
# Access the third-last element using negative indexing.
print(m[-3])


# Create an array of 6 numbers and access the last 3 elements individually using negative indexes.
n=np.array([10, 20, 30, 40, 50,60])
print(n[-1]), print(n[-2]), print(n[-3])

# Create a 2D array and access the last element of the last row using negative indexing.
x = np.array([
    [10, 20, 30],
    [40, 50,60]
    ])
print(x[1][-1])