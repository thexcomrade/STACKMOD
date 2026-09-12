import numpy as np

students = np.array([
    "Arun", "Anu", "Rahul", "Meera", "Amal",
    "Diya", "Vishnu", "Sneha", "Akhil", "Fathima"
])

marks = np.array([
    [78, 85, 72, 80, 88],
    [92, 89, 95, 90, 94],
    [65, 70, 68, 72, 75],
    [88, 84, 91, 86, 90],
    [55, 62, 58, 60, 65],
    [76, 80, 74, 78, 82],
    [45, 52, 48, 55, 50],
    [90, 94, 89, 92, 96],
    [68, 73, 70, 65, 72],
    [82, 87, 85, 80, 89]
])

# Total & Average

total = np.sum(marks, axis=1)
average = np.mean(marks, axis=1)

for i in range(len(students)):
    print(students[i], total[i], average[i])

# Top Student

top_index = np.argmax(average)

print("Top Student:", students[top_index])
print("Average:", average[top_index])

# Pass / Fail

result = np.where(average >= 50, "Pass", "Fail")
print(result)

# Report

print("\nSTUDENT PERFORMANCE REPORT")

print("Total Students:", len(students))
print("Total Subjects:", marks.shape[1])
print("Highest Mark:", np.max(marks))
print("Lowest Mark:", np.min(marks))

top_index = np.argmax(average)
low_index = np.argmin(average)

print("Top Student:", students[top_index])
print("Top Student Average:", average[top_index])

print("Lowest Performing Student:", students[low_index])
print("Lowest Student Average:", average[low_index])
