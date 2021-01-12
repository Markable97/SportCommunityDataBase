drop trigger `sport_community_db`.`chat_of_team_AFTER_INSERT`;
DELIMITER //
CREATE TRIGGER `sport_community_db`.`chat_of_team_AFTER_INSERT` AFTER INSERT ON `chat_of_team` FOR EACH ROW
BEGIN
	insert into latest_message (user_id, friend_id, message_id, sender_id, receiver_id, message, message_date)
    select st.user_id, st.team_created_id, new.message_id, new.sender_id, new.teams_created_id, new.message, new.message_date
    from squad_team st
    where st.team_created_id = new.teams_created_id
    ON DUPLICATE KEY UPDATE message_id = new.message_id, sender_id = new.sender_id, receiver_id = new.teams_created_id, message = new.message, message_date = new.message_date;
END
