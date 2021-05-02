-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2021 at 11:30 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `clubs`
--

CREATE TABLE `clubs` (
  `id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` int(11) NOT NULL,
  `cups_won` int(11) NOT NULL,
  `date_founded` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clubs`
--

INSERT INTO `clubs` (`id`, `league_id`, `name`, `value`, `cups_won`, `date_founded`) VALUES
(0, 1, 'Manchester United', 255000, 150, '1900-01-01');

-- --------------------------------------------------------

--
-- Table structure for table `coaches`
--

CREATE TABLE `coaches` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `cups_won` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(11) NOT NULL,
  `type` enum('CREATE','UPDATE','DELETE') NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `table_name` varchar(100) NOT NULL,
  `table_id` int(11) NOT NULL,
  `approved` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `type`, `date`, `table_name`, `table_id`, `approved`) VALUES
(1, 'CREATE', '2021-04-28 15:07:47', 'users', 1, b'0'),
(2, 'CREATE', '2021-04-28 16:53:43', 'users', 2, b'0'),
(3, 'CREATE', '2021-04-28 16:54:10', 'users', 3, b'0'),
(4, 'CREATE', '2021-04-28 16:54:32', 'users', 4, b'0'),
(5, 'CREATE', '2021-04-28 16:55:02', 'users', 5, b'0'),
(6, 'CREATE', '2021-04-28 16:58:30', 'users', 6, b'0'),
(7, 'CREATE', '2021-04-28 16:59:03', 'users', 7, b'0'),
(8, 'CREATE', '2021-04-28 16:59:45', 'users', 8, b'0'),
(9, 'CREATE', '2021-04-28 17:00:24', 'users', 9, b'0'),
(10, 'CREATE', '2021-04-28 17:00:45', 'users', 10, b'0'),
(11, 'CREATE', '2021-04-28 17:01:15', 'users', 11, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `leagues`
--

CREATE TABLE `leagues` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `sport_id` int(11) NOT NULL,
  `total_clubs` int(11) NOT NULL,
  `country` varchar(100) NOT NULL,
  `logo` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leagues`
--

INSERT INTO `leagues` (`id`, `name`, `sport_id`, `total_clubs`, `country`, `logo`) VALUES
(1, 'English Premier League', 1, 20, 'England', NULL),
(2, 'La Liga', 1, 20, 'Soain', NULL),
(3, 'Serie A', 1, 18, 'Italy', NULL),
(4, 'Bundesliga', 1, 18, 'Germany', NULL),
(5, 'Ligue 1', 1, 18, 'France', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leagues_dates`
--

CREATE TABLE `leagues_dates` (
  `id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `matches`
--

CREATE TABLE `matches` (
  `id` int(11) NOT NULL,
  `league_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `home_team` int(11) NOT NULL,
  `away_team` int(11) NOT NULL,
  `home_team_score` int(11) NOT NULL,
  `away_team_score` int(11) NOT NULL,
  `attendees` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `height` decimal(10,0) NOT NULL,
  `weight` decimal(10,0) NOT NULL,
  `birthDate` date NOT NULL,
  `country` varchar(100) NOT NULL,
  `club_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `players_perfomances`
--

CREATE TABLE `players_perfomances` (
  `id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  `match_id` int(11) NOT NULL,
  `score` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `seasons`
--

CREATE TABLE `seasons` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `league_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seasons`
--

INSERT INTO `seasons` (`id`, `name`, `league_id`, `start_date`, `end_date`) VALUES
(1, '2020/2021', 1, '2020-07-30', '2021-05-30'),
(2, '2021/2022', 1, '2021-08-01', '2022-05-30'),
(3, '2021/2022', 2, '2021-08-01', '2022-05-30'),
(4, '2021/2022', 3, '2021-08-01', '2022-05-30'),
(5, '2021/2022', 4, '2021-08-01', '2022-05-30'),
(6, '2021/2022', 5, '2021-08-01', '2022-05-30');

-- --------------------------------------------------------

--
-- Table structure for table `selectors`
--

CREATE TABLE `selectors` (
  `id` int(11) NOT NULL,
  `gender` enum('M','F') NOT NULL,
  `country` varchar(100) NOT NULL,
  `preffered_sport` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sports`
--

CREATE TABLE `sports` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `logo` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sports`
--

INSERT INTO `sports` (`id`, `name`, `logo`) VALUES
(1, 'Football ⚽', NULL),
(2, 'Hockey 🏑', NULL),
(3, 'Cricket 🏏', NULL),
(4, 'Basketball🏀', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` int(11) NOT NULL,
  `squad_total` int(11) NOT NULL,
  `injuries_total` int(11) NOT NULL,
  `dateFounded` date NOT NULL,
  `logo` varchar(4096) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `userName` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `approved` bit(1) NOT NULL DEFAULT b'0',
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `userName`, `password`, `approved`, `created_at`) VALUES
(1, 'Super', 'User', 'admin', '$2y$10$xtiAIpsgclz4NIhFG/gIdei5NbTMgvYTdwQaie3w1aGZLB9vSCDRu', b'1', '2021-04-28 15:07:47'),
(2, 'Marcus', 'Rashford', 'marcus', '$2y$10$qAt9fhgiLyuRKOi4aAoNKeaB/GqSCRLL20dBb.gp7ZOy8i9HieB1i', b'0', '2021-04-28 16:53:43'),
(3, 'Ole', 'Gunar', 'olegunar', '$2y$10$A.ZalrnH8hPb2H2A73AZVuL7cAgcRawtfLx3U7mSNlHPCbLoia1Am', b'0', '2021-04-28 16:54:10'),
(4, 'John', 'Doe', 'johndoe', '$2y$10$lU.lJlZs5YcJr7WqiuxBy.jr9zo6Pi3wg5PLh6Vd58zcaOZZKGT9K', b'0', '2021-04-28 16:54:31'),
(5, 'Manchester', 'United', 'mufc', '$2y$10$M16GISuE2DE4J6Gti.Z.eOUJ8dNNrdawzNOyxrIWkzbUCypscqEl.', b'0', '2021-04-28 16:55:02'),
(6, 'Paul', 'Pogba', 'pogba', '$2y$10$m2o/tiFci26.fI28HIR1iOPU9teaHHPA0TiKW6CJ0V9vbmyQfiJtO', b'0', '2021-04-28 16:58:30'),
(7, 'Bruno', 'Fernandes', 'fernandes', '$2y$10$US35mEbJnVdV9uWX5w8wlO1tu35rj0ngBypvnskR9FfQ5uoJDNMdy', b'0', '2021-04-28 16:59:03'),
(8, 'David', 'De Gea', 'degea', '$2y$10$L6aUXVutCtZsTj9CiYXEe.b8r9b1XzxIhDPgx/MGRun.liXv6ORGC', b'0', '2021-04-28 16:59:45'),
(9, 'Kevin', 'Debruine', 'kdb', '$2y$10$p9pr3J3xrStT.d21jVKRp.ccKzSqPCO8G8gqkjk2em40jHt6m2oVi', b'0', '2021-04-28 17:00:24'),
(10, 'Kun', 'Aguero', 'aguero', '$2y$10$fSeOWWK/4S3CzkufpZD.c.9wjXHz8toBhFoSWGE3HRZltOl2zVL7G', b'0', '2021-04-28 17:00:45'),
(11, 'Rahim', 'Sterling', 'sterling', '$2y$10$Jn/hMQN9ESzHcwzXOwi7UeOvSd0rebBKLHM4j3A4MTr13jRD1Ecn6', b'0', '2021-04-28 17:01:15');

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` enum('ADMIN','COACH','SELECTOR','PLAYER','CLUB') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `user_id`, `type`) VALUES
(1, 1, 'ADMIN'),
(2, 2, 'PLAYER'),
(3, 3, 'COACH'),
(4, 4, 'SELECTOR'),
(5, 5, 'CLUB'),
(6, 6, 'PLAYER'),
(7, 7, 'PLAYER'),
(8, 8, 'PLAYER'),
(9, 9, 'PLAYER'),
(10, 10, 'PLAYER'),
(11, 11, 'PLAYER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clubs`
--
ALTER TABLE `clubs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_id` (`league_id`);

--
-- Indexes for table `coaches`
--
ALTER TABLE `coaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leagues`
--
ALTER TABLE `leagues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sport_id` (`sport_id`);

--
-- Indexes for table `leagues_dates`
--
ALTER TABLE `leagues_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_id` (`league_id`);

--
-- Indexes for table `matches`
--
ALTER TABLE `matches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_id` (`league_id`),
  ADD KEY `away_team` (`away_team`),
  ADD KEY `home_team` (`home_team`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `players_perfomances`
--
ALTER TABLE `players_perfomances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `player_id` (`player_id`),
  ADD KEY `match_id` (`match_id`);

--
-- Indexes for table `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `league_id` (`league_id`);

--
-- Indexes for table `selectors`
--
ALTER TABLE `selectors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `preffered_sport` (`preffered_sport`);

--
-- Indexes for table `sports`
--
ALTER TABLE `sports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `club_id` (`club_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`userName`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `coaches`
--
ALTER TABLE `coaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `leagues`
--
ALTER TABLE `leagues`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leagues_dates`
--
ALTER TABLE `leagues_dates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `matches`
--
ALTER TABLE `matches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `players_perfomances`
--
ALTER TABLE `players_perfomances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seasons`
--
ALTER TABLE `seasons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `selectors`
--
ALTER TABLE `selectors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sports`
--
ALTER TABLE `sports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `clubs`
--
ALTER TABLE `clubs`
  ADD CONSTRAINT `clubs_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `coaches`
--
ALTER TABLE `coaches`
  ADD CONSTRAINT `coaches_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `coaches_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leagues`
--
ALTER TABLE `leagues`
  ADD CONSTRAINT `leagues_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sports` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `leagues_dates`
--
ALTER TABLE `leagues_dates`
  ADD CONSTRAINT `leagues_dates_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `matches`
--
ALTER TABLE `matches`
  ADD CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `matches_ibfk_2` FOREIGN KEY (`away_team`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `matches_ibfk_3` FOREIGN KEY (`home_team`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `players_perfomances`
--
ALTER TABLE `players_perfomances`
  ADD CONSTRAINT `players_perfomances_ibfk_1` FOREIGN KEY (`player_id`) REFERENCES `players` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `players_perfomances_ibfk_2` FOREIGN KEY (`match_id`) REFERENCES `matches` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `seasons`
--
ALTER TABLE `seasons`
  ADD CONSTRAINT `seasons_ibfk_1` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `selectors`
--
ALTER TABLE `selectors`
  ADD CONSTRAINT `selectors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `selectors_ibfk_2` FOREIGN KEY (`preffered_sport`) REFERENCES `sports` (`id`) ON UPDATE NO ACTION;

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `clubs` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `user_types`
--
ALTER TABLE `user_types`
  ADD CONSTRAINT `user_types_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
