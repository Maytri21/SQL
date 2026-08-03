use world;

-- ifnull ->  replaces the null values with the value given
select name, indepyear, ifnull(indepyear,0) from country;

-- coalesce -> returns the first not null value
select name, indepyear, lifeexpectancy, coalesce(indepyear, lifeexpectancy, name) from country;

-- case statement -> used for multiple cases or conditions
select name, population, indepyear, 
case
when indepyear>1947 then 'after 1947'
when indepyear>1919 then 'only after 1919'
else 'else condition'
end 
as 'case statement'
from country;

-- if statement -> we do not use this we use case statement
-- works the same way if-else works in python and we can use elif also
select name, population, indepyear, 
if(indepyear>1947, 'after india','before india') 
from country;

-- with elif
select name, population, indepyear, 
if(indepyear>1947, 'after india', 
if(indepyear>1920, 'just before india', 'before india')) 
from country;

-- print the continent name and no. of countries wit the category of the continent column
select * from country;
select  continent, count(name), 
case
when count(name)<10 then 'small continent'
when count(name) between 10 and 15 then 'average continent'
else 'large continent'
end as 'case statement'
from country
group by continent;
