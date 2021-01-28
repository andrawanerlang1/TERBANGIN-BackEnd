-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2021 at 04:24 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `terbangin`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_image` varchar(200) NOT NULL,
  `user_numberPhone` int(200) NOT NULL,
  `user_city` varchar(200) NOT NULL,
  `user_nationality` varchar(200) NOT NULL,
  `post_code` int(200) NOT NULL,
  `user_role` int(2) NOT NULL,
  `user_status` int(2) NOT NULL,
  `user_key` int(200) NOT NULL,
  `user_create_at` datetime NOT NULL,
  `user_updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_email`, `user_password`, `user_name`, `user_image`, `user_numberPhone`, `user_city`, `user_nationality`, `post_code`, `user_role`, `user_status`, `user_key`, `user_create_at`, `user_updated_at`) VALUES
(1, 'mila@gmail.com', '$2b$10$Wtphpe8DGawVniFI/OAFeOjKlqoQCNVZr9bcZtP1VUd6wzjdNTEBS', 'milla', '', 857000, '', '', 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'candrabaru@gmail.com', '$2b$10$YjqaLGtbT.PM9EXr9.AhI.id2GQu2Tc6.Gb9bz/icbfiEucCHSMYe', 'Candrawan', '', 7864321, 'Bogor', 'Bogor jl.abcdefgh', 40724, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
