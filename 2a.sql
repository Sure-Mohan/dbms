Queries (along with sub-queries) using UNION, INTERSECT Constraints.
--union
SELECT name FROM Employees WHERE department_id = 10
UNION
SELECT name FROM Employees WHERE department_id = 30;
--intersect
SELECT name FROM Employees WHERE department_id = 20
INTERSECT
SELECT name FROM Employees WHERE salary < 60000;
