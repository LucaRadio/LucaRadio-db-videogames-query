--1 select * from software_houses
--2 select * from players where city = 'Rogahnland'
--3 select * from players where name like '%a'
--4 select * from reviews where player_id= 800
--5 select count(*) from tournaments where year=2015
--6 select * from awards where description like '%facere%'
--7 select distinct videogame_id from category_videogame where category_id = 2 or category_id = 6
--8 select * from reviews where rating >=2 and rating <=4
--9 select * from videogames where release_date like '2020%'
--10 select distinct videogame_id  from reviews where rating = 5
--11 select count(id) as number_of_votes, AVG(rating) as average from reviews where videogame_id= 412
--12 select count(*) from videogames where software_house_id = 1 and release_date like  '2018%'




--1 select count(*) from software_houses group by  country
--2 select count(*) as number_of_reviews,videogame_id from reviews group by videogame_id\
--3 select count(*) as number_of_videogames,pegi_label_id from pegi_label_videogame group by pegi_label_id order by pegi_label_id
--4 select count(*) as number_of_videogames,YEAR(release_date) as year from videogames group by YEAR(release_date) 
--5 select count(*) as number_of_videogames,device_id from device_videogame group by device_id
--6 select videogame_id,avg(rating) from reviews group by videogame_id order by avg(rating) 


--1 select distinct player_id from reviews inner join players on players.id= reviews.player_id
--2 select distinct videogame_id  from tournament_videogame inner join tournaments on tournaments.id=tournament_videogame.tournament_id where year = 2016
--3 select * from category_videogame inner join categories on categories.id = category_videogame.category_id 
--4 select distinct software_houses.* from videogames inner join software_houses on software_houses.id = videogames.software_house_id where YEAR(release_date)>2020
--5 select award_id,software_houses.name from award_videogame inner join videogames on award_videogame.videogame_id = videogames.id inner join software_houses on software_houses.id = videogames.software_house_id order by software_houses.id 

--6 select distinct videogames.name, categories.id, pegi_labels.id from reviews
--		inner join videogames on videogames.id = reviews.videogame_id
--		inner join category_videogame on category_videogame.videogame_id = videogames.id
--		inner join pegi_label_videogame on pegi_label_videogame.videogame_id = videogames.id
--		inner join categories on categories.id = category_videogame.category_id
--		inner join pegi_labels on pegi_labels.id = pegi_label_videogame.pegi_label_id
--		where rating >= 4



--7 select distinct videogames.id from tournament_videogame
--          inner join tournaments on tournaments.id = tournament_videogame.tournament_id
--          inner join videogames on videogames.id = tournament_videogame.videogame_id
--          inner join player_tournament on tournaments.id = player_tournament.tournament_id
--          inner join players on players.id = player_tournament.player_id
--          where players.name like 'S%'


--8 select tournaments.city from videogames
--			inner join tournament_videogame on tournament_videogame.videogame_id = videogames.id
--			inner join tournaments on tournaments.id = tournament_videogame.tournament_id
--			inner join award_videogame on award_videogame.videogame_id = videogames.id
--			inner join awards on awards.id = award_videogame.award_id
--			where awards.name like '%anno%' and award_videogame.year = 2018

--9 select players.id from videogames
--			inner join tournament_videogame on tournament_videogame.videogame_id = videogames.id
--			inner join tournaments on tournaments.id = tournament_videogame.tournament_id
--			inner join award_videogame on award_videogame.videogame_id = videogames.id
--			inner join awards on awards.id = award_videogame.award_id
--			inner join player_tournament on player_tournament.tournament_id= tournaments.id
--			inner join players on players.id = player_tournament.player_id
--			where award_videogame.year = 2018 and awards.name like '%atteso%' and tournaments.year = 2019
	
	
--10  select top 1 software_houses.*,videogames.* from videogames
--			inner join software_houses on software_houses.id = videogames.software_house_id
--			order by videogames.release_date


--11 select top 1 videogames.name,videogames.id,videogames.release_date, count(reviews.id)as count_of_reviews from reviews
--			inner join videogames on videogames.id = reviews.videogame_id 
--			group by videogames.name,videogames.id,videogames.release_date
--			order by count_of_reviews desc


--12 select top 1 software_houses.id , count(awards.id) as count_of_awards from videogames
--			inner join award_videogame on award_videogame.videogame_id = videogames.id
--			inner join awards on awards.id = award_videogame.award_id
--			inner join software_houses on software_houses.id= videogames.software_house_id
--          where award_videogame.year between 2015 and 2016
--			group by software_houses.id
--			order by count_of_awards desc

--13 select distinct categories.id from videogames
--			inner join category_videogame on category_videogame.videogame_id= videogames.id
--			inner join categories on categories.id = category_videogame.category_id
--			inner join reviews on reviews.videogame_id = videogames.id 
--			group by categories.id,videogames.id
--			having avg(reviews.rating)<2




