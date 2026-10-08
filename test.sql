-- Test file for Question 20

SET SERVEROUTPUT ON;

INSERT INTO Employee
(
    EmployeeID,
    EmployeeName,
    Department,
    Salary
)
VALUES
(
    102,
    'Meena',
    'IT',
    40000
);

COMMIT;

DECLARE
    v_Count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_Count
    FROM Employee
    WHERE EmployeeID = 102
      AND EmployeeName = 'Meena';

    IF v_Count = 1 THEN
        DBMS_OUTPUT.PUT_LINE('TEST PASSED');
        DBMS_OUTPUT.PUT_LINE(
            'New employee record inserted successfully.'
        );
    ELSE
        DBMS_OUTPUT.PUT_LINE('TEST FAILED');
    END IF;
END;
/
