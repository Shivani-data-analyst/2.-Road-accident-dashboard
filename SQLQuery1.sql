create database road_accident;
use road_accident;
select * from road_accident;

select sum(number_of_casualties) as CY_causalties
from road_accident;

--Current year causalties
select sum(number_of_casualties) as CY_causalties
from road_accident
where year(accident_date) = 2022;

--current year causalties in comparison with road surface
select sum(number_of_casualties) as CY_causalties
from road_accident
where year(accident_date) = 2022 and road_surface_conditions = 'Dry';

--current year accidents
select count(distinct accident_index) as CY_Accidents
from road_accident
where year(accident_date) = 2022;

--current year fatal causalties
select sum(number_of_casualties) as CY_Fatal_Causalties
from road_accident
where year(accident_date) = 2022 and accident_severity = 'Fatal';

--total fatal causalties
select sum(number_of_casualties) as Fatal_Causalties
from road_accident
where accident_severity = 'Fatal';

--total serious causalties
select sum(number_of_casualties) as Serious_Causalties
from road_accident
where accident_severity = 'Serious';

--current year seroius causalties
select sum(number_of_casualties) as Serious_Causalties
from road_accident
where year(accident_date) = 2022 and accident_severity = 'Serious';

--total slight causalties
select sum(number_of_casualties) as Slight_Causalties
from road_accident
where accident_severity = 'Slight';

--current year
select sum(number_of_casualties) as Slight_Causalties
from road_accident
where year(accident_date) = 2022 and accident_severity = 'Slight';


select cast(sum(number_of_casualties) as decimal(10,2)) *100 / (select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident)
from road_accident
where accident_severity = 'Slight';

select cast(sum(number_of_casualties) as decimal(10,2)) *100 / (select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident)
from road_accident
where accident_severity = 'Serious';

select concat( cast(sum(number_of_casualties) as decimal(10,2)) *100 / (select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident),'%')as percentage_of
from road_accident
where accident_severity = 'Fatal';


select * from road_accident;
--for year 2022
select
case 
when vehicle_type in ('Agricultural vehicle') 
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end as vehicle_group,
sum(number_of_casualties) as CY_Casulaties
from road_accident
where year(accident_date) = '2022'
group by
case 
when vehicle_type in ('Agricultural vehicle')
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end
--for year= 2021
select
case 
when vehicle_type in ('Agricultural vehicle') 
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end as vehicle_group,
sum(number_of_casualties) as CY_Casulaties
from road_accident
where year(accident_date) = '2021'
group by
case 
when vehicle_type in ('Agricultural vehicle')
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end

--total year
select
case 
when vehicle_type in ('Agricultural vehicle') 
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end as vehicle_group,
sum(number_of_casualties) as CY_Casulaties
from road_accident
group by
case 
when vehicle_type in ('Agricultural vehicle')
then 'Agricultural'
when vehicle_type in ('Car', 'Taxi/Private hire car')
then 'Cars'
when vehicle_type in ('Motorcycle 125cc and under', 'Motorcycle over 50cc', 'Motorcycle over 125cc and upto 500cc', 'Motorcycle over 500cc', 'Pedal cycle')
then 'Bike'
when vehicle_type in ('Bus or coach (17 or more pass seats)', 'Minibus (8-16 passenger seats)')
then 'Bus'
when vehicle_type in ('Goods 7.5 tonnes mgw and over', 'Goods over 3.5t. and under 7.5t', 'Van/Goods 3.5 tonnes mgw or under')
then 'Van'
else 'Other'
end


select DATENAME(month, accident_date) as month_name , sum(number_of_casualties) as CY_Causalities
from road_accident
where YEAR(accident_date) = '2022'
group by datename(month, accident_date)
order by datename(month, accident_date) desc;

--
select DATENAME(month, accident_date) as month_name, sum(number_of_casualties) as PY_Causalities
from road_accident
where YEAR(accident_date) = '2021'
group by datename(month, accident_date);

select road_type, sum(number_of_casualties) from road_accident
where year(accident_date) = '2022'
group by road_type;

select urban_or_rural_area, concat(cast(sum(number_of_casualties) as decimal(10,2)) *100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident where year(accident_date) = '2022'), '%')as percentage_of_area
from road_accident
where year(accident_date) = '2022'
group by urban_or_rural_area;

select urban_or_rural_area,sum(number_of_casualties) as total, concat(cast(sum(number_of_casualties) as decimal(10,2)) *100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident where year(accident_date) = '2022'), '%')as percentage_of_area
from road_accident
where year(accident_date) = '2022'
group by urban_or_rural_area;


select 
case when light_conditions in ('Daylight')
then 'Day'
when light_conditions in ('Darkness - lighting unknown', 'Darkness- light lit', 'Darkness- light unlit', 'Darkness- no lighting')
then 'Night'
end as Light_condition,
concat(cast(cast(sum(number_of_casualties) as decimal(10,2)) *100 /
(select cast(sum(number_of_casualties) as decimal(10,2)) from road_accident
where year(accident_date) = '2022') as decimal(10,2)),'%') as CY_Casualties_PCT
from road_accident
where year(accident_date) = '2022'
group by
case when light_conditions in ('Daylight')
then 'Day'
when light_conditions in ('Darkness - lighting unknown', 'Darkness- light lit', 'Darkness- light unlit', 'Darkness- no lighting')
then 'Night'
end

select top 10 local_authority, sum(number_of_casualties) as Total_Casualties
from road_accident
group by local_authority 
order by Total_Casualties desc;

select
case when weather_conditions in ('Fog or mist', 'Snowing + high winds', 'Snowing no high winds')
then 'Fog'
when weather_conditions in ('Raining + high winds', 'Raining no high winds')
then 'Rain'
when weather_conditions in ('Fine + high winds', 'Fine no high winds')
then 'Winds'
else 'Others'
end as weather_conditions_group,
sum(number_of_casualties) as CY_Casulaties
from road_accident
group by
case when weather_conditions in ('Fog or mist', 'Snowing + high winds', 'Snowing no high winds')
then 'Fog'
when weather_conditions in ('Raining + high winds', 'Raining no high winds')
then 'Rain'
when weather_conditions in ('Fine + high winds', 'Fine no high winds')
then 'Winds'
else 'Others'
end



select
case when road_surface_conditions in ('Dry')
then 'Dry'
when road_surface_conditions in ('Flood over 3cm. deep', 'Wet or damp')
then 'Flood'
when road_surface_conditions in ('Frost or ice', 'Snow')
then 'Snow'
else 'Others'
end as road_surface_conditions_group,
sum(number_of_casualties) as CY_Casulaties
from road_accident
group by
case when road_surface_conditions in ('Dry')
then 'Dry'
when road_surface_conditions in ('Flood over 3cm. deep', 'Wet or damp')
then 'Flood'
when road_surface_conditions in ('Frost or ice', 'Snow')
then 'Snow'
else 'Others'
end

select *  from road_accident;