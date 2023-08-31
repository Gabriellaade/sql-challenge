
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

CREATE TABLE dept_emp (
  emp_no int NOT NULL,
  dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

CREATE TABLE employees (
  emp_no int NOT NULL,
  emp_title_id VARCHAR NOT NULL,
  birth_date date NOT NULL,
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  sex VARCHAR NOT NULL,
  hire_date date NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

CREATE TABLE titles (
  title_id VARCHAR NOT NULL,
  title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
	
);


--create table salaries(
--emp_no int not null,
--salary int not null,
	--FOREIGN KEY (emp_no) references (emp_no),
	--primary key (emp_no)
--);

--1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
INNER JOIN salaries
ON employees.emp_no = salaries.emp_no

--2.List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT employees.last_name, employees.first_name, employees.hire_date
FROM employees
WHERE employees.hire_date BETWEEN '1986-01-01' AND '1986-12-31'

--3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)

--5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%'



--6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales'


--7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM ((departments
INNER JOIN dept_emp
ON departments.dept_no = dept_emp.dept_no)
INNER JOIN employees
ON dept_emp.emp_no = employees.emp_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'

--8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT employees.last_name, COUNT(employees.last_name) AS LastNameCount
FROM employees
GROUP BY employees.last_name
ORDER BY LastNameCount DESC




