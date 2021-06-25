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
SELECT title, COUNT(title) AS Total
FROM titles t JOIN dept_emp de
                   ON t.emp_no = de.emp_no
WHERE de.dept_no = 'd009'
  AND de.to_date LIKE '9%'
  AND t.to_date LIKE '9%'
GROUP BY title;

# Find the current salary of all current managers

# I know I need department names, department manager names, and salaries
# So I know I have to join the departments table, the department managers table, and the salaries table
# But I notice that the department managers table does not have the managers' names.
# Managers' names are in the employees table. Managers' identities, identified by employee number,
# are in the department managers table. Therefore I need to include the employees table in my join chain
