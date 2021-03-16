create or replace view v_matches as 
select m.id_match, 
       se.id_season,
       l.id_league,
       l.league_name,
	   d.division_name,
       d.id_division,
       m.id_tour,
       th.id_team as team_home_id,
       th.team_name as team_home,
       m.goal_home,
       m.goal_guest,
       tg.team_name as team_guest,
       tg.id_team as team_guest_id,
       date_format(m.match_date,'%d-%m-%y %H:%i') match_date,
       s.name_stadium,
       m.match_desc
from matches m
join teams th on th.id_team = m.team_home 
join teams tg on tg.id_team = m.team_guestname_
join seasons se on se.id_season = m.season_id
left join stadiums s on s.id_stadium = m.stadium_id
left join divisions d on d.id_division = m.division_id
join leagues l on l.id_league = d.league_id