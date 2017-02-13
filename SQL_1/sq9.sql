SELECT name, title, stars
FROM REVIEWER
JOIN RATING
ON Rating.rID = Reviewer.rID
JOIN MOVIE

ON Movie.mID = Rating.mID


