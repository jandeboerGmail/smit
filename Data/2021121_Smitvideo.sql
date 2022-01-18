-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 21, 2021 at 04:54 PM
-- Server version: 10.3.32-MariaDB-0ubuntu0.20.04.1
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smitvideo`
--

-- --------------------------------------------------------

--
-- Table structure for table `camera_bedrijf`
--

CREATE TABLE `camera_bedrijf` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `plaats` varchar(50) NOT NULL,
  `land` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `telefoon` varchar(16) NOT NULL,
  `contact_naam` varchar(50) NOT NULL,
  `contact_telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `adres`, `postcode`, `plaats`, `land`, `image`, `telefoon`, `contact_naam`, `contact_telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Brandweer Volendam', 'Julianaweg  137B', '1131DH', 'Volendam', 'Nederland', '', '112', 'Comadend Tol', '', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2021-12-14 14:58:28.736998'),
(2, 'Politie PURMEREND', 'Component 96', '', 'Purmerend', 'Nederland', '', '0900 - 8844', '', '', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-14 15:01:44.184558'),
(3, 'Tol visbedijf', 'Viskade 2', '', 'Volendam', 'Nederland', '', '', '', '', '', 'tol-visbedijf', '2021-12-14 15:01:44.000000', '2021-12-14 15:02:35.062601');

-- --------------------------------------------------------

--
-- Table structure for table `camera_camera`
--

CREATE TABLE `camera_camera` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `gps_locatie` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `datum_geplaatst` datetime(6) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `locatie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `locatie_id`) VALUES
(1, 'Ingang Buro Edam', 'Videomaster', '', '', '2021-12-14 15:10:50.000000', '', 'ingang-buro-edam', '2021-12-14 15:10:50.000000', '2021-12-14 15:18:59.291551', 1),
(2, 'Ingang Buro', 'Videomaster', '', '', '2021-12-14 15:17:58.000000', '', 'ingang-buro', '2021-12-14 15:17:58.000000', '2021-12-14 15:18:21.214808', 2);

-- --------------------------------------------------------

--
-- Table structure for table `camera_gebruiker`
--

CREATE TABLE `camera_gebruiker` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_gebruiker`
--

INSERT INTO `camera_gebruiker` (`id`, `user`, `password`, `naam`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`) VALUES
(1, 'jan', 'test1', 'Jan de Boer', '0299 363 889', '', 'jan-de-boer', '2021-12-14 15:06:35.000000', '2021-12-14 15:07:18.928584', 1),
(2, 'Orson', 'Test1', 'Orson Joon', '0299 363 889', '', 'orson-joon', '2021-12-14 15:07:29.000000', '2021-12-14 15:07:56.220845', 1);

-- --------------------------------------------------------

--
-- Table structure for table `camera_video`
--

CREATE TABLE `camera_video` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `opname_van` datetime(6) NOT NULL,
  `opname_tot` datetime(6) NOT NULL,
  `video_image` varchar(100) DEFAULT NULL,
  `video_link` varchar(500) NOT NULL,
  `codec` varchar(50) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL,
  `camera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_video`
--

INSERT INTO `camera_video` (`id`, `naam`, `opname_van`, `opname_tot`, `video_image`, `video_link`, `codec`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `camera_id`) VALUES
(1, 'Video 1', '2021-12-14 21:05:25.000000', '2021-12-14 21:05:25.000000', '', '', '', '', 'video-1', '2021-12-14 21:05:26.000000', '2021-12-14 21:06:00.227766', 2, 2),
(2, 'Video2', '2021-12-14 00:00:00.000000', '2021-12-14 06:00:00.000000', '', '', '', '', 'video2', '2021-12-14 21:06:04.000000', '2021-12-14 21:06:51.956936', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `camera_wijk`
--

CREATE TABLE `camera_wijk` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `contact_naam` varchar(50) NOT NULL,
  `contact_telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_wijk`
--

INSERT INTO `camera_wijk` (`id`, `naam`, `image`, `contact_naam`, `contact_telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`) VALUES
(1, 'Buro Edam', '', '', '', '', 'buro-edam', '2021-12-14 15:08:05.000000', '2021-12-14 15:09:57.757784', 2),
(2, 'Buro Volendam', '', '', '', '', 'buro-volendam', '2021-12-14 15:10:02.000000', '2021-12-14 15:10:36.067072', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_bedrijf_slug_6cf0579f` (`slug`);

--
-- Indexes for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD UNIQUE KEY `camera_camera_naam_locatie_id_1828c446_uniq` (`naam`,`locatie_id`),
  ADD KEY `camera_camera_locatie_id_4b75514e_fk_camera_wijk_id` (`locatie_id`),
  ADD KEY `camera_camera_slug_9c14c40a` (`slug`);

--
-- Indexes for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camera_gebruiker_user_bedrijf_id_dc029b08_uniq` (`user`,`bedrijf_id`),
  ADD KEY `camera_gebruiker_bedrijf_id_d690ec4b_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_gebruiker_slug_1691fc8f` (`slug`);

--
-- Indexes for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD KEY `camera_video_bedrijf_id_d8810ead_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_video_camera_id_306b84c4_fk_camera_camera_id` (`camera_id`),
  ADD KEY `camera_video_slug_8e2824f8` (`slug`);

--
-- Indexes for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_wijk_bedrijf_id_c591b2eb_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_wijk_slug_65f2b4da` (`slug`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD CONSTRAINT `camera_camera_locatie_id_4b75514e_fk_camera_wijk_id` FOREIGN KEY (`locatie_id`) REFERENCES `camera_wijk` (`id`);

--
-- Constraints for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  ADD CONSTRAINT `camera_gebruiker_bedrijf_id_d690ec4b_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`);

--
-- Constraints for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD CONSTRAINT `camera_video_bedrijf_id_d8810ead_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_video_camera_id_306b84c4_fk_camera_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera_camera` (`id`);

--
-- Constraints for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  ADD CONSTRAINT `camera_wijk_bedrijf_id_c591b2eb_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
