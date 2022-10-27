USE employee;

# 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT departments.dept_name AS department, CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
from departments
Join dept_manager USING(dept_no)
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE '9999%'
ORDER BY department;

# 3 Find the name of all departments currently managed by women.

SELECT departments.dept_name as department, CONCAT(employees.first_name, ' ', employees.last_name) AS 'manager name'
from departments
Join dept_manager ON dept_manager.dept_no = departments.dept_no AND dept_manager.to_date LIKE '9999%'
Join employees ON employees.emp_no = dept_manager.emp_no AND employees.gender = 'f'
ORDER BY department ASC;

#4 Find the current titles of employees currently working in the Customer Service department.

SELECT titles.title AS title, count(title)
FROM dept_emp
JOIN titles on dept_emp.emp_no = titles.emp_no AND titles.to_date LIKE '9999%' AND dept_emp.to_date LIKE '9999%'
JOIN departments ON departments.dept_no = dept_emp.dept_no and dept_name = 'customer service'
GROUP BY title
ORDER BY title ASC;

#5 Find the current salary of all current managers.

SELECT DISTINCT departments.dept_name AS department, CONCAT(employees.first_name, ' ', employees.last_name) AS managers, salaries.salary AS salary
from departments
Join dept_manager USING(dept_no)
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE salaries.to_date LIKE '9999%' AND dept_manager.to_date > curdate()
ORDER BY department ASC;

#6 Find the number of current employees in each department.

SELECT departments.dept_no AS dept_no, departments.dept_name AS department, COUNT(employees.emp_no) AS num_emp
from departments
Join dept_emp USING(dept_no)
Join employees ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date LIKE "9999%"
GROUP BY department
ORDER BY dept_no ASC; 

#7 Which department has the highest average salary? Hint: Use current not historic information.

SELECT DISTINCT departments.dept_name AS department, ROUND(avg(salaries.salary),2) AS salary
FROM salaries
JOIN dept_emp ON dept_emp.emp_no = salaries.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE dept_emp.to_date LIKE "9999%" 
GROUP BY department
ORDER BY salary DESC
LIMIT 1;

#8 Who is the highest paid employee in the Marketing department?

SELECT DISTINCT CONCAT(employees.first_name, ' ', employees.last_name) AS emp_name, salaries.salary as salary
from salaries
JOIN employees on employees.emp_no = salaries.emp_no
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = "marketing"
GROUP BY emp_name, salary
ORDER BY salary DESC
LIMIT 1;

#9 Which current department manager has the highest salary?

SELECT DISTINCT CONCAT(employees.first_name, ' ', employees.last_name) AS emp_name, salaries.salary as salary
from salaries
JOIN employees on employees.emp_no = salaries.emp_no
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_manager.dept_no
WHERE salaries.to_date LIKE '9999%' AND dept_manager.to_date LIKE '9999%'
GROUP BY emp_name, salary
ORDER BY salary DESC
LIMIT 1;

#10 Determine the average salary for each department. Use all salary information and round your results.

SELECT DISTINCT departments.dept_name AS department, ROUND((avg(salaries.salary)), 0) AS average_salary
FROM salaries
JOIN dept_emp ON dept_emp.emp_no = salaries.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
GROUP BY department
ORDER BY average_salary DESC;
