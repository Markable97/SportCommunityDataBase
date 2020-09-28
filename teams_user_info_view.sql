create or replace view teams_user_info as
select 
st.team_created_id team_id,
	   t.team_name team_name,
       football_team_desc(t.team_id) team_desc,
       t.leader_id leader_id,
       (select user_name from users u where u.id_user = t.leader_id) leader_name,
       t.image team_image_url,
       st.user_id,
	   (select user_name from users u where u.id_user = st.user_id) user_name,
       a.amplua_name amplua,
       ps.games,
       ps.goals,
       ps.assists,
	   ps.yellow_cards yellow,
       ps.red_cards red,
       st.status_invite
from squad_team st
join teams_created t on st.team_created_id = t.id_team_created
left join squad_team_has_players shp on st.team_created_id = shp.team_created_id and st.user_id = shp.user_id
left join teams tt on tt.id_team = t.team_id
left join players p on p.id_player = shp.player_id
left join players_statistics ps on ps.team_id = tt.id_team and ps.player_id = p.id_player
left join amplua a on a.id_amplua = p.amplua_id
where st.status_invite in ('in team', 'admin')




