use world;

-- suquery -> a query within a query -> nested query
-- types: single row, multi row, multi row and multi column, correlated 

-- single row subquery -> inner query returns only one row and one column

create database corr_db;
use corr_db;
create table employee_c(id int, name varchar(20), salary int);
insert into employee_c values(1,'a',100),(2,'b',250),(3,'c',400),(4,'d',380);

-- highest salary kya hai
select max(salary) from employee_c;
select * from employee_c where salary=400;

-- minimum salary kya hai
select min(salary) from employee_c;
select * from employee_c where salary=100;

-- nested query -> outter query(inner query) -> first inner query will run tan outter query will run
select * from employee_c where salary=(select min(salary) from employee_c);  -- min salary
select * from employee_c where salary=(select max(salary) from employee_c);  -- max salary

insert into employee_c value(5,'aman', 250);
select * from employee_c where salary=(select salary from employee_c where name ='b');

select name,id from employee_c where salary>(select avg(salary) from employee_c);

select * from city;

-- get the name of the city where the district of the city is same for the city abudabi
select name from city where district=(select district from city where name='abu dhabi');

-- get all the columns from city table were population is max
select * from city where population=(select max(population) from city);

-- get the district and name of the city where the country code is same for herat
select district, name from city where countrycode=(select countrycode from city where district='herat');

-- get the district ,city and population for all the countries of amsterdam and sort by population
select district, name, population from city where countrycode=(select countrycode from city where name='amsterdam') order by population;

