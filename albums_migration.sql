DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
                        id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                        artist VARCHAR(255) DEFAULT 'NONE',
                        name  VARCHAR(100) NOT NULL,
                        release_date  INT UNSIGNED NOT NULL,
                        sales FLOAT,
                        genre  VARCHAR(100) NOT NULL,
                        PRIMARY KEY (id)
);