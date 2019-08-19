create view WLM_QUEUE_STATE_VW as
select (config.service_class-5) as queue
, trim (class.condition) as description
, config.num_query_tasks as slots
, config.query_working_mem as mem
, config.max_execution_time as max_time
, config.user_group_wild_card as "user_*"
, config.query_group_wild_card as "query_*"
, state.num_queued_queries queued
, state.num_executing_queries executing
, state.num_executed_queries executed
from
STV_WLM_CLASSIFICATION_CONFIG class,
STV_WLM_SERVICE_CLASS_CONFIG config,
STV_WLM_SERVICE_CLASS_STATE state
where
class.action_service_class = config.service_class
and class.action_service_class = state.service_class
and config.service_class > 4
order by config.service_class;

select * from wlm_queue_state_vw;

create view WLM_QUERY_STATE_VW as
select query, (service_class-5) as queue, slot_count, trim(wlm_start_time) as start_time, trim(state) as state, trim(queue_time) as queue_time, trim(exec_time) as exec_time
from stv_wlm_query_state;
select * from wlm_query_state_vw;

select * from wlm_queue_state_vw;

create view WLM_QUERY_STATE_VW as
select query, (service_class-5) as queue, slot_count, trim(wlm_start_time) as start_time, trim(state) as state, trim(queue_time) as queue_time, trim(exec_time) as exec_time
from stv_wlm_query_state;
--run this in a seperate terminal
select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid < 100000;
--run this in previous terminal
select * from wlm_queue_state_vw;
select * from wlm_query_state_vw;
--after congiguring worl load managementrun the following query
select * from wlm_queue_state_vw;
select * from wlm_query_state_vw;


set query_group to test;
select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid <40000;
select * from wlm_query_state_vw;
select * from wlm_queue_state_vw;
reset query_group;
select avg(l.priceperticket*s.qtysold) from listing l, sales s where l.listid <40000;
select * from wlm_queue_state_vw;
select * from wlm_query_state_vw;
