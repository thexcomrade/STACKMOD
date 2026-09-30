import pandas as pd

data = {
    "Name": ["Asha", "Ben", "Chitra", "Dev", "Esha", "Farhan", "Gita", "Hari", "Ivy", "Jose"],
    "Dept": ["HR", "IT", "IT", "Sales", "HR", "Sales", "IT", "Sales", "HR", "IT"],
    "City": ["Kochi", "Chennai", "Kochi", "Delhi", "Chennai", "Delhi", "Kochi", "Kochi", "Delhi", "Chennai"],
    "Age": [29, 34, 26, 41, 38, 30, 27, 45, 33, 36],
    "Salary": [42000, 65000, 58000, 50000, 47000, 52000, 61000, 55000, 45000, 70000],
    "Rating": [4.2, 3.8, 4.5, 3.5, 4.0, 4.1, 4.7, 3.9, 4.3, 3.6],
}

df = pd.DataFrame(data)


# Q1. Find the number of rows and columns of df.
print(df.shape)


# Q2. Print only the number of rows. Then print only the number of columns.
print(df.shape[0])
print(df.shape[1])


# Q3. Find the total number of elements (cells) in df.
print(df.size)


# Q4. Find the number of dimensions of df. Then find the ndim of the single column df["Salary"]. Why are they different?
print(df.ndim)
print(df["Salary"].ndim)


# Q5. Display the first 3 rows using iloc.
print(df.iloc[:3])


# Q6. Display the last 2 rows using iloc.
print(df.iloc[-2:])


# Q7. Get the value in the 4th row and 2nd column.
print(df.iloc[3, 1])


# Q8. Select rows 2 to 5 and columns 0 to 2.
print(df.iloc[2:6, 0:3])


# Q9. Select rows 0, 4 and 8 with only columns 1 and 3.
print(df.iloc[[0, 4, 8], [1, 3]])


# Q10. Display the row with index label 3.
print(df.loc[3])


# Q11. Display the Name and Salary columns for all rows.
print(df.loc[:, ["Name", "Salary"]])


# Q12. Show Name, Dept and Age for index labels 2 to 6.
print(df.loc[2:6, ["Name", "Dept", "Age"]])


# Q13. Show all employees whose Dept is "IT".
print(df.loc[df["Dept"] == "IT"])


# Q14. Show Name and Salary of employees who earn more than 55000.
print(df.loc[df["Salary"] > 55000, ["Name", "Salary"]])


# Q15. Show employees from "Kochi" with Rating above 4.0.
print(df.loc[(df["City"] == "Kochi") & (df["Rating"] > 4.0)])


# Q16. Sort the DataFrame by Salary in ascending order.
print(df.sort_values("Salary"))


# Q17. Sort by Salary in descending order.
print(df.sort_values("Salary", ascending=False))


# Q18. Sort by Age and show only the 3 youngest employees.
print(df.sort_values("Age").iloc[:3])


# Q19. Sort by Dept (A to Z) and then by Salary (high to low) within each department.
print(df.sort_values(["Dept", "Salary"], ascending=[True, False]))


# Q20. Find the name of the highest-rated employee using sort_values() and iloc.
print(df.sort_values("Rating", ascending=False).iloc[0]["Name"])


# Q21. Count how many employees are in each Dept.
print(df["Dept"].value_counts())


# Q22. Count how many employees are in each City.
print(df["City"].value_counts())


# Q23. Show the Dept counts as percentages.
print(df["Dept"].value_counts(normalize=True))


# Q24. Which city has the most employees? Print only its name.
print(df["City"].value_counts().idxmax())


# Q25. Find the mean of Salary using agg().
print(df["Salary"].agg("mean"))


# Q26. Find the min, max and mean of Salary in one agg() call.
print(df["Salary"].agg(["min", "max", "mean"]))


# Q27. Apply different functions to different columns: mean of Age, and max of Salary.
print(df.agg({"Age": "mean", "Salary": "max"}))


# Q28. Use groupby("Dept") with agg() to get the average salary per department.
print(df.groupby("Dept").agg({"Salary": "mean"}))


# Q29. Group by City and find the min and max Age in each city.
print(df.groupby("City").agg({"Age": ["min", "max"]}))


# Q30. Get IT employees, sort them by Salary (high to low), and show only Name and Salary.
print( df[df["Dept"] == "IT"].sort_values("Salary", ascending=False)[["Name", "Salary"]] )


# Q31. Find the average salary of employees older than 30, grouped by Dept.
print(df[df["Age"] > 30].groupby("Dept").agg({"Salary": "mean"}))


# Q32. Find the department with the highest average rating,
# using groupby, agg and sort_values.
print(
    df.groupby("Dept")
    .agg({"Rating": "mean"})
    .sort_values("Rating", ascending=False)
)


# Q33. Filter employees with Rating >= 4.0,then use shape to find how many there are.
print(df[df["Rating"] >= 4.0].shape[0])


# Q34. Show the top 3 highest-paid employees in "Delhi" or "Kochi".
print(df[df["City"].isin(["Delhi", "Kochi"])].sort_values("Salary", ascending=False).iloc[:3]
)