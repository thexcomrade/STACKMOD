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