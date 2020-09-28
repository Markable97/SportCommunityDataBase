CREATE DEFINER=`root`@`localhost` TRIGGER `sport_community_db`.`teams_created_AFTER_INSERT` AFTER INSERT ON `teams_created` FOR EACH ROW
BEGIN
	insert into squad_team
    set user_id = new.leader_id,
		team_created_id = new.id_team_created,
        type_user = 1;
END