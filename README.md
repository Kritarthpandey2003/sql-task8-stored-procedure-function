# SQL Task 8 - Stored Procedures & Functions

## Objective
Learn to modularize SQL logic using **Stored Procedures** and **Functions**, and understand their usage in MySQL.

---

##  Tools Used
- MySQL Workbench
- MySQL Server

---

##  Deliverables
 Stored Procedure: `GetEmployeesByMinSalary`  
 Function: `GetBonus`

---

##  Description
In this task, we:
- Created a database named `task8`.
- Created an `employees` table with sample data.
- Wrote and tested a **Stored Procedure** to fetch employees with a salary above a given minimum.
- Wrote and tested a **Function** to calculate a bonus (10% of salary) for each employee.
- Verified everything using `CALL` and `SELECT` statements.

---

##  SQL Script
You can find the full SQL script in this repository:  
[`task8.sql`](./task8.sql)

---

##  Usage

### 1️ Create the database and table
```sql
CREATE DATABASE IF NOT EXISTS task8;
USE task8;

CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (emp_name, salary) VALUES 
('Alice', 50000),
('Bob', 60000),
('Charlie', 70000);
SELECT * FROM employees;

### 2 Stored Procedure
DELIMITER //

CREATE PROCEDURE GetEmployeesByMinSalary(IN min_salary DECIMAL(10,2))
BEGIN
    SELECT * FROM employees WHERE salary >= min_salary;
END //

DELIMITER ;

CALL GetEmployeesByMinSalary(55000);

### 3 Function
DELIMITER //

CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;

SELECT emp_name, salary, GetBonus(salary) AS bonus FROM employees;


