-- This is a comment in MySQL
create database school1;
-- To create a new database we use the 'create database' command
-- To view all the existing databases in our system , use 'show databases'
show databases;
-- To select the current database in use
use school1;
-- To create a new table in a database

-- Data Types
-- Int / Integer , float,  - 10.7777777, double - 10.77777777777 , char, varchar
-- Creating a table
-- Syntax - create table table_name(column1 datatype, column2 datatype,...)
create table students(student_id int, student_name varchar(30), marks float);
-- To view the table structure
desc students;

-- inserting data into table

insert into students values(101, "Kanishk", 34);

insert into students values(102, "Will Smith", 72);

-- inserting multipe rows in a single line

insert into students values(103, "Sandeep", 88), (104, "Watson", 52), (105, "Pranjal", 92);


-- retrieving data from a table

select * from students;

-- retreiving a single column from the table
select student_name from students;

select student_name, marks from students;

-- retrieving data based on conditions (where keyword)
select * from students where marks>80;

-- records where id is greater than 103
select * from students where student_id>103;

-- giving multiple conditions (using and) (both conditions should be true)
select * from students where student_id>101 and marks>80;

-- giving multiple conditions (using or) (one statement can be true or both can be true)
select * from students where student_id = 101 or student_id = 103;

-- sorting a table based on a column
select * from students order by marks;

-- descending order
select * from students order by marks desc;


-- filtering based on multiple values (list of values)
-- IN 
select * from students where student_id in (101,102,104);

-- 'between' - filter based on a range
select * from students where marks between 30 and 70;

create database sample;

-- removing database from the memory
drop database sample;

use sample;

-- viewing first 3 rows of the table
select * from students limit 3;


-- importing data from a new file
-- Schema -> Database --> Tables --> Select 'Table Data Import Wizard' from the drop down --> select your file

select * from bmi;

select * from bmi limit 5;

select * from bmi order by weight desc limit 5;

-- grouping data using groupby

select BmiClass, count(*) from bmi group by BmiClass;

-- DML (Data Maniulation Language) commands - insert, delete, update
-- DDL (Data Definition Language) commande - alter, create, drop
-- TCl (Transaction Control Language) commands - begin, rollback

-- deleting rows from a table
use school1;

-- 'delete' keyword
delete from students where student_name = "Kanishk";

-- upxdating data in the table

select * from students;

-- change marks of Will Smith to 90
-- Syntax - update table_name set new_value where condition;
update students set marks = 90 where student_name = "Will Smith";

update students set marks = 48 where student_name = "Watson";

select * from students;

-- altering the structure of a table

-- adding a new column to student table
-- Syntax - alter tablw table_name add column column_name datatype;
alter table students add column class char(5);

-- renaming a column
-- Syntax - alter table table_name change old_name new_name datatype;
alter table students change class Standard char(5);

desc students;

-- Removing a column
alter table students drop column Standard;

-- Groupby

select BmiClass, count(*) from bmi group by BmiClass;

-- Use 'having' clause to give conditions to a group by
select BmiClass, count(*) from bmi group by BmiClass having count(*)>80;

-- to find the average weight of each Bmi Class
-- sum
select sum(32 + 40);

select length("Bahubali");

select trim("  Champions_Trophy  "); -- removes the wide space

-- Use ltrim to remove the leading spaces and Use rtrim to remove trailling spaces

select lower("BABURAO");  -- changes the input in lower case

select upper("Raju Rastogi");  -- changes the input in upperr case

select substring("Raju Rastogi",5 ,6);

select round(3.1414, 2);

select abs(-32);

select concat("Gurgaon", "Haryana");

select max(weight) from bmi;

select min(weight) from bmi;

select locate("in", "Sachin");

select replace("Entertainment", "Enter", "Exit");

select curdate();

select now();

select curtime();

select date_add(curdate(), interval 5 day);

select year(curdate());

select extract(YEAR from curdate());

-- alias 'as'

select (50 + 80) as result;

select year(curdate()) as year;

-- Pattern Matching
-- 'like' keyword

select * from students;

select * from students where student_name LIKE 'W%';

select * from students where student_name LIKE '%Smith';

-- '_'
select * from students where student_name LIKE '_______';

select * from students where student_name LIKE '%t%';

select * from students where student_name LIKE 'W%'or student_name LIKE 's%';

-- distinct - to fetch unique values from a column
select distinct BmiClass from bmi;

-- 'not' keyword 
select * from bmi where BmiClass not in ("Overweight", "Underweight");

-- is null

create table expenses(s_no int, item varchar(25), payment_total float);

insert into expenses values(1, "Broom", 100), (2, "Water", null), (3, "Desk", 2000), (4, null, 5000);

select * from expenses;

select * from expenses where item is null;
select * from expenses where payment_total is not null;

-- primary key - a column that uniquely identifies each record in a table
use school;

show tables;
use school1;
show tables;

create table employees(e_id char(5) , e_name varchar(30) , salary float, dept_id int , primary key (e_id));

desc employees;

insert into employees(e_name, salary, dept_id) values("Ishan", 40000, 3);

-- constraints 

create table products(p_id int unique, p_name varchar(30) not null, price float default 100);

insert into products values(101, "Jadoo", 2000);
insert into products values(102, "Broom", 80);

insert into products(p_id, price) values(103, 10000); 

insert into products(p_id, p_name) values(104, "IPhone");

drop table retail_store_sales;

select * from retail_sales_dataset;

-- Q. What is the average age of our stores' customers?
-- Q. What is the total sales in each Product Category?
-- Q. Which customer has bought the most amount of products from our store?
-- Q. What is the average Price per Unit for each Product Category?
-- Q. Convert the data column to date datatype.

desc retail_sales_dataset;

select * from retail_sales_dataset limit 5;

-- Q1
select round(avg(Age),0) as Average_Age from retail_sales_dataset;

-- Q2
select `Product Category` , sum(`Total Amount`) from retail_sales_dataset group by `Product Category`;

use school1;

-- Q3
select `Customer ID`, sum(`Total Amount`) as Amount from retail_sales_dataset group by `Customer ID` order by Amount desc limit 1;

-- Q4
select `Product Category`, avg(`Price per Unit`) as `Avg Price` from retail_sales_dataset group by `Product Category`;

-- Q5
alter table retail_sales_dataset modify `Date` Date; 
desc retail_sales_dataset;

select avg(`Total Amount`) from retail_sales_dataset;

-- display all those records where Total Amount is greater than average Total Amount

select * from retail_sales_dataset where `Total Amount` > (select avg(`Total Amount`) from retail_sales_dataset);

create table new_department(dept_id int, dept_name varchar(30), emp_id int, emp_name varchar(30), emp_salary float);

insert into new_department values(1, "Sales", 101, "Ram", 15000), (1,"Sales", 102, "Shyam",25000),
(2, "Marketing",103,"Ramesh",20000), (2, "Marketing", 104, "Suresh",18000), (1, "Sales",  105, "Mahesh", 22000),
(3,"Finance", 106, "Manish", 15000),(3, "Finance",107,"Mahinder", 35000), (3, "Finance" ,108, "Sunil",70000);

select * from new_department;

select dept_name, emp_id, emp_name, emp_salary, avg(emp_salary) OVER (partition by dept_name) from new_department;

select dept_name, emp_id, emp_name, emp_salary, rank() OVER (partition by dept_name ORDER BY emp_salary DESC) from new_department;

select dept_name, emp_id, emp_name, emp_salary, dense_rank() OVER (partition by dept_name ORDER BY emp_salary DESC) from new_department;
drop database OrderAnalytics;


/* In the following MySQL project, I will be analyzing the data of a business organization which ships
products across multiple product categories all over United States of America. The goal of this product is to gain
meaningful insights from raw data and suggest practical and executable meausres for further decision making
*/
-- Creating a new database named 'OrderAnalytics'
create database order_analytics;
use order_analytics;
-- Importing data (csv file) using Table Data Import Wizard
show tables;

-- structure of the imported dataset
desc `orders data`;

-- first 10 rows of the data
select * from `orders data` limit 10;


select count(*) from `orders data` where `Order ID` is null; -- 0, no missing orderid

-- Q1 Who aree the to 10 highest valued customers for our company?
select `Customer ID`, `Customer Name`,sum(Sales) from `orders data` group by `Customer ID`, `Customer Name` order by sum(sales) desc limit 10;

-- Q2 What is the most preffered shipping mode used by the customers?
select `Ship Mode`, count(Sales) from `orders data` group by `Ship Mode` order by count(Sales) desc limit 1;

-- Q3 Give the most successful product Category for each consumer segment.
WITH Category_Segment AS (select Segment, Category, sum(Sales) as Amt,rank() OVER  -- badi si query means CTE Common Table Expressions
(PARTITION BY Segment ORDER BY sum(Sales) DESC)as rnk from `orders data` group by Segment, Category)
select Segment, Category, Amt from Category_Segment where rnk = 1;

-- view --> a virtual table which is the subset of the original table.alter
create view abc as select `Price per Unit`, `Total Amount` from retail_sales_dataset;


-- deleting a view
drop view abc;

show index from retail_sales_dataset;

show index from employees;

create index new_index on employees(e_name);

show index from employees;

-- to delete the index from table
drop index new_index on employees;

-- dataset - create/drop, table - create/drop/insert/decs/update/alter - drop/add/modify/change, select
-- select - where --> IN, Between, and, or, Not in, is null, is not null, LIKE, alias - as
-- order by (desc), group by - having, join - left, right, inner, outer, cross.
-- constraints - primary key, foreign key, unique, not null, default, auto-increment, check (condition)
-- functions, SUBQUERIES, WINDOW FUNCTIONS -- RANK, DENSE_RANK, AVERAGE, ETC.
-- VIEW, INDEX, CTE- with














