use employees;
select database();
show tables;
describe employees; /* primary key emp_no: int, birth_date: date, first_name: varchar, last_name: varchar, gender: enum, hire_date: date */

/* Which table(s) do you think contain a numeric type column? Employees, salaries */ 

/* Which table(s) do you think contain a string type column? All of them except salaries more than likely contain a string */

/* Which table(s) do you think contain a date type column? dept_emp, dept_manager, employees are the most likely to contain a date */

/* What is the relationship between the employees and the departments tables? there is no column relationship between the two, their only relationship is existing in the same databases and through the dept_emp table
*/

SHOW CREATE TABLE dept_manager;

/*
CREATE TABLE `dept_manager` (
  `emp_no` int NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1
*/

