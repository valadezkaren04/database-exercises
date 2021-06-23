USE employees;

# use of indexes is part of Query Optimization

SHOW INDEXES from employees;

SHOW INDEXES from departments;

# getting salary info

SELECT salary FROM salaries WHERE salary BETWEEN 50000 AND 70000;

# created a 'secret' table with salary info:
ALTER TABLE salaries ADD INDEX salary_index (salary);

USE codeup_test_db;

CREATE TABLE quotes2 (
    id INT NOT NULL AUTO_INCREMENT,
    content VARCHAR(500) NOT NULL,
    author VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE quotes2 ADD UNIQUE (content);

INSERT INTO quotes2 (content, author)
VALUES ('Don’t be trapped in someone else’s dream.', 'V');

USE employees;

DROP INDEX salary_index ON salaries;

# indexes exercise

USE codeup_test_db;

