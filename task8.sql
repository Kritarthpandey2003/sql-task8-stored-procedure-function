use TASK8;
DROP TABLE IF EXISTS employees;
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
DROP PROCEDURE IF EXISTS GetEmployeesByMinSalary;
DELIMITER //

CREATE PROCEDURE GetEmployeesByMinSalary(IN min_salary DECIMAL(10,2))
BEGIN
    SELECT * FROM employees WHERE salary >= min_salary;
END //

DELIMITER ;
CALL GetEmployeesByMinSalary(55000);
DROP FUNCTION IF EXISTS GetBonus;
DELIMITER //

CREATE FUNCTION GetBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;
SELECT emp_name, salary, GetBonus(salary) AS bonus
FROM employees;
SHOW PROCEDURE STATUS WHERE Db = 'task8';
SHOW FUNCTION STATUS WHERE Db = 'task8';
