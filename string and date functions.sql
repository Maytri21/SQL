use world;

-- functions are a block of code used to perform a certain task

-- concat function
select name, continent, concat(name,continent) from country;  -- concat does not have any seperator such as space
select name, continent, concat_ws("_",name,continent) from country;  -- concat_ws(with space) does have a seperator 

-- upper case
select name, continent, upper(name) from country;

-- trim function --> removes spaces or characters from a given string
select trim('x' from 'xxxhelloxxx');

-- replace function
select replace('i like java', 'java', 'python');  -- replaces java with python in i like java line

-- length function --> gives total number of bytes
-- char_length --> gives total number of characters
select length("database1"), char_length("database1");

-- substr function
select name, substr(name,2) from country; -- it will start from the number of character given
select name, substr(name,2,4) from country;  -- 2nd is the starting number and 4th is the number of characters
select name, substr(name,-4,2) from country;

-- lpad function
select name, lpad(name,6,"-") from country;  -- this means that every country name should have 6 letters an if not than it will add hyphen to make it 6

-- date and time(YYYY-MM-DD)
select current_date(), current_time(), current_timestamp(), now();
select now(), adddate(now(),2), adddate(now(), -1), adddate(now(), interval 1 month), adddate(now(), interval 1 year);   -- add date function add/sub the number of days/months/weeks/year to the date given

-- extraction of date/month/year
select now(), year(now()), month(now());
select now(), extract(month from now()), extract(minute from now()), extract(day from now());
select now(), weekday(now());

-- date_format function
select now(), date_format(now(), '%m');  -- gives the number of month
select now(), date_format(now(), '%M');  -- gives name of month
select now(), date_format(now(), '%Y');  -- gives the whole year as 2026
select now(), date_format(now(), '%y');  -- gives the number of year as 26
select now(), date_format(now(), '%W');  -- gives the name of the week
select now(), date_format(now(), '%w');  -- gives the number of the week day

