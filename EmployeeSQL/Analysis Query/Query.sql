-- Join employees and salaries tables
CREATE VIEW employee_stats AS 
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no=s.emp_no;

--First, Last Name of employees hired in 1986
CREATE VIEW hires_1986 AS
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date >= '01/01/1986' AND hire_date<= '12/30/1986';

--Managers for each dept; dept number, dept name, the manager's employee number, last, and first name
CREATE VIEW managers_by_dept AS
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS n
ON d.dept_no = n.dept_no
JOIN employees AS e
ON e.emp_no::VARCHAR = n.emp_no;

--Employees for each dept; emp no, last name, first name, and dept name
CREATE VIEW employees_by_dept AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS n
ON d.dept_no = n.dept_no
JOIN employees AS e
ON e.emp_no::VARCHAR = n.emp_no;

