-- COMMANDS
-- Tables
-- columns

SELECT title
FROM Movie
WHERE director = "Steven Spielberg"
--
SELECT DISTINCT year 
FROM Movie
JOIN Rating
ON Movie.mID = Rating.mID
WHERE stars >= 4
ORDER BY year ASC
--
SELECT title
FROM Movie
WHERE mID NOT IN (SELECT mID 
                  FROM Rating)
--
SELECT name
FROM Reviewer
JOIN Rating
ON Reviewer.rID = Rating.rID
WHERE ratingDate IS null
--
SELECT name, title, stars, ratingDate
FROM Reviewer
JOIN Rating
ON Reviewer.rID = Rating.rID
JOIN Movie
ON Movie.mID = Rating.mID
ORDER BY name, title, stars
--
SELECT name, title
FROM (SELECT name, title, count(Rating.rID) as counter
      FROM Reviewer
      JOIN Rating
      ON Reviewer.rID = Rating.rID
      JOIN Movie
      ON Movie.mID = Rating.mID
      GROUP BY Rating.rID) as rate
      WHERE rate.counter > 1 LIMIT 1
      -- ALTERNATIVE
SELECT name, title
FROM (SELECT name, title, count(Rating.rID) as counter
FROM Reviewer
INNER JOIN Rating USING(rID)
INNER JOIN Movie USING(mID)
GROUP BY Rating.rID) as rate
WHERE rate.counter > 1 LIMIT 1
      
--
SELECT title, MAX(stars)
FROM Movie
JOIN Rating
ON Movie.mID = Rating.mID
GROUP BY Movie.mID
ORDER BY title
--
SELECT title, MAX(stars) - MIN(stars) AS spread
FROM Movie
INNER JOIN Rating USING (mID)
GROUP BY mID
ORDER BY spread DESC, title
--
SELECT AVG(before.average) - AVG(after.average)
FROM (SELECT AVG(stars) as average
      FROM Movie
      INNER JOIN Rating USING(mID)
      WHERE year < 1980 
      GROUP BY mID) as before,
     (SELECT AVG(stars) as average
      FROM Movie
      INNER JOIN Rating USING(mID)
      WHERE year > 1980
      GROUP BY mID) as after
