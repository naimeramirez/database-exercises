USE codeup_test_db;


SELECT release_date AS 'Albums released after 1991' FROM albums WHERE release_date > 1991;
DELETE FROM albums WHERE release_date > 1991;

SELECT genre AS 'Albums with genre of disco' FROM albums WHERE genre = 'disco';
DELETE FROM albums WHERE genre = 'disco';

SELECT record_name AS 'Albums with artist name of Whitney Houston' FROM albums WHERE artist_name = 'Whitney Houston';
DELETE FROM albums WHERE artist_name = 'Whitney Houston';


SELECT artist_name, release_date, genre FROM albums;