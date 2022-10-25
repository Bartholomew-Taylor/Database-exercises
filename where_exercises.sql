USE employees;



/* Create a file named where_exercises.sql. Make sure to use the employees database. */
SELECT *
	FROM employees;
	

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned. 709 records returned*/

SELECT *
	FROM employees
	 WHERE first_name IN ('irena', 'vidya', 'maya');

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2? 709 same number as long as you use first_name = for every OR */
SELECT *
	FROM employees
	 WHERE first_name = 'vidya' or first_name = 'maya' or first_name = 'irena';

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned. 441 records returned*/

SELECT *
	FROM employees
	 WHERE (first_name = 'vidya' or first_name = 'maya' or first_name = 'irena') AND gender = 'M';
	 

-- Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E */

SELECT *
	FROM employees
	 WHERE last_name LIKE'E%';

-- Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E? 30723 and 23393*/

SELECT *
	FROM employees
	 WHERE last_name LIKE'%' or last_name LIKE '%E';
	 
SELECT *
	FROM employees
	 WHERE last_name LIKE'%' AND NOT last_name LIKE 'E%';

/* Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E? 889 AND 24292*/

SELECT *
	FROM employees
	 WHERE last_name LIKE'E%' AND last_name LIKE '%E';
	 
SELECT *
	FROM employees
	 WHERE last_name LIKE '%E';

/* Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned. 135214*/

SELECT *
	FROM employees
	 WHERE hire_date LIKE '199%';

/* Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned. 842*/

SELECT *
	FROM employees
	 WHERE birth_date LIKE '%12-25';

/* Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned. 362 */

SELECT *
	FROM employees
	 WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25';

/* Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned. 1873 */

SELECT *
	FROM employees
	 WHERE last_name LIKE '%q%';

/* Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found? 547*/

SELECT *
	FROM employees
	 WHERE (last_name LIKE '%q%') AND NOT (last_name LIKE '%qu%');