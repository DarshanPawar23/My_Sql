create database day10;
use day10;

create table students(
id int primary key,
name varchar(50),
department enum('cse','eee','ec','mech'),
marks int 
);
alter table students
modify column id int auto_increment;

create table departments(
id int primary key,
department enum ('cse','ec','mech')
);
alter table departments
modify column id int auto_increment;

Insert into students (name,department,marks)
values
('Darshan','ec',99),
('Dheeraj','mech',89),
('Ram','ec',100),
('Sham','cse',100),
('Hanuman','eee',100);

insert into departments
(department) values
('cse'),
('ec'),
('mech');

-- Find the average marks of each department,
-- but show only departments whose average marks > 80.
-- 👉 (GROUP BY + HAVING)
select department,avg(marks) 
from students
group by department
having avg(marks) >80;


-- department name
-- total number of students
-- Include departments with zero students.
-- 👉 (LEFT JOIN + COUNT)

SELECT 
  d.department,
  COUNT(s.name) AS total_students
FROM departments d
LEFT JOIN students s
  ON d.department = s.department
GROUP BY d.department;

-- Find students who scored more than the overall average marks.
select * from 
students 
where marks >(select avg(marks) from students);

-- Find students who scored more than their department’s average marks.
select * from 
students s
where marks > (select avg(students.marks) from students where department =s.department);

-- Increase marks by 10 for students who scored below the average marks.
SET SQL_SAFE_UPDATES = 0;

update students
set marks = marks+10
where marks <(select avg(marks) from (select marks from students) d);

