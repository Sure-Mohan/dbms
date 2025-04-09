Implement a function which accepts employee id as input and has to return the job id of the employee.
ALTER TABLE Employees ADD job_id VARCHAR2(20);
UPDATE Employees SET job_id = 'DEV' WHERE emp_id = 1;
UPDATE Employees SET job_id = 'HR' WHERE emp_id = 2;
UPDATE Employees SET job_id = 'MKT' WHERE emp_id = 3;
UPDATE Employees SET job_id = 'MKT' WHERE emp_id = 4;
UPDATE Employees SET job_id = 'DEV' WHERE emp_id = 5;
COMMIT;
select * from employees
--function for getting jobid and input is empid
CREATE OR REPLACE FUNCTION get_job_id(p_emp_id IN NUMBER)
RETURN VARCHAR2
IS
    v_job_id VARCHAR2(20);  -- To hold job_id
BEGIN
    -- Fetch job_id of the given employee
    SELECT job_id INTO v_job_id
    FROM Employees
    WHERE emp_id = p_emp_id;

    RETURN v_job_id;  -- Return the job_id

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'Not Found';  -- If no employee with given ID
    WHEN OTHERS THEN
        RETURN 'Error';      -- For any other error
END;
/
-- See result in a query
SELECT get_job_id(1) FROM dual;

-- Or in a PL/SQL block:
BEGIN
    DBMS_OUTPUT.PUT_LINE('Job ID: ' || get_job_id(1));
END;
/
