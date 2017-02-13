SELECT title, AVG(stars)
FROM MOVIE
JOIN RATING
ON Movie.mID = Rating.mID
GROUP BY title