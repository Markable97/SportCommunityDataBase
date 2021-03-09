CREATE DEFINER = CURRENT_USER TRIGGER `sport_community_db`.`events_AFTER_INSERT` AFTER INSERT ON `events` FOR EACH ROW
BEGIN
	insert into users_notifications (user_id, id_notification, notification_type, team_id, team_name)
    select user_id, new.id_event, 'event', t.team_created_id, tc.team_name
	from squad_team t, teams_created tc
	where t.team_created_id = new.teams_created_id
	and t.status_invite in ('admin', 'in team')
	and tc.id_team_created = t.team_created_id;
END