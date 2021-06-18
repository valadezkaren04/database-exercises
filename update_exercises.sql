USE codeup_test_db;

SELECT '*************************************' AS '';
 SELECT 'ALl albums' AS '';
 SELECT * FROM albums; /* shows all the albums */

 SELECT '*************************************' AS '';
 SELECT 'All albums released before 1980''s' AS '';
 SELECT name FROM albums WHERE release_date < 1980;
 SELECT release_date FROM albums WHERE release_date < 1980; /* gets all the albums released before 1980 */

 SELECT '*************************************' AS '';
 SELECT 'Michael Jackson''s albums' AS '';
 SELECT name FROM albums WHERE artist = 'Michael Jackson'; /* gets all MJ's albums */

 /* Update */
 UPDATE albums
 SET sales = sales * 10; /* makes sales 10 x the sales */
 SELECT sales FROM albums; /* displays updated sales */

 /* Update */
 UPDATE albums
 SET release_date = release_date - 100
 WHERE release_date <= 1980; /* changes all 1980's albums to 1800's */

 /* Update */
 UPDATE albums
 SET artist = 'Peter Jackson'
 WHERE artist = 'Michael Jackson'; /* replaces MJ with PJ */

 SELECT 'Michael Jackson as Peter Jackson' AS '';
 SELECT artist FROM albums WHERE artist = 'Peter Jackson';

