SELECT title,stars
FROM MOVIE
JOIN RATING
ON Movie.mID = Rating.mID

