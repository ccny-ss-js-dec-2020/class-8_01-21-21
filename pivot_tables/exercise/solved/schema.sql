/*
  1. Create a performers table (i.e. Actors & Actresses)
  2. Create a performances table (i.e. tv show names, movies name)
  3. Insert records into both of those tables
  4. Create a pivot talbe called 'performers_performances'
  5. Create records to represent the many to many join between the two tables
*/
CREATE TABLE performers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);

CREATE TABLE performances (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255) UNIQUE,
  type VARCHAR(255)
);

INSERT INTO performers (name) VALUES ('Nicolas Cage');
INSERT INTO performers (name) VALUES ('Elizabeth Shue');

INSERT INTO performances (title, type) VALUES ('Leaving Las Vegas', 'Movie');
INSERT INTO performances (title, type) VALUES ('Con Air', 'Movie');
INSERT INTO performances (title, type) VALUES ('Karate Kid', 'Movie');

CREATE TABLE performers_performances (
  performer_id INT NOT NULL,
  performance_id INT NOT NULL,
  FOREIGN KEY performer_id REFERENCES performers(id),
  FOREIGN KEY performance_id REFERENCES performances(id)
);

INSERT INTO performers_performances (performer_id, performance_id) VALUES (1,1);
INSERT INTO performers_performances (performer_id, performance_id) VALUES (2,1);
INSERT INTO performers_performances (performer_id, performance_id) VALUES (1,2);
INSERT INTO performers_performances (performer_id, performance_id) VALUES (2,3);

/* To get all of the performance id's of the Nicolas Cage Moves */
SELECT performance_id FROM performers_performances
INNER JOIN performers
ON performers_performances.performer_id=performers.id
WHERE performers.id=1;

/* To get all of the performance names of Nicolas Cage Movies */
SELECT performances.title FROM performers_performances
INNER JOIN performers
INNER JOIN performances
ON performers_performances.performer_id=performers.id
AND performers_performances.performance_id=performances.id
WHERE performers.name='Nicolas Cage';

/* To get all of the performance names of Elizabeth Shue Movies */
SELECT performances.title FROM performers_performances
INNER JOIN performers
INNER JOIN performances
ON performers_performances.performer_id=performers.id
AND performers_performances.performance_id=performances.id
WHERE performers.name='Elizabeth Shue';

/* To get all of the performers id's in Con Air */
SELECT performer_id FROM performers_performances
INNER JOIN performances
ON performers_performances.performance_id=performances.id
WHERE performances.id=1;

/* To get all of the performers names in Con Air */
SELECT performers.name FROM performers_performances
INNER JOIN performances
INNER JOIN performers
ON performers_performances.performance_id=performances.id
AND performers_performances.performer_id=performers.id
WHERE performances.title='Con Air';
