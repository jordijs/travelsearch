-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Temps de generació: 11-02-2023 a les 00:10:54
-- Versió del servidor: 10.4.27-MariaDB
-- Versió de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dades: `vueling`
--

-- --------------------------------------------------------

--
-- Estructura de la taula `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `city` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Bolcament de dades per a la taula `cities`
--

INSERT INTO `cities` (`id`, `city`) VALUES
(13, 'Amsterdam'),
(1, 'Barcelona'),
(43, 'Berlin'),
(2, 'Bilbao'),
(14, 'Florence'),
(10, 'Las Palmas de Gran Canaria'),
(5, 'London'),
(42, 'Madrid'),
(3, 'Palma de Mallorca'),
(6, 'Paris'),
(15, 'Rome'),
(45, 'الأقصر‎'),
(44, 'القاهرة‎'),
(16, 'قطر'),
(47, '北京市'),
(46, '广州市');

-- --------------------------------------------------------

--
-- Estructura de la taula `flights`
--

CREATE TABLE `flights` (
  `id` int(11) NOT NULL,
  `time` time NOT NULL,
  `city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Bolcament de dades per a la taula `flights`
--

INSERT INTO `flights` (`id`, `time`, `city`) VALUES
(4, '09:00:00', 42),
(5, '10:00:00', 45),
(6, '10:00:00', 47);

-- --------------------------------------------------------

--
-- Estructura de la taula `hotels`
--

CREATE TABLE `hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `stars` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Bolcament de dades per a la taula `hotels`
--

INSERT INTO `hotels` (`id`, `name`, `stars`) VALUES
(1, 'Hotel Best Madrid', 3),
(2, 'Hotel Worst Paris', 4),
(3, 'Hotel Worst Berlin', 4);

-- --------------------------------------------------------

--
-- Estructura de la taula `trips`
--

CREATE TABLE `trips` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` enum('land','air') NOT NULL,
  `days` tinyint(4) NOT NULL,
  `hotel1` int(11) DEFAULT NULL,
  `hotel2` int(11) DEFAULT NULL,
  `flight1` int(11) DEFAULT NULL,
  `flight2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Bolcament de dades per a la taula `trips`
--

INSERT INTO `trips` (`id`, `name`, `type`, `days`, `hotel1`, `hotel2`, `flight1`, `flight2`) VALUES
(1, 'Europe Popular Capitals', 'land', 3, 1, 2, NULL, NULL),
(2, 'Europe laying out cities', 'land', 3, 1, 3, NULL, NULL),
(3, 'Infinite Egypt', 'air', 4, NULL, NULL, 4, 5),
(4, 'Incredible China', 'air', 10, NULL, NULL, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de la taula `trip_cities`
--

CREATE TABLE `trip_cities` (
  `id` int(11) NOT NULL,
  `trip` int(11) NOT NULL,
  `city` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

--
-- Bolcament de dades per a la taula `trip_cities`
--

INSERT INTO `trip_cities` (`id`, `trip`, `city`) VALUES
(1, 1, 42),
(2, 1, 6),
(3, 1, 5),
(4, 2, 43),
(5, 2, 42),
(6, 3, 42),
(7, 3, 44),
(8, 3, 45),
(9, 4, 46),
(10, 4, 47);

--
-- Índexs per a les taules bolcades
--

--
-- Índexs per a la taula `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `city` (`city`);

--
-- Índexs per a la taula `flights`
--
ALTER TABLE `flights`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city` (`city`) USING BTREE;

--
-- Índexs per a la taula `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Índexs per a la taula `trips`
--
ALTER TABLE `trips`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hotel1` (`hotel1`),
  ADD KEY `hotel2` (`hotel2`),
  ADD KEY `flight1` (`flight1`),
  ADD KEY `flight2` (`flight2`);

--
-- Índexs per a la taula `trip_cities`
--
ALTER TABLE `trip_cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `trip` (`trip`),
  ADD KEY `city` (`city`);

--
-- AUTO_INCREMENT per les taules bolcades
--

--
-- AUTO_INCREMENT per la taula `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT per la taula `flights`
--
ALTER TABLE `flights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la taula `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la taula `trips`
--
ALTER TABLE `trips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT per la taula `trip_cities`
--
ALTER TABLE `trip_cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restriccions per a les taules bolcades
--

--
-- Restriccions per a la taula `flights`
--
ALTER TABLE `flights`
  ADD CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON UPDATE CASCADE;

--
-- Restriccions per a la taula `trips`
--
ALTER TABLE `trips`
  ADD CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`hotel1`) REFERENCES `hotels` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_2` FOREIGN KEY (`hotel2`) REFERENCES `hotels` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_3` FOREIGN KEY (`flight1`) REFERENCES `flights` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `trips_ibfk_4` FOREIGN KEY (`flight2`) REFERENCES `flights` (`id`) ON UPDATE CASCADE;

--
-- Restriccions per a la taula `trip_cities`
--
ALTER TABLE `trip_cities`
  ADD CONSTRAINT `trip_cities_ibfk_1` FOREIGN KEY (`trip`) REFERENCES `trips` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `trip_cities_ibfk_2` FOREIGN KEY (`city`) REFERENCES `cities` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
