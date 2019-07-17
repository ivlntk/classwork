CREATE Table department2	
(	
	dept_no  VARCHAR (10) NOT NULL,
	#NAME?
	dept_name  VARCHAR (50),
	#NAME?
	PRIMARY KEY (dept_no)
);	
	
#NAME?	
SELECT *	
from department2;	
	
#NAME?	
	
#NAME?	
SELECT *	
from department2;	
	
--Create table employees; drop in case of issues	
--DROP Table employees; 	
CREATE Table employees (	
	--emp_ID serial,
	emp_no INT NOT NULL,
	birth_date DATE  NOT NULL,
	first_name VARCHAR (50) NOT NULL,
	last_name VARCHAR (50) NOT NULL,
	gender CHAR (1) NOT NULL,
	hire_date DATE NOT NULL,
	#NAME?
	PRIMARY KEY (emp_no)
);	
	
-- View Table --	
SELECT *	
from employees;	
	
#NAME?	
	
-- View Table data --	
SELECT *	
from employees;	
	
#NAME?	
--DROP table dept_emp;	
CREATE Table dept_emp(	
	--deptemp_ID serial,
	emp_no INT NOT NULL,
	dept_no VARCHAR (10) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	#NAME?
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department2(dept_no)
);	
	
--Check table output --	
SELECT *	
from dept_emp;	
	
#NAME?	
--Check table data --	
SELECT *	
from dept_emp;	
	
	
#NAME?	
--DROP Table dept_manager;	
CREATE Table dept_manager(	
	dept_no VARCHAR (10) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department2(dept_no)
	
);	
	
--Check table --	
SELECT *	
from dept_manager;	
	
#NAME?	
--Check table data --	
SELECT *	
from dept_manager;	
	
	
#NAME?	
--DROP Table salaries;	
CREATE Table salaries	
(	emp_no INT NOT NULL,
	salary INTEGER NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);	
	
#NAME?	
SELECT *	
from salaries;	
	
#NAME?	
#NAME?	
SELECT *	
from salaries;	
	
#NAME?	
--DROP Table titles;	
CREATE Table titles	
(	emp_no INT NOT NULL,
	title VARCHAR (25) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);	
	
	
#NAME?	
SELECT *	
from titles;	
	
#NAME?	
#NAME?	
SELECT *	
from titles;	
	
#NAME?	
	
SELECT emp_no, first_name, last_name, gender	
FROM employees	
WHERE emp_no IN	
(	
	SELECT salary, emp_no
	FROM salaries
);	
	
#NAME?	
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary	
FROM employees	
JOIN salaries 	
ON employees.emp_no = salaries.emp_no;	
	
	
--List employees who were hired in 1986.	
SELECT first_name, last_name, hire_date 	
FROM employees	
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';	
	
--List the manager of each department with the following information: department number, department name, the manager's employee number, 	
#NAME?	
SELECT department2.dept_no, department2.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name, dept_manager.from_date, dept_manager.to_date	
FROM department2	
JOIN dept_manager	
ON department2.dept_no = dept_manager.dept_no	
JOIN employees	
ON dept_manager.emp_no = employees.emp_no;	
	
#NAME?	
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department2.dept_name	
FROM dept_emp	
JOIN employees	
ON dept_emp.emp_no = employees.emp_no	
JOIN department2	
ON dept_emp.dept_no = department2.dept_no;	
	
	
--List all employees whose first name is "Hercules" and last names begin with "B."	
SELECT first_name, last_name	
FROM employees	
WHERE last_name like 'B%'	
AND first_name = 'Hercules'	
ORDER BY last_name;	
	
	
#NAME?	
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department2.dept_name	
FROM dept_emp	
JOIN employees	
ON dept_emp.emp_no = employees.emp_no	
JOIN department2	
ON dept_emp.dept_no = department2.dept_no	
WHERE department2.dept_name = 'Sales';	
	
#NAME?	
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, department2.dept_name	
FROM dept_emp	
JOIN employees	
ON dept_emp.emp_no = employees.emp_no	
JOIN department2	
ON dept_emp.dept_no = department2.dept_no	
WHERE department2.dept_name = 'Sales' 	
OR department2.dept_name = 'Development';	
	
	
#NAME?	
SELECT last_name,	
COUNT(last_name) AS "frequency"	
FROM employees	
GROUP BY last_name	
ORDER BY	
COUNT(last_name) DESC;	
