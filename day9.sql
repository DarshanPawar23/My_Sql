create database day9;
use day9;

-- Q1 - PRIMARY KEY + NOT NULL + UNIQUE
-- Create a table users with:
-- user_id → PRIMARY KEY
-- name → NOT NULL
-- email → UNIQUE
create table users(
user_id int primary key,
name varchar(50) not null,
email varchar(50) not null
);

-- 🟢 Q2 – DEFAULT + CHECK
-- Create a table results with:
-- id → PRIMARY KEY
-- marks → DEFAULT 0
-- marks must be between 0 and 100

 create table results(
 id int primary key,
 marks int default 0,
check(marks between 0 and 100)
 );
 
--  Create two tables:
-- department(id, dept_name)
-- students(id, name, department_id)
-- Add a foreign key so students.department_id references department.id.

create table department(
id int primary key,
dept_name enum('cse','mech','eee')
);
create table students(
id int primary key,
name varchar(50),
department_id int unique,
FOREIGN KEY (department_id)
REFERENCES department(id)
ON DELETE CASCADE  
-- ON DELETE SET NULL
);