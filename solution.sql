create database employeeDB;
USE employeeDB;
DROP TRIGGER IF EXISTS trg_after_employee_insert ON Employee;
DROP FUNCTION IF EXISTS notify_employee_insert();
DROP TABLE IF EXISTS Employee;

CREATE TABLE Employee (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    hire_date DATE DEFAULT CURRENT_DATE
);

CREATE OR REPLACE FUNCTION notify_employee_insert()
RETURNS TRIGGER AS $$
BEGIN

    RAISE NOTICE 'Success: New employee record created for % % (Department: %)', 
        NEW.first_name, 
        NEW.last_name, 
        NEW.department;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
EXECUTE FUNCTION notify_employee_insert();

INSERT INTO Employee (first_name, last_name, department) 
VALUES ('John', 'Doe', 'Engineering');
