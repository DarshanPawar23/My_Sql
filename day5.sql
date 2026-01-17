create database day5 ;
use day5 ;
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

-- Write a query to display students whose marks are greater than the average marks of all students.
select * from 
students
where marks >(select avg(marks) from students);

-- Write a query to display students who belong to departments that have more than 1 student.
select * from students
where department in 
(select department 
from students 
group by department
having count(*)>1);


-- Write a query to display student(s) who scored the maximum marks.
select * from 
students
where marks In (select max(marks) from students);

-- Write a query to display students whose marks are less than the average marks of the CSE department.
select * 
from students
where marks < (
  select avg(marks)
  from students
  where department = 'cse'
);


-- Write a query to display:
-- student name
-- marks
-- for students who scored above their own department’s average marks.

SELECT name, marks
FROM students s
WHERE marks > (
  SELECT AVG(marks)
  FROM students
  WHERE department = s.department
);

 

