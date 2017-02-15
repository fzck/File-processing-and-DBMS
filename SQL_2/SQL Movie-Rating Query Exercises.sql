-- Find the titles of all movies directed by Steven Spielberg.
select title
from movie
where director = "Steven Spielberg"

-- Find all years that have a movie that received a rating of 4 or 5, and sort them in increasing order. 
select distinct year 
from movie
join rating
on movie.mid = rating.mid
where stars >= 4
order by year asc

-- Find the titles of all movies that have no ratings. 
select title
from movie
where mid not in(select mid
                 from rating)

-- Some reviewers didn't provide a date with their rating. 
-- Find the names of all reviewers who have ratings with a NULL value for the date.
select name
from reviewer 
where rid in 
    (select rid
     from rating 
     where ratingdate is null)

-- Write a query to return the ratings data in a more readable format: 
-- reviewer name, movie title, stars, and ratingDate.
-- Also, sort the data, first by reviewer name, then by movie title, and lastly by number of stars. 
select name, title, stars, ratingdate
from reviewer
join rating
on reviewer.rid = rating.rid
join movie
on movie.mid = rating.mid
order by name, title, stars

-- For all cases where the same reviewer rated the same movie twice and gave it a higher rating the second time,
-- return the reviewer's name and the title of the movie. 
select name, title 
from
    (select name, count(rating.rid) as counter, rating.mid, title, stars, ratingdate
     from rating
     join reviewer 
     on rating.rid = reviewer.rid
     join movie 
     on movie.mid = rating.mid
     group by rating.rid) as rate
     where rate.counter > 1 limit 1

-- For each movie that has at least one rating, 
-- find the highest number of stars that movie received. 
-- Return the movie title and number of stars. Sort by movie title. 
select title, max(stars)
from movie
join rating
on movie.mid = rating.mid
group by movie.mid
order by title

-- For each movie, return the title and the 'rating spread',
-- that is, the difference between highest and lowest ratings given to that movie.
-- Sort by rating spread from highest to lowest, then by movie title.
select title, max(stars) - min(stars) as spread
from movie
join rating
on movie.mid = rating.mid
group by movie.mid
order by  spread desc, title

-- Find the difference between the average rating of movies released before 1980
-- and the average rating of movies released after 1980.
-- (Make sure to calculate the average rating for each movie, 
--  then the average of those averages for movies before 1980 and movies after. 
-- Don't just calculate the overall average rating before and after 1980.)
select avg(before.average) - avg(after.average)
from ( select avg(stars) as average
        from movie
        join rating
        on movie.mid = rating.mid
        where year < 1980 
        group by rating.mid ) as before, 
     ( select avg(stars) as average
        from movie
        join rating
        on movie.mid = rating.mid
        where year > 1980 
        group by rating.mid ) as after




