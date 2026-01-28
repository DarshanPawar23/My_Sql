create database day16;
use day16;

-- Table: Person(id, email)
-- Find all duplicate emails.
-- 👉 Output only the email.

CREATE TABLE Person (
  id INT,
  email VARCHAR(255)
);
INSERT INTO Person (id, email) VALUES
(1, 'a@leetcode.com'),
(2, 'b@leetcode.com'),
(3, 'a@leetcode.com'),
(4, 'c@leetcode.com'),
(5, 'b@leetcode.com');

select p1.email as e
from
Person P1
join Person P2
on
P1.email = P2.email
and
p1.id != p2.id
group by p1.email;

-- Tables:
-- Customers(id, name)
-- Orders(id, customerId)
-- Find customers who never placed any order.

CREATE TABLE Customers (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);

CREATE TABLE Orders (
  id INT PRIMARY KEY,
  customerId INT
);

INSERT INTO Customers (id, name) VALUES
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

INSERT INTO Orders (id, customerId) VALUES
(1, 3),
(2, 1);

select * from
Customers c
where c.id not in (select customerId from Orders);

-- Q3 (LeetCode MEDIUM – Second highest salary)
-- Table: Employee(id, salary)
-- Find the second highest salary.
-- ⚠️ If no second highest exists → return NULL.
-- 👉 Do NOT use LIMIT 1,1.

CREATE TABLE Employee (
  id INT PRIMARY KEY,
  salary INT
);
INSERT INTO Employee (id, salary) VALUES
(1, 100),
(2, 200),
(3, 300);

select max(salary) from Employee
where salary<(select max(salary) from Employee);

-- Q4 (LeetCode MEDIUM – Highest salary in each department)
-- Tables:
-- Employee(id, name, salary, departmentId)
-- Department(id, name)
-- Find employees who have the highest salary in each department.

CREATE TABLE Department (
  id INT PRIMARY KEY,
  name VARCHAR(100)
);
CREATE TABLE Employees (
  id INT PRIMARY KEY,
  name VARCHAR(100),
  salary INT,
  departmentId INT
);

INSERT INTO Department (id, name) VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

INSERT INTO Employees (id, name, salary, departmentId) VALUES
(1, 'Alice', 70000, 1),
(2, 'Bob', 80000, 1),
(3, 'Charlie', 60000, 2),
(4, 'David', 90000, 1),
(5, 'Eva', 75000, 3);

SELECT d.name AS Department, e.name AS Employee, e.salary
FROM Employees e
JOIN Department d ON e.departmentId = d.id
WHERE (e.departmentId, e.salary) IN (
  SELECT departmentId, MAX(salary)
  FROM Employees
  GROUP BY departmentId
);









