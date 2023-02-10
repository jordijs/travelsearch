SELECT trips.name, hotels.name, h2.name
FROM trips
INNER JOIN hotels ON trips.hotel1 = hotels.id
INNER JOIN hotels h2 ON trips.hotel2 = h2.id
INNER JOIN trip_cities ON trip_cities.trip = trips.id
INNER JOIN cities ON cities.id = trip_cities.city
WHERE cities.city LIKE '%mad%';

