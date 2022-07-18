-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Preparing the list for exporting
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
	ri.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Joining dept_emp and departments to get dept_name info into new table
SELECT de.emp_no,
	de.dept_no,
	d.dept_name
INTO better_dept_emp
FROM dept_emp as de
LEFT JOIN departments as d
ON de.dept_no = d.dept_no;

-- Using resulting new table to create a new table that shows retirement numbers by department but also give the department name
SELECT COUNT(ce.emp_no), bde.dept_no, bde.dept_name
INTO retire_dy_dept
FROM current_emp as ce
LEFT JOIN better_dept_emp as bde
ON ce.emp_no = bde.emp_no
GROUP BY bde.dept_no, bde.dept_name
ORDER BY bde.dept_no;

-- Code as given by module, but not used
-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
-- INTO retire_dy_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Creating more thorough emp[loyy infor list for potential retirees
SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');
	 
-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
-- DEPT Retirees: add department infor to current employyee list
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
	d.dept_name,
	de.to_date
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

-- List for sales
SELECT ce.emp_no,
	ce.last_name,
	ce.first_name,
	d.dept_name
INTO for_sales
FROM current_emp as ce
INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no)
WHERE (de.dept_no = 'd007');

-- List for mentoring program eligibility (in sales and development departments)
SELECT ce.emp_no,
	ce.last_name,
	ce.first_name,
	d.dept_name
INTO mentor_program
FROM current_emp as ce
INNER JOIN dept_emp as de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments as d 
ON (de.dept_no = d.dept_no)
WHERE de.dept_no  IN ('d005', 'd007');