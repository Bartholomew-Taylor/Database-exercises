use employees;
select database();
show tables;
describe employees; /* primary key emp_no: int, birth_date: date, first_name: varchar, last_name: varchar, gender: enum, hire_date: date */

/* Which table(s) do you think contain a numeric type column? Employees, salaries */ 

/* Which table(s) do you think contain a string type column? All of them except salaries more than likely contain a string */

/* Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees are the most likely to contain a date */

/* What is the relationship between the employees and the departments tables? there is no column relationship between the two, their only relationship is existing in the same databases 
*/

SHOW CREATE TABLE dept_manager;
