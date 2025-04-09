Queries for Creation and dropping of Views.
--Creating a view
CREATE VIEW dept_summary AS
SELECT department_id, COUNT(*) AS emp_count, AVG(salary) AS avg_salary
FROM Employees
GROUP BY department_id;
--query
SELECT * FROM dept_summary;
--dropping view
DROP VIEW dept_summary;

