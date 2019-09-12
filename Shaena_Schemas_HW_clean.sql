-- DATA ENGINEERING:
-- 1. Create Department Table
CREATE TABLE departments(
	dept_no VARCHAR(50) NOT NULL,
	dept_name VARCHAR(50) NOT NULL,
	PRIMARY KEY (dept_no)
);


-- 2. Create department/employee Table
SELECT * FROM departments;

CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(50) NOT NULL,
	from_date VARCHAR(50) NOT NULL,
	to_date VARCHAR(50) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- 3. Create Department Table
SELECT * FROM departments;

CREATE TABLE dept_manager(
	dept_no VARCHAR(50) NOT NULL,
	emp_no INTEGER NOT NULL,
	from_date VARCHAR(50) NOT NULL,
	to_date VARCHAR(50) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- 4. Create Employee Table 
CREATE TABLE employees(
	emp_no INTEGER NOT NULL,
	birth_date VARCHAR(50) NOT NULL,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(50) NOT NULL,
	hire_date VARCHAR(50) NOT NULL,
	PRIMARY KEY (emp_no)
);


-- 5. Create Salaries Table 
SELECT * FROM employees;

CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	from_date VARCHAR(50) NOT NULL,
	to_date VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);


-- 6. Create Titles Table
SELECT * FROM employees;

CREATE TABLE titles(
	emp_no INTEGER NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_date VARCHAR(50) NOT NULL,
	to_date VARCHAR(50) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

-- DATA ANALYSIS
/* 1. List the following details of each employee: employee number, last name, 
first name, gender, and salary. */
SELECT     
employees.emp_no, employees.last_name,
employees.first_name, employees.gender, salaries.salary
FROM employees
JOIN salaries on employees.emp_no = salaries.emp_no;

/* 2. List employees who were hired in 1986. */
SELECT     
	*
FROM 
	employees
WHERE
	employees.hire_date LIKE '1986%'
;

/* 3. list the manager of each department with the following information: department number,
department name, the manager's employee number, last name, first name, and start and end employment dates. */
SELECT     
	dept_manager.dept_no, departments.dept_name,
	dept_manager.emp_no, employees.last_name, employees.first_name,
	dept_manager.from_date, dept_manager.to_date
	
FROM 
	((dept_manager
INNER JOIN
	departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN
	 employees ON employees.emp_no = dept_manager.emp_no);
	 

/*4. List the department of each employee with the following information: 
employee number, last name, first name, and department name. */
SELECT     
	employees.emp_no, 
	employees.last_name, 
	employees.first_name,
	departments.dept_name
	
FROM 
	((dept_manager
INNER JOIN
	departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN
	 employees ON employees.emp_no = dept_manager.emp_no);


/* 5. List all employees whose first name is "Hercules" and last names begin with "B." */

SELECT     
	*
	
FROM 
	employees
WHERE
	employees.first_name = 'Hercules' and
	employees.last_name LIKE 'B%'
;

/* 6. List all employees in the Sales department, including their employee number, 
last name, first name, and department name. */
SELECT     
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
	
FROM 
	((dept_manager
INNER JOIN
	departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN
	 employees ON employees.emp_no = dept_manager.emp_no)
WHERE
	departments.dept_name = 'Sales' 
;

/* 7. List all employees in the Sales and Development departments,
 including their employee number, last name, first name, and department name. */
 SELECT     
	employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
	
FROM 
	((dept_manager
INNER JOIN
	departments ON dept_manager.dept_no = departments.dept_no)
INNER JOIN
	 employees ON employees.emp_no = dept_manager.emp_no)
WHERE
	departments.dept_name = 'Sales' or
	departments.dept_name = 'Development'
;

/* 8. In descending order, list the frequency count of employee last names, i.e., 
how many employees share each last name. */
SELECT     
	employees.last_name,
	COUNT(employees.last_name) AS number_of_employees
FROM 
	employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC
;
	 
