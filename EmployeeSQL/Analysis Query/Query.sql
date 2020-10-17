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

--List First, Last name, and Sex of employee named "Hercules" and last name starts with "B"
CREATE VIEW hercules_b AS
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List all employees in the Sales department (employee number, last name, first name, and department name)
CREATE VIEW sales_employees AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS n
ON d.dept_no = n.dept_no
JOIN employees AS e
ON e.emp_no::VARCHAR = n.emp_no
WHERE d.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
CREATE VIEW sales_development_employees AS
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM departments AS d
JOIN dept_emp AS n
ON d.dept_no = n.dept_no
JOIN employees AS e
ON e.emp_no::VARCHAR = n.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';

--list the frequency count of employee last names, i.e., how many employees share each last name.
CREATE VIEW last_name_count AS
SELECT last_name, COUNT(last_name) AS Total
FROM employees
GROUP BY last_name
ORDER BY Total DESC;