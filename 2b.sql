Program development using WHILE LOOPS, numeric FOR LOOPS using ERROR Handling, BUILT –IN Exceptions, USER defined Exceptions, RAISE-APPLICATION ERROR.
SET SERVEROUTPUT ON;
DECLARE
    -- Cursor with parameter and FOR UPDATE
    CURSOR emp_cursor(p_dept_id IN NUMBER) IS
        SELECT emp_id, name, salary
        FROM Employees
        WHERE department_id = p_dept_id
        FOR UPDATE;
    -- Variables to hold data
    v_emp_id Employees.emp_id%TYPE;
    v_name   Employees.name%TYPE;
    v_salary Employees.salary%TYPE;
    v_new_salary Employees.salary%TYPE;
    -- User-defined exception
    e_low_salary EXCEPTION;
BEGIN
    -- Open cursor for Department 10
    OPEN emp_cursor(10);
    LOOP
        FETCH emp_cursor INTO v_emp_id, v_name, v_salary;
        EXIT WHEN emp_cursor%NOTFOUND;
        -- Raise user-defined exception if salary is too low
        IF v_salary < 10000 THEN
            RAISE e_low_salary;
        END IF;
        -- Raise built-in exception if name is NULL
        IF v_name IS NULL THEN
            RAISE_APPLICATION_ERROR(-20001, 'Employee name cannot be NULL (ID: ' || v_emp_id || ')');
        END IF;
        -- Calculate new salary (increase by 10%)
        v_new_salary := v_salary * 1.10;
        -- Update using WHERE CURRENT OF
        UPDATE Employees
        SET salary = v_new_salary
        WHERE CURRENT OF emp_cursor;
        -- Output info
        DBMS_OUTPUT.PUT_LINE('Updated Salary for ' || v_name || ' (ID: ' || v_emp_id || ') to: ' || v_new_salary);
    END LOOP;
    COMMIT;
    CLOSE emp_cursor;
-- Exception handling
EXCEPTION
    WHEN e_low_salary THEN
        DBMS_OUTPUT.PUT_LINE(' Salary is too low for update.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(' Error: ' || SQLERRM);
END;
/
