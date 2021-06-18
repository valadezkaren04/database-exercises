USE codeup_test_db;

/*  select:
 *  The name of all albums by Pink Floyd.
 *  The year Sgt. Pepper's Lonely Hearts Club Band was released
 *  The genre for Nevermind
 *  Which albums were released in the 1990s
 *  Which albums had less than 20 million certified sales
 *  All the albums with a genre of "Rock". Why do these query results not include albums
    with a genre of "Hard rock" or "Progressive rock"?
 */

 SELECT 'All from Pink Floyd' AS '';
 SELECT * FROM albums WHERE artist = 'Pink Floyd'; /* calls all the Pink Floyd albums */

 SELECT 'The year Sgt. Pepper''s Lonely Hearts Club Band was released' AS '';
 SELECT release_date FROM albums WHERE name = 'Pepper''s Lonely Hearts Club Band'; /* gets the release date for specific album */

 SELECT 'The genre for Nevermind' AS 'Nirvana album';
 SELECT genre FROM albums WHERE name = 'Nevermind'; /* gets the genre for album Nevermind */

 SELECT 'Albums released in the 90''s' AS '';
 SELECT * FROM albums WHERE release_date BETWEEN 1990 AND 1999; /* gets all the albums that were released in the 1990's */

 SELECT 'Less than 20 mil certified sales' AS '';
 SELECT * FROM albums WHERE sales < 20; /* gets albums with sales less than 20 */

 SELECT 'Rock albums' AS '';
 SELECT * FROM albums WHERE genre = 'Rock'; /* gets albums with the genre of rock */
