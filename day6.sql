create database day6;
use day6;

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

-- Write a query to add a new column email of type VARCHAR(50) to the students table.
Alter table students
add column email varchar(50);

-- Write a query to change the datatype of age from INT to SMALLINT.
Alter table students
modify column age smallint;

-- Write a query to add a DEFAULT value of 0 to the marks column.
Alter table students
modify marks int default 0;

-- Write a query to rename the column name to full_name
Alter table students
rename column name to full_name;

-- Write a query to remove the department column from the students table.
Alter table students
drop column department;

-- Write a query to add a CHECK constraint so that marks must be between 0 and 100
alter table students
add constraint  check_marks
check(marks between 0 and 100);