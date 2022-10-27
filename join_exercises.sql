USE employees;

# 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name)
from departments
Join dept_manager USING(dept_no)
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE '9999%';

# 3 Find the name of all departments currently managed by women.

SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name)
from departments
Join dept_manager USING(dept_no)
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE '9999%' AND employees.gender = 'f';

#4 Find the current titles of employees currently working in the Customer Service department.

SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name)
from departments
Join dept_emp USING(dept_no)
Join employees ON employees.emp_no = dept_emp.emp_no
WHERE departments.dept_name = "Customer Service" AND dept_emp.to_date LIKE "9999%";

#5 Find the current salary of all current managers.

SELECT DISTINCT departments.dept_name AS department, CONCAT(employees.first_name, ' ', employees.last_name) AS managers, salaries.salary AS salary
from departments
Join dept_manager USING(dept_no)
JOIN salaries ON salaries.emp_no = dept_manager.emp_no
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE salaries.to_date LIKE '9999%';



