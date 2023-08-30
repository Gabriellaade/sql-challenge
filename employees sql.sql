
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

