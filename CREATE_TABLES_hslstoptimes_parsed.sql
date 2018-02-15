/*NOTE THE DATE FILTER IN WHERE-CLAUSES! 
CAN BE REMOVED AFTER TESTING, NOW JUST FOR LIMITING THE DATA TO A REASONABLE LEVEL */

/* TRAMS */

DROP TABLE IF EXISTS public.hslstoptimes_tram CASCADE;

CREATE TABLE public.hslstoptimes_tram AS 
 SELECT 
    hslstops.stop_name,
    hslstops.stop_desc,
    hslstops.stop_lon AS stop_lon_float, 
    hslstops.stop_lat AS stop_lat_float,
    hslstops.zone_id,
    hslstops.vehicle_type,
    hslroutes.route_short_name,
    hslroutes.route_long_name,
    hslroutes.route_desc,
    hsltrips.trip_headsign,
    hslstop_times.stop_headsign,
    split_part(hsltrips.trip_id, '_', 2) AS trip_YYYYMMDD_txt,
    left(split_part(hsltrips.trip_id, '_', 2),4) AS trip_YYYY_txt,
    substring(split_part(hsltrips.trip_id, '_', 2),5,2) AS trip_MM_txt,
    right(split_part(hsltrips.trip_id, '_', 2),2) AS trip_DD_txt,
    split_part(hsltrips.trip_id, '_', 3) AS trip_weekday_txt,
    hsltrips.trip_id,
    to_timestamp(hslstop_times.arrival_time, 'HH24:MI:SS'::text)::time without time zone AS arrival_time,
    to_timestamp(hslstop_times.departure_time, 'HH24:MI:SS'::text)::time without time zone AS departure_time,
    hslstop_times.arrival_time AS arrival_time_txt,
    hslstop_times.departure_time AS departure_time_txt,
    hslstop_times.stop_sequence,
    hslroutes.route_type,
    hsltrips.direction_id,
    hslstops.location_type,
    ST_SetSRID(ST_Point(hslstops.stop_lon, hslstops.stop_lat), 4326) AS stop_point
 FROM hslstop_times,
    hslstops,
    hsltrips,
    hslcalendar,
    hslroutes
 WHERE hslstop_times.stop_id = hslstops.stop_id AND 
	hsltrips.service_id = hslcalendar.service_id AND 
	hsltrips.trip_id = hslstop_times.trip_id AND 
	hslroutes.route_id = hsltrips.route_id AND 
	hslcalendar.wednesday = 1 AND 
	split_part(hsltrips.trip_id, '_', 2) = '20180205' AND 
	hslstops.vehicle_type = 0;

/* METRO */

DROP TABLE IF EXISTS public.hslstoptimes_metro CASCADE;

CREATE TABLE public.hslstoptimes_metro AS 
 SELECT 
    hslstops.stop_name,
    hslstops.stop_desc,
    hslstops.stop_lon AS stop_lon_float, 
    hslstops.stop_lat AS stop_lat_float,
    hslstops.zone_id,
    hslstops.vehicle_type,
    hslroutes.route_short_name,
    hslroutes.route_long_name,
    hslroutes.route_desc,
    hsltrips.trip_headsign,
    hslstop_times.stop_headsign,
    split_part(hsltrips.trip_id, '_', 2) AS trip_YYYYMMDD_txt,
    left(split_part(hsltrips.trip_id, '_', 2),4) AS trip_YYYY_txt,
    substring(split_part(hsltrips.trip_id, '_', 2),5,2) AS trip_MM_txt,
    right(split_part(hsltrips.trip_id, '_', 2),2) AS trip_DD_txt,
    split_part(hsltrips.trip_id, '_', 3) AS trip_weekday_txt,
    hsltrips.trip_id,
    to_timestamp(hslstop_times.arrival_time, 'HH24:MI:SS'::text)::time without time zone AS arrival_time,
    to_timestamp(hslstop_times.departure_time, 'HH24:MI:SS'::text)::time without time zone AS departure_time,
    hslstop_times.arrival_time AS arrival_time_txt,
    hslstop_times.departure_time AS departure_time_txt,
    hslstop_times.stop_sequence,
    hslroutes.route_type,
    hsltrips.direction_id,
    hslstops.location_type,
    ST_SetSRID(ST_Point(hslstops.stop_lon, hslstops.stop_lat), 4326) AS stop_point
 FROM hslstop_times,
    hslstops,
    hsltrips,
    hslcalendar,
    hslroutes
 WHERE hslstop_times.stop_id = hslstops.stop_id AND 
	hsltrips.service_id = hslcalendar.service_id AND 
	hsltrips.trip_id = hslstop_times.trip_id AND 
	hslroutes.route_id = hsltrips.route_id AND 
	hslcalendar.wednesday = 1 AND 
	split_part(hsltrips.trip_id, '_', 2) = '20180205' AND 
	hslstops.vehicle_type = 1 AND
	left(hslstops.stop_id,1) in ('1', '2');

/* TRAINS */

DROP TABLE IF EXISTS public.hslstoptimes_train CASCADE;

CREATE TABLE public.hslstoptimes_train AS 
 SELECT 
    hslstops.stop_name,
    hslstops.stop_desc,
    hslstops.stop_lon AS stop_lon_float, 
    hslstops.stop_lat AS stop_lat_float,
    hslstops.zone_id,
    hslstops.vehicle_type,
    hslroutes.route_short_name,
    hslroutes.route_long_name,
    hslroutes.route_desc,
    hsltrips.trip_headsign,
    hslstop_times.stop_headsign,
    split_part(hsltrips.trip_id, '_', 2) AS trip_YYYYMMDD_txt,
    left(split_part(hsltrips.trip_id, '_', 2),4) AS trip_YYYY_txt,
    substring(split_part(hsltrips.trip_id, '_', 2),5,2) AS trip_MM_txt,
    right(split_part(hsltrips.trip_id, '_', 2),2) AS trip_DD_txt,
    split_part(hsltrips.trip_id, '_', 3) AS trip_weekday_txt,
    hsltrips.trip_id,
    to_timestamp(hslstop_times.arrival_time, 'HH24:MI:SS'::text)::time without time zone AS arrival_time,
    to_timestamp(hslstop_times.departure_time, 'HH24:MI:SS'::text)::time without time zone AS departure_time,
    hslstop_times.arrival_time AS arrival_time_txt,
    hslstop_times.departure_time AS departure_time_txt,
    hslstop_times.stop_sequence,
    hslroutes.route_type,
    hsltrips.direction_id,
    hslstops.location_type,
    ST_SetSRID(ST_Point(hslstops.stop_lon, hslstops.stop_lat), 4326) AS stop_point
 FROM hslstop_times,
    hslstops,
    hsltrips,
    hslcalendar,
    hslroutes
 WHERE hslstop_times.stop_id = hslstops.stop_id AND 
	hsltrips.service_id = hslcalendar.service_id AND 
	hsltrips.trip_id = hslstop_times.trip_id AND 
	hslroutes.route_id = hsltrips.route_id AND 
	hslcalendar.wednesday = 1 AND 
	split_part(hsltrips.trip_id, '_', 2) = '20180205' AND 
	hslstops.vehicle_type = 109;

/* FERRIES */

DROP TABLE IF EXISTS public.hslstoptimes_ferry CASCADE;

CREATE TABLE public.hslstoptimes_ferry AS 
 SELECT 
    hslstops.stop_name,
    hslstops.stop_desc,
    hslstops.stop_lon AS stop_lon_float, 
    hslstops.stop_lat AS stop_lat_float,
    hslstops.zone_id,
    hslstops.vehicle_type,
    hslroutes.route_short_name,
    hslroutes.route_long_name,
    hslroutes.route_desc,
    hsltrips.trip_headsign,
    hslstop_times.stop_headsign,
    split_part(hsltrips.trip_id, '_', 2) AS trip_YYYYMMDD_txt,
    left(split_part(hsltrips.trip_id, '_', 2),4) AS trip_YYYY_txt,
    substring(split_part(hsltrips.trip_id, '_', 2),5,2) AS trip_MM_txt,
    right(split_part(hsltrips.trip_id, '_', 2),2) AS trip_DD_txt,
    split_part(hsltrips.trip_id, '_', 3) AS trip_weekday_txt,
    hsltrips.trip_id,
    to_timestamp(hslstop_times.arrival_time, 'HH24:MI:SS'::text)::time without time zone AS arrival_time,
    to_timestamp(hslstop_times.departure_time, 'HH24:MI:SS'::text)::time without time zone AS departure_time,
    hslstop_times.arrival_time AS arrival_time_txt,
    hslstop_times.departure_time AS departure_time_txt,
    hslstop_times.stop_sequence,
    hslroutes.route_type,
    hsltrips.direction_id,
    hslstops.location_type,
    ST_SetSRID(ST_Point(hslstops.stop_lon, hslstops.stop_lat), 4326) AS stop_point
 FROM hslstop_times,
    hslstops,
    hsltrips,
    hslcalendar,
    hslroutes
 WHERE hslstop_times.stop_id = hslstops.stop_id AND 
	hsltrips.service_id = hslcalendar.service_id AND 
	hsltrips.trip_id = hslstop_times.trip_id AND 
	hslroutes.route_id = hsltrips.route_id AND 
	hslcalendar.wednesday = 1 AND 
	split_part(hsltrips.trip_id, '_', 2) = '20180205' AND 
	hslstops.vehicle_type = 4 AND 
	left(hslstops.stop_id,1)='1';

/* BUSES */

DROP TABLE IF EXISTS public.hslstoptimes_bus CASCADE;

CREATE TABLE public.hslstoptimes_bus AS 
 SELECT 
    hslstops.stop_name,
    hslstops.stop_desc,
    hslstops.stop_lon AS stop_lon_float, 
    hslstops.stop_lat AS stop_lat_float,
    hslstops.zone_id,
    hslstops.vehicle_type,
    hslroutes.route_short_name,
    hslroutes.route_long_name,
    hslroutes.route_desc,
    hsltrips.trip_headsign,
    hslstop_times.stop_headsign,
    split_part(hsltrips.trip_id, '_', 2) AS trip_YYYYMMDD_txt,
    left(split_part(hsltrips.trip_id, '_', 2),4) AS trip_YYYY_txt,
    substring(split_part(hsltrips.trip_id, '_', 2),5,2) AS trip_MM_txt,
    right(split_part(hsltrips.trip_id, '_', 2),2) AS trip_DD_txt,
    split_part(hsltrips.trip_id, '_', 3) AS trip_weekday_txt,
    hsltrips.trip_id,
    to_timestamp(hslstop_times.arrival_time, 'HH24:MI:SS'::text)::time without time zone AS arrival_time,
    to_timestamp(hslstop_times.departure_time, 'HH24:MI:SS'::text)::time without time zone AS departure_time,
    hslstop_times.arrival_time AS arrival_time_txt,
    hslstop_times.departure_time AS departure_time_txt,
    hslstop_times.stop_sequence,
    hslroutes.route_type,
    hsltrips.direction_id,
    hslstops.location_type,
    ST_SetSRID(ST_Point(hslstops.stop_lon, hslstops.stop_lat), 4326) AS stop_point
 FROM hslstop_times,
    hslstops,
    hsltrips,
    hslcalendar,
    hslroutes
 WHERE hslstop_times.stop_id = hslstops.stop_id AND 
	hsltrips.service_id = hslcalendar.service_id AND 
	hsltrips.trip_id = hslstop_times.trip_id AND 
	hslroutes.route_id = hsltrips.route_id AND 
	hslcalendar.wednesday = 1 AND 
	split_part(hsltrips.trip_id, '_', 2) = '20180205' AND 
	hslstops.vehicle_type = 3;




