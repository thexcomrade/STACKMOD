import pandas as pd
# Creating from a dictionary
data = {
'Name': ['Alice', 'Bob', 'Charlie', 'David'],
'Age': [25, 30, 22, 35],
'City': ['New York', 'London', 'Paris', 'London'],
'Salary': [70000, 85000, 58000, 92000]
}
df = pd.DataFrame(data)
print(df)
print(df.size)
print(df.shape)
print(df.ndim)

print("\nSort by Age ascending")
# Sort by Age ascending (default)
x= df.sort_values(by='Age')
print(x)

# Sort by Salary descending
print("\nSort by Salary descending")
y = df.sort_values(by='Salary', ascending=False)
print(y)

# loc[row_label, col_label]
print("\nLOC FUNCTION")
print(df.loc[0, 'Name']) 
print(df.loc[0:2, ['Name', 'Age']]) 
# iloc[row_position, col_position]
print("\nILOC FUNCTION")
# print(df.iloc[0, 2])
print(df.iloc[2:4, 1:3])