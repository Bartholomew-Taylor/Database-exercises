USE employees;

/*
Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.
*/

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
Irena Reutenauer and Vidya Simmen
*/

SELECT *
from employees
WHERE first_name IN ('irena', 'vidya', 'maya')
ORDER BY first_name ASC;

/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
Irena Acton and Vidya Zweizeg
*/

SELECT *
from employees
WHERE first_name IN ('irena', 'vidya', 'maya')
ORDER BY first_name ASC, last_name ASC;


/*
Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?
Irena Acton and Maya Zyda
*/

SELECT *
from employees
WHERE first_name IN ('irena', 'vidya', 'maya')
ORDER BY last_name ASC, first_name ASC;


/*
Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.
899 10021 Ramzi Erde and 499648 Tadahiro Erde
*/

SELECT *
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'e%'
ORDER BY emp_no ASC;

/*
Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.
899, Teiji Eldridge and Serfi Erde
*/

SELECT *
FROM employees
WHERE last_name LIKE '%E' AND last_name LIKE 'e%'
ORDER BY hire_date DESC;

/*
Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.
Khun Bernini and Douadi Pettis
*/

SELECT *
FROM employees
WHERE hire_date LIKE '199%' AND birth_date LIKE '%12-25'
ORDER BY birth_date ASC, hire_date DESC;