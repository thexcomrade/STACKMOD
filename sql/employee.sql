CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

CREATE TABLE EMP (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(50),
    Email VARCHAR(100)
    

CREATE TABLE EMP2 (
    Id INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Department VARCHAR(30),
    Salary INT,
    City VARCHAR(50),
    Email VARCHAR(100)
);

INSERT INTO EMP2
(Id, Name, Age, Department, Salary, City, Email)
VALUES
(201, 'Vishnu', 24, 'IT', 30000, 'Kochi', 'vishnu@gmail.com'),
(202, 'Anjali', 29, 'HR', 40000, 'Chennai', 'anjali@gmail.com'),
(203, 'Rahul', 33, 'Finance', 25000, 'Kochi', 'rahul@gmail.com'),
(204, 'Neha', 26, 'Sales', 35000, 'Kollam', NULL),
(205, 'Sanjay', 28, 'IT', 50000, 'Kochi', 'sanjay@gmail.com');

select * from emp;
select * from emp2;

SELECT Name, Age AS list FROM EMP
UNION
SELECT Name, Age FROM EMP2;

SELECT Name, Age AS list FROM EMP
UNION ALL
SELECT Name, Age FROM EMP2;

#DELETE

delete from emp where id=108;
delete from emp where city='chennai';

#DEFAULT and AUTO_INCREMENT

CREATE TABLE Medicines (
    MedicineID INT AUTO_INCREMENT PRIMARY KEY,
    MedicineName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) DEFAULT 0.00
);

select * from medicines;

INSERT INTO Medicines (MedicineName, Price)
VALUES ('Paracetamol', 25.00);
INSERT INTO Medicines (MedicineName)
VALUES ('Vitamin Tablet');

#CASE

SELECT 
    Name,
    Age,
    CASE
        WHEN Age < 18 THEN 'Young'
        WHEN Age < 20 THEN 'Adult'
        WHEN Age < 50 THEN 'Aged'
        ELSE 'Senior'
    END AS AgeCategory
FROM EMP;

select name, salary, case
when salary>= 80000 then 'high'
when salary>= 50000 then 'medium'
when salary>= 35000 then 'low'
end as salarylist
from emp;



