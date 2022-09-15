create or replace view v_players_statistics_goals as 
select ps.division_id, t.id_team as team_id, t.team_name, p.id_player player_id, p.player_name, ps.goals + ps.penalty as  points, a.amplua_name
from players_statistics ps, teams t, players p, amplua a
where ps.player_id = p.id_player
and ps.team_id = t.id_team
and p.amplua_id = a.id_amplua
order by ps.goals desc;

create or replace view v_players_statistics_assists as 
select ps.division_id, t.id_team as team_id, t.team_name, p.id_player player_id, p.player_name, ps.assists as  points, a.amplua_name
from players_statistics ps, teams t, players p, amplua a
where ps.player_id = p.id_player
and ps.team_id = t.id_team
and p.amplua_id = a.id_amplua
order by ps.assists desc;

create or replace view v_players_statistics_yellows as 
select ps.division_id, t.id_team as team_id, t.team_name, p.id_player player_id, p.player_name, ps.yellow_cards as  points, a.amplua_name
from players_statistics ps, teams t, players p, amplua a
where ps.player_id = p.id_player
and ps.team_id = t.id_team
and p.amplua_id = a.id_amplua
and ps.yellow_cards > 0
order by ps.yellow_cards desc;

create or replace view v_players_statistics_reds as 
select ps.division_id, t.id_team as team_id, t.team_name, p.id_player player_id, p.player_name, ps.red_cards as  points, a.amplua_name
from players_statistics ps, teams t, players p, amplua a
where ps.player_id = p.id_player
and ps.team_id = t.id_team
and p.amplua_id = a.id_amplua
order by ps.red_cards desc;