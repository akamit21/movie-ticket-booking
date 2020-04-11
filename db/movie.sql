-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 11, 2020 at 01:45 PM
-- Server version: 5.7.29-0ubuntu0.18.04.1
-- PHP Version: 7.2.24-0ubuntu0.18.04.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movie`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) UNSIGNED NOT NULL,
  `city_name` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_name`, `state`, `created_on`, `updated_on`) VALUES
(1, 'Patna', 'Bihar', '2020-04-10 15:40:59', '2020-04-10 15:40:59'),
(2, 'Ranchi', 'Jharkhand', '2020-04-10 15:40:59', '2020-04-10 15:40:59'),
(3, 'Hajipur', 'Bihar', '2020-04-10 15:40:59', '2020-04-10 15:40:59'),
(4, 'Kanpur', 'Uttar Pradesh', '2020-04-10 15:40:59', '2020-04-10 15:40:59');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) UNSIGNED NOT NULL,
  `movie_name` varchar(255) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `language` varchar(255) NOT NULL,
  `rating` enum('1','2','3','4','5') NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `movie_name`, `genre`, `language`, `rating`, `created_on`, `updated_on`) VALUES
(1, 'Star Trek V: The Final Frontier', 'Action,Sci-Fi', 'Hindi', '1', '2020-04-10 15:58:56', '2020-04-10 16:15:16'),
(2, 'Koi Mil Gaya', 'Drama,Sci-Fi', 'Hindi', '3', '2020-04-10 15:58:56', '2020-04-10 23:54:34'),
(3, 'Season of the Witch', 'Drama,Horror', 'English', '5', '2020-04-10 15:58:56', '2020-04-10 23:49:34'),
(4, 'Murder', 'Crime,Drama,Thriller', 'Hindi', '5', '2020-04-10 15:58:56', '2020-04-10 23:54:42'),
(5, 'Rang De Basanti', 'Drama', 'Hindi', '2', '2020-04-10 15:58:56', '2020-04-10 23:50:03'),
(6, 'Whatever', 'Drama', 'English', '2', '2020-04-10 15:58:57', '2020-04-10 16:04:29'),
(7, 'Lagaan', 'Adventure,Drama', 'Hindi', '2', '2020-04-10 15:58:57', '2020-04-10 23:55:13'),
(8, 'Dil To Pagal Hai ', 'Drama', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 23:54:07'),
(9, 'Bad Boy Bubby', 'Drama', 'English', '3', '2020-04-10 15:58:57', '2020-04-10 16:04:29'),
(10, 'Veer Zaara', 'Drama,Romance', 'Hindi', '2', '2020-04-10 15:58:57', '2020-04-10 23:53:58'),
(11, 'Aflatoon', 'Action,Adventure,Comedy,Crime', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 23:52:47'),
(12, 'Traviata, La', 'Drama,Musical', 'English', '1', '2020-04-10 15:58:57', '2020-04-10 16:15:16'),
(13, 'Hostel: Part II', 'Crime,Horror,Thriller', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 16:15:16'),
(14, 'Talaash', 'Crime,Drama', 'Hindi', '3', '2020-04-10 15:58:57', '2020-04-10 23:52:21'),
(15, 'Jet Li\'s Fearless (Huo Yuan Jia)', 'Action,Drama', 'English', '2', '2020-04-10 15:58:57', '2020-04-10 16:15:16'),
(16, 'Shivaji, The Boss', 'Drama,Romance', 'Hindi', '1', '2020-04-10 15:58:57', '2020-04-10 23:51:33'),
(17, 'Baghban', 'Drama,Romance', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 23:51:18'),
(18, 'Four Christmases', 'Comedy', 'English', '2', '2020-04-10 15:58:57', '2020-04-10 16:04:29'),
(19, 'Death Race 2', 'Action,Sci-Fi,Thriller', 'Hindi', '2', '2020-04-10 15:58:57', '2020-04-10 16:15:16'),
(20, '2 States', 'Horror', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 23:51:05'),
(21, 'Night of the Demons 2', 'Comedy,Romance', 'English', '2', '2020-04-10 15:58:57', '2020-04-10 23:50:57'),
(22, 'Happy Birthday to Me', 'Horror,Mystery', 'Hindi', '4', '2020-04-10 15:58:57', '2020-04-10 16:15:16'),
(23, '1, 2, 3, Sun (Un, deuz, trois, soleil)', 'Drama', 'Hindi', '5', '2020-04-10 15:58:57', '2020-04-10 16:03:49'),
(24, '3 Idiots', 'Comedy', 'Hindi', '5', '2020-04-10 15:58:58', '2020-04-10 23:50:40'),
(25, 'Five-Year Engagement, The', 'Comedy,Romance', 'Hindi', '3', '2020-04-10 15:58:58', '2020-04-10 16:15:16');

-- --------------------------------------------------------

--
-- Table structure for table `shows`
--

CREATE TABLE `shows` (
  `id` int(11) UNSIGNED NOT NULL,
  `fk_theatre_id` int(11) UNSIGNED NOT NULL,
  `fk_movie_id` int(11) UNSIGNED NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `start_time` varchar(16) DEFAULT NULL,
  `end_time` varchar(16) DEFAULT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `shows`
--

INSERT INTO `shows` (`id`, `fk_theatre_id`, `fk_movie_id`, `start_date`, `end_date`, `start_time`, `end_time`, `created_on`, `updated_on`) VALUES
(1, 1, 6, NULL, NULL, '09:30:00', '12:00:00', '2020-04-10 23:30:19', '2020-04-10 23:32:30'),
(3, 9, 3, NULL, NULL, '09:00:00', '11:00:00', '2020-04-10 23:30:19', '2020-04-10 23:33:48'),
(4, 17, 11, NULL, NULL, '13:00:00', '16:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:03'),
(5, 33, 6, NULL, NULL, '17:20:00', '20:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:28'),
(6, 1, 6, NULL, NULL, '13:30:00', '16:00:00', '2020-04-10 23:30:19', '2020-04-10 23:32:30'),
(7, 1, 6, NULL, NULL, '16:30:00', '20:00:00', '2020-04-10 23:30:19', '2020-04-10 23:33:48'),
(8, 17, 11, NULL, NULL, '17:00:00', '21:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:03'),
(9, 33, 6, NULL, NULL, '12:20:00', '16:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:28'),
(10, 2, 4, NULL, NULL, '09:30:00', '12:00:00', '2020-04-10 23:30:19', '2020-04-10 23:32:30'),
(11, 10, 12, NULL, NULL, '09:00:00', '11:00:00', '2020-04-10 23:30:19', '2020-04-10 23:33:48'),
(12, 18, 16, NULL, NULL, '13:00:00', '16:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:03'),
(13, 26, 2, NULL, NULL, '17:20:00', '20:00:00', '2020-04-10 23:30:19', '2020-04-10 23:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `theatres`
--

CREATE TABLE `theatres` (
  `id` int(11) UNSIGNED NOT NULL,
  `theatre_name` varchar(255) NOT NULL,
  `fk_city_id` int(11) UNSIGNED NOT NULL,
  `total_seats` tinyint(3) UNSIGNED NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `theatres`
--

INSERT INTO `theatres` (`id`, `theatre_name`, `fk_city_id`, `total_seats`, `created_on`, `updated_on`) VALUES
(1, 'PVR Cinemas', 1, 50, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(2, 'PVR Cinemas', 3, 75, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(9, 'INOX', 1, 50, '2020-04-10 15:47:00', '2020-04-10 22:08:15'),
(10, 'INOX', 4, 75, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(17, 'Cinepolis', 1, 50, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(18, 'Cinepolis', 4, 75, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(25, 'SPI Cinemas', 2, 50, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(26, 'SPI Cinemas', 3, 75, '2020-04-10 15:47:00', '2020-04-10 15:47:00'),
(33, 'SPI Cinemas', 1, 75, '2020-04-10 15:47:00', '2020-04-10 15:47:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(11) UNSIGNED NOT NULL,
  `fk_show_id` int(11) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `ticket_number` int(11) UNSIGNED NOT NULL,
  `seats` varchar(255) NOT NULL,
  `amount` smallint(5) UNSIGNED NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `fk_show_id`, `date`, `ticket_number`, `seats`, `amount`, `created_on`, `updated_on`) VALUES
(3, 6, '2020-03-11', 4906, '45,46', 200, '2020-04-11 13:10:19', '2020-04-11 13:10:19'),
(4, 6, '2020-03-11', 3793, '42,43', 200, '2020-04-11 13:11:05', '2020-04-11 13:11:05'),
(5, 6, '2020-03-11', 4715, '3,4', 200, '2020-04-11 13:13:33', '2020-04-11 13:13:33'),
(6, 6, '2020-03-11', 1642, '7,8', 200, '2020-04-11 13:33:58', '2020-04-11 13:33:58'),
(7, 6, '2020-03-11', 6212, '5,6', 200, '2020-04-11 13:34:23', '2020-04-11 13:34:23'),
(8, 6, '2020-03-11', 2640, '1,2', 200, '2020-04-11 13:35:10', '2020-04-11 13:35:10'),
(9, 12, '2020-03-11', 7834, '71,72,73', 300, '2020-04-11 13:40:56', '2020-04-11 13:40:56');

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewShow`
-- (See below for the actual view)
--
CREATE TABLE `viewShow` (
`id` int(11) unsigned
,`fk_theatre_id` int(11) unsigned
,`fk_movie_id` int(11) unsigned
,`start_time` varchar(16)
,`end_time` varchar(16)
,`movie_name` varchar(255)
,`genre` varchar(255)
,`language` varchar(255)
,`rating` enum('1','2','3','4','5')
,`theatre_name` varchar(255)
,`total_seats` tinyint(3) unsigned
,`fk_city_id` int(11) unsigned
,`city_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `viewShow`
--
DROP TABLE IF EXISTS `viewShow`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewShow`  AS  select `shows`.`id` AS `id`,`shows`.`fk_theatre_id` AS `fk_theatre_id`,`shows`.`fk_movie_id` AS `fk_movie_id`,`shows`.`start_time` AS `start_time`,`shows`.`end_time` AS `end_time`,`movies`.`movie_name` AS `movie_name`,`movies`.`genre` AS `genre`,`movies`.`language` AS `language`,`movies`.`rating` AS `rating`,`theatres`.`theatre_name` AS `theatre_name`,`theatres`.`total_seats` AS `total_seats`,`theatres`.`fk_city_id` AS `fk_city_id`,`cities`.`city_name` AS `city_name` from (((`shows` join `movies` on((`shows`.`fk_movie_id` = `movies`.`id`))) join `theatres` on((`shows`.`fk_theatre_id` = `theatres`.`id`))) join `cities` on((`theatres`.`fk_city_id` = `cities`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shows`
--
ALTER TABLE `shows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_theatre_id` (`fk_theatre_id`),
  ADD KEY `fk_movie_id` (`fk_movie_id`);

--
-- Indexes for table `theatres`
--
ALTER TABLE `theatres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_city_id` (`fk_city_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `shows`
--
ALTER TABLE `shows`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `theatres`
--
ALTER TABLE `theatres`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `shows`
--
ALTER TABLE `shows`
  ADD CONSTRAINT `shows_ibfk_1` FOREIGN KEY (`fk_theatre_id`) REFERENCES `theatres` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `shows_ibfk_2` FOREIGN KEY (`fk_movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `theatres`
--
ALTER TABLE `theatres`
  ADD CONSTRAINT `theatres_ibfk_1` FOREIGN KEY (`fk_city_id`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
