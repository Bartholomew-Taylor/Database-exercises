USE employees;

#1 Find all the current employees with the same 
# hire date as employee 101010 using a sub-query.


SELECT *
FROM employees
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
WHERE hire_date = (SELECT hire_date 
					From employees WHERE emp_no = '101010')
					AND dept_emp.to_date LIKE '9999%';
	

#2 Find all the titles ever held by all current 
# employees with the first name Aamod.

SELECT emp_no
	FROM employees 
	 WHERE first_name = 'aamod';
	 
SELECT emp_no 
	FROM dept_emp
	 WHERE to_date > CURDATE();
	 
#2 answer below	 
SELECT title, emp_no 
	FROM titles
	 WHERE emp_no IN (
	 SELECT emp_no
	FROM employees 
	 WHERE first_name = 'aamod'
	 and emp_no IN
	 (SELECT emp_no 
	FROM dept_emp
	 WHERE to_date LIKE '9999%'));
	 
#3 How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.



SELECT count(*)
 FROM dept_emp
  WHERE to_date < CURDATE();


#4 Find all the current department managers that are female. List their names in a comment in your code.

SELECT dept_manager.emp_no as emp_ident, employees.first_name AS firstname, employees.last_name AS lastname
FROM dept_manager
JOIN employees ON employees.emp_no = dept_manager.emp_no AND dept_manager.to_date > CURDATE()
WHERE dept_manager.emp_no IN (
	SELECT employees.emp_no
	FROM employees
	WHERE gender = 'f')
	ORDER BY firstname;
	
	SELECT emp_no
FROM employees
WHERE gender = 'f';

SELECT emp_no
FROM dept_emp
WHERE to_date < CURDATE();
	
# 5 . Find all the employees who currently have a higher salary than the companies overall, historical average salary.	

SELECT employees.emp_no, CONCAT(first_name,' ', last_name), salary
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no 
		AND salaries.salary > (SELECT AVG(salaries.salary) 
			FROM salaries) 
WHERE to_date > CURDATE()
ORDER BY salary;

SELECT max(salary)
FROM salaries;

SELECT avg(salary)
FROM salaries;







