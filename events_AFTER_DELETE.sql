CREATE DEFINER = CURRENT_USER TRIGGER `sport_community_db`.`events_AFTER_DELETE` AFTER DELETE ON `events` FOR EACH ROW
BEGIN
	delete from users_notifications
    where id_notification = old.id_event and team_id = old.teams_created_id;
END