USE noether_2022;

DROP TABLE IF EXISTS my_numbers;

CREATE TEMPORARY TABLE my_numbers(
	n INT UNSIGNED NOT NULL, 
	 name VARCHAR(10) NOT NULL
	


);

SELECT *
FROM my_numbers;