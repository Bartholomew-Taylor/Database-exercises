USE employees;

# 2 Using the example in the Associative Table Joins section as a guide, write a query that shows each department along with the name of the current manager for that department.

SELECT departments.dept_name, CONCAT(employees.first_name, ' ', employees.last_name)
from departments
Join dept_manager USING(dept_no)
Join employees ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date LIKE '9999%';