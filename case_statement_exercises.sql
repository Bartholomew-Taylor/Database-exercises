USE employees;

#1. Write a query that returns all employees, their department number, their start date, their end date, and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT CONCAT(first_name, ' ', last_name) AS full_name, 
		dept_no AS dept_no, 
		 from_date AS start_date, 
		 to_date AS end_date, 
		IF(to_date > CURDATE(), true, false) AS is_current_employee
	FROM employees
	 JOIN dept_emp USING(emp_no)
	 JOIN departments USING(dept_no);
	 
	 

#2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.

SELECT CONCAT(first_name, ' ', last_name) AS full_name,
   CASE 
     WHEN LOWER(LEFT(last_name, 1)) between 'a' and 'h' then 'A-H'
     WHEN LOWER(LEFT(last_name, 1)) between 'i' and 'q' then 'I-Q'
     WHEN LOWER(LEFT(last_name, 1)) between 'r' and 'z' then 'R-Z'
   END AS 'alpha_group'
FROM employees;


#3. How many employees (current or previous) were born in each decade?

SELECT count(*) AS num_of_emps,
	CASE 
		WHEN birth_date LIKE '196%' THEN '60s'
	   ELSE '50s' 
	   END AS decade	
FROM employees
GROUP BY decade;



#4. What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT ROUND(AVG(salary),2) AS AVG_SALARY,
 CASE 
 	WHEN dept_name IN ('research','development') THEN 'R&D'
 	WHEN dept_name IN ('sales', 'marketing') THEN 'Sales_&_Marketing'
 	WHEN dept_name IN ('production','quality management') THEN 'Prod_&_Q&M'
 	WHEN dept_name IN ('finance','human resources') THEN 'Finance_&_HR'
 	ELSE 'Customer_Service'
 	END AS name_of_dept
FROM departments
JOIN dept_emp USING(dept_no)
JOIN salaries USING(emp_no)
WHERE dept_emp.to_date > CURDATE()
	AND salaries.to_date > CURDATE()
GROUP BY name_of_dept;



