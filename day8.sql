create database day8;
use day8;
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

alter table students
add column email varchar(50);

-- Create an index on the full_name column.
create index ind_name on students(name);

-- Create a unique index on the email column.
create unique index ind_email on students(email);

-- Create a composite index on (department, marks).
create index ind_composite on students(department,marks);

-- Write a query to view all indexes on the students table.
show indexes from students;

-- Drop the index created on full_name.
drop index ind_name on students;
