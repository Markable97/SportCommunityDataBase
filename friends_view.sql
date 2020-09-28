create or replace view friends_view as 
select s.id_user, 
	   f.friend_id, 
       (select user_name from users where id_user = f.friend_id) user_name,
       (select status from users where id_user = f.friend_id) user_status,
       f.status status_friend
from friends f, users s
where f.user_id = s.id_user