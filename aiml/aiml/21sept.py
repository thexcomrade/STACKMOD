import numpy as np

# Create a 1D array with elements [10, 20, 30, 40, 50]. Print the last element using negative indexing.

arr1=np.array([10, 20, 30, 40, 50])
print(arr1[-1:])

# Create a 1D array [1,2,3,4,5,6,7]. Slice elements from index 2 to 5.

arr2=np.array([1,2,3,4,5,6,7])
print(arr2[2:5])

# From array [5,10,15,20,25,30], Print elements using step slicing (every 2 elements).

arr3=np.array([5,10,15,20,25,30])
print(arr3[::2])

# Reverse a 1D array using slicing. 
print(arr3[::-1])
# Extract last 3 elements using negative slicing.
print(arr3[-3:])

# Create array [100,200,300,400,500]. Print the second last element.
arr4=np.array([100,200,300,400,500])
print(arr4[-2:-1])

# From [1,2,3,4,5,6], Print elements from last to first.
arr4=np.array([1,2,3,4,5,6])
print(arr4[::-1])

# Extract elements from -4 to -1.
print(arr4[-4::])

# Replace the last element using negative indexing.
arr4[-1]=100
print(arr4)
# Access third element from the end.
print(arr3[-3])

arr5=np.array([1,2,3,4,5,6,7,8,9])
# Slice first 4 elements from an array.
print(arr5[:4])
# Slice elements from index 1 to end.
print(arr5[1:])
# Slice alternate elements from array.
print(arr5[::1])
# Slice array in reverse order.
print(arr5[::-1])
# Extract middle elements from [10,20,30,40,50,60].
arr6=np.array([10,20,30,40,50,60])
print(arr6[3])