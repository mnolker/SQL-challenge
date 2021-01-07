--Data Analysis Question 1. 
--List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.sex, s.salary
FROM employees AS emp
JOIN salaries AS s
	ON emp.emp_no = s.emp_no
;

--Data Analysis Question 2. 
--List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp.emp_no, emp.first_name, emp.last_name, emp.hire_date
FROM employees AS emp
GROUP BY (emp.emp_no)
HAVING EXTRACT(YEAR FROM emp.hire_date) = '1986';

--Data Analysis Question 3. 
--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, d.dept_name, m.dept_mgr_emp_no, p.first_name, p.last_name
FROM dept_manager AS m
JOIN employees as p
	ON m.dept_mgr_emp_no = p.emp_no
JOIN departments as d
	ON m.dept_no = d.dept_no
ORDER BY m.dept_no, p.last_name
;

--Data Analysis Question 4. 
--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dp.emp_no, p.first_name, p.last_name, d.dept_name
FROM dept_emp as dp
JOIN employees as p
	ON dp.emp_no = p.emp_no
JOIN departments as d
	ON dp.dept_no = d.dept_no
ORDER BY dp.emp_no
;

--Data Analysis Question 5. 
--List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT emp.first_name, emp.last_name, emp.sex
FROM employees AS emp
GROUP BY (emp.emp_no)
HAVING emp.first_name = 'Hercules' AND substring(emp.last_name from 1 for 1) = 'B';

--Data Analysis Question 6. 
--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dp.emp_no, p.first_name, p.last_name, d.dept_name
FROM dept_emp as dp
JOIN employees as p
	ON dp.emp_no = p.emp_no
JOIN departments as d
	ON dp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY dp.emp_no
;
--Data Analysis Question 7. 
--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dp.emp_no, p.first_name, p.last_name, d.dept_name
FROM dept_emp as dp
JOIN employees as p
	ON dp.emp_no = p.emp_no
JOIN departments as d
	ON dp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY dp.emp_no
;

--Data Analysis Question 8. 
--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT p.last_name, COUNT(*)
FROM employees as p
GROUP BY p.last_name
ORDER BY COUNT desc
;
