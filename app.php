<?php 
require_once 'index.php';
//Connect to DB

require_once 'connection.php';

//NOTE: some fields are missing due to problems to implement join in the query
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


$sth = $dbh->prepare($queryTripName);
$sth->bindValue(':searchtext', "%$searchText%");
$sth->execute();

$result = $sth->fetchAll();
var_dump ($result);
?>



<?php
//Close connection to DB
$dbh = null;
$gsent = null;
?>