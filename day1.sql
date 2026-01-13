create database day1;
use day1;

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

-- Write a query to display all columns from the students table.
Select * from students;

-- Write a query to display only name and department of all students.
select name,department from students;

-- Write a query to display all students whose age is greater than 20.
SELECT * 
FROM students
WHERE age > 20;

-- Write a query to display students who belong to the "CSE" department.
select *
from students
where department = "cse";

-- Write a query to display all students ordered by marks in descending order (highest first).
select * from students
order by marks desc;


