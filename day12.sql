create database day12;
use day12;

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

-- Start a transaction,
-- increase marks by 10 for CSE students,
-- then undo the change.
SET SQL_SAFE_UPDATES = 0;

start transaction;
update students
set marks = marks+10
where department="cse";
rollback;
select * from students;

-- Start a transaction,
-- update marks to 95 for student id = 1,
-- and make the change permanent.
start transaction;
update students
set marks =95
where id=1;
commit;

-- 🟢 Q3 – SAVEPOINT (PARTIAL UNDO)

START TRANSACTION;

UPDATE students
SET marks = marks + 5;

SAVEPOINT sp1;

UPDATE students
SET marks = marks - 20
WHERE department = 'mech';

ROLLBACK TO sp1;

COMMIT;

-- 🟢 Q4 – CONDITION-BASED ROLLBACK

START TRANSACTION;

UPDATE students
SET marks = marks + 30
WHERE id = 1;

-- If marks exceed 100, rollback else commit
SELECT 
CASE 
  WHEN marks > 100 THEN 'ROLLBACK'
  ELSE 'COMMIT'
END
FROM students
WHERE id = 1;

ROLLBACK;


-- 🟢 Q5 – SAFE DELETE

START TRANSACTION;

DELETE FROM students
WHERE marks < 40;

ROLLBACK;




