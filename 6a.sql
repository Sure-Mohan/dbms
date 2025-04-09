Queries using Conversion functions (to_char, to_number and to_date).
--To char
SELECT name, TO_CHAR(salary, '999,999') AS formatted_salary
FROM Employees;
--SELECT name, TO_CHAR(hire_date, 'DD-Mon-YYYY') AS formatted_date
FROM Employees;
--To number
SELECT TO_NUMBER('10000') + 5000 AS total
FROM dual;
--To date
SELECT TO_DATE('25-12-2023', 'DD-MM-YYYY') AS xmas
FROM dual;
--To date
SELECT TO_CHAR(TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Month DD, YYYY') AS formatted
FROM dual;
