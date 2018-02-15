-- upload csv-files, maintained in http://dev.hsl.fi/gtfs/
COPY HSLstops FROM '~/HSL/stops.txt' DELIMITER ',' CSV HEADER;
COPY HSLstop_times FROM '~/HSL/stop_times.txt' DELIMITER ',' CSV HEADER;
COPY HSLtrips FROM '~/HSL/trips.txt' DELIMITER ',' CSV HEADER;
COPY HSLroutes FROM '~/HSL/routes.txt' DELIMITER ',' CSV HEADER;
COPY HSLcalendar FROM '~/HSL/calendar.txt' DELIMITER ',' CSV HEADER;
