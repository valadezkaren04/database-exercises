USE employees;

# Show each department along with the name of the current manager for that department

SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Depatment Manager'
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no
                 JOIN departments d ON dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '9%';

# Find the name of all departments currently managed by women

SELECT d.dept_name AS 'Department Name',
       CONCAT(e.first_name, ' ', e.last_name) AS 'Depatment Manager'
FROM employees e JOIN dept_manager dm ON e.emp_no = dm.emp_no
                 JOIN departments d ON dm.dept_no = d.dept_no
WHERE dm.to_date LIKE '9%'
  AND e.gender = 'F';

# Find the current titles of employees currently working in
# the Customer Service department
# the tricky part here is realizing you have to include both de.to_date and t.to_date in your WHERE clause