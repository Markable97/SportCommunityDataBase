CREATE DEFINER=`root`@`localhost` TRIGGER `sport_community_db`.`teams_created_BEFORE_INSERT` BEFORE INSERT ON `teams_created` FOR EACH ROW
BEGIN
	declare l_team_name VARCHAR(45);
    if new.team_id is not null then	
	
        set new.team_name = (select team_name from teams where id_team = new.team_id);
    end if;
END