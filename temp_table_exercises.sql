#1 Using the example from the lesson, create a temporary table called employees_with_departments that contains first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create this table on your own database. If you see "Access denied for user ...", it means that the query was attempting to write a new table to a database that you can only read.
     
CREATE TEMPORARY TABLE noether_2022.employees_with_departments AS (

SELECT first_name, last_name, title, dept_name
FROM employees AS e
JOIN dept_emp AS de USING(emp_no)
JOIN departments AS d USING(dept_no)
JOIN titles AS t using(emp_no)
WHERE de.to_date > NOW()
     AND t.to_date > NOW()
     AND dept_name = 'customer service'
     
);

SELECT * 
FROM noether_2022.employees_with_departments;

#1.a Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns

ALTER TABLE noether_2022.employees_with_departments ADD full_name VARCHAR(30);

#1b Update the table so that full name column contains the correct data

UPDATE employees_with_departments SET 
full_name = CONCAT(first_name, ' ', last_name);

#1.c Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP COLUMN last_name;
ALTER TABLE employees_with_departments DROP COLUMN first_name;

#1d we could've just created it to with those columns to being with?

DROP TABLE IF EXISTS noether_2022.payments_copy;

/* 2. Create a temporary table based on the payment table from the sakila database.

Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199. */

CREATE TEMPORARY TABLE noether_2022.payments_copy AS (
						select *
							 from sakila.payment AS s_p	
							 		 );
select *
FROM noether_2022.payments_copy;


ALTER TABLE noether_2022.payments_copy ADD amount_in_cents INT;
UPDATE noether_2022.payments_copy SET amount_in_cents = amount * 100;

ALTER TABLE noether_2022.payments_copy DROP COLUMN amount;

# 3 Find out how the current average pay in each department compares to the overall current pay for everyone at the company. In order to make the comparison easier, you should use the Z-score for salaries. In terms of salary, what is the best department right now to work for? The worst?

DROP TABLE IF EXISTS noether_2022.ind_pay_vs_dept_pay;

CREATE TEMPORARY TABLE noether_2022.ind_pay_vs_dept_pay as (
						SELECT CONCAT(employees.first_name,' ', employees.last_name),
										employees.emp_no, salaries.salary, departments.dept_name
							 FROM employees.employees
							 JOIN dept_emp USING(emp_no)
							 JOIN salaries USING(emp_no)							 JOIN departments USING(dept_no) 
							 WHERE salaries.to_date > CURDATE()
							);
							
Select *
FROM noether_2022.ind_pay_vs_dept_pay;

ALTER TABLE noether_2022.ind_pay_vs_dept_pay ADD z_score_compare FLOAT; 
UPDATE noether_2022.ind_pay_vs_dept_pay SET z_score_compare = 
			(SELECT
    			(salaries.salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries) AS zscore
FROM salaries);


SELECT dept_name, AVG(salaries.salary)
FROM departments
JOIN dept_emp ON dept_emp.dept_no = departments.dept_no
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
GROUP BY dept_name;
