-- datatypes

use newdb2;

-- int datatype

create table test1(rollno int);  -- DDL statement
insert into test1 values(10);    -- DML statement
insert into test1 values('aman');  -- error because aman is not int datatype
select * from test1;

-- tinyint -> 1 byte memory -> 8 bit
-- range -> -128 to 127
-- we can give true and false
create table test2(rollno tinyint);
insert into test2 values(127);  -- in range
insert into test2 values(128);  -- error out of range
insert into test2 values(true); -- will store 1 in the output
select * from test2;

-- unsigned 
-- 0 to 255 range
-- no negative number
create table test3(rollno tinyint unsigned);
insert into test3 values(127);  -- in range
insert into test3 values(256);  -- error out of range
select * from test3;

-- small int -> 2 byte
-- big int -> 8 byte -> 64 bit

-- string datatype

-- char -> fixed size of character(memory block)
-- fixed size of character
-- used only if we know the length of character
-- white spaces are not included -> removes the last spaces not the middle ones
create table test4(gender char(10));  -- fixed for 10 characters
insert into test4 values('M');  -- 1 character but 10 character space occupied
select * from test4;

-- varchar -> no fixed size of characters(no memory block)
-- white spaces are kept -> does not remove the last spaces
create table test5(gender varchar(10));
insert into test5 values('M  ');
select char_length(gender) from test5;

-- constraints -> set of rules that we apply on the column to prevent invalid data entry

-- not null constraint -> restricts null values in the table
create table test6(id int, name varchar(20) not null);
insert into test6 values(1, 'maytri');
insert into test6 values(2, null);  -- gave error -> constraint worked
select * from test6;

-- default constraint -> gives the default value as output if no value is given
create table test7(id int, name varchar(20) default 'regex');
insert into test7 values(1, 'maytri');
insert into test7(id) values(2);  -- regex is printed with 2 id -> constraint worked
select * from test7;

-- unique constraint -> helps so that we do not store any duplicate value for a column
create table test8(id int unique, name varchar(20));
insert into test8 values(1, 'maytri');
insert into test8 values(1, 'maytri');  -- gave error -> constraint worked
insert into test8 values(1, 'angad');   -- gave error -> constraint worked
insert into test8 values(null, 'cherry');  -- null value can be stored
select * from test8;

-- primary key constraint -> unique and not null
-- it is only one in a table but can be a combination of more than one columns
create table test9(id int primary key, name varchar(20));
insert into test9 values(1, 'maytri');
insert into test9 values(1, 'maytri');  -- duplicate key -> gave error
insert into test9 values(null, 'cherry');  -- null value -> gave error
select * from test9;


drop database if exists foreigndb;
create database foreigndb;
use foreigndb;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

-- foreign key constraint -> dusari tabel ki primary key
-- before making foreigen key we should have parent table
-- syntax -> 
/* create table child_table(
column1 data_type,
column2 data_type2,
...
constraint fk_name foreign key(column1) references parent_table (parent column) );
*/
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    constraint customer_id_fk foreign key (customer_id) references customers(customer_id) on delete cascade,
    constraint product_id_fk foreign key (product_id) references products(product_id) on delete cascade
);

-- parent record -> customers and products table
-- child record -> orders table
-- on delete cascade -> we can delete the data from parent table and the child table will be updated automatically
-- on delete set null -> if we delete a data from parent table than in the child table the foriegn key will become null
-- on delete set default -> if we delete a data from parent table than in the child table the foriegn key will give the default value 
-- on delete restrict -> prevents deleting the parent row if the matching child row exists
-- on delete no action -> similar to restrict in mysql

INSERT INTO orders
VALUES
(1,101,1,2);

INSERT INTO orders
VALUES
(2,999,1,1);  -- will not work because of foriegn key constraint(there is no 999 custoner_id in customers table) -> constraint worked
 
INSERT INTO orders
VALUES
(3,101,500,1);  -- will not work because of foriegn key constraint(there is no 500 product_id in products table) -> constraint worked

select * from customers;
select * from orders;
select * from products;


