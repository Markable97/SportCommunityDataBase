drop procedure add_friend_request;
DELIMITER //
create procedure add_friend_request(a_user_id BIGINT, a_friend_id BIGINT)
BEGIN
	
insert into friends
   set user_id = a_user_id,
	   friend_id = a_friend_id,
       status = 'head_request';
insert into friends
   set user_id = a_friend_id,
	   friend_id= a_user_id,
       status = 'request';
	
END; //

DELIMITER //
create procedure add_friend_complete(a_user_id BIGINT, a_friend_id BIGINT)
BEGIN
	
    update friends
    set status = 'friend'
    where user_id =  a_user_id and
	   friend_id= a_friend_id;
    
    update friends
    set status = 'friend'
    where user_id = a_friend_id and
	   friend_id= a_user_id;
       
END; //

drop procedure add_friend_delete;
DELIMITER //
create procedure add_friend_delete(a_user_id BIGINT, a_friend_id BIGINT)
BEGIN
	delete from friends 
    where (user_id = a_user_id and friend_id = a_friend_id) or (user_id = a_friend_id and friend_id = a_user_id);
END; //
