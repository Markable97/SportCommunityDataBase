CREATE DEFINER=`root`@`localhost` TRIGGER `sport_community_db`.`squad_team_AFTER_DELETE` AFTER DELETE ON `squad_team` FOR EACH ROW
BEGIN
	declare l_leader_id BIGINT;
    
	delete from users_notifications
    where team_id = old.team_created_id and user_id = old.user_id
    and notification_type = 'event';
    
   
    select leader_id
    into l_leader_id
    from teams_created
    where id_team_created = old.team_created_id;
    
    if old.user_id = l_leader_id then
		delete from teams_created
        where id_team_created = old.team_created_id;
    else
		delete from latest_message
		where friend_id = old.team_created_id
        and user_id = old.user_id;
    end if;
END