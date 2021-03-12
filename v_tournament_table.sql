create or replace view v_tournament_table as 
select s.id_season, l.id_league, l.league_name, d.id_division, d.division_name, t.id_team, t.team_name,
	    tt.games AS games,
        tt.wins AS wins,
        tt.draws AS draws,
        tt.losses AS losses,
        tt.goals_scored AS goals_scored,
        tt.goals_conceded AS goals_conceded,
        (tt.goals_scored - tt.goals_conceded) AS sc_con,
        tt.points AS points
from tournament_table tt, teams t, divisions d, leagues l, seasons s
where tt.team_id = t.id_team
and tt.division_id = d.id_division
and d.league_id = l.id_league
and tt.season_id = s.id_season

