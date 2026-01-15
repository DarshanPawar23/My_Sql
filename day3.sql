create database day3;
use day3;
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

-- Write a query to display all students whose marks are greater than 75.
select * from students
where marks > 75;

-- Display name and department of students who belong to
-- CSE or EEE.
select name , department 
from students
where department in ('cse' , 'eee');

-- Write a query to find total number of students in the table.
select count(*) as total from students;

-- Write a query to find number of students in each department.
select count(*),department from students
group by department;

-- Write a query to find the average marks of students in each department.
select  department , avg(marks) as avg_marks  
from students
group by department;

-- Write a query to display departments whose average marks are greater than 90.
select  department , avg(marks) as avg_marks  
from students
group by department
having avg(marks) >90;


-- Write a query to find:
-- maximum marks
-- minimum marks
-- from the students table.

select max(marks) as highest_marks , min(marks) as lowest_marks,department 
from students
group by department;

-- Write a query to display:
-- department name
-- total students
-- average marks
-- Only for departments having more than 2 students.
 
  select 
  count(*) as total_stud, 
  avg(marks) as avg_marks,
  department 
  from students
  group by department
  having count(*) >2;
  