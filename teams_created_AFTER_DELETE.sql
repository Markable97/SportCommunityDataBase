CREATE DEFINER=`root`@`localhost` TRIGGER `sport_community_db`.`teams_created_AFTER_DELETE` AFTER DELETE ON `teams_created` FOR EACH ROW
BEGIN
	delete from latest_message
    where friend_id = old.id_team_created;
END