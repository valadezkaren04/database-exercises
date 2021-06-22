USE employees;

SELECT COUNT(*), gender FROM employees GROUP BY gender;

SELECT COUNT(*), last_name FROM employees GROUP BY last_name;

SELECT COUNT(*), last_name FROM employees GROUP BY last_name ORDER BY COUNT(*);

# average age of hire for employees of The Company:
SELECT AVG(DATEDIFF(hire_date, birth_date)/365) FROM employees;

SELECT MAX(DATEDIFF(hire_date, birth_date)/365) FROM employees;

SELECT MIN(DATEDIFF(hire_date, birth_date)/365) FROM employees;

# GROUP BY combines duplicates into one single value for each group
# GROUP BY consolidates rows based on a common value.


SELECT DISTINCT title FROM titles; /* find all the unique titles within the company */

# displays only the last names:
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%e'
ORDER BY last_name;

# displays only the last names as well:
SELECT DISTINCT last_name FROM employees WHERE last_name LIKE 'E%e'
GROUP BY last_name ORDER BY last_name;

# more useful than ^^ counts the last name and displays the last name:
SELECT COUNT(last_name), last_name FROM employees WHERE last_name LIKE 'E%e'
GROUP BY last_name ORDER BY last_name;

# selects last and first name. Where last name ends and starts with e:
SELECT DISTINCT first_name, last_name FROM employees WHERE last_name LIKE 'E%e'
GROUP BY last_name,first_name;

SELECT gender, COUNT(*) FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

