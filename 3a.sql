Queries using Aggregate functions (COUNT, SUM, AVG, MAX and MIN), GROUPBY, HAVING and Creation and dropping of Views.
--Count
SELECT COUNT(*) AS total_employees FROM Employees;
--Sum
SELECT SUM(salary) AS total_salary FROM Employees;
--Average value
SELECT AVG(salary) AS avg_salary FROM Employees;
--Max and min
SELECT MAX(salary) AS highest_salary, MIN(salary) AS lowest_salary FROM Employees;
--Group by
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id;
--Having
SELECT department_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 50000;
--Creating a view
CREATE VIEW dept_summary AS
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id;
--query
SELECT * FROM dept_summary;
--dropping view
DROP VIEW dept_summary;
