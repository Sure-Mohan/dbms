7	 A)Queries using string functions (Concatenation, lpad, rpad, ltrim, rtrim, lower, upper, initcap, length, substr and instr). 
--Concatenation
SELECT name || ' works as ' || job_id AS employee_info
FROM Employees;
--LPAD
SELECT LPAD(name, 10, '*') AS padded_name
FROM Employees;
--RPAD
SELECT RPAD(name, 10, '*') AS padded_name
FROM Employees;
--LTRIM
SELECT LTRIM('***Hello', '*') AS trimmed
FROM dual;
--RTRIM
SELECT RTRIM('Hello***', '*') AS trimmed
FROM dual;
--LOWER
SELECT LOWER(name) AS lowercase_name
FROM Employees;
--UPPER
SELECT UPPER(name) AS uppercase_name
FROM Employees;
--INITCAP
SELECT INITCAP(name) AS proper_case_name
FROM Employees;
--LENGTH
SELECT name, LENGTH(name) AS name_length
FROM Employees;
--SUBSTR
SELECT name, SUBSTR(name, 1, 3) AS first_3_letters
FROM Employees;
--INSTR
SELECT name, INSTR(name, 'a') AS position_of_a
FROM Employees;
--BONUS
SELECT INITCAP(LPAD(name, 10, '*')) AS formatted_name
FROM Employees;
