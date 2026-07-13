create database moviesdb;     -- creating the database      DDL
use moviesdb;    -- using the database
create table deepika(filmname varchar(30), amount int, director varchar(30));    -- creating a table
describe deepika;   -- to know the structure of the table
insert into deepika values('kalki', 100000, 'Karan Johar');   -- to insert the data      DML
select * from deepika;   -- to know the content of the table      DQL
show databases;
use world;
describe country;   -- table mai konse columns hai aur unke data type kya hai
select * from country;
select name, continent from country;
select name, population, population+50 from country;     -- does not change the original data 
select name, population, population+50 as newpopulation from country;     -- to change te name of new or existing columns just for the output not the original table
select * from country where continent='Asia';      -- select selected rows which satisfy the where condition
select name, continent, population from country where name='India';      -- select selected rows and columns which satisfy the where condition
select * from country where continent='Europe' and indepyear>1900;       -- both conditions should satisfy
select * from country where continent='Europe' or indepyear>1900;        -- any one condition should be true

-- get the country code and name where the surface area of the country is greater than 1900
select code, name from country where surfacearea>1900;

-- get the country code and name only for countries where the region is sourthern europe
select code, name from country where region="Southern Europe";

-- get the country code and name where the country belong to affrica and region is central affrica
select code, name from country where continent="Africa" and region="Central Africa";

-- get the country name, continent and population where they belong to asia or affrica
select name, continent, population from country where continent="asia" or continent="africa";

-- get the name, population and region with the 10% increment in the population for the countries whose indepyear is after 1950
select name, population, population+population*0.1 as newpopulation from country where indepyear>1950;

-- get all the values of country where te country name and local name is same
select * from country where name=localname;
