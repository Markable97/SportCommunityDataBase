create or replace view all_user_choice_event as
select e.id_event, pc.user_id, 'positive' as choice
from events e, positive_choice pc
where e.id_event = pc.events_id
union all 
select e.id_event, nc.user_id, 'negative' as choice
from events e, negative_choice nc
where e.id_event = nc.events_id
union all
select e.id_event, nec.user_id, 'neutral' as choice
from events e, neutral_choice nec
where e.id_event = nec.events_id