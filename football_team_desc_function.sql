CREATE DEFINER=`root`@`localhost` FUNCTION `football_team_desc`(a_team_id int) RETURNS varchar(100) CHARSET utf8mb4
BEGIN
	declare  l_desc VARCHAR(100);
    
    
    select concat(l.league_name, '| ',d.division_name)
    into l_desc
    from divisions d, leagues l, teams t
    where t.division_id = d.id_division
    and d.league_id = l.id_league
    and t.id_team = a_team_id;
    
RETURN l_desc;
END