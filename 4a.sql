Queries using GROUPBY, HAVING.
--Group by
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id;
--Having
SELECT department_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 50000;

