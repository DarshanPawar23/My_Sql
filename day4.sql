create database day4;
use day4;
create table department(
id int primary key auto_increment,
dept_name enum('cse','eee','mech')
);
create table students(
id int primary key auto_increment,
name varchar(25),
department_id int unique
);
alter table students modify department_id int;
insert into department (dept_name)
values
('cse'),
('mech'),
('eee'),
('cse');

insert into students(name,department_id)
values
('darshan',1),
('dheeraj',2),
('ranbir',4),
('kartik',8);

-- Write a query to display:
-- student name
-- department name

select students.name , department.dept_name
from students
Inner join department on department.id = students.department_id;

-- Write a query to display:
-- student name
-- department name
-- only for students belonging to the CSE department.

select students.name , department.dept_name
from students
Inner join department on department.id = students.department_id
where department.dept_name='cse';

-- Write a query to display:
-- student name
-- department name
-- Include all students, even if they do not have a department assigned.

select students.name , department.dept_name
from students
left join department on department.id = students.department_id;

-- Write a query to display:
-- student name
-- department name
-- Include all departments, even if no student is assigned.

select students.name , department.dept_name
from students
right join department on department.id = students.department_id;

-- Write a query to find:
-- department name
-- total number of students in each department

select count(students.name ) as count_stud, department.dept_name 
from students
Inner join department on department.id = students.department_id
group by department.dept_name;

-- Write a query to display:
-- department name
-- number of students
-- Only for departments having more than 1 student.

select count(students.name ) as count_stud, department.dept_name 
from students
Inner join department on department.id = students.department_id
group by department.dept_name
having count(students.name) >1;