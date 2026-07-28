use world;

-- joins are used to combine data of more than one table based on their values 

select city.name, city.countrycode from city;
select country.name, country.code from country;

select city.name, city.countrycode, country.name, country.code from city join country where city.countrycode=country.code;

-- using alias --> can be refered as nickname

select c.name, c.countrycode from city as c;
select co.name, co.code from country as co;

select c.name, c.countrycode, co.name, co.code from city as c join country as co where c.countrycode=co.code;

-- types of joins

create database joinsdb;
use joinsdb;

create table departments ( departmentid int primary key, departmentname varchar(50));
insert into departments(departmentid, departmentname) values 
(101, "finance"), 
(102, "tech"), 
(103,"hr");

create table employees ( employeeid int primary key, employeename varchar(50), departmentid int);
insert into employees(employeeid, employeename, departmentid) values 
(1, "maytri",101), 
(2, "angad",102), 
(3,"ayesha",105),   -- no matching department
(4,"mayuri",NULL);  -- no department assigned

-- inner join --> we get common values from both the tables
select e.employeename, e.employeeid, e.departmentid, d.departmentid, d.departmentname from employees as e 
join departments as d on e.departmentid=d.departmentid;  

-- left join --> we get the whole data of the left table weather common or not
select e.employeename, e.employeeid, e.departmentid, d.departmentid, d.departmentname from employees as e 
left join departments as d on e.departmentid=d.departmentid;   -- the table on the left of join table is the left table in this case it is employee

-- right join --> we get the whole data of the right table weather common or not
select e.employeename, e.employeeid, e.departmentid, d.departmentid, d.departmentname from employees as e 
right join departments as d on e.departmentid=d.departmentid;   -- the table on the right of join table is the right table in this case it is department

-- primary key is a key which can be used to identify every row in a table
-- forign key is a key which is used to establish relation between two tables and it is the primary key of another table

-- cross join/cartesian join --> every row of one table is connected to every row of another table
select e.employeename, e.employeeid, e.departmentid, d.departmentid, d.departmentname from employees as e 
cross join departments as d;  -- no condition is applied in this join

-- natural join --> type of join in which we do not provide the condition and it applies join based on same column
-- we do not use this
select e.employeename, e.employeeid, e.departmentid, d.departmentid, d.departmentname from employees as e 
natural join departments as d;   -- in this case it is behaving as inner join

select c.name, c.countrycode, co.name, co.code from city as c 
natural join country as co;   -- in this case since code column as diff names in both the tables therefor it will not give any output

-- self join --> when we join a table by itself
create database selfjoindb;
use selfjoindb;

create table employees(eid int, name varchar(50), mid int);
insert into employees values (1, 'maytri', NULL), (2, 'angad', 1), (3, 'mayuri', 1), (4, 'ayesha', 2);
select * from employees;

select e1.name, e1.eid, e1.mid, e2.name, e2.eid from employees as e1  
join employees as e2 where e1.mid = e2.eid;  -- self join

 use joinsdb2;
 
 -- to find the budget of each department
 select d.dept_name, sum(budget) from projects as p 
 join departments as d ON p.dept_id=d.dept_id
 group by dept_name;
 
 -- to find the department name and total employees working in that department
 select d.dept_name, count(emp_id) from employees as e 
 join departments as d ON e.dept_id=d.dept_id
 group by dept_name;
 
-- where clause and having are used with group by
-- where clause is used to filter data from table but having clause is used for aggregate functions
-- where clause is independant while having is dependant on group by
-- where clause is executed before aggregate functions and that is why it does not filter aggregate functions

