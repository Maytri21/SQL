use world;

-- between operator
select * from country where indepyear BETWEEN 1900 and 1950;

-- in operator 
select * from country where indepyear in(1901,1902,1903);

-- like operator
select * from country where name like "A%";
select * from country where name like "%A";
select * from country where name like "A%N";
select * from country where name like "%A%";
select * from country where name like "A__%";
select * from country where name like "A%_";
select * from country where name like "__d__";

-- get the city and the population where you have the letter E in city name
select name, population from city where name like "%E%";

-- get the city and the population where you have the second last letter B in city name
select name, population from city where name like "%B_";

-- get the city and the population where you have the second letter A and last second letter R in city name
select name, population from city where name like "_A%R_";

-- get the city and the population where you have AA in city name
select name, population from city where name like "%AA%";

-- get the city name and population where the country name have two characters E seperated by a character and should be in the middle
select name, population from city where name like "_%E_E%_";