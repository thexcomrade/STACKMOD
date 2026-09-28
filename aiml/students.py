import pandas as pd
import numpy as np
data = {
 "RollNo": [101, 102, 103, 104, 105, 106, 107, 108, 109, 110],
 "Name": ["Anu", "Bijo", "Cathy", "Dev", "Esha", "Farhan", "Gita", "Hari", "Irfan", "Jaya"],
 "Gender": ["F", "M", "F", "M", "F", "M", "F", "M", "M", "F"],
 "Section": ["A", "A", "B", "B", "A", "C", "C", "B", "A", "C"],
 "Maths": [92, 78, 85, 45, 67, 88, 82, 59, 73, 95],
 "Science": [88, 65, 90, 52, 71, 79, 84, 48, 69, 91],
 "English": [81, 72, 88, 60, 68, 75, 90, 55, 66, 87],
 "Social": [79, 70, 84, 58, 64, 82, 86, 50, 71, 89],
 "Computer": [95, 80, 92, 40, 74, 85, 88, 62, 70, 98]
}
df = pd.DataFrame(data)
subjects = ["Maths", "Science", "English", "Social", "Computer"]

# A. Creating and Inspecting Data

# Q1. Create the DataFrame df using the code given above and display it.
print("\nDATA FRAME")
print(df)

# Q2. Display the first 3 rows and the last 4 rows of the DataFrame.
print("\nROW PRINTING ")
print(df.head(3))
print(df.tail(4))

# Q3. Find the shape (rows, columns) of the DataFrame.
print("\nSHAPE ")
print(df.shape)
# Q4. Display the column names, index, and data types of all columns.

print("\nCOLUMN ")
print(df.columns)

print("\nINDEX")
print(df.index)

print("\nDATA TYPE ")
print(df.dtypes)

# Q5. Use info() and describe() on the DataFrame. What does each tell you?
df.info()
print(df.describe)

# Q6. Set the RollNo column as the index. Store the result in a new DataFrame df2.
print("\nNEW DATA FRAME")
df2 = df.set_index("RollNo")
print(df2)

# B. Selecting Rows and Columns

# Q7. Display only the Name and Maths columns.

# Q8. Using loc on df2, display the details of the student with RollNo 105.

# Q9. Using iloc, display the rows at positions 2 to 5 and columns at positions 1 to 4 (both inclusive).

# Q10. Display the Name and Computer marks of the first five students.