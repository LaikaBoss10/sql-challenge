-- DATA ANALYSIS
SET search_path TO challenge;

--List the employee number, last name, first name, sex, and salary of each employee (2 points)
SELECT e.emp_no, e.first_name, e.last_name, s.salary, e.sex
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT e.first_name, e.last_name, e.hire_date
FROM employees e
WHERE EXTRACT(YEAR FROM(hire_date)) = 1986;

-- List the manager of each department along with their department number, department name,
-- employee number, last name, and first name (2 points)
SELECT dm.emp_no AS manager_emp_no,
	dm.dept_no,
    d.dept_name,
    e.first_name,
    e.last_name
FROM dept_manager dm
-- Using an inner join on dept_no it brings in dept_name from departments table.
JOIN departments d ON dm.dept_no = d.dept_no
-- Using an inner join on emp_no it brings in first_name and last_name from the rows that match emp_no's.
JOIN employees e ON dm.emp_no = e.emp_no;

-- List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name (2 points)
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and 
-- whose last name begins with the letter B (2 points)
SELECT e.first_name, e.last_name, e.sex
FROM employees e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, 
-- last name, and first name (2 points)
SELECT de.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employees e on de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- List each employee in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name (4 points)
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e on de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'

-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
