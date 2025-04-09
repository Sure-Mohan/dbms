Develop a program that includes the features NESTEDIF, CASE and CASE expression. The program can be extended using the NULLIF and COALESCE functions.

SET SERVEROUTPUT ON;

DECLARE
    -- Employee data variables
    v_emp_id       Employees.emp_id%TYPE := 1;  -- Test with emp_id = 1
    v_name         Employees.name%TYPE;
    v_salary       Employees.salary%TYPE;
    v_job_id       Employees.job_id%TYPE;

    -- Output/logic variables
    v_bonus        NUMBER;
    v_category     VARCHAR2(30);
    v_null_check   VARCHAR2(50);
    v_final_job_id VARCHAR2(20);

BEGIN
    -- Get employee data
    SELECT name, salary, job_id INTO v_name, v_salary, v_job_id
    FROM Employees
    WHERE emp_id = v_emp_id;

    -----------------------------------------
    -- NESTED IF: Check salary ranges
    -----------------------------------------
    IF v_salary > 60000 THEN
        IF v_salary > 80000 THEN
            DBMS_OUTPUT.PUT_LINE('Salary: Very High');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Salary: High');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salary: Average or Low');
    END IF;

    -----------------------------------------
    -- CASE Statement: Determine job category
    -----------------------------------------
    CASE v_job_id
        WHEN 'DEV' THEN v_category := 'Developer';
        WHEN 'HR'  THEN v_category := 'Human Resources';
        WHEN 'MKT' THEN v_category := 'Marketing';
        ELSE v_category := 'Other';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Job Category: ' || v_category);

    -----------------------------------------
    -- CASE Expression: Calculate bonus
    -----------------------------------------
    v_bonus := CASE 
                   WHEN v_salary > 80000 THEN 5000
                   WHEN v_salary > 60000 THEN 3000
                   ELSE 1000
               END;

    DBMS_OUTPUT.PUT_LINE('Bonus: ' || v_bonus);

    -----------------------------------------
    -- NULLIF: Check if salary is exactly 50000
    -----------------------------------------
    IF NULLIF(v_salary, 50000) IS NULL THEN
        v_null_check := 'Salary is exactly 50000';
    ELSE
        v_null_check := 'Salary is not 50000';
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_null_check);

    -----------------------------------------
    -- COALESCE: Handle NULL job_id
    -----------------------------------------
    v_final_job_id := COALESCE(v_job_id, 'UNASSIGNED');

    DBMS_OUTPUT.PUT_LINE('Final Job ID: ' || v_final_job_id);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Employee not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
