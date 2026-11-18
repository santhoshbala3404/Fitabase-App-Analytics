create database fitabase;
use fitabase;

select * from dailyactivities;
select distinct id from dailyactivities;
select avg(loggedactivitiesdistance), avg(veryactivedistance), avg(moderatelyactivedistance), avg(lightactivedistance), avg(sedentaryactivedistance) from dailyactivities;
select avg(veryactiveminutes), avg(fairlyactiveminutes), avg(lightlyactiveminutes), avg(sedentaryminutes) from dailyactivities;
select id, round(avg(calories),3) as average_calories from dailyactivities group by id order by avg(calories) limit 10;
select id, totaldistance, trackerdistance from dailyactivities where totaldistance<>trackerdistance;

select distinct * from heartpersec limit 25;
select distinct id from heartpersec;
select id, avg(value) as AVERAGE_HEARTBEAT from heartpersec group by id order by avg(value);

select * from steppermin;
select id, sum(steps) as total_steps_walked_in_a_day from steppermin group by id order by sum(steps) desc;

select * from minutemets;
select id, round(avg(mets),2) as average_mets from minutemets group by id order by avg(mets) desc;


select * from sleeptime;
select round(avg(totalminutesasleep),2) as average_minutes_asleep, round(avg(totaltimeinbed),2) as average_sleeptime_time_in_bed from sleeptime;
select id, round(avg(totalminutesasleep),2) as average_minutes_asleep, round(avg(totaltimeinbed),2) as average_sleeptime_time_in_bed from sleeptime group by id;

select * from weightinfo; 
ALTER TABLE weightinfo DROP COLUMN fat;
select distinct id from weightinfo;
select id, avg(bmi),
case 
when 0<avg(bmi)<18.5 then 'Underweight'
when avg(bmi)>=18.5 and avg(bmi)<24.9 then 'Normal Weight'
when avg(bmi)>=24.9 and avg(bmi)<29.9 then 'Overweight'
else 'Obese'
end as bmi_indication
from weightinfo group by id;

desc table calories;
desc table caloriespermin;

select id, sum(calories) from calories group by id;
alter table caloriespermin rename column calories to calpermin;
select id, sum(calpermin) from caloriespermin group by id;

select c.id, c.total_calories, cpm.total_calpermin, abs(c.total_calories-cpm.total_calpermin) as difference 
from (select id, sum(calories) as total_calories from calories group by id) c
join (select id, round(sum(calpermin),2) as total_calpermin from caloriespermin group by id) cpm
on c.id=cpm.id;

select * from hourlyintensity;
alter table hourlyintensity drop column averageintensity;
select id, sum(totalintensity), avg(totalintensity) from hourlyintensity group by id;







