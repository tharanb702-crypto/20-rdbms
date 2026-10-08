-- Question 20:
-- Create a trigger that automatically displays a message
-- after inserting a new employee record into the Employee table.

SET SERVEROUTPUT ON;

CREATE TABLE Employee (
    EmployeeID NUMBER(5) PRIMARY KEY,
    EmployeeName VARCHAR2(20) NOT NULL,
    Department VARCHAR2(20),
    Salary NUMBER(10,2)
);

-- Write your trigger below.
