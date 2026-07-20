create schema DA;
use DA;


 -- Check Existing Tables
SHOW TABLES; 


-- 1. CREATE TABLE: departments

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);


-- 3. INSERT DATA: 

-- Departments

INSERT INTO departments (dept_id, dept_name, location) VALUES
(10, 'Human Resources', 'Chennai'),
(20, 'Finance', 'Bengaluru'),
(30, 'Engineering', 'Hyderabad'),
(40, 'Sales', 'Kochi'),
(50, 'Marketing', 'Coimbatore');
SELECT * FROM Departments;



-- 2. CREATE TABLE: employees


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50),
    gender VARCHAR(10),      
    email VARCHAR(100),
    phone VARCHAR(15),
    salary DECIMAL(10,2),
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


-- Employees

INSERT INTO employees 
(emp_id, first_name, last_name, gender, email, phone, salary, hire_date, dept_id)
VALUES
(101, 'Arun', 'Kumar', 'Male', 'arun.kumar@example.com', '9876543210', 55000, '2021-04-10', 30),
(102, 'Deepa', 'Ramesh', 'Female', 'deepa.ramesh@example.com', '9823445567', 48000, '2022-01-15', 10),
(103, 'Vignesh', 'S', 'Male', 'vignesh.s@example.com', '9001122334', 62000, '2020-11-05', 30),
(104, 'Lakshmi', 'Narayanan', 'Female', 'lakshmi.narayanan@example.com', '7890654321', 70000, '2019-06-20', 20),
(105, 'Meera', 'Krishnan', 'Female', 'meera.krishnan@example.com', '9100223344', 45000, '2023-02-01', 50),
(106, 'Karthik', 'Reddy', 'Male', 'karthik.reddy@example.com', '9988776655', 75000, '2018-09-25', 30),
(107, 'Anitha', 'Menon', 'Female', 'anitha.menon@example.com', '9933445566', 52000, '2021-12-12', 40),
(108, 'Suresh', 'Kannan', 'Male', 'suresh.kannan@example.com', '9445566778', 58000, '2020-03-30', 40),
(109, 'Harini', 'Raj', 'Female', 'harini.raj@example.com', '9556677889', 49000, '2023-05-11', 10),
(110, 'Pradeep', 'Shetty', 'Male', 'pradeep.shetty@example.com', '9009988776', 80000, '2017-07-18', 20),
(111, 'Rohit', 'Verma', 'Male', 'rohit.verma@example.com', '9887766554', 50000, '2022-08-15', NULL),
(112, 'Seema', 'Patel', 'Female', 'seema.patel@example.com', '9776655443', 47000, '2023-09-10', NULL);

select * from  employees;
select*from Departments;
select*from employees order by salary desc;
-- caluculate total salary of male and female
select gender,sum(Salary) from employees group by gender;
-- show departments where average salary is greter than 60,000.
select dept_id,avg(Salary) as totol_emp from employees 
 group by dept_id having avg(Salary)>60000;																		

-- show total salary per department.alter
select  dept_id,sum(Salary) as total_salary from employees
group by dept_id ;
-- show total salary department only for those having salary sum greter than 150,000.
select dept_id,sum(Salary) as total_salary from employees
group by dept_id having sum(Salary)>150000;

-- count employees by gender
select gender ,count(*)  as gender from employees
group by gender;
--  show highest  and lowest salary in each department
select dept_id,max(Salary) as max_sal,min(Salary) as min_sal
from employees
group by dept_id;
-- show departments with morethan one female employees
select dept_id,count(*) as total_female from employees
where gender="female"
group by dept_id 
having count(*)>1;
-- show number of employees hired each year
select year(hire_date) as year_val,count(*) as count_yr from employees group by year(hire_date);

-- show department where the minimum salary is greater than 45000
select dept_id,min(Salary) as min_Salary from employees
group by dept_id having min(Salary)>45000;
select dept_id,min(salary)as minimumsalary from employees group by dept_id having min(salary)>45000;
-- show count of employees whose first name starts with "A" or "D" group by department
select dept_id,count(*) as total_emp from employees
where first_name like "A%"or first_name like "D%"
group by dept_id;
select * from employees where first_name like "A%" or first_name like "D%";
-- show departments where total number of employees with salary<60000 is at least 2
select dept_id,count(*) as total_mem from employees where salary<60000
group by dept_id
having count(*)>=2;
-- show total,average,max salary for each gender.
select  gender,sum(Salary) as total_sal,avg(Salary) as avg_sal,max(Salary) as max_sal from employees group by  gender;

-- get only emp_id,gender,phone,dept_id
select emp_id,gender,phone,dept_id from employees;
-- get only emp_id,gender,phone,dept_id and dept_id of 30 only
select emp_id,gender,phone,dept_id from employees where dept_id=30;
-- get only emp_id,gender,phone,dept_id and dept_id>15 only
select emp_id,gender,phone,dept_id from employees where dept_id>15;
-- get only emp_id, gender,phone,dept_id of female only
select emp_id,gender,phone,dept_id from employees where gender= "Female";
-- get only emp_id, gender,phone,dept_id of male only
select emp_id,gender,phone,dept_id from employees where gender= "Male";
-- get only emp_id,first_name,last_name,gender,phone,dept_id of male only in ascending order
select  first_name,last_name,emp_id,gender,phone,dept_id from employees where gender= "Male"order by  first_name asc;
-- get only emp_id,first_name,last_name,gender,phone,dept_id of male only in desending order
select  first_name,last_name,emp_id,gender,phone,dept_id from employees where gender= "Male"order by  first_name desc;
-- display all records from the employees table
select*from employees;
-- display first_name,and last_name of all employees
select first_name,last_name from employees;
-- display all department names from departments table
select * from departments;
-- display employees whose dept_id is 30.
select emp_id,dept_id from employees where dept_id=30;
-- display employees with salary more than 50000.
select * from employees where salary>50000;
-- display employees who were hired after 2021.
select *from employees where hire_date>'2021-12-31';
-- display all employees ordered by salary from highest to lowest.
select*from employees where salary order by salary asc; -- low
select*from employees where salary order by salary desc; -- high
-
-- display unique department IDs from employees table.
select distinct dept_id from employees;
-- display employees whose first name begins with letter 'A'.
select first_name from employees where first_name like "A%";
-- % act as wildcard character -> it replace any of character


-- GROUP BY AND AGGREGATIONS
-- Caluculate total salary of male and female
select gender ,sum(Salary)from employees group by gender; -- replace name new name used in keyword "as"
select gender ,sum(Salary) as total_salary from employees group by gender;
-- show departments with morethan one female employees
select gender,dept_id,count(*) as total_female from employees
where gender="female"
group by dept_id having count(*)>1;

-- count number of employees in each department.
select  dept_id,count(*)  as total_emp from employees group by dept_id;
-- show average salary of employees in each department
select dept_id,avg(Salary) as avg_sal from employees group by dept_id;
-- where filters rows before grouping
-- having filters groups after aggregation

-- top-3 based on slary whose emp_id should be greter than 105
select emp_id,first_name,salary,gender from employees where emp_id>105
order by salary desc
limit 3;

-- top -3 based on salary of female emp_id should be greater than 105
select emp_id,first_name,salary,gender from employees where emp_id>105 and gender="Female"
order by salary desc
limit 3;

-- top-3 based on salary of male whose emp_id should be greater than 105
select emp_id,first_name,salary,gender from employees where emp_id>105 and gender="Male"
order by salary desc
limit 3;

-- show 3 based on salary by skipping top -1
select first_name,salary,gender from employees
order by salary desc
limit 3
offset 1;

-- show 3 records based on salary of male whose emp_id should be greater than 105 by skipping 2
select* from employees where emp_id>105 and gender="Male"
order by Salary asc 
 limit 3 offset 2;
-- skip 1 rowthen 2nd highest salary
select  emp_id,
first_name,salary,gender from employees where emp_id>105 order by salary desc limit 3 offset 1;
select *from employees;
-- LAG:- next row 
select emp_id,first_name,salary,gender ,lag(salary,1) over() as "total_price"
from employees;
-- LEAD:- previous rows
SELECT emp_id,first_name,salary,gender,lead(salary,2) over() as "lead_salary"
from employees;
--   2nd highest salary
select* from(select*,row_number()over(order by salary desc)as rs from employees)as rt where rs=2;
with rank1 as (
select * ,dense_rank()over(order by salary desc)as rs from employees as rt)
select *from rank1
where rs=3;

