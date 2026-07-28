create database joinsdb2;
use joinsdb2;
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

-- 1
select e.emp_id, e.emp_name, d.dept_name, d.location from employees  as e inner join departments as d ON e.dept_id=d.dept_id;

-- 2
select p.proj_id, p.proj_name, d.dept_name, p.budget from projects as p inner join departments as d ON p.dept_id=d.dept_id;

-- 3
select e.emp_name, d.dept_name, p.proj_name from employees as e inner join departments as d ON e.dept_id=d.dept_id
inner join projects as p on p.dept_id=d.dept_id;

-- 4
select e.emp_id, e.emp_name, e.dept_id, d.dept_name from employees as e left join 
departments as d on e.dept_id=d.dept_id;

-- 5
select d.dept_id, d.dept_name, p.proj_name, p.budget from departments as d left join 
projects as p on d.dept_id=p.dept_id;

-- 6
select e.emp_id, e.emp_name, e.dept_id from employees as e left join departments as d ON
e.dept_id=d.dept_id where d.dept_id is NULL;

-- 7
select e.emp_name, d.dept_id, d.dept_name from employees as e right join departments as d on
e.dept_id=d.dept_id;

-- 8
select d.dept_name, p.proj_id, p.proj_name, d.dept_id from departments as d right join projects as p on 
p.dept_id=d.dept_id;

-- 9
select d.dept_id, d.dept_name, d.location from employees as e right join departments as d
ON e.dept_id=d.dept_id where e.emp_id is NULL;

-- 10
select e.emp_name, e.salary, d.dept_name from employees as e cross join departments as d where 
e.salary>70000 AND d.dept_name IN ('Finance','legal');

-- 11
select p.proj_name, p.budget,d.dept_name, d.location from projects as p cross join departments
as d where p.budget>=400000 AND d.location IN ('Mumbai','pune');

-- 12
select count(*) as total_combinations from employees as e cross join departments as d;

-- 13
select e.emp_id, e.emp_name, d.dept_id, e.salary,e.city from employees as e join departments as d where
e.dept_id=d.dept_id and e.salary>60000;

-- 14
select emp_id,emp_name,salary,city from employees where city IN ('mumbai','delhi');

-- 15
select emp_id, emp_name, dept_id, salary from employees where dept_id is NULL;

-- 16
select * from departments where location IN ('bangalore','delhi');

-- 17
select * from departments where dept_id>=30;

-- 18
select * from departments where dept_name LIKE 'F%' or dept_name LIKE 'L%';

-- 19 
select * from projects where budget BETWEEN 200000 AND 400000;

-- 20
select * from projects where dept_id = 20;

-- 21
select proj_id, proj_name, budget from projects where proj_name LIKE '%a%'and budget<300000;

-- 22
select e.emp_name, d.dept_name, d.location, p.proj_name, p.budget from employees as e 
inner join departments as d ON e.dept_id=d.dept_id inner join projects as p ON
d.dept_id=p.dept_id;

-- 23
select e.emp_id, e.emp_name, d.dept_name, p.proj_name from employees as e left join departments as d ON 
e.dept_id=d.dept_id left join projects as p on d.dept_id=p.dept_id;

-- 24
select e.emp_name, e.salary, d.dept_name, p.proj_name, p.budget from employees as e inner join
departments as d on e.dept_id=d.dept_id inner join projects as p on d.dept_id=p.dept_id
where  e.salary>60000 and p.budget>250000;

-- 25
select d.dept_id, d.dept_name, e.emp_name, p.proj_name from departments as d left join
employees as e ON d.dept_id=e.dept_id left join projects as p ON d.dept_id=p.dept_id;

-- 26
select e.emp_name, d.location, p.proj_name from employees as e inner join departments as d
on e.dept_id=d.dept_id inner join projects as p on d.dept_id=p.dept_id where d.location IN
('bangalore','mumbai');

-- 27
select e1.emp_name as employee_1, e2.emp_name as employee_2, e1.city from employees 
as e1 inner join employees as e2 on e1.city=e2.city where e1.emp_id<e2.emp_id;

-- 28
select p.proj_name, p.dept_id, e.emp_name from projects as p left join employees as e On
p.dept_id=e.dept_id;