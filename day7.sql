create database day7;
use day7;
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

SET SQL_SAFE_UPDATES = 0;
-- Write a query to update marks to 95 for the student whose name is 'Darshan'.
update  students
set marks =95
where id = 1;

-- Write a query to increase marks by 5 for all students whose marks are less than 90.
update students 
set marks = marks +5
where marks <90;

-- Write a query to set age = 21 for students:
-- from CSE department
-- whose marks are greater than 90
update students
set age = 21
where department ='cse' and marks >90;

-- Write a query to delete students whose marks are less than 40.
delete from students
where marks <40;

-- Write a query to delete students who belong to the department having the lowest average marks.
delete from students 
where department in 
(select department
 from(
  select department from students
  group by department
  having avg(marks) = (
     SELECT MIN(avg_marks)
      FROM (
        SELECT AVG(marks) AS avg_marks
        FROM students
        GROUP BY department
      ) t
  ) 
 ) d
);

-- Update marks to 100
-- for students who already have the maximum marks in the table
update students
set marks = 100
where marks>= (select max(marks)from (select max(marks) from students) d);
