DELIMITER //
CREATE  TRIGGER `sport_community_db`.`messages_AFTER_INSERT` AFTER INSERT ON `messages` FOR EACH ROW
BEGIN
	insert into latest_message (user_id, friend_id, message_id, sender_id, receiver_id, message, message_date)
    values(new.sender_id, new.receiver_id, new.message_id, new.sender_id, new.receiver_id, new.message, new.message_date)
    ON DUPLICATE KEY UPDATE message_id = new.message_id, sender_id = new.sender_id, receiver_id = new.receiver_id, message = new.message, message_date = new.message_date;
    
    insert into latest_message (user_id, friend_id, message_id, sender_id, receiver_id, message, message_date)
    values(new.receiver_id, new.sender_id, new.message_id, new.sender_id, new.receiver_id, new.message, new.message_date)
    ON DUPLICATE KEY UPDATE message_id = new.message_id, sender_id = new.sender_id, receiver_id = new.receiver_id, message = new.message, message_date = new.message_date;
    
END; //
