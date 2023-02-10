<?php 
require_once 'index.php';
//Connect to DB
/*
flights.time AS flight1_time,
flights.city AS flight1_city,
flights.time AS flight2_time,
flights.city AS flight2_city
$queryTripName = 'SELECT

trip_cities.city AS city1, 
tc2.city AS city2, 

flights.time AS flight1_time,
flights.city AS flight1_city,
f2.time AS flight2_time,
f2.city AS flight2_city

FROM trips
INNER JOIN flights ON trips.flight1 = flights.id
INNER JOIN flights f2 ON trips.flight2 = flights.id
INNER JOIN trip_cities ON trip_cities.trip = trips.id
INNER JOIN trip_cities tc2 ON trip_cities.city = cities.id
INNER JOIN cities ON cities.id = trip_cities.city
WHERE cities.city LIKE :searchtext';
*/
require_once 'connection.php';

$queryTripName = 'SELECT 
trips.name, 
hotels.name, 
trips.type, 
trips.days, 
hotels.name AS hotel1,
hotels.stars AS hotel1_stars,
h2.name AS hotel2,
h2.stars AS hotel2_stars
FROM trips
INNER JOIN hotels ON trips.hotel1 = hotels.id
INNER JOIN hotels h2 ON trips.hotel2 = h2.id
INNER JOIN trip_cities ON trip_cities.trip = trips.id
INNER JOIN cities ON cities.id = trip_cities.city
WHERE cities.city LIKE :searchtext';


echo $searchText;
$sth = $dbh->prepare($queryTripName);
$sth->bindValue(':searchtext', "%$searchText%");
$sth->execute();

$result = $sth->fetchAll();
var_dump ($result);
?>



<?php
//Close connection to database
$dbh = null;
$gsent = null;
?>