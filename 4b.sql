Programs development using creation of procedures, passing parameters IN and OUT of PROCEDURES.
CREATE OR REPLACE PROCEDURE get_employee_job (
    p_emp_id   IN  Employees.emp_id%TYPE,
    p_job_id   OUT Employees.job_id%TYPE
)
IS
BEGIN
    SELECT job_id INTO p_job_id
    FROM Employees
    WHERE emp_id = p_emp_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_job_id := 'Not Found';
    WHEN OTHERS THEN
        p_job_id := 'Error';
END;
/
DECLARE
    v_job_id VARCHAR2(20);  -- OUT variable to hold job ID
BEGIN
    get_employee_job(1, v_job_id);  -- Call the procedure with emp_id = 1
    DBMS_OUTPUT.PUT_LINE('Job ID is: ' || v_job_id);
END;
/

