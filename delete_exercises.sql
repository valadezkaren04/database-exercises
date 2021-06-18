USE codeup_test_db;

SELECT 'Albums released after 1991' AS '';
# SELECT * FROM albums WHERE release_date > 1991; /* albums released after 1991 */
DELETE FROM albums WHERE release_date > 1991;

SELECT 'Albums with genre disco' AS '';
# SELECT * FROM albums WHERE genre = 'disco'; /* albums with the genre 'disco' */
DELETE FROM albums WHERE genre = 'disco';

SELECT 'Albums by Meat Loaf' AS '';
# SELECT * FROM albums WHERE artis = 'Guns N'' Roses'; /* albums by 'Whitney Houston' (...or maybe an artist of your choice) */
DELETE FROM albums WHERE artis = 'Meat Loaf';