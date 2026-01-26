create database day14;
use day14;

create table students(
id int primary key auto_increment,
name varchar(25),
department enum("cse","mech","civil","eee") not null,
marks int not null
);
insert into students (name,department,marks)values
("darshan","cse",80),
('Dheeraj','mech',29),
('Ram','civil',100),
('Sham','cse',100),
('Hanuman','cse',100);

-- Get all students who:
-- belong to CSE
-- OR belong to MECH
-- 👉 Use UNION (not OR).
select * from students
where department = "cse"
union
select * from students
where department = "mech";

-- Get all students who:
-- scored above 90
-- OR are from EEE department
-- 👉 Use UNION.
select * from students
where marks >90
union
select * from students
where department ="eee";

-- 🟡 Q3 (UNION vs UNION ALL)
-- Get all student names from:
-- students
-- alumni
-- Allow duplicates.
-- 👉 Which UNION should you use and why?

-- --> I'll use "unoion"

-- Q4 (Interview Trap)
-- Why does this query fail?

-- --> cant combine a because marks columm extra used for union

-- Q5 (Interview Level)
-- Get unique departments from:
-- students table
-- teachers table
select department from students
union
select department from teachers;

