Queries (along with sub-queries) using ANY, ALL, IN, EXISTS, NOT EXISTS.
 UNION, INTERSECT, Constraints. 
-- Employees Table
CREATE TABLE Employees (
    emp_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    department_id NUMBER,
    salary NUMBER CHECK (salary > 0),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- ProjectAssignments Table
CREATE TABLE ProjectAssignments (
    emp_id NUMBER,
    project_name VARCHAR2(50),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
);
INSERT INTO Departments (department_id, dept_name) VALUES (10, 'Engineering');
INSERT INTO Departments (department_id, dept_name) VALUES (20, 'Marketing');
INSERT INTO Departments (department_id, dept_name) VALUES (30, 'HR');
INSERT INTO Departments (department_id, dept_name) VALUES (40, 'Finance');
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES (1, 'Alice', 10, 50000);
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES (2, 'Bob', 20, 60000);
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES (3, 'Charlie', 10, 55000);
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES (4, 'Dave', 30, 70000);
INSERT INTO Employees (emp_id, name, department_id, salary) VALUES (5, 'Eve', 20, 40000);
INSERT INTO ProjectAssignments (emp_id, project_name) VALUES (1, 'Project X');
INSERT INTO ProjectAssignments (emp_id, project_name) VALUES (2, 'Project Y');
INSERT INTO ProjectAssignments (emp_id, project_name) VALUES (4, 'Project X');
INSERT INTO ProjectAssignments (emp_id, project_name) VALUES (5, 'Project Z');
--Any
SELECT name, salary
FROM Employees
WHERE salary > ANY (
    SELECT salary
    FROM Employees
    WHERE department_id = 20
);
--All
SELECT name, salary
FROM Employees
WHERE salary > ALL (
    SELECT salary FROM Employees WHERE department_id = 20
);
--Exists
SELECT dept_name
FROM Departments d
WHERE EXISTS (
    SELECT 1 FROM Employees e
    WHERE e.department_id = d.department_id
);
--Not exists
SELECT dept_name
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1 FROM Employees e
    WHERE e.department_id = d.department_id
);
--union
SELECT name FROM Employees WHERE department_id = 10
UNION
SELECT name FROM Employees WHERE department_id = 30;
--intersect
SELECT name FROM Employees WHERE department_id = 20
INTERSECT
SELECT name FROM Employees WHERE salary < 60000;

