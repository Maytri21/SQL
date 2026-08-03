use world;

-- multirow subquery -> inner query returns multiple rows and one column
-- multi row and multi column subquery -> inner query returns multiple rows and multiple column
-- =,>,< is not applied in multi row
-- in, any, all operators are used in this query

use corr_db;

select * from employee_c where salary in (select salary from employee_c where name = 'a' or name = 'b');   -- in operator

select * from employee_c where salary >all (select salary from employee_c where name ='a' or name = 'b');  -- >all operator -> dono conditions se bada

select * from employee_c where salary <all (select salary from employee_c where name ='a' or name = 'b');  -- <all operator -> dono conditions se chota

select * from employee_c where salary >any (select salary from employee_c where name ='a' or name = 'b');  -- >any operator -> dono conditions mai se ek se bada

select * from employee_c where salary <any (select salary from employee_c where name ='a' or name = 'b');  -- <any operator -> dono conditions mai se ek se chota

