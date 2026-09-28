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
print("\nName & Math Column")
print(df[["Name", "Maths"]])

# Q8. Using loc on df2, display the details of the student with RollNo 105.
print("\nRollNo 105")
print(df2.loc[105])

# Q9. Using iloc, display the rows at positions 2 to 5 and columns at positions 1 to 4 (both inclusive).
print(df.iloc[2:6,1:5])

# Q10. Display the Name and Computer marks of the first five students.
print("\nName & Comp Mark Frst5")
print(df[["Name", "Computer"]].head(5))

# C. Filtering Data

# Q11. Display all students who scored more than 80 in Maths.
print("\nAbove 80 in Maths")
print(df["Maths"] > 80)

# Q12. Display the students who scored above 75 in both Science and English.
print("\nAbove 75 in both Science and English")
print(df[(df["Science"] > 75) & (df["English"] > 75)])

# Q13. Display the students who belong to Section A or Section C.
print("\nSection A or Section C")
print(df[(df["Section"] == " A") & (df["Section"] == "C") ])

# Q14. Display the female students of Section B.
print("\nFemale students of Section B")
print(df[(df["Section"] == "B") & (df["Gender"] == "F") ])

# Q15. Display the students whose name starts with the letter 'A' or 'J'.
print(df["Name"].str.startswith(("A","J")))

# Q16. Find the students who scored less than 50 in at least one subject.
print("\nAtleast one subject >50")
print(  #we use | because at least one subject can be below 50
    (df["Maths"] < 50) |
(df["Science"] < 50) |
(df["English"] < 50) |
(df["Social"] < 50) |
(df["Computer"] < 50)
)
# Q17. Use isin() to display the students whose RollNo is 102, 105 or 108.
print("\nRollNo is 102, 105 or 108")
print(df["RollNo"].isin([102, 105, 108]))

# D. Statistics and Aggregation

# Q18. Add a new column Total containing the sum of the five subject marks, and display Name and Total.
df["Total"] = df[subjects].sum(axis=1)

print("\nName and Total:")
print(df[["Name", "Total"]])

# Q19. Find the mean, maximum and minimum marks in each subject.

print("MEAN :",df[subjects].mean())
print("MAX VALUE :",df[subjects].max())
print("MIN VALUE :",df[subjects].min())

# Q20. Find the name of the student who scored the highest Total.
print("\nHighest Total")
print(df.loc[df["Total"].idxmax(), "Name"])

# Q21. Find the name of the student who scored the lowest in Science.
print("\nMin Science")
print(df.loc[df["Science"].idxmin(), "Name"])

# Q22. Find how many students scored above 90 in Computer.
print((df["Computer"] > 90).sum())

# Q23. Find the class average of the Total marks.
print(df["Total"].mean())

# Q24. Find the subject with the highest average mark.
print(df[subjects].mean().idxmax())

# Q25. Calculate the correlation between Maths and Science marks.
print(df["Maths"].corr(df["Science"]))

# E. Sorting and Ranking


# Q26. Sort the DataFrame by Total in descending order.
print(df.sort_values("Total", ascending=False))

# Q27. Sort by Section (ascending) and then by Total (descending).
print(df.sort_values(["Section", "Total"], ascending=[True, False]))

# Q28. Display the top 3 students using nlargest() and the bottom 3 using nsmallest() based on Total.
df.nlargest(3, "Total")
df.nsmallest(3, "Total")

# Q29. Add a Rank column that ranks students by Total (highest = rank 1).
df["Rank"] = df["Total"].rank(ascending=False, method="min")