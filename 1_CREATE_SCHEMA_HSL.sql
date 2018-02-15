/* Drop existing tables and create them for loading raw GTFS-data */

DROP TABLE IF EXISTS HSLroutes CASCADE;

CREATE TABLE public.HSLroutes
(
   route_id text, 
   agency_id text,
   route_short_name text,
   route_long_name text,
   route_desc text,
   route_type smallint,
   route_url text
) 
WITH (
  OIDS = FALSE
)
;

DROP TABLE IF EXISTS HSLcalendar CASCADE;

CREATE TABLE public.HSLcalendar
(
   service_id text,
   monday smallint,
   tuesday smallint,
   wednesday smallint,
   thursday smallint,
   friday smallint,
   saturday smallint,
   sunday smallint,
   start_date timestamp,
   end_date timestamp
) 
WITH (
  OIDS = FALSE
)
;

DROP TABLE IF EXISTS HSLstops CASCADE;

CREATE TABLE public.HSLstops
(
   stop_id text,
   stop_code text,
   stop_name text,
   stop_desc text,
   stop_lat numeric,
   stop_lon numeric,
   zone_id smallint,
   stop_url text,
   location_type smallint,
   parent_station text,
   wheelchair_boarding smallint,
   platform_code text,
   vehicle_type smallint
) 
WITH (
  OIDS = FALSE
)
;

DROP TABLE IF EXISTS HSLstop_times CASCADE;

CREATE TABLE public.HSLstop_times
(
   trip_id text,
   arrival_time text,
   departure_time text,
   stop_id text,
   stop_sequence smallint,
   stop_headsign text,
   pickup_type smallint,
   drop_off_type smallint,
   shape_dist_traveled numeric,
   timepoint smallint
) 
WITH (
  OIDS = FALSE
)
;

DROP TABLE IF EXISTS HSLtrips CASCADE;

CREATE TABLE public.HSLtrips
(
   route_id text,
   service_id text,
   trip_id text,
   trip_headsign text,
   direction_id smallint,
   shape_id text,
   wheelchair_accessible smallint,
   bikes_allowed smallint
) 
WITH (
  OIDS = FALSE
)
;





