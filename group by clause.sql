use world;

-- count function does not count null values or missing values
-- group by clause --> used for collection of same values --> we can not use select * with group by

select distinct(continent), count(name) from country;  -- can not give total number of rows with distinct basically can not use any aggregate function with distinct
select count(name) from country where continent = "asia";  -- it is double the work because for every continent we have to change the query

select continent , count(name) from country group by continent;  -- we can use aggregate functions with group by and is less work because everything is covered in one query

select name, count(name) from country group by name;
select countrycode, count(name), sum(population) from city group by countrycode;
select countrycode,count(name) from city where countrycode="afg";

-- count the number of countries which have the life expectancy from 70.1 to 83.5
select count(name) from country where lifeexpectancy>=70.1 and lifeexpectancy<=83.5;

-- get the total population of the country who got their indepandance after 1990
select sum(population) from country where indepyear>1990;

-- count the number of countries which are not slaved by any community
select count(name) from country where indepyear is null;
select count(name)-count(indepyear) from country;

-- get the total countries and the total surface area for each region
select region, count(name), sum(surfacearea) from country group by region;

-- get the total countries in each continent
select continent, count(name) from country group by continent;

-- get the total country for each region and each continent
select continent, region, count(name) from country group by continent, region;