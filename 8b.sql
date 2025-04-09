CREATE OR REPLACE FUNCTION get_annual_salary(p_emp_id IN Employees.emp_id%TYPE)
RETURN NUMBER
IS
    v_salary Employees.salary%TYPE;
    v_annual_salary NUMBER;
BEGIN
    -- Get salary of employee
    SELECT salary INTO v_salary
    FROM Employees
    WHERE emp_id = p_emp_id;

    -- Calculate annual salary
    v_annual_salary := v_salary * 12;

    RETURN v_annual_salary;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;  -- If employee ID is invalid
    WHEN OTHERS THEN
        RETURN -1; -- Return -1 for unexpected errors
END;
/
--invoke the function
SELECT get_annual_salary(1) AS annual_salary FROM dual;
--select statement
SELECT emp_id, name, get_annual_salary(emp_id) AS annual_salary
FROM Employees;
--calculate bonus
SELECT name
FROM Employees
WHERE get_annual_salary(emp_id) > 650000;
