USE noether_2022;

DROP TABLE IF EXISTS my_numbers;

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL, 
	 name VARCHAR(10) NOT NULL
	


);

SELECT *
FROM my_numbers;
#inserting data
INSERT INTO my_numbers(n, NAME)
VALUES (1, 'a'), (2, 'b'), (3, 'c');

#delete from my_numbers
DELETE FROM my_numbers WHERE n < 2;

#transform data

UPDATE my_numbers SET n = n + 1;


#transform existing data w/ condition

UPDATE my_numbers SET n = n + 10
WHERE name = 'a';

SELECT *
FROM my_numbers;

USE employees;

SELECT emp_no, dept_no, first_name, last_name, salary, title
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
JOIN salaries AS s USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN titles AS t using(emp_no)
WHERE de.to_date > NOW()
     AND s.to_date > NOW()
     AND t.to_date > NOW()
     AND dept_name = 'customer service';
     
CREATE TEMPORARY TABLE noether_2022.salary_info AS (

SELECT emp_no, dept_no, first_name, last_name, salary, title
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
JOIN salaries AS s USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN titles AS t using(emp_no)
WHERE de.to_date > NOW()
     AND s.to_date > NOW()
     AND t.to_date > NOW()
     AND dept_name = 'customer service'
     
);

SELECT *
FROM noether_2022.salary_info;


#avg salary for current employees

SELECT AVG(salary)
FROM noether_2022.salary_info;

#adding new columns
ALTER TABLE noether_2022.salary_info ADD avg_salary FLOAT;
ALTER TABLE noether_2022.salary_info ADD std_salary FLOAT;
ALTER TABLE noether_2022.salary_info ADD greater_than_avg_salary INT;

SELECT *
FROM noether_2022.salary_info;

#update new columns
UPDATE noether_2022.salary_info SET avg_salary = 67000;

UPDATE noether_2022.salary_info SET std_salary = 16000;

UPDATE noether_2022.salary_info SET greater_than_avg_salary = salary > avg_salary;