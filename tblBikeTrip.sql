{{ config(materialized='table', tags=["tutorial"]) }}

select a.trip_id,
a.starttime trip_starttime,
a.tripduration trip_duration,
a.bikeid trip_bike_id,
a.start_station_id trip_start_station_id,
haversine(a.start_station_latitude, a.start_station_longitude, a.end_station_latitude, a.end_station_longitude) * 0.621371 trip_distance,
a.usertype trip_usertype,
year(a.starttime) - birth_year trip_subscriber_age
from citibike.public.trips_cleaned a
