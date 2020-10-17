
-- Create table for departments
CREATE TABLE departments(
	dept_no VARCHAR,
	dept_name VARCHAR,
	PRIMARY KEY (dept_no)
);

SELECT * FROM departments;

--Create table for dept_emp
CREATE TABLE dept_emp(
	emp_no VARCHAR,
	dept_no VARCHAR
);

SELECT * FROM dept_emp;

--Create table for dept_manager
CREATE TABLE dept_manager(
	dept_no VARCHAR,
	emp_no VARCHAR,
	PRIMARY KEY (dept_no, emp_no)
);

SELECT * FROM dept_manager;

--Create table for employees
CREATE TABLE employees(
	emp_no INTEGER,
	emp_title_id VARCHAR,
	birth_date VARCHAR,
	first_name VARCHAR,
	last_name VARCHAR,
	sex VARCHAR(1),
	hire_date DATE
);

SELECT * FROM employees;

--Create table for salaries
CREATE TABLE salaries(
	emp_no INTEGER,
	salary INTEGER
);

SELECT * FROM salaries;

--Create table for titles
CREATE TABLE titles(
	title_id VARCHAR,
	title VARCHAR,
	PRIMARY KEY (title_id)
);

SELECT * FROM titles;