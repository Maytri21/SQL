use world;

-- numeric functions
select lifeexpectancy, round(lifeexpectancy) from country;  -- round off the decimal values
select 76.469, round(76.469,1),round(76.469,2); -- 1 and 2 are giving the base of the decimal

-- round off to nearest 10s,100s and 1000s
select round(9.2,-1);  -- -1 round offs the nearest 10 
select round(13.2,-1);
select round(54.2,-2);  -- -2 round offs the nearest 100
select round(44.2,-2);
select round(501.2,-3);  -- -3 round offs the nearest 1000

-- truncate function
select truncate(334.678,1); -- this function does not round off it just extracts the value
select round(334.678,1), truncate(334.678,1);

-- floor function
select floor(34.9999999);  -- converts the number to lower inteager

-- ceil function
select ceil(34.9999999);  -- converts the number to upper inteager

-- abs function
select abs(10.1111), abs(-10.11111);  -- abs means absolute value and it always gives positive value

