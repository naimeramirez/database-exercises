USE codeup_test_db;

SELECT * FROM albums WHERE artist_name = 'Pink Floyd';

SELECT release_date FROM albums WHERE id = 27;

SELECT genre FROM albums WHERE record_name = Nevermind;

SELECT * FROM albums WHERE release_date = 1990 AND 1999;

SELECT * FROM albums WHERE sales < 20;

SELECT * FROM albums WHERE genre = 'rock';

SHOW TABLE;

DESCRIBE albums;