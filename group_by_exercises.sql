USE employees;

# 2. The return has seven distinct titles

SELECT DISTINCT title
FROM titles; 


# 3. Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY.

SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name like 'e%e';

#4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.

SELECT first_name, last_name
FROM employees
GROUP BY first_name, last_name
HAVING last_name like 'e%e';


#5 write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.

SELECT last_name
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';
#Chleq, Lindqvist, Qiwen

#6 Add a COUNT() to your results (the query above) to find the number of employees with the same last name.

SELECT last_name, count(last_name)
FROM employees
GROUP BY last_name
HAVING last_name LIKE '%q%' AND NOT last_name LIKE '%qu%';

#7 Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.

SELECT first_name, gender, COUNT(*) AS totalcount
FROM employees
GROUP BY first_name, gender
HAVING first_name IN('irena', 'vidya', 'maya')
ORDER BY first_name;


# 8 Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT lower(CONCAT(SUBSTR(first_name, 1,1),SUBSTR(last_name,1,4),'_', SUBSTR(birth_date,6,2), SUBSTR(birth_date,3,2))) AS username, count(*) AS username_count
FROM employees
GROUP BY username
HAVING username_count > 1 #this is the bonus part
ORDER BY username_count desc; 
#yes there are 13,251 usernames used more than once

SELECT emp_no, avg(salary)
FROM salaries
GROUP BY emp_no;

