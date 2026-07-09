lab6 -2

CREATE DATABASE CompanyDB;

USE CompanyDB;

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50)
);

INSERT INTO Departments (DeptName)
VALUES
('HR'),
('IT'),
('Finance');

select * from Departments;

INSERT INTO Employees (FullName, Department, Salary)
VALUES
('Alice Johnson', 'HR', 50000),
('Bob Smith', 'IT', 70000),
('Charlie Brown', 'Finance', 65000),
('David Lee', 'IT', 75000);

SELECT * FROM Employees;
SELECT * FROM Departments;

CREATE USER 'admin1'@'localhost'
IDENTIFIED BY 'Admin123';

CREATE USER 'manager1'@'localhost'
IDENTIFIED BY 'Manager123';

CREATE USER 'employee1'@'localhost'
IDENTIFIED BY 'Employee123';

CREATE role 'AdminRole';
CREATE ROLE 'ManagerRole';
CREATE ROLE 'EmployeeRole';

-- Admin can do everything
GRANT ALL PRIVILEGES
ON CompanyDB.*
TO 'AdminRole';

-- Manager can read and modify
GRANT SELECT, INSERT, UPDATE
ON CompanyDB.*
TO 'ManagerRole';

-- Employee can only read
GRANT SELECT
ON CompanyDB.*
TO 'EmployeeRole';

GRANT 'AdminRole'
TO 'admin1'@'localhost';

GRANT 'ManagerRole'
TO 'manager1'@'localhost';

GRANT 'EmployeeRole'
TO 'employee1'@'localhost';




SET DEFAULT ROLE 'AdminRole'
TO 'admin1'@'localhost';

SET DEFAULT ROLE 'ManagerRole'
TO 'manager1'@'localhost';

SET DEFAULT ROLE 'EmployeeRole'
TO 'employee1'@'localhost';

SHOW GRANTS FOR 'admin1'@'localhost';

SHOW GRANTS FOR 'manager1'@'localhost';

SHOW GRANTS FOR 'employee1'@'localhost';

GRANT DELETE
ON CompanyDB.Employees
TO 'manager1'@'localhost';

REVOKE DELETE
ON CompanyDB.Employees
FROM 'manager1'@'localhost';

REVOKE 'EmployeeRole'
FROM 'employee1'@'localhost';

DROP ROLE 'EmployeeRole';

DROP USER 'employee1'@'localhost';

FLUSH PRIVILEGES;

CREATE VIEW EmployeeView AS
SELECT EmpID, FullName, Department
FROM Employees;

GRANT SELECT
ON CompanyDB.EmployeeView
TO 'manager1'@'localhost';

REVOKE SELECT
ON CompanyDB.EmployeeView
FROM 'manager1'@'localhost';

DROP VIEW EmployeeView;

