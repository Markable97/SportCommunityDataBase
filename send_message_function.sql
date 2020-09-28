drop function send_message;
DELIMITER //
create function send_message(a_sender_id BIGINT, a_receiver_id BIGINT, a_message TEXT) returns TEXT
begin 
	
    declare l_message_id BIGINT;
    
    declare l_token TEXT;
    
    
    declare l_message_date BIGINT;
    
    SELECT `AUTO_INCREMENT`
    into l_message_id
	FROM  INFORMATION_SCHEMA.TABLES
	WHERE TABLE_SCHEMA = 'sport_community_db'
	AND   TABLE_NAME   = 'messages'; 
    
	select token
    into l_token
    from users
    where user_id = a_receiver_id;
    
    set l_message_date = UNIX_TIMESTAMP();
    insert into messages
    set sender_id = a_sender_id,
		receiver_id = a_receiver_id,
        message = a_message,
        message_date = l_message_date;
    
  
    
	return concat_ws(' ', l_message_date, l_message_id, l_token);   
    
END; //