drop function user_choice;
DELIMITER //
create function user_choice(a_event_id bigint, a_user_id bigint) returns varchar(10)
begin
	declare l_return varchar(10);
    
    select t.choice
    into l_return
    from all_user_choice_event t
    where t.user_id = a_user_id
    and t.id_event = a_event_id;
    
    if l_return is null then
     set l_return = 'none';
    end if;
    
    return l_return;
    
end;
//