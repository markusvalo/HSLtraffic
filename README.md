# HSLtraffic

Scripts to create a PostgreSQL database for HSL GTFS-data.

STEPS TO FOLLOW
- 1_CREATE_SCHEMA_HSL.sql drops existing tavles and anything related to them (cascade)
- 2_UPLOAD_gtfs_csv.sql copies data from .txt-files into the tables
- 3_CREATE_TABLES_hslstoptimes_parsed.sql creates table(s) with some additional parsing in order to help filtering when utilizing the data. Tables probavly to be combined in the future to make maintenance easier. They are now created by transport type (train/tram/metro/ferry/bus).

Data can be downloaded as zip-archives from http://dev.hsl.fi/gtfs/.

The files inside zip follow Google's GTFS-guidelines for public transport (at least to some level), descriptions here: https://developers.google.com/transit/gtfs/reference/

A rough [schema diagram](HSL_GTFS_schema.png) can be found in this directory.

I tested these and created a sample video with QGIS Time Manager -plugin, going to add the route segments between stops to get a bit more calm animation as next version.
- video: https://vimeo.com/255089153
- QGIS: https://qgis.org/en/site/
- Time Manager: https://anitagraser.com/projects/time-manager/
