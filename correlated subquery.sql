use world;

-- correlated subquery -> dependant subquery -> inner query depends on outter query
-- inner query runs multiple times for each row of outter query
-- company does not use this
-- inner query gets the reference of the outter query

drop database if exists newdb2;
create database newdb2;

use newdb2;

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

INSERT INTO Customers VALUES
(101, 'Alice', 'New York'),
(102, 'Bob', 'Chicago'),
(103, 'Charlie', 'Dallas'),
(104, 'David', 'Seattle'),
(105, 'Emma', 'Boston'),
(106, 'Frank', 'Chicago'),
(107, 'Grace', 'Dallas'),
(108, 'Henry', 'Miami');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20)
);

INSERT INTO Orders VALUES
(1001, 101, '2025-01-05', 1200, 'Delivered'),
(1002, 101, '2025-02-15', 800, 'Cancelled'),
(1003, 102, '2025-01-20', 3500, 'Delivered'),
(1004, 102, '2025-03-10', 600, 'Pending'),
(1005, 103, '2025-02-18', 900, 'Delivered'),
(1006, 104, '2025-03-05', 4500, 'Delivered'),
(1007, 104, '2025-04-01', 700, 'Pending'),
(1008, 105, '2025-01-11', 1500, 'Cancelled'),
(1009, 105, '2025-04-12', 2200, 'Delivered'),
(1010, 107, '2025-05-01', 1800, 'Pending');

select * from customers;
select * from orders;

-- normal form
select order_id, amount from orders
where order_id = 1001 and 
amount=(select max(amount) from orders where order_id=1001);  

-- correlated query form
select order_id, amount from orders as o_outter 
where amount=(select max(amount) from orders where order_id= o_outter.order_id);  

-- exists and non exists correlated subquery -> works on one value only if one value is found than it will not move forward
-- in operator -> works for every value returned by subquery
-- in operator is slower than exists operator

select * from customers where exists(select 1 from orders where orders.customer_id = customers.customer_id);  -- exists operator   -- 1 is for true and 0 is for false
select * from customers where customer_id in(select customer_id from orders);     -- in operator  -- multi row subquery
select * from customers where not exists(select 1 from orders where orders.customer_id = customers.customer_id);  -- not exists operator

-- find the customer who have atleast one delivered order
select * from customers where exists(select 1 from orders where orders.customer_id = customers.customer_id and orders.status='delivered');

-- find the customers who have both delivered and pending status
select * from customers where 
exists(select 1 from orders where orders.customer_id = customers.customer_id and orders.status = 'delivered')     -- first exists
and exists(select 1 from orders where orders.customer_id = customers.customer_id and orders.status = 'pending');  -- second exists

-- questions
create database querydb;

use querydb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(101, 'HR', 'Delhi'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Pune'),
(105, 'Marketing', 'Hyderabad');

INSERT INTO Employee VALUES
(1, 'Amit',    'M', 55000, 101, NULL),
(2, 'Neha',    'F', 48000, 101, 1),
(3, 'Raj',     'M', 62000, 101, 1),
(4, 'Priya',   'F', 70000, 102, NULL),
(5, 'Arjun',   'M', 68000, 102, 4),
(6, 'Kiran',   'F', 72000, 102, 4),
(7, 'Rohit',   'M', 61000, 102, 4),
(8, 'Sneha',   'F', 80000, 103, NULL),
(9, 'Vikas',   'M', 75000, 103, 8),
(10,'Anjali',  'F', 78000, 103, 8),
(11,'Mohit',   'M', 50000, 104, NULL),
(12,'Pooja',   'F', 45000, 104, 11),
(13,'Deepak',  'M', 53000, 104, 11),
(14,'Riya',    'F', 60000, 104, 11),
(15,'Kunal',   'M', 65000, 105, NULL),
(16,'Nisha',   'F', 62000, 105, 15),
(17,'Varun',   'M', 59000, 105, 15),
(18,'Isha',    'F', 67000, 105, 15),
(19,'Manish',  'M', 64000, 105, 15),
(20,'Kavya',   'F', 52000, 101, 1);

select * from employee;
select * from department;

select * from employee where dept_id=104
and salary=(select max(salary) from employee where dept_id=104);

select * from employee as eout where 
salary=(select max(salary) from employee where dept_id=eout.dept_id);

-- employee whose salary is greater than avg salary of their own dept
select * from employee as e where salary>(select avg(salary) from employee where dept_id=e.dept_id);

-- employee who earns more than every other employee in their department
select emp_name from employee as e where salary>=ALL(select salary from employee where dept_id=e.dept_id);

-- employee whose salary is greater than their managers
select * from employee as e where salary > (select salary from employee as m where m.dept_id=e.manager_id);

-- employees who are not the highest paid in their department
select emp_name from employee as e where salary != (select max(salary) from employee where dept_id=e.dept_id);

-- departments having atleast one employee earning more than 70000
select dept_name from department where dept_id in (select dept_id from employee where salary>70000);

-- second highest salary
select emp_name, dept_id, salary from employee as e where salary=(select max(salary) from employee as e2 where dept_id=e.dept_id and 
salary<(select max(salary) from employee where dept_id=e.dept_id));

-- find the name of a person and its dept whose salary should be less than the salary of all the employees amoung the same department
select emp_name,dept_id from employee as c where salary<(select min(salary) from employee where dept_id=c.dept_id);

-- get the dept name if the sum of all there employees salary should be less than 8000000
select dept_name from department as d where 8000000>(select sum(salary) from employee where dept_id=d.dept_id);

-- get emp details if in its dept the salary of all the employees in the dept should be less than 70000
select * from employee as e where 70000>all(select salary from employee where dept_id=e.dept_id);




