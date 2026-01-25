create database day13;
use day13;

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

SET SQL_SAFE_UPDATES = 0;
-- Start transaction
-- Increase marks by 10 for ALL students
-- Realize this was wrong
-- Undo everything

start transaction;
update students
set marks = marks + 10;
rollback;

-- 🟢 Q2 – PARTIAL FAILURE (SAVEPOINT)
-- Scenario:
-- Increase marks by 5 for CSE students
-- Create savepoint
-- Increase marks by 20 for MECH students
-- Later realize step 3 was wrong
-- Undo only step 3
-- Keep step 1 changes
-- 👉 Write SQL using SAVEPOINT.

start transaction;
update students
set marks = marks+5
where department="cse";

savepoint sp1;

update students
set marks = marks+20
where department="mech";

rollback to sp1;
commit;

-- Q3 – CONDITION-CHECK SCENARIO
-- Scenario
-- Update marks of student id = 3 by +30
-- If marks become greater than 100, undo
-- Else, make it permanent
 
 update students
 set marks = marks+30
 where id = 3;

 If(select marks from students where id=3)>100 then
 rollback;
 else
 commit;
 end if;
 
-- Q4 – SAFE DELETE WITH VERIFICATION
-- Scenario:
-- Start transaction
-- Delete students with marks < 35
-- Check how many rows were deleted
-- If deleted rows > 2 → undo
-- Else → commit


-- 🟢 Q5 – MULTI-STEP REAL CASE (IMPORTANT)
-- Scenario:
-- Start transaction
-- Increase marks by 5 for CSE
-- Savepoint
-- Delete students with marks < 40
-- Realize delete condition was wrong
-- Undo delete
-- Keep update
-- Commit

START TRANSACTION;
UPDATE students
SET marks = marks + 5
WHERE department = 'cse';
SAVEPOINT sp1;
DELETE FROM students
WHERE marks < 40;
ROLLBACK TO sp1;
COMMIT;
