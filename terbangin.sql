-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Feb 2021 pada 16.52
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
-- Struktur dari tabel `booking`
--

CREATE TABLE `booking` (
  `bookingId` int(5) NOT NULL,
  `userId` int(5) NOT NULL,
  `totalPassenger` int(2) NOT NULL,
  `flightId` int(5) NOT NULL,
  `paymentStatus` int(1) NOT NULL,
  `totalPayment` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `contactFullname` varchar(50) NOT NULL,
  `contactEmail` varchar(50) NOT NULL,
  `contactNumber` int(30) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `booking`
--

INSERT INTO `booking` (`bookingId`, `userId`, `totalPassenger`, `flightId`, `paymentStatus`, `totalPayment`, `code`, `contactFullname`, `contactEmail`, `contactNumber`, `createdAt`, `updatedAt`) VALUES
(1, 2, 3, 2, 1, 7500000, 'af38cd3205', 'Tanjirou', 'tanjirou@gmail.com', 1234, '2021-01-31 12:43:44', '2021-02-01 15:48:06'),
(2, 2, 3, 2, 1, 7500000, 'b132306671', 'Tanjirou', 'tanjirou@gmail.com', 1234, '2021-01-31 12:44:23', '2021-01-31 19:44:23'),
(3, 2, 1, 3, 0, 500000, 'a8817ebdf7911485', 'asd', 'asd', 62123123, '2021-01-31 14:58:30', '2021-01-31 21:58:30'),
(4, 2, 1, 3, 0, 500000, '81b1a79a6cf9fbde', 'asd', '123', 62123, '2021-01-31 15:00:10', '2021-01-31 22:00:10'),
(5, 2, 3, 2, 0, 7500000, '27f067755a2b3ab7', 'Tanjirou', 'tanjirou@gmail.com', 1234, '2021-01-31 15:01:35', '2021-01-31 22:01:35'),
(6, 2, 1, 3, 0, 500000, 'f274229d9d14605e', 'asd', 'dwq', 622112, '2021-01-31 15:02:39', '2021-01-31 22:02:39'),
(7, 2, 1, 3, 0, 500000, '39c8a44fe507ddc3', 'asdwa', 'dawdaw', 62213123, '2021-01-31 15:04:50', '2021-01-31 22:04:50'),
(8, 3, 1, 4, 0, 550000, 'bcc5368779ff33ac', 'andra', 'asd@asd', 62123, '2021-01-31 17:06:03', '2021-02-01 00:06:03'),
(9, 2, 1, 4, 0, 550000, '5411c8ae153bcb92', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:02', '2021-02-01 11:00:02'),
(10, 2, 1, 4, 0, 550000, '5649ed30b53b47e5', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:05', '2021-02-01 11:00:05'),
(11, 2, 1, 4, 0, 550000, '5f54a06547482a17', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:07', '2021-02-01 11:00:07'),
(12, 2, 1, 4, 0, 550000, 'b7ae76a9d9e48613', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:08', '2021-02-01 11:00:08'),
(13, 2, 1, 4, 0, 550000, '308195b33c08ffa1', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:10', '2021-02-01 11:00:10'),
(14, 2, 1, 4, 0, 550000, 'c37783a8d962a90a', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:12', '2021-02-01 11:00:13'),
(15, 2, 1, 4, 0, 550000, '2c8183457def3f6c', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:13', '2021-02-01 11:00:13'),
(16, 2, 1, 4, 0, 550000, 'f7dab50db3979dfb', 'asd', 'asd@asd', 62123, '2021-02-01 04:00:14', '2021-02-01 11:00:14'),
(17, 2, 2, 4, 0, 1100000, '9cc55ed147b8ebc8', 'andra', 'andra@asd', 62123123, '2021-02-01 06:55:30', '2021-02-01 13:55:30'),
(18, 2, 1, 15, 0, 150000, '10c1dfc5b1d3283f', 'andra', 'asd@asd', 62123, '2021-02-01 13:00:19', '2021-02-01 20:00:19'),
(19, 3, 2, 18, 0, 300000, 'ac2f6455b4014442', 'asd', '1232', 6221331, '2021-02-01 15:18:22', '2021-02-01 22:18:22'),
(20, 2, 3, 2, 0, 7500000, '47c8c3bea0e3a816', 'Tanjirou', 'tanjirou@gmail.com', 1234, '2021-02-01 15:46:32', '2021-02-01 22:46:32');

-- --------------------------------------------------------

--
-- Struktur dari tabel `chat`
--

CREATE TABLE `chat` (
  `chatId` int(10) NOT NULL,
  `roomIdUniq` int(10) NOT NULL,
  `message` varchar(300) NOT NULL,
  `sender` int(5) NOT NULL,
  `receiver` int(5) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `flight`
--

CREATE TABLE `flight` (
  `flightId` int(10) NOT NULL,
  `mascapai` varchar(20) NOT NULL,
  `mascapaiImage` varchar(100) NOT NULL,
  `departureTime` time NOT NULL,
  `arrivedTime` time NOT NULL,
  `flightDate` datetime NOT NULL DEFAULT current_timestamp(),
  `price` int(10) NOT NULL,
  `food` int(11) NOT NULL DEFAULT 0,
  `wifi` int(11) NOT NULL DEFAULT 0,
  `luggage` int(11) NOT NULL DEFAULT 0,
  `capacity` int(4) NOT NULL,
  `clas` int(2) NOT NULL,
  `fromCity` varchar(30) NOT NULL,
  `fromCountry` varchar(30) NOT NULL,
  `toCity` varchar(30) NOT NULL,
  `toCountry` varchar(30) NOT NULL,
  `tripType` varchar(3) NOT NULL,
  `terminal` varchar(10) NOT NULL,
  `transitType` int(1) NOT NULL DEFAULT 0,
  `gate` varchar(10) NOT NULL,
  `code` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `flight`
--

INSERT INTO `flight` (`flightId`, `mascapai`, `mascapaiImage`, `departureTime`, `arrivedTime`, `flightDate`, `price`, `food`, `wifi`, `luggage`, `capacity`, `clas`, `fromCity`, `fromCountry`, `toCity`, `toCountry`, `tripType`, `terminal`, `transitType`, `gate`, `code`) VALUES
(1, 'Air Asia', '2021-01-28T15-49-35.653Zairasia.png', '15:00:00', '15:45:00', '2021-01-30 00:00:00', 1200000, 1, 1, 0, 90, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 2, '222', ''),
(2, 'Garuda Indonesia', '2021-01-29T06-07-05.305ZgarudaIndonesia.png', '06:45:00', '07:15:00', '2021-01-30 00:00:00', 600000, 1, 1, 0, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'B12', 2, '212', ''),
(3, 'Garuda Indonesia', '2021-01-29T06-08-43.747ZgarudaIndonesia.png', '07:50:00', '08:15:00', '2021-01-30 00:00:00', 550000, 1, 1, 1, 96, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 1, '212', ''),
(4, 'Garuda Indonesia', '2021-01-29T06-09-22.352ZgarudaIndonesia.png', '07:50:00', '08:15:00', '2021-01-30 00:00:00', 550000, 1, 1, 1, 89, 2, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 0, '221', ''),
(5, 'Garuda Indonesia', '2021-01-29T06-10-23.324ZgarudaIndonesia.png', '19:50:00', '20:15:00', '2021-01-30 00:00:00', 750000, 1, 1, 1, 100, 2, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 0, '221', ''),
(6, 'Lion Air', '2021-01-29T06-12-10.457Zlionair.png', '19:00:00', '19:35:00', '2021-01-30 00:00:00', 350000, 1, 1, 0, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A11', 1, '229', ''),
(8, 'Lion Air', '2021-01-29T06-14-33.784Zlionair.png', '16:00:00', '16:35:00', '2021-01-30 00:00:00', 400000, 1, 1, 1, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A11', 2, '232', ''),
(9, 'Lion Air', '2021-01-29T06-15-33.283Zlionair.png', '18:00:00', '18:35:00', '2021-01-30 00:00:00', 500000, 0, 0, 1, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A10', 0, '232', ''),
(10, 'Air Asia', '2021-01-29T06-16-41.803Zairasia.png', '18:00:00', '18:35:00', '2021-01-30 00:00:00', 650000, 1, 0, 1, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A14', 0, '234', ''),
(11, 'Air Asia', '2021-01-29T06-17-19.663Zairasia.png', '20:00:00', '20:35:00', '2021-01-30 00:00:00', 600000, 1, 0, 1, 100, 1, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A16', 0, '234', ''),
(12, 'Air Asia', '2021-01-29T15-07-53.496Zairasia.png', '00:00:02', '02:00:02', '2021-01-31 00:00:00', 1200000, 1, 1, 1, 100, 2, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 2, '', ''),
(13, 'Lion Air', '2021-01-29T15-09-40.410Zairasia.png', '00:00:02', '02:00:02', '2021-01-31 00:00:00', 1200000, 1, 1, 1, 100, 2, 'Surabaya', 'IDN', 'Medan', 'IDN', '1', 'A2', 0, '', ''),
(14, 'Lion Air', '2021-01-30T22-15-55.637Zairasia.png', '00:00:02', '05:00:02', '2021-02-18 08:25:17', 1000000, 1, 1, 1, 100, 2, 'Medan', 'IDN', 'Surabaya', 'IDN', '1', 'A2', 0, '', 'AB-2066'),
(15, 'Garuda Indonesia', '', '21:09:00', '23:13:00', '2021-02-01 00:00:00', 150000, 1, 1, 0, 99, 6, 'Medan', 'IDN', 'Tokyo', 'JPN', '1', 'A', 1, '', 'SJ-212'),
(16, 'Garuda Indonesia', '', '02:52:00', '04:52:00', '2021-01-30 00:00:00', 200000, 1, 0, 1, 100, 4, 'Jakarta', 'IDN', 'Tokyo', 'JPN', '1', 'B', 1, '', 'SJ-221'),
(17, 'Lion Air', '', '13:58:00', '16:58:00', '2021-01-30 00:00:00', 300000, 0, 1, 1, 40, 2, 'Jakarta', 'IDN', 'K.Lumpur', 'MAS', '1', 'A', 2, '', 'HA-325'),
(18, 'Air Asia', '', '22:08:00', '23:16:07', '2021-01-30 00:00:00', 150000, 1, 1, 1, 48, 7, 'Jakarta', 'IDN', 'K.Lumpur', 'MAS', '1', 'A', 1, '', 'JKL-212'),
(19, 'Air Asia', '', '22:12:00', '23:12:00', '2021-01-30 00:00:00', 150000, 0, 1, 0, 60, 1, 'Jakarta', 'IDN', 'K.Lumpur', 'MAS', '1', 'A', 1, '', 'JKL-221');

-- --------------------------------------------------------

--
-- Struktur dari tabel `notif`
--

CREATE TABLE `notif` (
  `notifId` int(11) NOT NULL,
  `notifTitle` varchar(255) NOT NULL,
  `notifMessage` varchar(300) NOT NULL,
  `receiverId` int(11) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `notif`
--

INSERT INTO `notif` (`notifId`, `notifTitle`, `notifMessage`, `receiverId`, `createdAt`) VALUES
(14, 'Booking Status  12', 'Hello there! Your booking status is received and waiting for payment.', 12, '2021-01-31 21:59:04'),
(15, 'Booking Status  12', 'Hello there! Your booking status is received and waiting for payment.', 1, '2021-01-31 21:59:10'),
(19, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 5411c8ae153bcb92 .', 2, '2021-02-01 11:00:02'),
(20, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 5649ed30b53b47e5 .', 2, '2021-02-01 11:00:06'),
(21, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 5f54a06547482a17 .', 2, '2021-02-01 11:00:07'),
(22, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: b7ae76a9d9e48613 .', 2, '2021-02-01 11:00:08'),
(23, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 308195b33c08ffa1 .', 2, '2021-02-01 11:00:10'),
(24, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: c37783a8d962a90a .', 2, '2021-02-01 11:00:13'),
(25, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 2c8183457def3f6c .', 2, '2021-02-01 11:00:13'),
(26, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: f7dab50db3979dfb .', 2, '2021-02-01 11:00:15'),
(27, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 9cc55ed147b8ebc8 .', 2, '2021-02-01 13:55:30'),
(28, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: 10c1dfc5b1d3283f .', 2, '2021-02-01 20:00:20'),
(29, 'Booking status', 'Hello there! Your booking status is received and waiting for payment. Booking code: ac2f6455b4014442 .', 3, '2021-02-01 22:18:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `passenger`
--

CREATE TABLE `passenger` (
  `passengerId` int(10) NOT NULL,
  `bookingId` int(10) NOT NULL,
  `title` varchar(10) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `nationality` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `passenger`
--

INSERT INTO `passenger` (`passengerId`, `bookingId`, `title`, `fullName`, `nationality`) VALUES
(1, 1, 'ms', 'Nezuko', 'Indonesia'),
(2, 1, 'mr', 'Zenitsu', 'Indonesia'),
(3, 2, 'ms', 'Nezuko', 'Indonesia'),
(4, 2, 'mr', 'Zenitsu', 'Indonesia'),
(5, 3, 'Mr.', 'asd', 'Indonesia'),
(6, 4, 'Mr.', 'awdaw', 'Indonesia'),
(7, 5, 'ms', 'Nezuko', 'Indonesia'),
(8, 5, 'mr', 'Zenitsu', 'Indonesia'),
(9, 6, 'Mr.', 'asd', 'Indonesia'),
(10, 7, 'Mr.', 'asdawdad', 'Indonesia'),
(11, 8, 'Mr.', 'andra', 'Indonesia'),
(12, 9, 'Mr.', 'asd', 'Indonesia'),
(13, 10, 'Mr.', 'asd', 'Indonesia'),
(14, 11, 'Mr.', 'asd', 'Indonesia'),
(15, 12, 'Mr.', 'asd', 'Indonesia'),
(16, 13, 'Mr.', 'asd', 'Indonesia'),
(17, 14, 'Mr.', 'asd', 'Indonesia'),
(18, 15, 'Mr.', 'asd', 'Indonesia'),
(19, 16, 'Mr.', 'asd', 'Indonesia'),
(20, 17, 'Mr.', 'andra', 'Indonesia'),
(21, 17, 'Mr.', 'rizqon', 'Indonesia'),
(22, 18, 'Mr.', 'andra', 'Indonesia'),
(23, 19, 'Mr.', 'asd', 'Indonesia'),
(24, 19, 'Mr.', 'dwad', 'Indonesia'),
(25, 20, 'ms', 'Nezuko', 'Indonesia'),
(26, 20, 'mr', 'Zenitsu', 'Indonesia');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roomchat`
--

CREATE TABLE `roomchat` (
  `roomId` int(10) NOT NULL,
  `roomIdUniq` int(10) NOT NULL,
  `sender` int(10) NOT NULL,
  `receiver` int(10) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `roomchat`
--

INSERT INTO `roomchat` (`roomId`, `roomIdUniq`, `sender`, `receiver`, `createdAt`, `updatedAt`) VALUES
(1, 818935, 2, 1, '2021-01-31 18:51:57', '2021-01-31 18:51:57'),
(2, 818935, 1, 2, '2021-01-31 18:51:57', '2021-01-31 18:51:57'),
(3, 882128, 2, 3, '2021-01-31 22:29:42', '2021-01-31 22:29:42'),
(4, 882128, 3, 2, '2021-01-31 22:29:42', '2021-01-31 22:29:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `userId` int(5) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `profileImage` varchar(200) NOT NULL,
  `phoneNumber` int(20) NOT NULL,
  `city` varchar(25) NOT NULL,
  `nationality` varchar(25) NOT NULL,
  `postCode` int(10) NOT NULL,
  `role` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp(),
  `userKey` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userId`, `email`, `password`, `fullName`, `profileImage`, `phoneNumber`, `city`, `nationality`, `postCode`, `role`, `status`, `createdAt`, `updatedAt`, `userKey`) VALUES
(1, 'andr7na@gmail.com', '$2b$07$aRYbn0Jgc3T.x5e2d1aCtuNDOBhse9MqJLuXKFMOw/gSxtA8EjEyi', 'andrawan', '', 85458345, '', '', 0, 1, 0, '2021-01-29 09:12:46', '2021-02-01 15:26:00', 0),
(2, 'asd@asd', '$2b$07$rPDxGBCPM6ck1rjNXghufejIWwoQ/zQMsg7X2X9ezuK5DrxBz4H3i', 'Rudy', '2021-02-01T06-58-31.226Z3a389b0d-5b3f-4e25-99da-2da6f0f232d0.jpg', 123123, 'bekasi', 'jalan bumi lestari', 1745, 0, 0, '2021-01-31 18:00:54', '2021-02-01 06:53:14', 0),
(3, 'admin@admin', '$2b$10$FeM8aiKF7Wboszh10wo4RukknQ1ZF1226OnsVm8B60HF8cKrSYs/2', 'Chandrawan', '2021-02-01T03-32-52.449Z29d47698-2d7c-4404-85b8-47baf717b068.jpg', 0, '', '', 0, 1, 0, '2021-01-31 18:51:26', '2021-01-31 18:51:26', 0),
(4, '123@123', '$2b$10$/3KkEtEVz0XPN21duxa3Ge6m7/xRxBBVfJGj3mMU.cKUSiT3p2OKq', 'andra123', '', 0, '', '', 0, 0, 0, '2021-02-01 13:48:58', '2021-02-01 13:48:58', 0),
(5, 'asd@aswdad', '$2b$10$zTV/LqHu9o9/cgwEvXyzN.0ZWEpQ1mW/FKEK0ZcEvIWCN6py0Lgnu', 'asd', '', 0, '', '', 0, 0, 0, '2021-02-01 22:24:42', '2021-02-01 22:24:42', 0);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingId`);

--
-- Indeks untuk tabel `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`chatId`);

--
-- Indeks untuk tabel `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flightId`);

--
-- Indeks untuk tabel `notif`
--
ALTER TABLE `notif`
  ADD PRIMARY KEY (`notifId`);

--
-- Indeks untuk tabel `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`passengerId`);

--
-- Indeks untuk tabel `roomchat`
--
ALTER TABLE `roomchat`
  ADD PRIMARY KEY (`roomId`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `booking`
--
ALTER TABLE `booking`
  MODIFY `bookingId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `chatId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT untuk tabel `flight`
--
ALTER TABLE `flight`
  MODIFY `flightId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `notif`
--
ALTER TABLE `notif`
  MODIFY `notifId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passengerId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `roomchat`
--
ALTER TABLE `roomchat`
  MODIFY `roomId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
