-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jan 2021 pada 15.58
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
  `code` varchar(10) NOT NULL,
  `contactFullname` varchar(50) NOT NULL,
  `contactEmail` varchar(50) NOT NULL,
  `contactNumber` int(30) NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
 
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
  `departureTime` datetime NOT NULL DEFAULT current_timestamp(),
  `arrivedTime` datetime NOT NULL DEFAULT current_timestamp(),
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
  `transitType` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  MODIFY `bookingId` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `chat`
--
ALTER TABLE `chat`
  MODIFY `chatId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `flight`
--
ALTER TABLE `flight`
  MODIFY `flightId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `passenger`
--
ALTER TABLE `passenger`
  MODIFY `passengerId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `roomchat`
--
ALTER TABLE `roomchat`
  MODIFY `roomId` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(5) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
