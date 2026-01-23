create database day11;
use day11;

create table department(
id int primary key auto_increment,
dep_name varchar(5)
);

create table student(
id int primary key auto_increment,
name varchar(50),
dept_id int,
marks int,
foreign key (dept_id) references department(id)
);

insert into department(dep_name) values
('cse'),
('mech'),
('eee'),
('civil');

Insert into student(name,dept_id,marks)
values
('Darshan',1,39),
('Dheeraj',2,89),
('Ram',3,100),
('Sham',1,100),
('Hanuman',2,100);

-- Find the department(s) where:
-- the average marks are greater than the overall average marks of all students.
-- 👉 Uses: GROUP BY + HAVING + subquery
SELECT student.dept_id, department.dep_name
FROM student, department
WHERE student.dept_id = department.id
group by student.dept_id
having avg(marks) > (select avg(marks) from student);

-- Display:
-- department name
-- highest marks scored in that department
-- Include only departments having at least 1 student.
select d.dep_name , max(s.marks)
from department d
left join  student s on d.id = s.dept_id
group by d.dep_name
having count(s.name)>=1;

-- Find students who did NOT score the highest marks in their department.
-- 👉 Uses: subquery
-- (hint: compare with department-wise max)
SELECT *
FROM student s
WHERE s.marks < (
    SELECT MAX(s2.marks)
    FROM student s2
    WHERE s2.dept_id = s.dept_id
);

-- Increase marks by 5 for students who:
-- are in departments whose average marks < 70
UPDATE student s
SET s.marks = s.marks + 5
WHERE (
    SELECT AVG(s2.marks)
    FROM student s2
    WHERE s2.dept_id = s.dept_id
) < 70;

-- Delete students who:
-- scored below their department’s average marks
 delete from student s
 where s.marks < (select avg(s1.marks) from  student s1 where s1.dept_id =s.dept_id);
  
  

