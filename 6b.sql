Create a simple PL/SQL program which includes declaration section, executable section and exception –Handling section.

SET SERVEROUTPUT ON;

DECLARE
    --  DECLARATION SECTION
    v_emp_id   Employees.emp_id%TYPE := 1;         -- Input (change as needed)
    v_name     Employees.name%TYPE;                -- To store name

BEGIN
    -- ️ EXECUTABLE SECTION
    SELECT name INTO v_name
    FROM Employees
    WHERE emp_id = v_emp_id;

    -- Print the employee name
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || v_name);

EXCEPTION
    -- ❗ EXCEPTION-HANDLING SECTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with ID: ' || v_emp_id);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
END;
/
