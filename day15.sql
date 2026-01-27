create database day15;
use day15;

-- Find first login date for each player.
create table Activity(
id int primary key auto_increment,
player_id int ,
event_date date
);
insert into Activity (player_id,event_date)
values
(1,'2026-01-27'),
(1,'2026-02-02'),
(2,'2026-01-11'),
(3,'2026-01-15');

select player_id,min(event_date)
from Activity
group by player_id;

-- Find employees who earn the highest salary.
CREATE TABLE Employee (
  id INT PRIMARY KEY auto_increment,
  name VARCHAR(50),
  salary INT
);
INSERT INTO Employee (name, salary) VALUES
( 'Rahul', 50000),
( 'Anita', 65000),
( 'Darshan', 45000),
( 'Kiran', 70000),
( 'Sneha', 60000);

select * from Employee
where salary = (select max(salary) from Employee);

-- Find employees who earn more than average salary.
CREATE TABLE Employees (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  salary INT NOT NULL,
  department VARCHAR(30)
);
INSERT INTO Employees (name, salary, department) VALUES
('Rahul', 50000, 'IT'),
('Anita', 65000, 'HR'),
('Darshan', 45000, 'IT'),
('Kiran', 70000, 'Finance'),
('Sneha', 60000, 'HR');

select * from 
Employees
where salary >(select avg(salary) from Employees);

-- Find customers who never placed an order.
CREATE TABLE Customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);
CREATE TABLE Orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customerId INT,
  FOREIGN KEY (customerId) REFERENCES Customers(id)
);
INSERT INTO Customers (name) VALUES
('Rahul'),
('Anita'),
('Darshan'),
('Kiran');

INSERT INTO Orders (customerId) VALUES
(1),
(1),
(3);

select * from Customers c
where id not in 
(select customerId from Orders o
where c.id = o.customerId
 );

-- Find all numbers that appear at least 3 times consecutively.
CREATE TABLE Logs (
  id INT AUTO_INCREMENT PRIMARY KEY,
  num INT
);
INSERT INTO Logs (num) VALUES
(1),
(1),
(1),
(2),
(1),
(2),
(2);

SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l2.id = l3.id - 1
WHERE l1.num = l2.num
  AND l2.num = l3.num;





