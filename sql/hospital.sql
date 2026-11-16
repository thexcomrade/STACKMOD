USE HOSP;

CREATE TABLE Patients (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(50),
    City VARCHAR(50),
    BillAmount DECIMAL(10,2),
    DoctorName VARCHAR(50),
    Phone VARCHAR(15)
);

INSERT INTO Patients
(ID, Name, Age, Gender, Disease, City,
 BillAmount, DoctorName, Phone)
VALUES
(1, 'Arun', 25, 'Male', 'Fever', 'Kochi', 1500, 'Dr.Ravi', '9876543210'),
(2, 'Anu', 32, 'Female', 'Diabetes', 'Chennai', 5000, 'Dr.Meera', NULL),
(3, 'Rahul', 45, 'Male', 'BP', 'Bangalore', 3500, 'Dr.Ravi', '9876543211'),
(4, 'Meera', 28, 'Female', 'Fever', 'Kochi', 2000, 'Dr.Anil', NULL),
(5, 'Nikhil', 55, 'Male', 'Heart Disease', 'Trivandrum', 15000, 'Dr.Meera', '9876543212'),
(6, 'Diya', 22, 'Female', 'Asthma', 'Chennai', 4500, 'Dr.Anil', '9876543213'),
(7, 'Amal', 38, 'Male', 'Diabetes', 'Kochi', 6000, 'Dr.Ravi', NULL),
(8, 'Neha', 30, 'Female', 'BP', 'Bangalore', 3000, 'Dr.Meera', '9876543214'),
(9, 'Vijay', 60, 'Male', 'Heart Disease', 'Chennai', 20000, 'Dr.Anil', '9876543215'),
(10, 'Sneha', 27, 'Female', 'Fever', 'Trivandrum', 1800, 'Dr.Ravi', NULL),
(11, 'Kiran', 42, 'Male', 'Asthma', 'Kochi', 5500, 'Dr.Meera', '9876543216'),
(12, 'Priya', 35, 'Female', 'Diabetes', 'Bangalore', 7000, 'Dr.Anil', NULL),
(13, 'Ajay', 19, 'Male', 'Fever', 'Chennai', 1000, 'Dr.Ravi', '9876543217'),
(14, 'Lakshmi', 48, 'Female', 'BP', 'Kochi', 4000, 'Dr.Meera', '9876543218'),
(15, 'Sanjay', 33, 'Male', 'Asthma', 'Trivandrum', 6500, 'Dr.Anil', NULL),
(16, 'Asha', 24, 'Female', 'Migraine', 'Kollam', 2500, 'Dr.Ravi', '9876543219'),
(17, 'Manu', 50, 'Male', 'Diabetes', 'Kochi', 8500, 'Dr.Meera', '9876543220'),
(18, 'Divya', 29, 'Female', 'Asthma', 'Kollam', 3200, 'Dr.Anil', NULL),
(19, 'Suresh', 65, 'Male', 'Heart Disease', 'Bangalore', 25000, 'Dr.Meera', '9876543221'),
(20, 'Kavya', 21, 'Female', 'Fever', 'Kozhikode', 1200, 'Dr.Ravi', '9876543222'),
(21, 'Rohit', 36, 'Male', 'BP', 'Chennai', 4800, 'Dr.Anil', '9876543223'),
(22, 'Pooja', 31, 'Female', 'Diabetes', 'Kochi', 7200, 'Dr.Meera', NULL),
(23, 'Vishnu', 27, 'Male', 'Migraine', 'Kozhikode', 2800, 'Dr.Ravi', '9876543224'),
(24, 'Reshma', 44, 'Female', 'Heart Disease', 'Kollam', 18000, 'Dr.Meera', '9876543225'),
(25, 'Adithya', 18, 'Male', 'Fever', 'Trivandrum', 900, 'Dr.Anil', NULL),
(26, 'Nisha', 39, 'Female', 'BP', 'Kochi', 5300, 'Dr.Ravi', '9876543226'),
(27, 'Deepak', 52, 'Male', 'Diabetes', 'Chennai', 9500, 'Dr.Meera', '9876543227'),
(28, 'Isha', 26, 'Female', 'Asthma', 'Bangalore', 4100, 'Dr.Anil', NULL),
(29, 'Mohan', 47, 'Male', 'Migraine', 'Kollam', 3600, 'Dr.Ravi', '9876543228'),
(30, 'Tina', 34, 'Female', 'Fever', 'Kozhikode', 1600, 'Dr.Anil', '9876543229');

SELECT COUNT(*) AS TotalPatients FROM Patients;

#QUESTIONS

#SELECT
SELECT * FROM Patients;
SELECT Name, Age FROM Patients;
SELECT Name,Disease, BillAmount FROM Patients;
SELECT NAME,AGE FROM Patients WHERE AGE>40;
SELECT * FROM PATIENTS WHERE DISEASE='FEVER';

#WHERE
SELECT * FROM PATIENTS WHERE CITY='KOCHI';
SELECT * FROM PATIENTS WHERE GENDER='FEMALE';
SELECT * FROM PATIENTS WHERE BILLAMOUNT>5000;
select * from patients where city in ('chennai','kochi','ernakulam');

#like & null
select * from patients where name like 's%';
select * from patients where name like '%a';
select * from patients where name like '%h%';
select * from patients where phone is null;
select distinct disease from patients;

#aggregate & sorting
select count(distinct name) from patients;
select avg(billamount) from patients;
select max(billamount) from patients;
select count(distinct name) from patients where doctorname='dr.meera';
select * from patients order by billamount  desc;


select * from patients;

select * from patients order by name asc;


#AND, OR, NOT

select * from patients where disease='fever' and city='kochi';
select *  from patients where city = 'kochi'or city ='chennai';
select * from patients where age>40 and disease='diabetes';
select * from patients where disease <> 'fever';
select * from patients where city='kochi' and billamount>3000 and gender='male';

#BETWEEN, IN, NOT IN

select * from patients where age between 25 and 40;
select * from patients where billamount between 2000 and 6000;
select * from patients where city in ('kochi','kollam','kozhikode');
select * from patients where disease not in ('fever','asthma');
select * from patients where age not between 20 and 40;

#ORDER BY
select * from patients order by age asc;
select * from patients order by billamount desc;
select * from patients order by city asc;
select * from patients order by disease asc, billamount desc;
select * from patients order by gender asc, age asc;

#LIMIT and Pagination
select * from patients order by id  limit 5;
select * from patients order by billamount desc limit 3;
select * from patients order by age asc limit 5;
select * from patients order by billamount desc limit 5 offset 3;
select * from patients order by billamount desc limit 1 offset 1;

#Aggregate Functions
select count(*) as totalpatient from patients;
select sum(billamount) as totalbill from patients;
select avg(age) as avgage from patients;
select min(billamount) as minbill from patients;
select count(*) from patients where phone is null;

#GROUP BY
select city,count(*) as patientcount from patients group by city;
select disease, avg(billamount) as aba from patients group by disease;
select sum(billamount),doctorname as tba from patients group by doctorname;
select max(billamount),city as mb from patients group by city;
select count(name),gender as pg from patients group by gender;

SELECT Gender, COUNT(*) AS TotalPatients FROM Patients GROUP BY Gender;

#IF, IFNULL, COALESCE, and NULLIF
select name,billamount, if(billamount >= 3000, 'hig bill','low bill') as billstatus from patients;
select name, ifnull(phone, 'not provided') as phone from patients;
select name, coalesce(phone,city, 'no contact') as contact from patients;

SELECT NULLIF(10, 10) AS Result;

#String, Numeric, and Date Functions
select concat(name,' - ',city) as patientdetails from patients;
select upper(name) from patients;
select lower(city) from patients;
select name,char_length(name) as namelength from patients;
select name, left(name,4) from patients;
select name, right(city,3) from patients; 
select name,substring(name,2,4) from patients;
select trim('      mysql is easy       ') as text;
select ltrim('      mysql                    is easy') as text;
select rtrim('    mysql        is easy                ') as text;
SELECT REPLACE('Hello World', 'World', 'MySQL') AS Result; #frst word, where2change, word2change
SELECT LOCATE('b', 'Database') AS Position;

#Numeric functions
SELECT ROUND(125.678, 2); #round a no 
SELECT CEIL(12.1); #round to higher value
SELECT FLOOR(12.9); #round to lower value
SELECT ABS(-25.5678); #absolute value
SELECT MOD(10, 3); #remainder
SELECT POWER(2, 3); #raises to
SELECT SQRT(144); #square root

#Date and time
-- Current date
SELECT CURDATE();

-- Current date and time
SELECT NOW();

-- Extract year
SELECT YEAR('2026-10-26');

-- Extract month
SELECT MONTH('2026-10-26');

-- Extract day
SELECT DAY('2026-10-26');

-- Difference in days
SELECT DATEDIFF('2026-10-26', '2026-10-01');

-- Add seven days
SELECT DATE_ADD('2026-10-26', INTERVAL 7 DAY);

-- Subtract one month
SELECT DATE_SUB('2026-10-26', INTERVAL 1 MONTH);

-- Last day of the month
SELECT LAST_DAY('2026-10-26');

-- Day name
SELECT DAYNAME('2026-10-26');

-- Month name
SELECT MONTHNAME('2026-10-26');

-- Format a date
SELECT DATE_FORMAT('2026-10-26', '%d-%m-%Y');


#UNION & UNION ALL

   select * from patients;

select city as location from patients where city='kochi' union select city as location from patients where city='kollam';

#INTERSECT and EXCEPT
SELECT City
FROM Patients
WHERE Age > 40

INTERSECT

SELECT City
FROM Patients
WHERE BillAmount > 10000;

SELECT City
FROM Patients

EXCEPT

SELECT City
FROM Patients
WHERE BillAmount > 10000;

#JOINS
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100)
);

INSERT INTO Doctors (DoctorID, DoctorName, Specialization)
VALUES
(1, 'Dr.Ravi', 'General Medicine'),
(2, 'Dr.Meera', 'Cardiology'),
(3, 'Dr.Anil', 'Pulmonology');


select p.name as patientname, 
p.disease,d.doctorname,d.specialization 
from patients as p inner join doctors as d
on p.doctorname = d.doctorname;

select p.name,p.doctorname,d.specialization from patients as p
left join doctors as d
on p.doctorname = d.doctorname;

SELECT p.*
FROM Patients AS p
LEFT JOIN Doctors AS d
    ON p.DoctorName = d.DoctorName
WHERE d.DoctorID IS NULL;

select p.name, d.doctorname from patients as p
right join doctors as d
on p.doctorname = d.doctorname;

select p.name,d.doctorname from patients as p
cross join doctors as d;


CREATE TABLE Pat (
    ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Gender VARCHAR(10),
    Disease VARCHAR(50),
    City VARCHAR(50),
    BillAmount DECIMAL(10,2),
    Payment VARCHAR(20)
);

INSERT INTO Pat
(ID, Name, Age, Gender, Disease, City, BillAmount, Payment)
VALUES
(1, 'Arun', 25, 'Male', 'Fever', 'Kochi', 1500, 'Paid'),
(2, 'Anu', 32, 'Female', 'Diabetes', 'Chennai', 5000, 'Pending'),
(3, 'Rahul', 45, 'Male', 'BP', 'Bangalore', 3500, 'Paid'),
(4, 'Meera', 28, 'Female', 'Fever', 'Kochi', 2000, 'Pending'),
(5, 'Nikhil', 55, 'Male', 'Heart Disease', 'Trivandrum', 15000, 'Paid'),
(6, 'Diya', 22, 'Female', 'Asthma', 'Chennai', 4500, 'Pending'),
(7, 'Amal', 38, 'Male', 'Diabetes', 'Kochi', 6000, 'Paid'),
(8, 'Neha', 30, 'Female', 'BP', 'Bangalore', 3000, 'Pending'),
(9, 'Vijay', 60, 'Male', 'Heart Disease', 'Chennai', 20000, 'Paid'),
(10, 'Sneha', 27, 'Female', 'Fever', 'Trivandrum', 1800, 'Pending'),
(11, 'Kiran', 42, 'Male', 'Asthma', 'Kochi', 5500, 'Paid'),
(12, 'Priya', 35, 'Female', 'Diabetes', 'Bangalore', 7000, 'Pending'),
(13, 'Ajay', 19, 'Male', 'Fever', 'Chennai', 1000, 'Paid'),
(14, 'Lakshmi', 48, 'Female', 'BP', 'Kochi', 4000, 'Paid'),
(15, 'Sanjay', 33, 'Male', 'Asthma', 'Trivandrum', 6500, 'Pending'),
(16, 'Asha', 24, 'Female', 'Migraine', 'Kollam', 2500, 'Paid'),
(17, 'Manu', 50, 'Male', 'Diabetes', 'Kochi', 8500, 'Pending'),
(18, 'Divya', 29, 'Female', 'Asthma', 'Kollam', 3200, 'Paid'),
(19, 'Suresh', 65, 'Male', 'Heart Disease', 'Bangalore', 25000, 'Pending'),
(20, 'Kavya', 21, 'Female', 'Fever', 'Kozhikode', 1200, 'Paid');

select * from pat;
-- CASE RELATED QUESTIONS

-- 1 
select name, age, case
when age < 25 then 'young'
when age between 25 and 45 then 'adult'
when age > 45 then 'senior'
end as agecategory 
from pat;

-- 2
select name, billamount, CASE
when billamount < 2000 then 'low bill'
when billamount between 2000 and 10000 then 'medium'
when billamount > 10000 then 'high bill'
end as billcategory from pat;

-- 3
select name, payment, case 
when payment = 'paid' then 'payment completed'
when payment = 'pending' then 'payment due'
else 'unknown status'
end as paymentmessage from pat;

-- 4
select name, gender, case 
when gender = 'male' then 'mr'
when gender = 'female' then 'mrs'
else 'other'
end as tile from pat;

-- 5

select name,age, disease, case 
when disease = 'heart disease' then 'critical'
when disease = 'diabetes' OR disease = 'bp' then 'high priority'
when disease = 'asthma' then 'medium priority'
else 'normal' end as diseasestatus from pat;