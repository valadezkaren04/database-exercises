USE employees;

SELECT CONCAT(first_name, ', ', last_name) AS full_name FROM employees
LIMIT 10;

SELECT CONCAT(first_name, ', ', last_name) AS full_name, birth_date AS DOB FROM employees
LIMIT 10;

SELECT CONCAT(emp_no, ' - ', last_name, ', ', first_name) AS full_name, birth_date AS DOB FROM employees
LIMIT 10;

