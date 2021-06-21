USE employees;

SELECT * FROM employees WHERE hire_date = '1985-01-01';

SELECT first_name FROM employees WHERE first_name LIKE '%sus%';

SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, first_name, last_name FROM employees
WHERE last_name IN ('Herber', 'Dredge', 'Lipner', 'Baek');

SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no < 10026;

SELECT emp_no, first_name, last_name FROM employees
WHERE emp_no < 20000
    AND last_name IN ('Herber', 'Baek')
   OR first_name = 'Shridhar';

# this is the old way oof doing it
SELECT * FROM salaries WHERE NOT salary BETWEEN 50000 AND 100000;

# in the past, this did not work, but now it does.
SELECT * FROM salaries WHERE salary NOT BETWEEN 50000 AND 100000;

SELECT birth_date FROM employees
WHERE NOT birth_date LIKE '195%';

# same as ^^ but this is a little more clear:
SELECT birth_date FROM employees
WHERE birth_date NOT LIKE '195%';

SELECT birth_date, hire_date FROM employees
WHERE birth_date NOT LIKE '195%'

# this will not select all employees born in Jan. 1963:
SELECT * FROM employees WHERE birth_date LIKE '1963-1%';

# this will:
SELECT * FROM employees WHERE birth_date LIKE '1963-01%';

SELECT * FROM employees WHERE birth_date LIKE '1963-01%' ORDER BY birth_date;