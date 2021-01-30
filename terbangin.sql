-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 31 Jan 2021 pada 00.05
-- Versi server: 10.4.14-MariaDB
-- Versi PHP: 7.4.11

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
  `flightCode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `flight`
--

INSERT INTO `flight` (`flightId`, `mascapai`, `mascapaiImage`, `departureTime`, `arrivedTime`, `flightDate`, `price`, `food`, `wifi`, `luggage`, `capacity`, `clas`, `fromCity`, `fromCountry`, `toCity`, `toCountry`, `tripType`, `terminal`, `transitType`, `gate`, `flightCode`) VALUES
(1, 'Air Asia', '2021-01-28T15-49-35.653Zairasia.png', '15:00:00', '15:45:00', '2021-01-30 00:00:00', 1200000, 1, 1, 0, 90, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 2, '222', ''),
(2, 'Garuda Indonesia', '2021-01-29T06-07-05.305ZgarudaIndonesia.png', '06:45:00', '07:15:00', '2021-01-30 00:00:00', 600000, 1, 1, 0, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 2, '212', ''),
(3, 'Garuda Indonesia', '2021-01-29T06-08-43.747ZgarudaIndonesia.png', '07:50:00', '08:15:00', '2021-01-30 00:00:00', 550000, 1, 1, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 1, '212', ''),
(4, 'Garuda Indonesia', '2021-01-29T06-09-22.352ZgarudaIndonesia.png', '07:50:00', '08:15:00', '2021-01-30 00:00:00', 550000, 1, 1, 1, 100, 2, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 0, '221', ''),
(5, 'Garuda Indonesia', '2021-01-29T06-10-23.324ZgarudaIndonesia.png', '19:50:00', '20:15:00', '2021-01-30 00:00:00', 750000, 1, 1, 1, 100, 2, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 0, '221', ''),
(6, 'Lion Air', '2021-01-29T06-12-10.457Zlionair.png', '19:00:00', '19:35:00', '2021-01-30 00:00:00', 350000, 1, 1, 0, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A11', 1, '229', ''),
(7, 'Citilink', '2021-01-29T06-12-55.733Zlionair.png', '12:00:00', '12:35:00', '2021-01-30 00:00:00', 375000, 1, 1, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A11', 1, '226', ''),
(8, 'Lion Air', '2021-01-29T06-14-33.784Zlionair.png', '16:00:00', '16:35:00', '2021-01-30 00:00:00', 400000, 1, 1, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A11', 2, '232', ''),
(9, 'Lion Air', '2021-01-29T06-15-33.283Zlionair.png', '18:00:00', '18:35:00', '2021-01-30 00:00:00', 500000, 0, 0, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A10', 0, '232', ''),
(10, 'Air Asia', '2021-01-29T06-16-41.803Zairasia.png', '18:00:00', '18:35:00', '2021-01-30 00:00:00', 650000, 1, 0, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A14', 0, '234', ''),
(11, 'Air Asia', '2021-01-29T06-17-19.663Zairasia.png', '20:00:00', '20:35:00', '2021-01-30 00:00:00', 600000, 1, 0, 1, 100, 1, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A16', 0, '234', ''),
(12, 'Air Asia', '2021-01-29T15-07-53.496Zairasia.png', '00:00:02', '00:00:02', '2021-01-31 00:00:00', 1200000, 1, 1, 1, 100, 2, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 2, '', ''),
(13, 'Lion Air', '2021-01-29T15-09-40.410Zairasia.png', '00:00:02', '00:00:02', '2021-01-31 00:00:00', 1200000, 1, 1, 1, 100, 2, 'Surabaya', 'Indonesia', 'Medan', 'Indonesia', '1', 'A2', 0, '', ''),
(14, 'Lion Air', '2021-01-30T22-15-55.637Zairasia.png', '00:00:02', '00:00:02', '2021-02-01 00:00:00', 1000000, 1, 1, 1, 100, 2, 'Medan', 'Indonesia', 'Surabaya', 'Indonesia', '1', 'A2', 0, '', 'AB-2066');

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
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`userId`, `email`, `password`, `fullName`, `profileImage`, `phoneNumber`, `city`, `nationality`, `postCode`, `role`, `status`, `createdAt`, `updatedAt`) VALUES
(1, 'andr7na@gmail.com', '$2b$10$GecrBC7c8oV6jJKkUSnjlepfU1bpimijqAFMrvkiisctZgPaN8eRi', 'andrawan', '', 85458345, '', '', 0, 0, 0, '2021-01-29 09:12:46', '2021-01-29 09:12:46');

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
  MODIFY `flightId` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
  MODIFY `userId` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
