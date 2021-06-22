USE employees;

SELECT * FROM employees WHERE birth_date LIKE '1954-01%'
ORDER BY birth_date, last_name
LIMIT 20;

SELECT * FROM employees WHERE birth_date LIKE '1954-01%'
ORDER BY birth_date, last_name
LIMIT 20 OFFSET 20; /* OFFSET gives you the next bundle of num */

SELECT * FROM employees WHERE birth_date LIKE '1954-01%'
ORDER BY birth_date, last_name
LIMIT 20 OFFSET 40;

# _ wild card represents one space, % wild card represents
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE '__e%' ORDER BY last_name;