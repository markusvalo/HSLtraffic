CREATE VIEW hslstoptimes AS
SELECT 
  hslstops.stop_name, 
  hslstops.stop_desc, 
  POINT(hslstops.stop_lat, hslstops.stop_lon) AS stop_location, 
  hslstops.zone_id, 
  hslstops.vehicle_type, 
  TO_TIMESTAMP(hslstop_times.arrival_time, 'HH24:MI:SS')::TIME AS arrival_time,
  TO_TIMESTAMP(hslstop_times.departure_time, 'HH24:MI:SS')::TIME AS departure_time,
  hslroutes.route_short_name, 
  hslroutes.route_long_name, 
  hslroutes.route_desc, 
  hsltrips.trip_headsign, 
  hsltrips.direction_id, 
  hslstop_times.stop_headsign, 
  hslstop_times.stop_sequence, 
  hslroutes.route_type, 
  hslstops.location_type
FROM 
  public.hslstop_times, 
  public.hslstops, 
  public.hsltrips, 
  public.hslcalendar, 
  public.hslroutes
WHERE 
  hslstop_times.stop_id = hslstops.stop_id AND
  hsltrips.service_id = hslcalendar.service_id AND
  hsltrips.trip_id = hslstop_times.trip_id AND
  hslroutes.route_id = hsltrips.route_id /* AND 
  hslcalendar.wednesday = 1 AND
  hsltrips.trip_id LIKE '%20180205_Ke%' AND
  hslroutes.route_short_name='322' */ ;
