create or replace view v_players_in_match as
select pm.match_id,
	   pm.team_id,
       t.team_name,
	   pm.player_id,
       p.player_name,
       pm.goals,
       pm.assists,      
       pm.penalty,
       pm.penalty_out,
       pm.yellow,
       pm.red,
       pm.own_goal 
from players_in_match pm
join players p on pm.player_id = p.id_player
join matches m on pm.match_id = m.id_match
join teams t on pm.team_id = t.id_team