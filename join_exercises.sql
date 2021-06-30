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
# So I start out with the basic join chain, showing the columns I need
# First version

SELECT dept_name AS 'Department Name',
       CONCAT(first_name, ' ', last_name) AS 'Department Manager',
       salary AS Salary
FROM departments d
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e ON dm.emp_no = e.emp_no
         JOIN salaries s ON e.emp_no = s.emp_no;

# The problem here is, I get EVERY salary the department managers have ever had
# in their entire careers at The Company
# in addition, this includes people who used to be managers but no longer are
# so I add a WHERE clause restricting the results to current salaries and managers
# for good measure I add an ORDER BY DESC even though it wasn't strictly required

SELECT dept_name AS 'Department Name',
CONCAT(first_name, ' ', last_name) AS 'Department Manager',
salary AS Salary FROM departments d
JOIN dept_manager dm ON d.dept_no = dm.dept_no
JOIN employees e ON dm.emp_no = e.emp_no
JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
AND dm.to_date = '9999-01-01'
ORDER BY Salary DESC;

# BONUS
# Find the names of all current employees, their department name, and their current manager's name
# The key here is to line up the employees table twice, but using a different condition on each time
# each time you give the MySQL database server a condition for joining, the server decides that it will
# line up the rows you have requested every time it finds that match

# The whole time I'm working out the solution I am using LIMIT 20, otherwise I'm wasting time and CPU
# resources. I only lift the limit near the end

# I know I need the concatenated last name and first name of every current employee
# that's from the employees table
# I need the department name - that's in the departments table
# and I need the manager's name - that's in the employees table again - But how?

# think of joins as creating a great big temporary table that only lives while the query is being made
# so I want to line up an employee's name with the department they are working in. Well, the department name
# is in the departments table, and the number representing the department every employee works in is in the
# department employees table

# so I need a table that looks like
# employees.last_name | employees.first_name | employees.emp_no | dept_emp.emp_no | dept_emp.dept_no | departments.dept_name

# armed with this knowledge I can set up my first join chain
SELECT CONCAT(e.last_name, ' ', e.first_name) AS employee,
       d.dept_name AS Department
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d on d.dept_no = de.dept_no
LIMIT 20;

# I've successfully built the first two thirds of the query
# Now I just need to tell the MySQL server "when you find a match between that department's manager
# and the department manager's name, line up the rows that have the matching value"
# Think of a JOIN clause as telling the server how to join up rows between columns from different tables
# you say, hey server, whenever a specified condition is true, like some column's value in one table
# matches a value in a column in another table, go ahead and line up the rows that have the matching value

# so we know each department, identified by number, has a manager, identified by the dept_no of the
# department they manage as well as by their employee number. So I have to link departments to dept_manager
# using dept_no match as the condition
# to test this, I'm going to give the manager's employee number as output

SELECT CONCAT(e.last_name, ' ', e.first_name) AS employee,
       d.dept_name AS Department,
       dm.emp_no AS 'Manager Employee Number'
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d on d.dept_no = de.dept_no
         JOIN dept_manager dm on d.dept_no = dm.dept_no
LIMIT 20;

# Now I just have to tell the server to line up the manager's name, based on an employee number match
# But this time I am not matching employee to dept_emp
# No, this time I want to match the manager's identity, which I just got, to their name
# that means Joining dept_manager to employees
# the server will get confused if I use the same alias for employees
# The server already has a representation of employees stored in the alias e, and that
# representation is linked to the employee in the first column
# we need a new representation linked to the manager's employee number
# so we create a new alias, e2
# we delete the employee number from our output and we try the new query

SELECT CONCAT(e.last_name, ' ', e.first_name) AS employee,
       dept_name AS Department,
       CONCAT(e2.last_name, ' ', e2.first_name) AS Manager
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e2 ON e2.emp_no = dm.emp_no;

# That's the right output, but 897570 rows ...
# I forgot to limit the results to only current employees

# I get duplicate results when I only limit to current employees,
# ... I investigate by using a query to one employee last name

SELECT CONCAT(e.last_name, ' ', e.first_name) AS employee,
       dept_name AS Department,
       CONCAT(e2.last_name, ' ', e2.first_name) AS Manager
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e2 ON e2.emp_no = dm.emp_no
WHERE de.to_date LIKE '9%' AND e.last_name = 'Sichman';

# Ahhhh, now I see. Yes, the server is querying for the
# name of the manager of that department ... but the
# dept_manager table contains every person who has ever managed that department
# I need to limit my results to just the current person who manages the department

SELECT CONCAT(e.last_name, ' ', e.first_name) AS employee,
       dept_name AS Department,
       CONCAT(e2.last_name, ' ', e2.first_name) AS Manager
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
         JOIN departments d ON de.dept_no = d.dept_no
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e2 ON e2.emp_no = dm.emp_no
WHERE de.to_date LIKE '9%' AND dm.to_date LIKE '9%';

# And I see the longed-for confirmation: 240124 rows in set (0.85 sec)