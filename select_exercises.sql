
	SELECT *
	FROM albums;
	/* 3a. how many rows are in the album table? 31*/
	
	SELECT DISTINCT artist
	FROM albums;
	/*a. How many rows are in the albums table?

	b. How many unique artist names are in the albums table?

	c. What is the primary key for the albums table?

	d. What is the oldest release date for any album in the albums table? 			What is the most recent release date?
 
	3b. 23 distinct names
	3c. the ID column is distinct
	3d. 1967 and 2011 */
	
	
	SELECT name as 'Pink Floyd Albums'
	FROM albums
	WHERE artist = 'Pink Floyd';
	/* a. The name of all albums by Pink Floyd. outputs Pink Floyd albums */
	
	SELECT release_date
	FROM albums
	WHERE name = 'SGT. Pepper\'s Lonely Hearts Club Band';
	/* b. The year Sgt. Pepper's Lonely Hearts Club Band was released? outputs album release date */
	
	SELECT genre
	FROM albums
	WHERE name = 'Nevermind';
	
	/* c. The genre for the album Nevermind? outputs genre of one of the best albums of all time */
	
	SELECT name
	FROM albums
	WHERE release_date BETWEEN 1990 AND 1999;
	/* d. Which albums were released in the 1990s? outputs albums released in the 90s */
	
	SELECT name
	FROM albums
	WHERE sales < 20;
	/* e. Which albums had less than 20 million certified sales?  outputs albums with sales below 20 million */
	
	SELECT name
	FROM albums
	WHERE genre = 'Rock';
	/* f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?  outputs albums with genre rock but only that word, sql doesn't register it as related to soft, prog or other rock forms /*
	
	