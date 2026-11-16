create database companydb;

use companydb;

create table emp (
    id int primary key, name varchar(20), age varchar(3), gender char(1),
    salary decimal(10,2), deptid char(3), joiningdate date, city varchar(15) 
);

INSERT INTO emp (id, name, age, gender, salary, deptid, joiningdate, city)
VALUES
(1, 'Arun', 24, 'M', 25000.00, 'D01', '2023-01-15', 'Kochi'),
(2, 'Anjali', 26, 'F', 32000.00, 'D02', '2022-05-20', 'Kozhikode'),
(3, 'Rahul', 28, 'M', 45000.00, 'D03', '2021-03-10', 'Trivandrum'),
(4, 'Meera', 23, 'F', 22000.00, 'D01', '2024-02-01', 'Thrissur'),
(5, 'Vishnu', 30, 'M', 55000.00, 'D04', '2020-07-12', 'Kannur'),
(6, 'Sneha', 25, 'F', 35000.00, 'D02', '2023-06-18', 'Kochi'),
(7, 'Akhil', 27, 'M', 40000.00, 'D03', '2022-09-25', 'Palakkad'),
(8, 'Diya', 22, 'F', 20000.00, 'D01', '2024-04-05', 'Kollam'),
(9, 'Nikhil', 32, 'M', 60000.00, 'D04', '2019-11-30', 'Kochi'),
(10, 'Athira', 29, 'F', 48000.00, 'D03', '2021-08-14', 'Alappuzha'),
(11, 'Kiran', 26, 'M', 30000.00, 'D02', '2023-10-02', 'Malappuram'),
(12, 'Devika', 24, 'F', 27000.00, 'D01', '2024-01-20', 'Kottayam'),
(13, 'Manu', 35, 'M', 75000.00, 'D04', '2018-06-11', 'Kochi'),
(14, 'Neha', 27, 'F', 42000.00, 'D03', '2022-12-15', 'Kannur'),
(15, 'Sanjay', 31, 'M', 52000.00, 'D02', '2020-03-22', 'Thrissur'),
(16, 'Lakshmi', 23, 'F', 24000.00, 'D01', '2024-05-10', 'Kozhikode'),
(17, 'Abhinav', 29, 'M', 47000.00, 'D03', '2021-10-08', 'Palakkad'),
(18, 'Parvathy', 28, 'F', 39000.00, 'D02', '2022-04-17', 'Kollam'),
(19, 'Rohit', 33, 'M', 68000.00, 'D04', '2019-02-28', 'Trivandrum'),
(20, 'Amrutha', 25, 'F', 33000.00, 'D01', '2023-08-19', 'Alappuzha');

select * from emp;

CREATE TABLE dept (
    deptid CHAR(3) PRIMARY KEY,
    deptname VARCHAR(20)
);

INSERT INTO dept (deptid, deptname)
VALUES
('D01', 'HR'),
('D02', 'Finance'),
('D03', 'IT'),
('D04', 'Marketing'),
('D05', 'Sales');

alter table emp add email varchar(30);
alter table emp modify salary decimal(8,2);

alter table staff drop column email;


create table projects(project_id int primary key, project_name varchar(30));
truncate table projects;
drop table projects;

alter table staff   modify name varchar(20) not null;