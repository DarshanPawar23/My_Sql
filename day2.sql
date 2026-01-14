create database day2;
use day2;
create table students(
id int primary key auto_increment,
name varchar(25),
age int,
department enum("cse","mech","civil","eee") not null,
marks int not null
);
Insert into students (name,age,department,marks)
values
('Darshan',12,'cse',99),
('Dheeraj',25,'mech',89),
('Ram',100,'civil',100),
('Sham',100,'cse',100),
('Hanuman',1000,'cse',100);

insert into students(name,age,department,marks)
values
("raju",35,"civil",35);

-- Write a query to display students whose age is greater than 18 AND marks are greater than 90.
select*from students
where age>18 and marks>90;

-- Write a query to display students who belong to either the cse OR mech department.
select * from students
where department="cse" or department="mech";

-- Write a query to display students whose marks are between 80 and 100 (inclusive).
select * from students
where marks between 80 and 100;

-- Write a query to display students whose age is IN (18, 25, 30, 100).
select * from students
where age In (18,25,30,100);

-- Write a query to display students whose name starts with the letter D.
select * from students
where name like 'D%' ;

-- Write a query to display:
-- students from cse department
-- whose name contains the letter a
-- and marks ≥ 90

select * from students
where department ="cse" and
name like '%a%' and
marks>90 ;