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
