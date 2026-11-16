create database bank;
use bank;


create table branches (
    branch_id int primary key auto_increment,
    branch_name varchar(100) not null,
    branch_code varchar(20) not null unique,
    city varchar(50) not null,
    state varchar(50),
    address varchar(255),
    phone varchar(15),
    created_at timestamp default current_timestamp
);


create table account_types (
    account_type_id int primary key auto_increment,
    type_name varchar(50) not null unique,
    minimum_balance decimal(15,2) default 0,
    interest_rate decimal(5,2) default 0,
    description varchar(255),
    check (minimum_balance >= 0),
    check (interest_rate >= 0)
);


create table interest_rates (
    rate_id int primary key auto_increment,
    rate_type varchar(50) not null,
    interest_rate decimal(5,2) not null,
    effective_from date not null,
    effective_to date,
    status varchar(20) default 'Active',
    check (interest_rate >= 0),
    check (status in ('Active', 'Inactive')),
    check (effective_to is null or effective_to >= effective_from)
);


create table customers (
    customer_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique,
    phone varchar(15) not null,
    date_of_birth date,
    gender varchar(15),
    address varchar(255),
    city varchar(50),
    state varchar(50),
    pincode varchar(10),
    branch_id int,
    registration_date date default (current_date),
    kyc_status varchar(20) default 'Pending',

    foreign key (branch_id)
        references branches(branch_id),

    check (gender is null or gender in ('Male', 'Female', 'Other')),
    check (kyc_status in ('Pending', 'Verified', 'Rejected'))
);


create table employees (
    employee_id int primary key auto_increment,
    employee_name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    designation varchar(50),
    salary decimal(12,2),
    joining_date date,
    branch_id int,

    foreign key (branch_id)
        references branches(branch_id),

    check (salary is null or salary >= 0)
);


create table accounts (
    account_id int primary key auto_increment,
    account_number varchar(30) not null unique,
    customer_id int not null,
    account_type_id int not null,
    branch_id int not null,
    balance decimal(15,2) default 0,
    nominee_name varchar(100),
    opening_date date default (current_date),
    status varchar(20) default 'Active',

    foreign key (customer_id)
        references customers(customer_id),

    foreign key (account_type_id)
        references account_types(account_type_id),

    foreign key (branch_id)
        references branches(branch_id),

    check (balance >= 0),
    check (status in ('Active', 'Inactive', 'Closed', 'Frozen'))
);


create table transactions (
    transaction_id int primary key auto_increment,
    account_id int not null,
    employee_id int,
    branch_id int,
    transaction_type varchar(20) not null,
    amount decimal(15,2) not null,
    transaction_date datetime default current_timestamp,
    description varchar(255),
    status varchar(20) default 'Success',
    reference_number varchar(50) unique,

    foreign key (account_id)
        references accounts(account_id),

    foreign key (employee_id)
        references employees(employee_id),

    foreign key (branch_id)
        references branches(branch_id),

    check (amount > 0),
    check (transaction_type in ('Deposit', 'Withdrawal', 'Transfer')),
    check (status in ('Success', 'Failed', 'Pending'))
);


create table beneficiaries (
    beneficiary_id int primary key auto_increment,
    customer_id int not null,
    beneficiary_name varchar(100) not null,
    account_number varchar(30) not null,
    bank_name varchar(100),
    ifsc_code varchar(20),
    added_date date default (current_date),
    status varchar(20) default 'Active',

    foreign key (customer_id)
        references customers(customer_id),

    check (status in ('Active', 'Inactive'))
);


create table transfers (
    transfer_id int primary key auto_increment,
    from_account_id int not null,
    to_account_id int not null,
    beneficiary_id int,
    transaction_id int,
    amount decimal(15,2) not null,
    transfer_date datetime default current_timestamp,
    transfer_mode varchar(20),
    status varchar(20) default 'Pending',
    reference_number varchar(50) unique,

    foreign key (from_account_id)
        references accounts(account_id),

    foreign key (to_account_id)
        references accounts(account_id),

    foreign key (beneficiary_id)
        references beneficiaries(beneficiary_id),

    foreign key (transaction_id)
        references transactions(transaction_id),

    check (from_account_id <> to_account_id),
    check (amount > 0),
    check (transfer_mode is null or transfer_mode in ('NEFT', 'RTGS', 'IMPS', 'UPI')),
    check (status in ('Pending', 'Success', 'Failed'))
);


create table loans (
    loan_id int primary key auto_increment,
    customer_id int not null,
    branch_id int,
    employee_id int,
    loan_type varchar(50) not null,
    loan_amount decimal(15,2) not null,
    interest_rate decimal(5,2) not null,
    issue_date date,
    due_date date,
    outstanding_amount decimal(15,2),
    status varchar(20) default 'Pending',

    foreign key (customer_id)
        references customers(customer_id),

    foreign key (branch_id)
        references branches(branch_id),

    foreign key (employee_id)
        references employees(employee_id),

    check (loan_amount > 0),
    check (interest_rate >= 0),
    check (outstanding_amount is null or outstanding_amount >= 0),
    check (status in ('Pending', 'Approved', 'Active', 'Closed', 'Defaulted'))
);


create table loan_payments (
    payment_id int primary key auto_increment,
    loan_id int not null,
    payment_amount decimal(15,2) not null,
    payment_date date,
    payment_method varchar(30),
    payment_status varchar(20) default 'Paid',
    due_date date,

    foreign key (loan_id)
        references loans(loan_id),

    check (payment_amount > 0),
    check (payment_status in ('Paid', 'Pending', 'Overdue', 'Failed'))
);


create table cards (
    card_id int primary key auto_increment,
    account_id int not null,
    card_number varchar(30) not null unique,
    card_type varchar(20),
    card_network varchar(20),
    issue_date date,
    expiry_date date,
    status varchar(20) default 'Active',

    foreign key (account_id)
        references accounts(account_id),

    check (card_type in ('Debit', 'Credit')),
    check (status in ('Active', 'Blocked', 'Expired', 'Inactive'))
);


create table atm_transactions (
    atm_transaction_id int primary key auto_increment,
    account_id int not null,
    transaction_id int,
    atm_id varchar(30),
    transaction_type varchar(20),
    amount decimal(15,2) not null,
    transaction_date datetime default current_timestamp,
    location varchar(100),
    status varchar(20) default 'Success',

    foreign key (account_id)
        references accounts(account_id),

    foreign key (transaction_id)
        references transactions(transaction_id),

    check (amount > 0),
    check (transaction_type in ('Withdrawal', 'Balance Inquiry', 'Deposit')),
    check (status in ('Success', 'Failed', 'Declined'))
);


create table fixed_deposits (
    fd_id int primary key auto_increment,
    customer_id int not null,
    account_id int not null,
    principal_amount decimal(15,2) not null,
    interest_rate decimal(5,2) not null,
    opening_date date not null,
    maturity_date date not null,
    maturity_amount decimal(15,2),
    status varchar(20) default 'Active',

    foreign key (customer_id)
        references customers(customer_id),

    foreign key (account_id)
        references accounts(account_id),

    check (principal_amount > 0),
    check (interest_rate >= 0),
    check (maturity_date > opening_date),
    check (status in ('Active', 'Matured', 'Closed'))
);


create table complaints (
    complaint_id int primary key auto_increment,
    customer_id int not null,
    branch_id int,
    employee_id int,
    complaint_type varchar(100),
    complaint_description text,
    complaint_date date default (current_date),
    resolution_date date,
    status varchar(20) default 'Open',
    priority varchar(20) default 'Medium',

    foreign key (customer_id)
        references customers(customer_id),

    foreign key (branch_id)
        references branches(branch_id),

    foreign key (employee_id)
        references employees(employee_id),

    check (status in ('Open', 'In Progress', 'Resolved', 'Closed')),
    check (priority in ('Low', 'Medium', 'High', 'Critical'))
);


create table kyc_documents (
    document_id int primary key auto_increment,
    customer_id int not null,
    document_type varchar(50) not null,
    document_number varchar(100),
    submission_date date default (current_date),
    verification_date date,
    status varchar(20) default 'Pending',

    foreign key (customer_id)
        references customers(customer_id),

    check (status in ('Pending', 'Verified', 'Rejected'))
);


create table audit_logs (
    log_id int primary key auto_increment,
    employee_id int,
    customer_id int,
    action_type varchar(50) not null,
    table_name varchar(50),
    record_id int,
    action_description text,
    action_timestamp datetime default current_timestamp,
    ip_address varchar(45),

    foreign key (employee_id)
        references employees(employee_id),

    foreign key (customer_id)
        references customers(customer_id)
);


show tables;

describe customers;
describe accounts;
describe transactions;
describe loans;
describe loan_payments;

select count(*) as total_tables
from information_schema.tables
where table_schema = 'bank';

insert into branches
(branch_name, branch_code, city, state, address, phone)
values
('kollam main branch', 'BR001', 'Kollam', 'Kerala', 'Main Road', '9876500001'),
('kochi branch', 'BR002', 'Kochi', 'Kerala', 'MG Road', '9876500002'),
('trivandrum branch', 'BR003', 'Thiruvananthapuram', 'Kerala', 'Statue Junction', '9876500003'),
('kottayam branch', 'BR004', 'Kottayam', 'Kerala', 'Central Junction', '9876500004'),
('thrissur branch', 'BR005', 'Thrissur', 'Kerala', 'Round South', '9876500005');

insert into account_types
(type_name, minimum_balance, interest_rate, description)
values
('Savings', 1000, 3.50, 'regular savings account'),
('Current', 5000, 0.00, 'business current account'),
('Salary', 0, 4.00, 'salary account'),
('Fixed Deposit', 10000, 7.00, 'fixed deposit account'),
('Recurring Deposit', 500, 6.50, 'recurring deposit account');

insert into interest_rates
(rate_type, interest_rate, effective_from, effective_to, status)
values
('Savings', 3.50, '2026-01-01', NULL, 'Active'),
('Current', 0.00, '2026-01-01', NULL, 'Active'),
('Salary', 4.00, '2026-01-01', NULL, 'Active'),
('Fixed Deposit', 7.00, '2026-01-01', NULL, 'Active'),
('Recurring Deposit', 6.50, '2026-01-01', NULL, 'Active'),
('Personal Loan', 10.50, '2026-01-01', NULL, 'Active'),
('Home Loan', 8.50, '2026-01-01', NULL, 'Active'),
('Education Loan', 9.00, '2026-01-01', NULL, 'Active'),
('Vehicle Loan', 9.50, '2026-01-01', NULL, 'Active'),
('Gold Loan', 8.00, '2026-01-01', NULL, 'Active');

insert into employees
(employee_name, email, phone, designation, salary, joining_date, branch_id)
values
('arun', 'arun@bank.com', '9000000001', 'Manager', 65000, '2022-01-10', 1),
('meera', 'meera@bank.com', '9000000002', 'Cashier', 35000, '2023-02-15', 1),
('rahul', 'rahul@bank.com', '9000000003', 'Loan Officer', 45000, '2021-03-20', 2),
('anu', 'anu@bank.com', '9000000004', 'Accountant', 40000, '2022-04-12', 2),
('vishnu', 'vishnu@bank.com', '9000000005', 'Manager', 70000, '2020-05-18', 3),
('diya', 'diya@bank.com', '9000000006', 'Cashier', 32000, '2023-06-22', 3),
('akhil', 'akhil@bank.com', '9000000007', 'Loan Officer', 48000, '2021-07-11', 4),
('sneha', 'sneha@bank.com', '9000000008', 'Accountant', 42000, '2022-08-19', 4),
('amal', 'amal@bank.com', '9000000009', 'Manager', 68000, '2020-09-25', 5),
('neha', 'neha@bank.com', '9000000010', 'Cashier', 33000, '2023-10-14', 5),
('nikhil', 'nikhil@bank.com', '9000000011', 'Loan Officer', 46000, '2021-11-16', 1),
('parvathy', 'parvathy@bank.com', '9000000012', 'Accountant', 41000, '2022-12-08', 2),
('kiran', 'kiran@bank.com', '9000000013', 'Manager', 72000, '2019-02-01', 3),
('arya', 'arya@bank.com', '9000000014', 'Cashier', 34000, '2024-03-05', 4),
('suresh', 'suresh@bank.com', '9000000015', 'Loan Officer', 49000, '2021-04-17', 5);

insert into customers
(first_name, last_name, email, phone, date_of_birth,
 gender, address, city, state, pincode, branch_id,
 registration_date, kyc_status)
values
('Arun', 'Kumar', 'arun1@gmail.com', '8000000001', '1995-04-12', 'Male', 'MG Road', 'Kollam', 'Kerala', '691001', 1, '2025-01-10', 'Verified'),
('Meera', 'Nair', 'meera1@gmail.com', '8000000002', '1998-06-22', 'Female', 'Beach Road', 'Kochi', 'Kerala', '682001', 2, '2025-01-15', 'Verified'),
('Rahul', 'Das', 'rahul1@gmail.com', '8000000003', '1992-03-18', 'Male', 'Market Road', 'Kottayam', 'Kerala', '686001', 4, '2025-02-01', 'Verified'),
('Anu', 'Thomas', 'anu1@gmail.com', '8000000004', '2000-08-10', 'Female', 'Main Road', 'Thrissur', 'Kerala', '680001', 5, '2025-02-10', 'Pending'),
('Vishnu', 'Raj', 'vishnu1@gmail.com', '8000000005', '1994-11-25', 'Male', 'Statue Road', 'Thiruvananthapuram', 'Kerala', '695001', 3, '2025-02-15', 'Verified'),
('Diya', 'Menon', 'diya1@gmail.com', '8000000006', '1999-01-14', 'Female', 'Central Road', 'Kollam', 'Kerala', '691002', 1, '2025-03-01', 'Verified'),
('Akhil', 'S', 'akhil1@gmail.com', '8000000007', '1996-09-08', 'Male', 'MG Road', 'Kochi', 'Kerala', '682002', 2, '2025-03-05', 'Verified'),
('Sneha', 'R', 'sneha1@gmail.com', '8000000008', '2001-02-19', 'Female', 'Town Road', 'Kottayam', 'Kerala', '686002', 4, '2025-03-12', 'Pending'),
('Amal', 'Jose', 'amal1@gmail.com', '8000000009', '1993-05-20', 'Male', 'East Road', 'Thrissur', 'Kerala', '680002', 5, '2025-03-18', 'Verified'),
('Neha', 'Paul', 'neha1@gmail.com', '8000000010', '1997-12-30', 'Female', 'West Road', 'Thiruvananthapuram', 'Kerala', '695002', 3, '2025-03-25', 'Verified'),
('Nikhil', 'K', 'nikhil1@gmail.com', '8000000011', '1995-07-11', 'Male', 'North Road', 'Kollam', 'Kerala', '691003', 1, '2025-04-01', 'Verified'),
('Parvathy', 'P', 'parvathy1@gmail.com', '8000000012', '2000-04-17', 'Female', 'South Road', 'Kochi', 'Kerala', '682003', 2, '2025-04-08', 'Pending'),
('Kiran', 'B', 'kiran1@gmail.com', '8000000013', '1991-10-09', 'Male', 'Market Road', 'Kottayam', 'Kerala', '686003', 4, '2025-04-15', 'Verified'),
('Arya', 'M', 'arya1@gmail.com', '8000000014', '1998-03-23', 'Female', 'Main Road', 'Thrissur', 'Kerala', '680003', 5, '2025-04-22', 'Verified'),
('Suresh', 'Kumar', 'suresh1@gmail.com', '8000000015', '1989-06-05', 'Male', 'Temple Road', 'Thiruvananthapuram', 'Kerala', '695003', 3, '2025-05-01', 'Verified'),
('Anjali', 'Nair', 'anjali1@gmail.com', '8000000016', '2001-07-16', 'Female', 'Beach Road', 'Kollam', 'Kerala', '691004', 1, '2025-05-08', 'Pending'),
('David', 'John', 'david1@gmail.com', '8000000017', '1994-02-12', 'Male', 'MG Road', 'Kochi', 'Kerala', '682004', 2, '2025-05-15', 'Verified'),
('Priya', 'S', 'priya1@gmail.com', '8000000018', '1997-08-29', 'Female', 'Town Road', 'Kottayam', 'Kerala', '686004', 4, '2025-05-22', 'Verified'),
('Robert', 'Thomas', 'robert1@gmail.com', '8000000019', '1990-11-03', 'Male', 'East Road', 'Thrissur', 'Kerala', '680004', 5, '2025-06-01', 'Verified'),
('Asha', 'R', 'asha1@gmail.com', '8000000020', '1999-05-27', 'Female', 'Central Road', 'Thiruvananthapuram', 'Kerala', '695004', 3, '2025-06-08', 'Verified'),
('Manu', 'Raj', 'manu1@gmail.com', '8000000021', '1993-04-14', 'Male', 'Main Road', 'Kollam', 'Kerala', '691005', 1, '2025-06-15', 'Verified'),
('Lakshmi', 'P', 'lakshmi1@gmail.com', '8000000022', '1998-09-21', 'Female', 'Market Road', 'Kochi', 'Kerala', '682005', 2, '2025-06-22', 'Pending'),
('Rohit', 'Das', 'rohit1@gmail.com', '8000000023', '1995-12-10', 'Male', 'North Road', 'Kottayam', 'Kerala', '686005', 4, '2025-07-01', 'Verified'),
('Keerthi', 'M', 'keerthi1@gmail.com', '8000000024', '2000-01-31', 'Female', 'South Road', 'Thrissur', 'Kerala', '680005', 5, '2025-07-08', 'Verified'),
('Ajay', 'Kumar', 'ajay1@gmail.com', '8000000025', '1992-06-18', 'Male', 'Statue Road', 'Thiruvananthapuram', 'Kerala', '695005', 3, '2025-07-15', 'Verified'),
('Sandra', 'Jose', 'sandra1@gmail.com', '8000000026', '1997-03-11', 'Female', 'Beach Road', 'Kollam', 'Kerala', '691006', 1, '2025-07-22', 'Verified'),
('Binu', 'Thomas', 'binu1@gmail.com', '8000000027', '1988-10-24', 'Male', 'MG Road', 'Kochi', 'Kerala', '682006', 2, '2025-08-01', 'Verified'),
('Nisha', 'R', 'nisha1@gmail.com', '8000000028', '1996-07-07', 'Female', 'Town Road', 'Kottayam', 'Kerala', '686006', 4, '2025-08-08', 'Pending'),
('Gokul', 'S', 'gokul1@gmail.com', '8000000029', '1994-02-26', 'Male', 'East Road', 'Thrissur', 'Kerala', '680006', 5, '2025-08-15', 'Verified'),
('Reshma', 'P', 'reshma1@gmail.com', '8000000030', '1999-11-19', 'Female', 'Central Road', 'Thiruvananthapuram', 'Kerala', '695006', 3, '2025-08-22', 'Verified'),
('Vijay', 'Menon', 'vijay1@gmail.com', '8000000031', '1991-05-13', 'Male', 'Main Road', 'Kollam', 'Kerala', '691007', 1, '2025-09-01', 'Verified'),
('Anjana', 'K', 'anjana1@gmail.com', '8000000032', '2001-08-02', 'Female', 'Market Road', 'Kochi', 'Kerala', '682007', 2, '2025-09-08', 'Verified'),
('Hari', 'B', 'hari1@gmail.com', '8000000033', '1993-09-15', 'Male', 'North Road', 'Kottayam', 'Kerala', '686007', 4, '2025-09-15', 'Pending'),
('Devika', 'Nair', 'devika1@gmail.com', '8000000034', '1998-12-06', 'Female', 'South Road', 'Thrissur', 'Kerala', '680007', 5, '2025-09-22', 'Verified'),
('Sanjay', 'R', 'sanjay1@gmail.com', '8000000035', '1990-04-28', 'Male', 'Statue Road', 'Thiruvananthapuram', 'Kerala', '695007', 3, '2025-10-01', 'Verified'),
('Maya', 'Thomas', 'maya1@gmail.com', '8000000036', '1997-06-09', 'Female', 'Beach Road', 'Kollam', 'Kerala', '691008', 1, '2025-10-08', 'Verified'),
('Ramesh', 'Kumar', 'ramesh1@gmail.com', '8000000037', '1987-01-22', 'Male', 'MG Road', 'Kochi', 'Kerala', '682008', 2, '2025-10-15', 'Verified'),
('Divya', 'S', 'divya1@gmail.com', '8000000038', '2000-10-17', 'Female', 'Town Road', 'Kottayam', 'Kerala', '686008', 4, '2025-10-22', 'Pending'),
('Joel', 'Mathew', 'joel1@gmail.com', '8000000039', '1994-08-05', 'Male', 'East Road', 'Thrissur', 'Kerala', '680008', 5, '2025-11-01', 'Verified'),
('Fathima', 'A', 'fathima1@gmail.com', '8000000040', '1999-03-30', 'Female', 'Central Road', 'Thiruvananthapuram', 'Kerala', '695008', 3, '2025-11-08', 'Verified');

insert into accounts
(account_number, customer_id, account_type_id, branch_id,
 balance, nominee_name, opening_date, status)
values
('ACC1001',1,1,1,25000,'Meera','2025-01-10','Active'),
('ACC1002',2,2,2,85000,'Arun','2025-01-11','Active'),
('ACC1003',3,1,4,12000,'Rahul','2025-01-12','Active'),
('ACC1004',4,3,5,45000,'Anu','2025-01-13','Active'),
('ACC1005',5,1,3,120000,'Diya','2025-01-14','Active'),
('ACC1006',6,2,1,65000,'Akhil','2025-01-15','Active'),
('ACC1007',7,1,2,18000,'Sneha','2025-01-16','Active'),
('ACC1008',8,3,4,95000,'Amal','2025-01-17','Active'),
('ACC1009',9,1,5,32000,'Neha','2025-01-18','Active'),
('ACC1010',10,1,3,150000,'Nikhil','2025-01-19','Active'),
('ACC1011',11,2,1,78000,'Parvathy','2025-01-20','Active'),
('ACC1012',12,1,2,22000,'Kiran','2025-01-21','Active'),
('ACC1013',13,3,4,55000,'Arya','2025-01-22','Active'),
('ACC1014',14,1,5,31000,'Suresh','2025-01-23','Active'),
('ACC1015',15,1,3,90000,'Anjali','2025-01-24','Active'),
('ACC1016',16,2,1,110000,'David','2025-01-25','Active'),
('ACC1017',17,1,2,14000,'Priya','2025-01-26','Active'),
('ACC1018',18,3,4,68000,'Robert','2025-01-27','Active'),
('ACC1019',19,1,5,42000,'Asha','2025-01-28','Active'),
('ACC1020',20,1,3,200000,'Manu','2025-01-29','Active'),
('ACC1021',21,2,1,35000,'Lakshmi','2025-02-01','Active'),
('ACC1022',22,1,2,27000,'Rohit','2025-02-02','Active'),
('ACC1023',23,3,4,73000,'Keerthi','2025-02-03','Active'),
('ACC1024',24,1,5,16000,'Ajay','2025-02-04','Active'),
('ACC1025',25,1,3,125000,'Sandra','2025-02-05','Active'),
('ACC1026',26,2,1,49000,'Binu','2025-02-06','Active'),
('ACC1027',27,1,2,58000,'Nisha','2025-02-07','Active'),
('ACC1028',28,3,4,82000,'Gokul','2025-02-08','Active'),
('ACC1029',29,1,5,19000,'Reshma','2025-02-09','Active'),
('ACC1030',30,1,3,99000,'Vijay','2025-02-10','Active'),
('ACC1031',31,2,1,105000,'Anjana','2025-02-11','Active'),
('ACC1032',32,1,2,24000,'Hari','2025-02-12','Active'),
('ACC1033',33,3,4,63000,'Devika','2025-02-13','Active'),
('ACC1034',34,1,5,37000,'Sanjay','2025-02-14','Active'),
('ACC1035',35,1,3,155000,'Maya','2025-02-15','Active'),
('ACC1036',36,2,1,44000,'Ramesh','2025-02-16','Active'),
('ACC1037',37,1,2,29000,'Divya','2025-02-17','Active'),
('ACC1038',38,3,4,87000,'Joel','2025-02-18','Active'),
('ACC1039',39,1,5,52000,'Fathima','2025-02-19','Active'),
('ACC1040',40,1,3,175000,'Arun','2025-02-20','Active'),
('ACC1041',1,2,1,65000,'Meera','2025-03-01','Active'),
('ACC1042',2,1,2,35000,'Arun','2025-03-02','Active'),
('ACC1043',3,3,4,95000,'Rahul','2025-03-03','Active'),
('ACC1044',4,1,5,18000,'Anu','2025-03-04','Active'),
('ACC1045',5,2,3,115000,'Diya','2025-03-05','Active'),
('ACC1046',6,1,1,27000,'Akhil','2025-03-06','Active'),
('ACC1047',7,3,2,75000,'Sneha','2025-03-07','Active'),
('ACC1048',8,1,4,43000,'Amal','2025-03-08','Active'),
('ACC1049',9,2,5,135000,'Neha','2025-03-09','Active'),
('ACC1050',10,1,3,33000,'Nikhil','2025-03-10','Active'),
('ACC1051',11,3,1,92000,'Parvathy','2025-03-11','Active'),
('ACC1052',12,1,2,21000,'Kiran','2025-03-12','Active'),
('ACC1053',13,2,4,61000,'Arya','2025-03-13','Active'),
('ACC1054',14,1,5,39000,'Suresh','2025-03-14','Active'),
('ACC1055',15,3,3,145000,'Anjali','2025-03-15','Active'),
('ACC1056',16,1,1,26000,'David','2025-03-16','Active'),
('ACC1057',17,2,2,71000,'Priya','2025-03-17','Active'),
('ACC1058',18,1,4,47000,'Robert','2025-03-18','Active'),
('ACC1059',19,3,5,160000,'Asha','2025-03-19','Active'),
('ACC1060',20,1,3,54000,'Manu','2025-03-20','Active');

insert into transactions
(account_id, employee_id, branch_id, transaction_type,
 amount, transaction_date, description, status, reference_number)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 200
)
select
    mod(n - 1, 60) + 1,
    mod(n - 1, 15) + 1,
    mod(n - 1, 5) + 1,
    case
        when mod(n, 3) = 0 then 'Withdrawal'
        when mod(n, 3) = 1 then 'Deposit'
        else 'Transfer'
    end,
    500 + (n * 137) % 20000,
    date_add('2025-01-01', interval mod(n, 365) day),
    concat('bank transaction ', n),
    case
        when mod(n, 20) = 0 then 'Failed'
        when mod(n, 15) = 0 then 'Pending'
        else 'Success'
    end,
    concat('TXN', lpad(n, 5, '0'))
from seq;

insert into loans
(customer_id, branch_id, employee_id, loan_type,
 loan_amount, interest_rate, issue_date, due_date,
 outstanding_amount, status)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 25
)
select
    n,
    mod(n - 1, 5) + 1,
    mod(n - 1, 15) + 1,
    case
        when mod(n, 5) = 0 then 'Home Loan'
        when mod(n, 5) = 1 then 'Personal Loan'
        when mod(n, 5) = 2 then 'Education Loan'
        when mod(n, 5) = 3 then 'Vehicle Loan'
        else 'Gold Loan'
    end,
    100000 + n * 25000,
    case
        when mod(n, 5) = 0 then 8.50
        when mod(n, 5) = 1 then 10.50
        when mod(n, 5) = 2 then 9.00
        when mod(n, 5) = 3 then 9.50
        else 8.00
    end,
    date_add('2025-01-01', interval n day),
    date_add('2028-01-01', interval n day),
    80000 + n * 15000,
    case
        when mod(n, 10) = 0 then 'Defaulted'
        when mod(n, 8) = 0 then 'Pending'
        else 'Active'
    end
from seq;

insert into cards
(account_id, card_number, card_type, card_network,
 issue_date, expiry_date, status)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 50
)
select
    mod(n - 1, 60) + 1,
    concat('CARD', lpad(n, 12, '0')),
    case
        when mod(n, 2) = 0 then 'Debit'
        else 'Credit'
    end,
    case
        when mod(n, 3) = 0 then 'Visa'
        when mod(n, 3) = 1 then 'Mastercard'
        else 'RuPay'
    end,
    '2025-01-01',
    '2030-01-01',
    case
        when mod(n, 15) = 0 then 'Blocked'
        else 'Active'
    end
from seq;

insert into atm_transactions
(account_id, transaction_id, atm_id, transaction_type,
 amount, transaction_date, location, status)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 100
)
select
    mod(n - 1, 60) + 1,
    n,
    concat('ATM', lpad(mod(n - 1, 10) + 1, 3, '0')),
    case
        when mod(n, 3) = 0 then 'Withdrawal'
        when mod(n, 3) = 1 then 'Deposit'
        else 'Balance Inquiry'
    end,
    500 + n * 50,
    date_add('2025-04-01', interval n day),
    case
        when mod(n, 5) = 0 then 'Kollam'
        when mod(n, 5) = 1 then 'Kochi'
        when mod(n, 5) = 2 then 'Trivandrum'
        when mod(n, 5) = 3 then 'Kottayam'
        else 'Thrissur'
    end,
    case
        when mod(n, 20) = 0 then 'Declined'
        else 'Success'
    end
from seq;

insert into fixed_deposits
(customer_id, account_id, principal_amount, interest_rate,
 opening_date, maturity_date, maturity_amount, status)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 20
)
select
    n,
    n,
    50000 + n * 10000,
    7.00,
    '2025-01-01',
    date_add('2027-01-01', interval n day),
    (50000 + n * 10000) * 1.14,
    'Active'
from seq;

insert into complaints
(customer_id, branch_id, employee_id, complaint_type,
 complaint_description, complaint_date, resolution_date,
 status, priority)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 25
)
select
    n,
    mod(n - 1, 5) + 1,
    mod(n - 1, 15) + 1,
    case
        when mod(n, 4) = 0 then 'Transaction Issue'
        when mod(n, 4) = 1 then 'ATM Issue'
        when mod(n, 4) = 2 then 'Account Issue'
        else 'Card Issue'
    end,
    concat('customer complaint number ', n),
    date_add('2025-05-01', interval n day),
    case
        when mod(n, 3) = 0 then NULL
        else date_add('2025-06-01', interval n day)
    end,
    case
        when mod(n, 3) = 0 then 'Open'
        when mod(n, 3) = 1 then 'Resolved'
        else 'In Progress'
    end,
    case
        when mod(n, 5) = 0 then 'High'
        when mod(n, 5) = 1 then 'Critical'
        else 'Medium'
    end
from seq;

insert into kyc_documents
(customer_id, document_type, document_number,
 submission_date, verification_date, status)
with recursive seq as (
    select 1 as n
    union all
    select n + 1 from seq where n < 40
)
select
    n,
    case
        when mod(n, 3) = 0 then 'Aadhaar'
        when mod(n, 3) = 1 then 'PAN'
        else 'Passport'
    end,
    concat('DOC', lpad(n, 6, '0')),
    date_add('2025-01-01', interval n day),
    case
        when mod(n, 5) = 0 then NULL
        else date_add('2025-02-01', interval n day)
    end,
    case
        when mod(n, 5) = 0 then 'Pending'
        when mod(n, 7) = 0 then 'Rejected'
        else 'Verified'
    end
from seq;

select 'branches' as table_name, count(*) as total from branches
union all
select 'customers', count(*) from customers
union all
select 'employees', count(*) from employees
union all
select 'account_types', count(*) from account_types
union all
select 'accounts', count(*) from accounts
union all
select 'transactions', count(*) from transactions
union all
select 'beneficiaries', count(*) from beneficiaries
union all
select 'transfers', count(*) from transfers
union all
select 'loans', count(*) from loans
union all
select 'loan_payments', count(*) from loan_payments
union all
select 'cards', count(*) from cards
union all
select 'atm_transactions', count(*) from atm_transactions
union all
select 'fixed_deposits', count(*) from fixed_deposits
union all
select 'interest_rates', count(*) from interest_rates
union all
select 'complaints', count(*) from complaints
union all
select 'kyc_documents', count(*) from kyc_documents
union all
select 'audit_logs', count(*) from audit_logs;

show tables;

create table audit_logs (
    log_id int primary key auto_increment,
    employee_id int,
    customer_id int,
    action_type varchar(50) not null,
    table_name varchar(50),
    record_id int,
    action_description text,
    action_timestamp datetime default current_timestamp,
    ip_address varchar(45),

    foreign key (employee_id)
        references employees(employee_id),

    foreign key (customer_id)
        references customers(customer_id)
);

select 'branches' as table_name, count(*) as total from branches
union all
select 'customers', count(*) from customers
union all
select 'employees', count(*) from employees
union all
select 'account_types', count(*) from account_types
union all
select 'accounts', count(*) from accounts
union all
select 'transactions', count(*) from transactions
union all
select 'beneficiaries', count(*) from beneficiaries
union all
select 'transfers', count(*) from transfers
union all
select 'loans', count(*) from loans
union all
select 'loan_payments', count(*) from loan_payments
union all
select 'cards', count(*) from cards
union all
select 'atm_transactions', count(*) from atm_transactions
union all
select 'fixed_deposits', count(*) from fixed_deposits
union all
select 'interest_rates', count(*) from interest_rates
union all
select 'complaints', count(*) from complaints
union all
select 'kyc_documents', count(*) from kyc_documents
union all
select 'audit_logs', count(*) from audit_logs;

insert into customers
(first_name, last_name, email, phone, date_of_birth,
 gender, address, city, state, pincode, branch_id, kyc_status)
values
('deva', 'narayanan', 'deva@gmail.com', '9876543210',
 '2004-07-30', 'Male', 'main road', 'Kollam',
 'Kerala', '691001', 1, 'Pending');

select * from customers;

update customers
set phone = '9998887776',
    address = 'MG Road, Kollam'
where customer_id = 1;

select * from customers
where customer_id = 1;

update customers
set kyc_status = 'Verified'
where customer_id = 2;

select customer_id, first_name, kyc_status
from customers
where customer_id = 2;

insert into accounts
(account_number, customer_id, account_type_id,
 branch_id, balance, nominee_name, status)
values
('ACC2001', 1, 1, 1, 25000, 'Arun', 'Active');

select * from accounts
where account_number = 'ACC2001';

update accounts
set status = 'Frozen'
where account_id = 1;

select account_id, account_number, status
from accounts
where account_id = 1;

select * from beneficiaries
where beneficiary_id = 30;

update beneficiaries
set status = 'Inactive'
where beneficiary_id = 30;

update beneficiaries
set status = 'Inactive'
where beneficiary_id = 30;

insert into transactions
(account_id, employee_id, branch_id,
 transaction_type, amount, description,
 status, reference_number)
values
(1, 1, 1, 'Deposit', 5000,
 'cash deposit', 'Success', 'TXN2001');

 insert into transactions
(account_id, employee_id, branch_id,
 transaction_type, amount, description,
 status, reference_number)
values
(1, 2, 1, 'Withdrawal', 2000,
 'cash withdrawal', 'Success', 'TXN2002');

 insert into loans
(customer_id, branch_id, employee_id, loan_type,
 loan_amount, interest_rate, issue_date,
 due_date, outstanding_amount, status)
values
(1, 1, 3, 'Personal Loan',
 200000, 10.50, '2026-11-16',
 '2029-11-16', 200000, 'Pending');

select * from loans;

update loans
set status = 'Approved'
where loan_id = 1;

select loan_id, loan_type, status
from loans
where loan_id = 1;

insert into loan_payments
(loan_id, payment_amount, payment_date,
 payment_method, payment_status, due_date)
values
(1, 5000, '2026-11-16',
 'UPI', 'Paid', '2026-11-20');

select * from loan_payments
where loan_id = 1;

update accounts
set status = 'Closed'
where account_id = 1
and balance = 0
and not exists (
    select 1
    from transfers t
    where t.from_account_id = accounts.account_id
    and t.status = 'Pending'
)
and not exists (
    select 1
    from transfers t
    where t.to_account_id = accounts.account_id
    and t.status = 'Pending'
);

select account_id, account_number, balance, status
from accounts
where account_id = 1;

select * from customers;
select * from accounts;
select * from beneficiaries;
select * from transactions;
select * from loans;
select * from loan_payments;

-- filtering & sorting

-- 1. find customers from a particular city.
select * from customers
where city = 'Kollam';

-- 2. find customers whose first names start with 'a'.
select * from customers
where first_name like 'A%';

-- 3. find accounts with balance between 10,000 and 1,00,000.
select * from accounts
where balance between 10000 and 100000;

-- 4. find customers belonging to selected branches using IN.
select * from customers
where branch_id in (1, 2, 3);

-- 5. find active accounts only.
select * from accounts
where status = 'Active';

-- 6. find accounts with NULL nominee information.
select * from accounts
where nominee_name is null;

-- 7. display customers in alphabetical order.
select * from customers
order by first_name asc;

-- 8. display the top 10 accounts by balance.
select * from accounts
order by balance desc
limit 10;

-- 9. find transactions within a given date range.
select * from transactions
where transaction_date between '2025-01-01' and '2025-12-31'
order by transaction_date;

-- 10. find account numbers matching a specific pattern.
select * from accounts
where account_number like 'ACC%';

-- JOINS

-- 1. display customer name, account number and account type.
select
    c.first_name,
    c.last_name,
    a.account_number,
    at.type_name
from customers c
inner join accounts a
    on c.customer_id = a.customer_id
inner join account_types at
    on a.account_type_id = at.account_type_id;

-- 2. display customer details along with their branch name.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    b.branch_name
from customers c
inner join branches b
    on c.branch_id = b.branch_id;

-- 3. display employee name, designation and branch name.
select
    e.employee_name,
    e.designation,
    b.branch_name,
    b.city
from employees e
inner join branches b
    on e.branch_id = b.branch_id;

-- 4. display account number, customer name and transaction details.
select
    a.account_number,
    c.first_name,
    t.transaction_type,
    t.amount,
    t.transaction_date,
    t.status
from accounts a
inner join customers c
    on a.customer_id = c.customer_id
inner join transactions t
    on a.account_id = t.account_id;

-- 5. display customer name, loan type and loan amount.
select
    c.first_name,
    c.last_name,
    l.loan_type,
    l.loan_amount,
    l.status
from customers c
inner join loans l
    on c.customer_id = l.customer_id;

-- 6. display loan details along with payment history.
select
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    lp.payment_amount,
    lp.payment_date,
    lp.payment_status
from loans l
inner join loan_payments lp
    on l.loan_id = lp.loan_id;

-- 7. display customer name along with card details.
select
    c.first_name,
    c.last_name,
    a.account_number,
    cd.card_number,
    cd.card_type,
    cd.card_network,
    cd.status
from customers c
inner join accounts a
    on c.customer_id = a.customer_id
inner join cards cd
    on a.account_id = cd.account_id;

-- 8. display customer name along with complaint details and status.
select
    c.first_name,
    c.last_name,
    cp.complaint_type,
    cp.complaint_description,
    cp.status,
    cp.priority
from customers c
inner join complaints cp
    on c.customer_id = cp.customer_id;

-- 9. find customers who do not have any bank account.
select
    c.customer_id,
    c.first_name,
    c.last_name
from customers c
left join accounts a
    on c.customer_id = a.customer_id
where a.account_id is null;

-- 10. find accounts that have no transactions.
select
    a.account_id,
    a.account_number,
    a.balance,
    a.status
from accounts a
left join transactions t
    on a.account_id = t.account_id
where t.transaction_id is null;

-- group by & aggregate analysis

use bank_management_db;

-- 1. count the total number of customers in each branch.
select
    b.branch_name,
    count(c.customer_id) as total_customers
from branches b
left join customers c
    on b.branch_id = c.branch_id
group by b.branch_id, b.branch_name;


-- 2. count the total number of accounts by account type.
select
    at.type_name,
    count(a.account_id) as total_accounts
from account_types at
left join accounts a
    on at.account_type_id = a.account_type_id
group by at.account_type_id, at.type_name;


-- 3. find the total account balance in each branch.
select
    b.branch_name,
    sum(a.balance) as total_balance
from branches b
left join accounts a
    on b.branch_id = a.branch_id
group by b.branch_id, b.branch_name;


-- 4. find the average account balance by account type.
select
    at.type_name,
    round(avg(a.balance), 2) as average_balance
from account_types at
inner join accounts a
    on at.account_type_id = a.account_type_id
group by at.account_type_id, at.type_name;


-- 5. find the total successful deposits in each branch.
select
    b.branch_name,
    sum(t.amount) as total_deposits
from branches b
inner join transactions t
    on b.branch_id = t.branch_id
where t.transaction_type = 'Deposit'
and t.status = 'Success'
group by b.branch_id, b.branch_name;


-- 6. find the total successful withdrawals in each branch.
select
    b.branch_name,
    sum(t.amount) as total_withdrawals
from branches b
inner join transactions t
    on b.branch_id = t.branch_id
where t.transaction_type = 'Withdrawal'
and t.status = 'Success'
group by b.branch_id, b.branch_name;


-- 7. find the total loan amount in each branch.
select
    b.branch_name,
    sum(l.loan_amount) as total_loan_amount
from branches b
inner join loans l
    on b.branch_id = l.branch_id
group by b.branch_id, b.branch_name;


-- 8. find the average loan amount by loan type.
select
    loan_type,
    round(avg(loan_amount), 2) as average_loan
from loans
group by loan_type;


-- 9. find branches having more than 10 customers.
select
    b.branch_name,
    count(c.customer_id) as total_customers
from branches b
inner join customers c
    on b.branch_id = c.branch_id
group by b.branch_id, b.branch_name
having count(c.customer_id) > 10;


-- 10. find account types having average balance above 50,000.
select
    at.type_name,
    round(avg(a.balance), 2) as average_balance
from account_types at
inner join accounts a
    on at.account_type_id = a.account_type_id
group by at.account_type_id, at.type_name
having avg(a.balance) > 50000;

-- sub queries

use bank_management_db;

-- 1. find customers whose account balance is above the average account balance.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance
from customers c
join accounts a
    on c.customer_id = a.customer_id
where a.balance > (
    select avg(balance)
    from accounts
);


-- 2. find the customer with the highest account balance.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    a.account_number,
    a.balance
from customers c
join accounts a
    on c.customer_id = a.customer_id
where a.balance = (
    select max(balance)
    from accounts
);


-- 3. find the branch with the highest total deposits.
select
    b.branch_id,
    b.branch_name,
    (
        select sum(t.amount)
        from transactions t
        where t.branch_id = b.branch_id
        and t.transaction_type = 'Deposit'
        and t.status = 'Success'
    ) as total_deposits
from branches b
where (
    select coalesce(sum(t.amount), 0)
    from transactions t
    where t.branch_id = b.branch_id
    and t.transaction_type = 'Deposit'
    and t.status = 'Success'
) = (
    select max(branch_deposits)
    from (
        select sum(amount) as branch_deposits
        from transactions
        where transaction_type = 'Deposit'
        and status = 'Success'
        group by branch_id
    ) as deposit_summary
);


-- 4. find customers who have never taken a loan.
select
    c.customer_id,
    c.first_name,
    c.last_name
from customers c
where not exists (
    select 1
    from loans l
    where l.customer_id = c.customer_id
);


-- 5. find customers whose loan amount is above the average loan amount.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    l.loan_type,
    l.loan_amount
from customers c
join loans l
    on c.customer_id = l.customer_id
where l.loan_amount > (
    select avg(loan_amount)
    from loans
);


-- 6. find the second-highest account balance.
select *
from accounts
where balance = (
    select max(balance)
    from accounts
    where balance < (
        select max(balance)
        from accounts
    )
);


-- 7. find employees working in the branch with the highest customer count.
select
    employee_id,
    employee_name,
    designation,
    branch_id
from employees
where branch_id = (
    select branch_id
    from customers
    group by branch_id
    order by count(customer_id) desc
    limit 1
);


-- 8. find accounts whose transaction count is above the average transaction count.
select
    a.account_id,
    a.account_number,
    count(t.transaction_id) as total_transactions
from accounts a
left join transactions t
    on a.account_id = t.account_id
group by a.account_id, a.account_number
having count(t.transaction_id) > (
    select avg(transaction_count)
    from (
        select
            a2.account_id,
            count(t2.transaction_id) as transaction_count
        from accounts a2
        left join transactions t2
            on a2.account_id = t2.account_id
        group by a2.account_id
    ) as transaction_summary
);

-- banking business analysis

use bank_management_db;

-- 1. find the branch with the highest number of customers.
select
    b.branch_name,
    count(c.customer_id) as total_customers
from branches b
left join customers c
    on b.branch_id = c.branch_id
group by b.branch_id, b.branch_name
order by total_customers desc
limit 1;


-- 2. find the branch with the highest total account balance.
select
    b.branch_name,
    sum(a.balance) as total_balance
from branches b
join accounts a
    on b.branch_id = a.branch_id
group by b.branch_id, b.branch_name
order by total_balance desc
limit 1;


-- 3. find the most popular account type.
select
    at.type_name,
    count(a.account_id) as total_accounts
from account_types at
join accounts a
    on at.account_type_id = a.account_type_id
group by at.account_type_id, at.type_name
order by total_accounts desc
limit 1;


-- 4. find the top 10 customers by total account balance.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    sum(a.balance) as total_balance
from customers c
join accounts a
    on c.customer_id = a.customer_id
group by c.customer_id, c.first_name, c.last_name
order by total_balance desc
limit 10;


-- 5. find customers with low account activity (less than 3 transactions).
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(t.transaction_id) as total_transactions
from customers c
join accounts a
    on c.customer_id = a.customer_id
left join transactions t
    on a.account_id = t.account_id
group by c.customer_id, c.first_name, c.last_name
having count(t.transaction_id) < 3;


-- 6. find customers who have both loans and fixed deposits.
select
    c.customer_id,
    c.first_name,
    c.last_name
from customers c
where exists (
    select 1
    from loans l
    where l.customer_id = c.customer_id
)
and exists (
    select 1
    from fixed_deposits fd
    where fd.customer_id = c.customer_id
);


-- 7. find customers who have overdue loan payments.
select distinct
    c.customer_id,
    c.first_name,
    c.last_name,
    lp.payment_amount,
    lp.due_date,
    lp.payment_status
from customers c
join loans l
    on c.customer_id = l.customer_id
join loan_payments lp
    on l.loan_id = lp.loan_id
where lp.payment_status = 'Overdue';


-- 8. find the loan type with the highest outstanding amount.
select
    loan_type,
    sum(outstanding_amount) as total_outstanding
from loans
group by loan_type
order by total_outstanding desc
limit 1;


-- 9. find the branch with the highest loan disbursement.
select
    b.branch_name,
    sum(l.loan_amount) as total_disbursement
from branches b
join loans l
    on b.branch_id = l.branch_id
where l.status in ('Active', 'Closed')
group by b.branch_id, b.branch_name
order by total_disbursement desc
limit 1;


-- 10. find customers who made the highest number of transactions.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(t.transaction_id) as total_transactions
from customers c
join accounts a
    on c.customer_id = a.customer_id
join transactions t
    on a.account_id = t.account_id
group by c.customer_id, c.first_name, c.last_name
order by total_transactions desc
limit 1;


-- 11. find the atm with the highest transaction volume.
select
    atm_id,
    count(atm_transaction_id) as total_transactions,
    sum(amount) as total_volume
from atm_transactions
where status = 'Success'
group by atm_id
order by total_volume desc
limit 1;


-- 12. find customers with repeated failed or declined transactions.
select
    c.customer_id,
    c.first_name,
    c.last_name,
    count(t.transaction_id) as failed_transactions
from customers c
join accounts a
    on c.customer_id = a.customer_id
join transactions t
    on a.account_id = t.account_id
where t.status = 'Failed'
group by c.customer_id, c.first_name, c.last_name
having count(t.transaction_id) > 1;


-- 13. find complaints that are still unresolved.
select
    c.first_name,
    c.last_name,
    cp.complaint_type,
    cp.complaint_description,
    cp.priority,
    cp.status
from customers c
join complaints cp
    on c.customer_id = cp.customer_id
where cp.status in ('Open', 'In Progress');


-- 14. find the branch with the highest complaint count.
select
    b.branch_name,
    count(cp.complaint_id) as total_complaints
from branches b
join complaints cp
    on b.branch_id = cp.branch_id
group by b.branch_id, b.branch_name
order by total_complaints desc
limit 1;

-- case statements

USE bank_management_db;

-- 1. classify accounts based on their balance
SELECT
    account_id,
    account_number,
    balance,
    CASE
        WHEN balance <= 10000 THEN 'Low Balance'
        WHEN balance <= 50000 THEN 'Medium Balance'
        WHEN balance <= 100000 THEN 'High Balance'
        ELSE 'Premium Balance'
    END AS balance_category
FROM accounts
ORDER BY balance DESC;


-- 2. classify loans based on their risk level
-- practice rule: defaulted loans are high risk;
-- higher outstanding amounts indicate higher risk.
SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    outstanding_amount,
    status,
    CASE
        WHEN status = 'Defaulted' THEN 'High Risk'
        WHEN COALESCE(outstanding_amount, 0) >= loan_amount * 0.75
            THEN 'High Risk'
        WHEN COALESCE(outstanding_amount, 0) >= loan_amount * 0.40
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS loan_risk_category
FROM loans;


-- 3. classify transactions based on their amount
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    CASE
        WHEN amount < 1000 THEN 'Small Transaction'
        WHEN amount <= 10000 THEN 'Medium Transaction'
        WHEN amount <= 50000 THEN 'Large Transaction'
        ELSE 'High Value Transaction'
    END AS transaction_category
FROM transactions
ORDER BY amount DESC;


-- 4. display readable transaction status
SELECT
    transaction_id,
    transaction_type,
    amount,
    status,
    CASE
        WHEN status = 'Success' THEN 'Completed'
        WHEN status = 'Pending' THEN 'Awaiting Processing'
        WHEN status = 'Failed' THEN 'Unsuccessful'
        ELSE 'Unknown Status'
    END AS transaction_status
FROM transactions;


-- 5. classify customers based on their total account balance
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(SUM(a.balance), 0) AS total_balance,
    CASE
        WHEN COALESCE(SUM(a.balance), 0) <= 10000
            THEN 'Basic Customer'
        WHEN SUM(a.balance) <= 50000
            THEN 'Standard Customer'
        WHEN SUM(a.balance) <= 100000
            THEN 'Premium Customer'
        ELSE 'High Value Customer'
    END AS customer_category
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_balance DESC;


-- 6. classify complaints based on priority
SELECT
    complaint_id,
    customer_id,
    complaint_type,
    priority,
    status,
    CASE
        WHEN priority = 'High' THEN 'Urgent Attention'
        WHEN priority = 'Medium' THEN 'Normal Attention'
        WHEN priority = 'Low' THEN 'Low Priority'
        ELSE 'Priority Not Assigned'
    END AS priority_category
FROM complaints;


-- 7. identify loan repayment status
SELECT
    loan_id,
    customer_id,
    loan_amount,
    outstanding_amount,
    status,
    CASE
        WHEN status = 'Defaulted' THEN 'Payment Default'
        WHEN status = 'Closed' THEN 'Fully Repaid'
        WHEN status = 'Pending' THEN 'Awaiting Approval'
        WHEN outstanding_amount = 0 THEN 'Fully Repaid'
        WHEN outstanding_amount < loan_amount THEN 'Partially Repaid'
        ELSE 'Repayment Not Started'
    END AS repayment_category
FROM loans;


-- 8. classify customers based on account activity
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS transaction_count,
    CASE
        WHEN COUNT(t.transaction_id) = 0 THEN 'No Activity'
        WHEN COUNT(t.transaction_id) <= 5 THEN 'Low Activity'
        WHEN COUNT(t.transaction_id) <= 15 THEN 'Moderate Activity'
        ELSE 'Highly Active'
    END AS activity_category
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY transaction_count DESC;


-- 9. classify fixed deposits based on their principal amount
SELECT
    fd_id,
    customer_id,
    principal_amount,
    interest_rate,
    maturity_amount,
    CASE
        WHEN principal_amount < 25000 THEN 'Small Deposit'
        WHEN principal_amount <= 100000 THEN 'Medium Deposit'
        WHEN principal_amount <= 500000 THEN 'Large Deposit'
        ELSE 'Very Large Deposit'
    END AS deposit_category
FROM fixed_deposits
ORDER BY principal_amount DESC;


-- 10. generate a branch performance category
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance,
    CASE
        WHEN COUNT(DISTINCT a.account_id) >= 15 THEN 'High Performance'
        WHEN COUNT(DISTINCT a.account_id) >= 8 THEN 'Medium Performance'
        ELSE 'Low Performance'
    END AS branch_performance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_balance DESC;

-- PART 10 -- BANKING BUSINESS ANALYSIS

-- 1. find the branch with the highest number of customers
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(c.customer_id) AS total_customers
FROM branches b
LEFT JOIN customers c
    ON b.branch_id = c.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_customers DESC
LIMIT 1;


-- 2. find the branch with the highest total account balance
SELECT
    b.branch_id,
    b.branch_name,
    SUM(a.balance) AS total_balance
FROM branches b
JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_balance DESC
LIMIT 1;


-- 3. find the most popular account type
SELECT
    at.account_type_id,
    at.type_name,
    COUNT(a.account_id) AS total_accounts
FROM account_types at
JOIN accounts a
    ON at.account_type_id = a.account_type_id
GROUP BY at.account_type_id, at.type_name
ORDER BY total_accounts DESC
LIMIT 1;


-- 4. find the top 10 customers by total balance
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_balance DESC
LIMIT 10;


-- 5. find customers with low account activity
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS transaction_count
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(t.transaction_id) < 3
ORDER BY transaction_count;


-- 6. find customers who have both loans and fixed deposits
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers c
WHERE EXISTS (
    SELECT 1
    FROM loans l
    WHERE l.customer_id = c.customer_id
)
AND EXISTS (
    SELECT 1
    FROM fixed_deposits fd
    WHERE fd.customer_id = c.customer_id
);


-- 7. find customers with overdue loan payments
SELECT DISTINCT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name
FROM customers c
JOIN loans l
    ON c.customer_id = l.customer_id
JOIN loan_payments lp
    ON l.loan_id = lp.loan_id
WHERE lp.payment_status = 'Overdue';


-- 8. find the loan type with the highest outstanding amount
SELECT
    loan_type,
    SUM(outstanding_amount) AS total_outstanding
FROM loans
GROUP BY loan_type
ORDER BY total_outstanding DESC
LIMIT 1;


-- 9. find the branch with the highest loan disbursement
SELECT
    b.branch_id,
    b.branch_name,
    SUM(l.loan_amount) AS total_loan_disbursement
FROM branches b
JOIN loans l
    ON b.branch_id = l.branch_id
WHERE l.status IN ('Active', 'Closed')
GROUP BY b.branch_id, b.branch_name
ORDER BY total_loan_disbursement DESC
LIMIT 1;


-- 10. find customers with the highest number of transactions
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_transactions DESC
LIMIT 1;


-- 11. find the ATM with the highest transaction volume
SELECT
    atm_id,
    COUNT(atm_transaction_id) AS total_transactions,
    SUM(amount) AS total_transaction_amount
FROM atm_transactions
WHERE status = 'Success'
GROUP BY atm_id
ORDER BY total_transaction_amount DESC
LIMIT 1;


-- 12. find customers with repeated failed transactions
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS failed_transactions
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.status = 'Failed'
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(t.transaction_id) > 1
ORDER BY failed_transactions DESC;


-- 13. find unresolved complaints
SELECT
    complaint_id,
    customer_id,
    complaint_type,
    complaint_description,
    complaint_date,
    status,
    priority
FROM complaints
WHERE status IN ('Open', 'In Progress')
ORDER BY complaint_date;


-- 14. find the branch with the highest complaint count
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(cmp.complaint_id) AS total_complaints
FROM branches b
LEFT JOIN complaints cmp
    ON b.branch_id = cmp.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_complaints DESC
LIMIT 1;


-- PART 11 -- CASE STATEMENTS

-- 1. create account balance categories
SELECT
    account_id,
    account_number,
    balance,
    CASE
        WHEN balance <= 10000 THEN 'Low Balance'
        WHEN balance <= 50000 THEN 'Medium Balance'
        WHEN balance <= 100000 THEN 'High Balance'
        ELSE 'Premium Balance'
    END AS balance_category
FROM accounts;


-- 2. create loan risk categories
-- practice rule: defaulted loans are high risk;
-- outstanding balance >= 75% of loan amount is also high risk.
SELECT
    loan_id,
    customer_id,
    loan_amount,
    outstanding_amount,
    status,
    CASE
        WHEN status = 'Defaulted' THEN 'High Risk'
        WHEN outstanding_amount >= loan_amount * 0.75
            THEN 'High Risk'
        WHEN outstanding_amount >= loan_amount * 0.40
            THEN 'Medium Risk'
        ELSE 'Low Risk'
    END AS loan_risk_category
FROM loans;


-- 3. classify transactions based on amount
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    CASE
        WHEN amount < 1000 THEN 'Small Transaction'
        WHEN amount <= 10000 THEN 'Medium Transaction'
        WHEN amount <= 50000 THEN 'Large Transaction'
        ELSE 'High Value Transaction'
    END AS transaction_category
FROM transactions;


-- 4. display readable transaction status
SELECT
    transaction_id,
    transaction_type,
    amount,
    status,
    CASE
        WHEN status = 'Success' THEN 'Completed'
        WHEN status = 'Pending' THEN 'Awaiting Processing'
        WHEN status = 'Failed' THEN 'Unsuccessful'
        ELSE 'Unknown Status'
    END AS transaction_status
FROM transactions;


-- PART 12 -- DATE FUNCTIONS

-- 1. find transactions made this month
SELECT *
FROM transactions
WHERE YEAR(transaction_date) = YEAR(CURDATE())
AND MONTH(transaction_date) = MONTH(CURDATE());


-- 2. find customers registered in the current year
SELECT
    customer_id,
    first_name,
    last_name,
    registration_date
FROM customers
WHERE YEAR(registration_date) = YEAR(CURDATE());


-- 3. find loans created during a selected year
SELECT *
FROM loans
WHERE YEAR(issue_date) = 2025;


-- 4. find overdue loan payments
SELECT
    payment_id,
    loan_id,
    payment_amount,
    due_date,
    payment_date,
    DATEDIFF(CURDATE(), due_date) AS overdue_days
FROM loan_payments
WHERE payment_status = 'Overdue'
AND due_date < CURDATE();


-- 5. calculate the number of days between loan issue and payment
SELECT
    l.loan_id,
    l.customer_id,
    l.issue_date,
    lp.payment_date,
    DATEDIFF(lp.payment_date, l.issue_date) AS days_between
FROM loans l
JOIN loan_payments lp
    ON l.loan_id = lp.loan_id
WHERE lp.payment_date IS NOT NULL;


-- 6. find fixed deposits maturing within the next 30 days
SELECT
    fd_id,
    customer_id,
    principal_amount,
    maturity_date,
    maturity_amount
FROM fixed_deposits
WHERE maturity_date BETWEEN CURDATE()
AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY maturity_date;


-- PART 13 -- WINDOW FUNCTIONS

-- 1. rank customers by account balance
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.account_number,
    a.balance,
    RANK() OVER (
        ORDER BY a.balance DESC
    ) AS balance_rank
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id;


-- 2. rank customers branch-wise
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.branch_id,
    SUM(a.balance) AS total_balance,
    RANK() OVER (
        PARTITION BY c.branch_id
        ORDER BY SUM(a.balance) DESC
    ) AS branch_rank
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name, c.branch_id;


-- 3. find top 3 customers in every branch
WITH customer_balances AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        c.branch_id,
        COALESCE(SUM(a.balance), 0) AS total_balance
    FROM customers c
    LEFT JOIN accounts a
        ON c.customer_id = a.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name, c.branch_id
),
ranked_customers AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY branch_id
            ORDER BY total_balance DESC
        ) AS branch_rank
    FROM customer_balances
)
SELECT *
FROM ranked_customers
WHERE branch_rank <= 3;


-- 4. rank loans by loan amount
SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount,
    RANK() OVER (
        ORDER BY loan_amount DESC
    ) AS loan_rank
FROM loans;


-- 5. compare current transaction with previous transaction using LAG()
SELECT
    transaction_id,
    account_id,
    transaction_type,
    amount,
    transaction_date,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date, transaction_id
    ) AS previous_transaction_amount
FROM transactions;


-- 6. demonstrate ROW_NUMBER(), RANK() and DENSE_RANK()
SELECT
    account_id,
    account_number,
    balance,
    ROW_NUMBER() OVER (
        ORDER BY balance DESC
    ) AS row_number_rank,
    RANK() OVER (
        ORDER BY balance DESC
    ) AS rank_value,
    DENSE_RANK() OVER (
        ORDER BY balance DESC
    ) AS dense_rank_value
FROM accounts;


-- PART 14 -- VIEWS

-- 1. create customer_account_summary
CREATE OR REPLACE VIEW customer_account_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.email,
    c.phone,
    COUNT(a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    c.phone;


-- 2. create branch_performance
CREATE OR REPLACE VIEW branch_performance AS
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COALESCE(SUM(DISTINCT a.balance), 0) AS total_balance
FROM branches b
LEFT JOIN customers c
    ON b.branch_id = c.branch_id
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name;


-- 3. create loan_summary
CREATE OR REPLACE VIEW loan_summary AS
SELECT
    l.loan_id,
    l.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    l.loan_type,
    l.loan_amount,
    l.outstanding_amount,
    l.interest_rate,
    l.issue_date,
    l.due_date,
    l.status
FROM loans l
JOIN customers c
    ON l.customer_id = c.customer_id;


-- 4. create customer_transaction_summary
CREATE OR REPLACE VIEW customer_transaction_summary AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(
        CASE
            WHEN t.transaction_type = 'Deposit'
            AND t.status = 'Success' THEN t.amount
            ELSE 0
        END
    ), 0) AS total_deposits,
    COALESCE(SUM(
        CASE
            WHEN t.transaction_type = 'Withdrawal'
            AND t.status = 'Success' THEN t.amount
            ELSE 0
        END
    ), 0) AS total_withdrawals
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
GROUP BY c.customer_id, c.first_name, c.last_name;


-- 5. create customer_financial_profile
CREATE OR REPLACE VIEW customer_financial_profile AS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COALESCE(a.total_balance, 0) AS total_balance,
    COALESCE(l.total_loans, 0) AS total_loans,
    COALESCE(l.total_outstanding, 0) AS total_outstanding,
    COALESCE(fd.total_fixed_deposits, 0) AS total_fixed_deposits
FROM customers c
LEFT JOIN (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
) a ON c.customer_id = a.customer_id
LEFT JOIN (
    SELECT
        customer_id,
        COUNT(loan_id) AS total_loans,
        SUM(outstanding_amount) AS total_outstanding
    FROM loans
    GROUP BY customer_id
) l ON c.customer_id = l.customer_id
LEFT JOIN (
    SELECT
        customer_id,
        SUM(principal_amount) AS total_fixed_deposits
    FROM fixed_deposits
    GROUP BY customer_id
) fd ON c.customer_id = fd.customer_id;


-- view usage
SELECT * FROM customer_account_summary;
SELECT * FROM branch_performance;
SELECT * FROM loan_summary;
SELECT * FROM customer_transaction_summary;
SELECT * FROM customer_financial_profile;


-- PART 15 -- INDEXING

-- 1. create an index on customer name
CREATE INDEX idx_customer_name
ON customers(first_name, last_name);


-- 2. customer email already has a UNIQUE constraint.
-- the UNIQUE constraint automatically creates an index.
SHOW INDEX FROM customers;


-- 3. account number already has a UNIQUE constraint.
-- the UNIQUE constraint automatically creates an index.
SHOW INDEX FROM accounts;


-- 4. create an index on transaction date
CREATE INDEX idx_transaction_date
ON transactions(transaction_date);


-- 5. create indexes on frequently joined foreign-key columns
CREATE INDEX idx_customers_branch
ON customers(branch_id);

CREATE INDEX idx_accounts_customer
ON accounts(customer_id);

CREATE INDEX idx_accounts_branch
ON accounts(branch_id);

CREATE INDEX idx_transactions_account
ON transactions(account_id);

CREATE INDEX idx_loans_customer
ON loans(customer_id);

CREATE INDEX idx_loans_branch
ON loans(branch_id);

CREATE INDEX idx_loan_payments_loan
ON loan_payments(loan_id);


-- 6. use EXPLAIN to compare query execution plans
EXPLAIN
SELECT *
FROM customers
WHERE first_name = 'Arun';


EXPLAIN
SELECT *
FROM transactions
WHERE transaction_date BETWEEN '2025-01-01'
AND '2025-12-31';


EXPLAIN
SELECT
    c.customer_id,
    c.first_name,
    a.account_number,
    a.balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
WHERE c.branch_id = 1;


-- PART 16 -- STORED PROCEDURES

DELIMITER $$

-- 1. get complete customer banking details
CREATE PROCEDURE get_customer_banking_details(
    IN p_customer_id INT
)
BEGIN
    SELECT
        c.*,
        a.account_id,
        a.account_number,
        a.balance,
        a.status AS account_status,
        at.type_name
    FROM customers c
    LEFT JOIN accounts a
        ON c.customer_id = a.customer_id
    LEFT JOIN account_types at
        ON a.account_type_id = at.account_type_id
    WHERE c.customer_id = p_customer_id;
END $$


-- 2. get all accounts of a customer
CREATE PROCEDURE get_customer_accounts(
    IN p_customer_id INT
)
BEGIN
    SELECT
        account_id,
        account_number,
        balance,
        opening_date,
        status
    FROM accounts
    WHERE customer_id = p_customer_id;
END $$


-- 3. get customer transaction history
CREATE PROCEDURE get_customer_transaction_history(
    IN p_customer_id INT
)
BEGIN
    SELECT
        t.transaction_id,
        a.account_number,
        t.transaction_type,
        t.amount,
        t.transaction_date,
        t.description,
        t.status
    FROM transactions t
    JOIN accounts a
        ON t.account_id = a.account_id
    WHERE a.customer_id = p_customer_id
    ORDER BY t.transaction_date DESC;
END $$


-- 4. get branch performance summary
CREATE PROCEDURE get_branch_performance_summary(
    IN p_branch_id INT
)
BEGIN
    SELECT
        b.branch_id,
        b.branch_name,
        COUNT(DISTINCT c.customer_id) AS total_customers,
        COUNT(DISTINCT a.account_id) AS total_accounts,
        COALESCE(SUM(DISTINCT a.balance), 0) AS total_balance,
        COUNT(DISTINCT l.loan_id) AS total_loans
    FROM branches b
    LEFT JOIN customers c
        ON b.branch_id = c.branch_id
    LEFT JOIN accounts a
        ON b.branch_id = a.branch_id
    LEFT JOIN loans l
        ON b.branch_id = l.branch_id
    WHERE b.branch_id = p_branch_id
    GROUP BY b.branch_id, b.branch_name;
END $$


-- 5. get outstanding loan details
CREATE PROCEDURE get_outstanding_loan_details(
    IN p_customer_id INT
)
BEGIN
    SELECT
        loan_id,
        customer_id,
        loan_type,
        loan_amount,
        outstanding_amount,
        interest_rate,
        due_date,
        status
    FROM loans
    WHERE customer_id = p_customer_id
    AND outstanding_amount > 0;
END $$

DELIMITER ;


-- stored procedure calls
CALL get_customer_banking_details(1);
CALL get_customer_accounts(1);
CALL get_customer_transaction_history(1);
CALL get_branch_performance_summary(1);
CALL get_outstanding_loan_details(1);


-- PART 17 -- USER-DEFINED FUNCTIONS

DELIMITER $$

-- 1. calculate account balance category
CREATE FUNCTION calculate_balance_category(
    p_balance DECIMAL(15,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_balance <= 10000 THEN 'Low Balance'
        WHEN p_balance <= 50000 THEN 'Medium Balance'
        WHEN p_balance <= 100000 THEN 'High Balance'
        ELSE 'Premium Balance'
    END;
END $$


-- 2. calculate loan outstanding amount
CREATE FUNCTION calculate_loan_outstanding(
    p_loan_id INT
)
RETURNS DECIMAL(15,2)
READS SQL DATA
BEGIN
    DECLARE v_outstanding DECIMAL(15,2);

    SELECT outstanding_amount
    INTO v_outstanding
    FROM loans
    WHERE loan_id = p_loan_id;

    RETURN COALESCE(v_outstanding, 0);
END $$


-- 3. calculate transaction fee where applicable
-- practice rule: 0.5% fee for transfers; no fee for other transactions.
CREATE FUNCTION calculate_transaction_fee(
    p_transaction_type VARCHAR(30),
    p_amount DECIMAL(15,2)
)
RETURNS DECIMAL(15,2)
DETERMINISTIC
BEGIN
    RETURN CASE
        WHEN p_transaction_type = 'Transfer'
            THEN ROUND(p_amount * 0.005, 2)
        ELSE 0.00
    END;
END $$

DELIMITER ;


-- function usage
SELECT
    account_id,
    account_number,
    balance,
    calculate_balance_category(balance) AS balance_category
FROM accounts;


SELECT
    loan_id,
    calculate_loan_outstanding(loan_id) AS outstanding_amount
FROM loans;


SELECT
    transaction_id,
    transaction_type,
    amount,
    calculate_transaction_fee(transaction_type, amount) AS transaction_fee
FROM transactions;


-- PART 18 -- TRIGGERS

DELIMITER $$

-- 1. prevent withdrawal when available balance is insufficient
CREATE TRIGGER before_transaction_insert
BEFORE INSERT ON transactions
FOR EACH ROW
BEGIN
    DECLARE v_balance DECIMAL(15,2);

    IF NEW.transaction_type = 'Withdrawal'
       AND NEW.status = 'Success' THEN

        SELECT balance
        INTO v_balance
        FROM accounts
        WHERE account_id = NEW.account_id
        FOR UPDATE;

        IF v_balance IS NULL OR v_balance < NEW.amount THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Insufficient account balance';
        END IF;

    END IF;
END $$


-- 2. automatically update account balance after a deposit
-- 3. automatically update account balance after a withdrawal
CREATE TRIGGER after_transaction_insert
AFTER INSERT ON transactions
FOR EACH ROW
BEGIN
    IF NEW.status = 'Success' THEN

        IF NEW.transaction_type = 'Deposit' THEN

            UPDATE accounts
            SET balance = balance + NEW.amount
            WHERE account_id = NEW.account_id;

        ELSEIF NEW.transaction_type = 'Withdrawal' THEN

            UPDATE accounts
            SET balance = balance - NEW.amount
            WHERE account_id = NEW.account_id;

        END IF;

    END IF;
END $$


-- 4. record important account changes in audit_logs
CREATE TRIGGER after_account_update
AFTER UPDATE ON accounts
FOR EACH ROW
BEGIN
    IF OLD.balance <> NEW.balance
       OR OLD.status <> NEW.status THEN

        INSERT INTO audit_logs (
            employee_id,
            customer_id,
            action_type,
            table_name,
            record_id,
            action_description,
            action_timestamp,
            ip_address
        )
        VALUES (
            NULL,
            NEW.customer_id,
            'UPDATE',
            'accounts',
            NEW.account_id,
            CONCAT(
                'Account updated. Old balance: ',
                OLD.balance,
                ', New balance: ',
                NEW.balance,
                ', Old status: ',
                OLD.status,
                ', New status: ',
                NEW.status
            ),
            NOW(),
            NULL
        );

    END IF;
END $$


-- 5. prevent invalid loan payment amounts
CREATE TRIGGER before_loan_payment_insert
BEFORE INSERT ON loan_payments
FOR EACH ROW
BEGIN
    DECLARE v_outstanding DECIMAL(15,2);

    IF NEW.payment_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Loan payment must be greater than zero';
    END IF;

    SELECT outstanding_amount
    INTO v_outstanding
    FROM loans
    WHERE loan_id = NEW.loan_id
    FOR UPDATE;

    IF v_outstanding IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Loan does not exist';
    END IF;

    IF NEW.payment_status = 'Paid'
       AND NEW.payment_amount > v_outstanding THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Payment exceeds outstanding loan amount';
    END IF;
END $$


-- update loan outstanding amount after successful payment
CREATE TRIGGER after_loan_payment_insert
AFTER INSERT ON loan_payments
FOR EACH ROW
BEGIN
    IF NEW.payment_status = 'Paid' THEN

        UPDATE loans
        SET
            outstanding_amount = GREATEST(
                outstanding_amount - NEW.payment_amount,
                0
            ),
            status = CASE
                WHEN outstanding_amount - NEW.payment_amount <= 0
                    THEN 'Closed'
                ELSE status
            END
        WHERE loan_id = NEW.loan_id;

    END IF;
END $$

DELIMITER ;


-- PART 19 -- COMMON TABLE EXPRESSIONS (CTE)

-- 1. find branch-wise total deposits
WITH branch_deposits AS (
    SELECT
        a.branch_id,
        SUM(t.amount) AS total_deposits
    FROM accounts a
    JOIN transactions t
        ON a.account_id = t.account_id
    WHERE t.transaction_type = 'Deposit'
    AND t.status = 'Success'
    GROUP BY a.branch_id
)
SELECT
    b.branch_id,
    b.branch_name,
    COALESCE(bd.total_deposits, 0) AS total_deposits
FROM branches b
LEFT JOIN branch_deposits bd
    ON b.branch_id = bd.branch_id
ORDER BY total_deposits DESC;


-- 2. find top customers by balance
WITH customer_balances AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COALESCE(SUM(a.balance), 0) AS total_balance
    FROM customers c
    LEFT JOIN accounts a
        ON c.customer_id = a.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_balances
ORDER BY total_balance DESC
LIMIT 10;


-- 3. find customers with high loan exposure
WITH customer_loan_exposure AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        SUM(l.loan_amount) AS total_loan_amount,
        SUM(l.outstanding_amount) AS total_outstanding
    FROM customers c
    JOIN loans l
        ON c.customer_id = l.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_loan_exposure
WHERE total_outstanding > 100000
ORDER BY total_outstanding DESC;


-- 4. find customers with unusually high transaction activity
WITH customer_activity AS (
    SELECT
        c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        COUNT(t.transaction_id) AS total_transactions
    FROM customers c
    JOIN accounts a
        ON c.customer_id = a.customer_id
    JOIN transactions t
        ON a.account_id = t.account_id
    GROUP BY c.customer_id, c.first_name, c.last_name
)
SELECT *
FROM customer_activity
WHERE total_transactions > (
    SELECT AVG(transaction_count)
    FROM (
        SELECT COUNT(t.transaction_id) AS transaction_count
        FROM accounts a
        LEFT JOIN transactions t
            ON a.account_id = t.account_id
        GROUP BY a.customer_id
    ) AS average_activity
)
ORDER BY total_transactions DESC;


-- 5. build a reusable query for branch performance
WITH branch_summary AS (
    SELECT
        b.branch_id,
        b.branch_name,
        COUNT(DISTINCT c.customer_id) AS total_customers,
        COUNT(DISTINCT a.account_id) AS total_accounts,
        COALESCE(SUM(DISTINCT a.balance), 0) AS total_balance
    FROM branches b
    LEFT JOIN customers c
        ON b.branch_id = c.branch_id
    LEFT JOIN accounts a
        ON b.branch_id = a.branch_id
    GROUP BY b.branch_id, b.branch_name
)
SELECT *
FROM branch_summary
ORDER BY total_balance DESC;


-- PART 20 -- FINAL POWER BI DATASET

-- KPI 1. total customers
SELECT COUNT(*) AS total_customers
FROM customers;


-- KPI 2. total accounts
SELECT COUNT(*) AS total_accounts
FROM accounts;


-- KPI 3. total deposits
SELECT
    COALESCE(SUM(amount), 0) AS total_deposits
FROM transactions
WHERE transaction_type = 'Deposit'
AND status = 'Success';


-- KPI 4. total withdrawals
SELECT
    COALESCE(SUM(amount), 0) AS total_withdrawals
FROM transactions
WHERE transaction_type = 'Withdrawal'
AND status = 'Success';


-- KPI 5. total loans
SELECT
    COUNT(*) AS total_loans,
    COALESCE(SUM(loan_amount), 0) AS total_loan_amount
FROM loans;


-- KPI 6. outstanding loans
SELECT
    COALESCE(SUM(outstanding_amount), 0) AS total_outstanding_loans
FROM loans;


-- KPI 7. total branches
SELECT COUNT(*) AS total_branches
FROM branches;


-- KPI 8. average account balance
SELECT
    ROUND(AVG(balance), 2) AS average_account_balance
FROM accounts;


-- KPI 9. top branch by total account balance
SELECT
    b.branch_id,
    b.branch_name,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY b.branch_id, b.branch_name
ORDER BY total_balance DESC
LIMIT 1;


-- KPI 10. top customer by total account balance
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY total_balance DESC
LIMIT 1;


-- KPI 11. loan default and overdue count
SELECT
    (
        SELECT COUNT(*)
        FROM loans
        WHERE status = 'Defaulted'
    ) AS defaulted_loans,
    (
        SELECT COUNT(*)
        FROM loan_payments
        WHERE payment_status = 'Overdue'
    ) AS overdue_payments;


-- KPI 12. total fixed deposits
SELECT
    COUNT(*) AS total_fixed_deposits,
    COALESCE(SUM(principal_amount), 0) AS total_fd_amount
FROM fixed_deposits;


-- KPI 13. complaint count
SELECT
    COUNT(*) AS total_complaints,
    SUM(
        CASE
            WHEN status IN ('Open', 'In Progress') THEN 1
            ELSE 0
        END
    ) AS unresolved_complaints
FROM complaints;


-- KPI 14. transaction volume
SELECT
    COUNT(*) AS total_transactions,
    COALESCE(SUM(amount), 0) AS total_transaction_amount
FROM transactions
WHERE status = 'Success';


-- POWER BI PAGE 1 -- BANKING OVERVIEW
SELECT
    (SELECT COUNT(*) FROM customers) AS total_customers,
    (SELECT COUNT(*) FROM accounts) AS total_accounts,
    (
        SELECT COALESCE(SUM(amount), 0)
        FROM transactions
        WHERE transaction_type = 'Deposit'
        AND status = 'Success'
    ) AS total_deposits,
    (
        SELECT COALESCE(SUM(amount), 0)
        FROM transactions
        WHERE transaction_type = 'Withdrawal'
        AND status = 'Success'
    ) AS total_withdrawals,
    (
        SELECT COALESCE(SUM(loan_amount), 0)
        FROM loans
    ) AS total_loans;


-- POWER BI PAGE 2 -- CUSTOMER ANALYTICS
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.state,
    c.branch_id,
    COUNT(a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city,
    c.state,
    c.branch_id;


-- POWER BI PAGE 2 -- ACCOUNT TYPE DISTRIBUTION
SELECT
    at.type_name,
    COUNT(a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance
FROM account_types at
LEFT JOIN accounts a
    ON at.account_type_id = a.account_type_id
GROUP BY at.account_type_id, at.type_name;


-- POWER BI PAGE 3 -- TRANSACTION ANALYTICS
SELECT
    DATE(transaction_date) AS transaction_day,
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Success'
GROUP BY DATE(transaction_date), transaction_type
ORDER BY transaction_day;


-- POWER BI PAGE 3 -- TRANSACTION TYPE SUMMARY
SELECT
    transaction_type,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM transactions
WHERE status = 'Success'
GROUP BY transaction_type;


-- POWER BI PAGE 4 -- LOAN ANALYTICS
SELECT
    loan_type,
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    SUM(outstanding_amount) AS total_outstanding,
    AVG(interest_rate) AS average_interest_rate
FROM loans
GROUP BY loan_type;


-- POWER BI PAGE 4 -- LOAN REPAYMENT AND OVERDUE ANALYSIS
SELECT
    l.loan_id,
    l.customer_id,
    l.loan_type,
    l.loan_amount,
    l.outstanding_amount,
    l.status,
    COUNT(
        CASE
            WHEN lp.payment_status = 'Paid' THEN lp.payment_id
        END
    ) AS paid_installments,
    COUNT(
        CASE
            WHEN lp.payment_status = 'Overdue' THEN lp.payment_id
        END
    ) AS overdue_installments
FROM loans l
LEFT JOIN loan_payments lp
    ON l.loan_id = lp.loan_id
GROUP BY
    l.loan_id,
    l.customer_id,
    l.loan_type,
    l.loan_amount,
    l.outstanding_amount,
    l.status;


-- POWER BI PAGE 5 -- BRANCH PERFORMANCE
SELECT
    b.branch_id,
    b.branch_name,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COALESCE(SUM(DISTINCT a.balance), 0) AS total_balance,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    COALESCE(SUM(DISTINCT l.loan_amount), 0) AS total_loan_amount
FROM branches b
LEFT JOIN customers c
    ON b.branch_id = c.branch_id
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
LEFT JOIN loans l
    ON b.branch_id = l.branch_id
GROUP BY b.branch_id, b.branch_name;


-- POWER BI PAGE 5 -- BRANCH-WISE TRANSACTION ANALYSIS
SELECT
    b.branch_id,
    b.branch_name,
    t.transaction_type,
    COUNT(t.transaction_id) AS total_transactions,
    COALESCE(SUM(t.amount), 0) AS total_amount
FROM branches b
JOIN transactions t
    ON b.branch_id = t.branch_id
WHERE t.status = 'Success'
GROUP BY b.branch_id, b.branch_name, t.transaction_type;
