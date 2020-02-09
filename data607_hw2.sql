  
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS user_profiles;
DROP TABLE IF EXISTS user_reviews;

CREATE TABLE movies (
	movie_id integer PRIMARY KEY AUTO_INCREMENT,
    title varchar(60) NOT NULL,
    rotten_tomatoes_percent TINYINT
    );
    
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "Once Upon a Time in Hollywood", 85);
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "The Irishman", 96);
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "Joker", 68);
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "Avengers: Endgame", 94);
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "Marriage Story" , 95);
INSERT INTO movies ( title, rotten_tomatoes_percent ) VALUES ( "Uncut Gems", 92);
        
CREATE TABLE user_profiles (
	user_id integer PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(20) NOT NULL,
    age TINYINT
    );
    
INSERT INTO user_profiles ( first_name, age) VALUES ( "Tom", 32);
INSERT INTO user_profiles ( first_name, age) VALUES ( "Catherine", 62);
INSERT INTO user_profiles ( first_name, age) VALUES ( "Mike", 59);
INSERT INTO user_profiles ( first_name, age) VALUES ( "Jasmine", 34);
INSERT INTO user_profiles ( first_name, age) VALUES ( "Emma", 30);

CREATE TABLE user_reviews (
	user_id integer NOT NULL REFERENCES user_profiles(user_id),
    movie_id integer NOT NULL REFERENCES movies(movie_id),
    rating TINYINT
    );

INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 1, 2, 5);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 1, 4, 4);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 2, 1, 2);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 2, 6, 4);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 2, 4, 3);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 3, 1, 4);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 3, 2, 1);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 3, 6, 5);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 4, 1, 2);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 4, 3, 3);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 4, 5, 5);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 5, 1, 3);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 5, 3, 4);
INSERT INTO user_reviews ( user_id, movie_id, rating) VALUES ( 5, 5, 4);

SELECT u.first_name as "User", m.title as "Movie Title", ur.rating
FROM user_profiles u LEFT JOIN user_reviews ur ON u.user_id = ur.user_id
LEFT JOIN movies m ON m.movie_id = ur.movie_id
ORDER BY m.title;
