USE employees;

# PART ONE

SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

SELECT * FROM employees WHERE last_name LIKE 'E%';

SELECT * FROM employees WHERE last_name Like '%q%';

# PART TWO

SELECT first_name FROM employees WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';

SELECT first_name FROM employees WHERE (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya')
AND gender = 'M';

# due to the exercise, that's the answer ^^ but this is the right solution:
# SELECT first_name, gender FROM employees WHERE first_name IN 'Irena', 'Vidya', 'Maya' AND gender = 'M';

SELECT * FROM employees WHERE last_name LIKE 'E%'
OR last_name LIKE 'e%';

SELECT * FROM employees WHERE last_name LIKE 'E%e';

SELECT * FROM employees WHERE last_name LIKE '%q%'
AND last_name NOT LIKE '%qu%';
