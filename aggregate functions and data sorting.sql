use world;

-- multi row functions
-- it collaps te number of rows in a column

select distinct(continent) from country;  -- give distinct values from a column

select count(continent) from country;   -- count the number of rows in a column

select count(distinct(continent)) from country;   -- count the number of distict rows in a column

-- aggregate functions are the functions which are used to apply calculations on a set of rows
-- eg.: max,min,count

select count(population), sum(population), avg(population) from country;
select count(surfacearea), sum(surfacearea), max(surfacearea), min(surfacearea) from country;
select count(continent), max(continent), min(continent) from country;  -- when we apply max,min on string than it will give the value depending on the order of alphabet

select population, count(population) from country;  -- we can not write aggregate and non-aggregate function in the same query
-- non-aggregate functions are normal column name such as continent and population

select population, replace(population,1,4) from country;
select avg(population), avg(replace(population,1,4)) from country;
select population, replace(population,0,'') from country;
select avg(population), avg(replace(population,0,'')) from country;

-- data sorting(order by clause)
select name, continent, region, population from country order by name; 
select name, continent, region, population from country order by name desc; 
select name, continent, region, population from country order by population; 
select name, continent, region, population from country order by population,name; 
select name, continent, region, population from country order by region, population desc; -- region is sorted in ascending order and population is sorted in descending order
