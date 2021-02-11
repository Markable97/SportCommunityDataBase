drop function is_leader;
DELIMITER //
create function is_leader(a_team_id BIGINT, a_user_id BIGINT) returns Int
begin
	declare l_is_leader int;

	select count(1)
    into l_is_leader
    from squad_team st
    where status_invite in ('admin')#Дальше будет возможность добавлять помощников
    and st.team_created_id = a_team_id
    and st.user_id = a_user_id ;
    
    return l_is_leader;
end;
//
