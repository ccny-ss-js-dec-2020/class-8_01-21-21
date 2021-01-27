/*
 1. Import the movies.csv file into MySql
    so that there should be a movies table in your database populated with data
 2. Get the following data using sql queries:
    1. Select all of the movies
    2. Select all of the movies where the name is casino
    3. Select all of the movies that have a US Gross greater than a million
    4. Select all of the movies where the release date is in 1994
    5. Select all of the movies where the distributor is Sony Pictures
    6. Select all of the movies with an MPAA Rating of R and a source of Based on a Book/Short Story
    7. Select all of the movies with a major genre of Drama or Comedy
    8. Select all of the movies where the imdb rating is greater than or equal to 8 and the rotten tomatoes rating is greater than or equal to 90
    9. Select all of the movies with a production budget less than 6,500,000
*/

/* 1 */
SELECT * FROM movies;

/* 2 */
SELECT * FROM movies WHERE title='casino';

/* 3 */
SELECT * FROM movies WHERE usGross > 1000000;

/* 4 */
SELECT * FROM movies WHERE releaseDate LIKE '%1994';

/* 5 */
SELECT * FROM movies WHERE distributor = 'Sony Pictures';

/* 6 */
SELECT * FROM movies WHERE mpaaRating='R' AND source='Based on Book/Short Story';

/* 7 */
SELECT * FROM movies WHERE majorGenre='Drama' OR majorGenre='Comedy';

/* 8 */
SELECT * FROM movies WHERE imdbRating >= 8 AND rottenTomatoesRating >= 90;

/* 9 */
SELECT * FROM movies WHERE productionBudget < 6500000;
