create or replace view events_team as
select ev.id_event, ev.teams_created_id team_id, ev.event_name, ev.event_date, ev.event_location, 
	ev.positive_name, (select count(1) from positive_choice where events_id = ev.id_event) positive_count, 
    ev.negative_name, (select count(1) from negative_choice where events_id = ev.id_event) negative_count, 
    ev.neutral_name, (select count(1) from neutral_choice where events_id = ev.id_event) neutral_count
from events ev;