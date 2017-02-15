--
select distinct name
from Reviewer
join rating using(rid)
join movie using (mid)
where title = "Gone with the Wind"

--
select name, title, stars
from Reviewer
join rating using(rid)
join movie using (mid)
where name = director
--
select name
from reviewer
union
select title
from movie
order by name,title
