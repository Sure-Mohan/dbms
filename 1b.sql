Develop programs using features parameters in a CURSOR variable.

-Cursors
-- Enable DBMS_OUTPUT in SQL Developer or SQLcl
SET SERVEROUTPUT ON;
DECLARE
    -- Cursor with IN parameter
    CURSOR emp_cursor(dept_id IN Employees.department_id%TYPE) IS
        SELECT emp_id, name, salary
        FROM Employees
        WHERE department_id = dept_id;
    -- Variables to hold values from cursor
    v_emp_id Employees.emp_id%TYPE;
    v_name Employees.name%TYPE;
    v_salary Employees.salary%TYPE;
BEGIN
    -- Call the cursor with department_id = 10 (Engineering)
    OPEN emp_cursor(10);
    LOOP
        FETCH emp_cursor INTO v_emp_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;
        -- Print the values
        DBMS_OUTPUT.PUT_LINE('ID: ' || v_emp_id || ', Name: ' || v_name || ', Salary: ' || v_salary);
    END LOOP;
    CLOSE emp_cursor;
END;
/
