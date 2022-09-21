-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 20, 2022 at 02:08 PM
-- Server version: 10.6.7-MariaDB-2ubuntu1.1
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smitvideo_dev`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add bedrijf', 7, 'add_bedrijf'),
(26, 'Can change bedrijf', 7, 'change_bedrijf'),
(27, 'Can delete bedrijf', 7, 'delete_bedrijf'),
(28, 'Can view bedrijf', 7, 'view_bedrijf'),
(29, 'Can add camera', 8, 'add_camera'),
(30, 'Can change camera', 8, 'change_camera'),
(31, 'Can delete camera', 8, 'delete_camera'),
(32, 'Can view camera', 8, 'view_camera'),
(33, 'Can add gebruiker', 9, 'add_gebruiker'),
(34, 'Can change gebruiker', 9, 'change_gebruiker'),
(35, 'Can delete gebruiker', 9, 'delete_gebruiker'),
(36, 'Can view gebruiker', 9, 'view_gebruiker'),
(37, 'Can add wijk', 10, 'add_wijk'),
(38, 'Can change wijk', 10, 'change_wijk'),
(39, 'Can delete wijk', 10, 'delete_wijk'),
(40, 'Can view wijk', 10, 'view_wijk'),
(41, 'Can add video', 11, 'add_video'),
(42, 'Can change video', 11, 'change_video'),
(43, 'Can delete video', 11, 'delete_video'),
(44, 'Can view video', 11, 'view_video'),
(45, 'Can add log', 12, 'add_log'),
(46, 'Can change log', 12, 'change_log'),
(47, 'Can delete log', 12, 'delete_log'),
(48, 'Can view log', 12, 'view_log'),
(49, 'Can add parameter', 13, 'add_parameter'),
(50, 'Can change parameter', 13, 'change_parameter'),
(51, 'Can delete parameter', 13, 'delete_parameter'),
(52, 'Can view parameter', 13, 'view_parameter');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$bu0TFkDfWCWoDjgjS5x2uY$4wU3MwoewJwSkzZldysUGvRtm4lsku8Ew9pvMK3XbFY=', '2022-09-19 17:58:41.424321', 1, 'django', 'Jan', 'de Boer', 'jandeboer@gmail.com', 1, 1, '2021-12-24 13:13:33.000000'),
(2, 'pbkdf2_sha256$216000$YiqzyB6QzVpS$jiCXYrdZouzfBZGzJQTsnDqJgNt3k5OsEp9jfkxHyp4=', '2021-12-29 10:29:53.865553', 1, 'orson', 'orson', 'Joon', 'orsonjoon1@gmail.com', 1, 1, '2021-12-29 09:58:16.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `camera_adress`
--

CREATE TABLE `camera_adress` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `straat` varchar(50) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `plaats` varchar(50) NOT NULL,
  `land` varchar(50) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `camera_bedrijf`
--

CREATE TABLE `camera_bedrijf` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `adres_id` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `adres_id`, `email`, `website`, `image`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Brandweer Volendam', '1', 'info@bedrijf.nl', '', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2021-12-24 14:28:08.249174'),
(2, 'Politie Purmerend', '1', 'info@bedrijf.nl', '', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-24 14:31:12.949985'),
(3, 'Firma Tol Visbedrijf', '1', 'info@bedrijf.nl', '', '', '0229-123456', '', 'firma-tol-visbedrijf', '2021-12-14 15:01:44.000000', '2021-12-24 14:33:59.257053'),
(4, 'Stadgenoot', '1', 'info@bedrijf.nl', '', '', '020-110110', '', 'stadgenoot', '2021-12-22 14:43:49.461489', '2022-09-19 18:00:45.411216'),
(5, 'Kees Garnalen BV', '1', 'info@bedrijf.nl', '', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786'),
(6, 'Smit Electrotechniek', '1', 'info@bedrijf.nl', '', '', '0229-363889', '', 'smit-electrotechniek', '2021-12-23 14:39:01.084730', '2021-12-24 14:31:34.113242'),
(7, 'Thuis', '1', 'jandeboer@gmailk.com', '', '', '0611268505', '', 'thuis', '2022-01-27 09:09:06.039126', '2022-01-27 09:09:06.046116');

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
  `bedrijf_id` int(11) NOT NULL,
  `locatie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `locatie`) VALUES
(1, 'Ingang Buro Edam', 'Videomaster', '', '', '2021-12-14 15:10:50.000000', '', 'ingang-buro-edam', '2021-12-14 15:10:50.000000', '2021-12-27 11:56:28.878695', 1, 'Aan de Paal'),
(2, 'Ingang Buro', 'Videomaster', '', '', '2021-12-14 15:17:58.000000', '', 'ingang-buro', '2021-12-14 15:17:58.000000', '2021-12-27 11:56:09.577064', 1, 'Op het dak'),
(3, 'Plein Noord', 'Videomaster', '', '', '2021-12-22 15:06:56.000000', '', 'plein-noord', '2021-12-22 15:06:56.000000', '2021-12-27 11:57:06.727835', 4, 'In de lichtmast'),
(4, 'Plein Zuid', 'Videomaster', '', '', '2021-12-22 15:07:55.000000', '', 'plein-zuid', '2021-12-22 15:07:55.000000', '2021-12-27 11:58:18.825169', 4, 'In het verkeerslicht'),
(5, 'Camera 1', '', '', '', '2021-12-24 15:34:04.469881', '', 'camera-1', '2021-12-24 15:34:04.469896', '2021-12-25 08:53:28.481828', 2, 'Ingang Buro'),
(6, 'Cam 2', '', '', '', '2021-12-25 08:48:55.102762', '', 'cam-2', '2021-12-25 08:48:55.102783', '2021-12-25 08:48:55.113805', 3, 'Op het Dak'),
(7, 'Cam Stalling', '', '', '', '2021-12-31 12:33:55.321256', '', 'cam-stalling', '2021-12-31 12:33:55.321276', '2021-12-31 12:33:55.360826', 4, 'Camera Stalling'),
(8, 'Werkkamer', '', '', '', '2022-01-27 09:07:07.719585', '', 'werkkamer', '2022-01-27 09:07:07.719604', '2022-01-27 09:11:11.562467', 7, 'Thuis'),
(9, 'default', 'Dahua NVR', '', '', '2022-09-20 09:36:57.411630', '', 'default', '2022-09-20 09:36:57.411640', '2022-09-20 09:36:57.415263', 4, 'Default locatie');

-- --------------------------------------------------------

--
-- Table structure for table `camera_gebruiker`
--

CREATE TABLE `camera_gebruiker` (
  `id` int(11) NOT NULL,
  `user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `telefoon` varchar(16) NOT NULL,
  `soort` int(11) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_gebruiker`
--

INSERT INTO `camera_gebruiker` (`id`, `user`, `password`, `naam`, `email`, `telefoon`, `soort`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(2, 'jan', 'test1', 'Jan de Boer', 'jandeboer@gmail.com', '0299 363 889', 0, '', 'jan-de-boer', '2021-12-14 15:06:35.000000', '2021-12-24 14:12:47.482569'),
(3, 'orson', 'Test1', 'Orson Joon', 'orson@smitelektrotechniek.nl', '0299 363 889', 0, '', 'orson-joon', '2021-12-14 15:07:29.000000', '2021-12-27 12:15:11.747076'),
(4, 'Sint', '', 'Sinterklaas', 'sint@smitelektrotechniek.nl', '0299 363 889', 2, '', 'sinterklaas', '2021-12-23 14:33:18.300634', '2021-12-24 14:13:18.193695'),
(5, 'klaasen', '', 'Agent Klaasen', 'info@me.nl', '0800-8844', 1, '', 'agent-klaasen', '2021-12-24 14:12:29.067839', '2021-12-25 08:11:40.485447'),
(6, 'vries', '', 'Commandant de  Vries', 'info@me.brandweer.nl', '06 11 22 33 44', 1, '', 'commandant-de-vries', '2021-12-24 14:15:35.591461', '2021-12-24 14:16:27.330791'),
(7, 'jansma', '', 'Agent Jansma', 'info@politie.nl', '0800-8844', 1, '', 'agent-jansma', '2021-12-24 14:30:02.647281', '2021-12-24 14:30:02.647952'),
(8, 'tol', '', 'Kees Tol', 'info@keestol.nl', '06 11 22 33 44', 1, '', 'kees-tol', '2021-12-24 14:32:54.840943', '2021-12-24 14:32:54.841784'),
(9, 'margot', '', 'dhr Margot', 'info@stadsplan.nl', '06 11 22 33 44', 1, '', 'dhr-margot', '2021-12-24 14:33:37.316037', '2021-12-24 14:33:37.316865');

-- --------------------------------------------------------

--
-- Table structure for table `camera_locatie`
--

CREATE TABLE `camera_locatie` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `adres_id` int(11) NOT NULL,
  `bedrijf_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `camera_log`
--

CREATE TABLE `camera_log` (
  `id` int(11) NOT NULL,
  `ordernr` varchar(50) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_log`
--

INSERT INTO `camera_log` (`id`, `ordernr`, `datum_inserted`, `datum_updated`, `message`) VALUES
(1, ' ', '2022-09-19 14:16:30.482709', '2022-09-19 14:16:30.482736', 'Looking for New Videos in /home/jan/video'),
(2, ' ', '2022-09-19 14:27:00.237686', '2022-09-19 14:27:00.237735', 'Looking for New Videos in /home/jan/video'),
(3, 'Ordernr001', '2022-09-19 14:27:05.620295', '2022-09-19 14:27:05.620324', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/auto265.mp4 Size: 61.24623 MB'),
(4, 'Ordernr001', '2022-09-19 15:04:46.571397', '2022-09-19 15:04:46.571437', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto265.webm Size: 130.94634 MB Time: 00:37:40'),
(5, 'Ordernr001', '2022-09-19 15:04:51.616735', '2022-09-19 15:04:51.616768', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(6, ' ', '2022-09-19 17:05:50.928656', '2022-09-19 17:05:50.928688', 'Looking for New Videos in /home/jan/video'),
(7, 'Ordernr001', '2022-09-19 17:05:56.707578', '2022-09-19 17:05:56.707608', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(8, ' ', '2022-09-19 17:59:23.485681', '2022-09-19 17:59:23.485737', 'Looking for New Videos in /home/jan/video'),
(9, 'Ordernr001', '2022-09-19 17:59:28.861047', '2022-09-19 17:59:28.861078', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(10, ' ', '2022-09-19 18:10:44.731622', '2022-09-19 18:10:44.731673', 'Looking for New Videos in /home/jan/video'),
(11, 'Ordernr001', '2022-09-19 18:10:50.001108', '2022-09-19 18:10:50.001138', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(12, 'Ordernr001', '2022-09-19 19:14:53.444422', '2022-09-19 19:14:53.444459', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 170.17024 MB Time: 01:04:03'),
(13, ' ', '2022-09-20 09:24:09.504783', '2022-09-20 09:24:09.504833', 'Looking for New Videos in /home/jan/video'),
(14, 'Ordernr001', '2022-09-20 09:24:15.236135', '2022-09-20 09:24:15.236165', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(15, ' ', '2022-09-20 09:25:48.924212', '2022-09-20 09:25:48.924253', 'Looking for New Videos in /home/jan/video'),
(16, 'Ordernr001', '2022-09-20 09:25:54.226681', '2022-09-20 09:25:54.226711', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(17, 'Ordernr001', '2022-09-20 09:25:54.244335', '2022-09-20 09:25:54.244359', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 2.00000 MB Time: 00:00:00'),
(18, ' ', '2022-09-20 09:30:07.441610', '2022-09-20 09:30:07.441652', 'Looking for New Videos in /home/jan/video'),
(19, 'Ordernr001', '2022-09-20 09:30:12.778679', '2022-09-20 09:30:12.778712', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(20, 'Ordernr001', '2022-09-20 09:30:12.802786', '2022-09-20 09:30:12.802811', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 14.00000 MB Time: 00:00:00'),
(21, ' ', '2022-09-20 09:32:38.328907', '2022-09-20 09:32:38.328948', 'Looking for New Videos in /home/jan/video'),
(22, 'Ordernr001', '2022-09-20 09:32:43.638680', '2022-09-20 09:32:43.638710', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(23, 'Ordernr001', '2022-09-20 09:32:43.651585', '2022-09-20 09:32:43.651612', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 21.00000 MB Time: 00:00:00'),
(24, ' ', '2022-09-20 09:38:07.749165', '2022-09-20 09:38:07.749177', 'Looking for New Videos in /home/jan/video'),
(25, 'Ordernr001', '2022-09-20 09:38:13.030669', '2022-09-20 09:38:13.030703', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(26, 'Ordernr001', '2022-09-20 09:38:13.057700', '2022-09-20 09:38:13.057727', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 36.00000 MB Time: 00:00:00'),
(27, ' ', '2022-09-20 09:38:55.240356', '2022-09-20 09:38:55.240406', 'Looking for New Videos in /home/jan/video'),
(28, 'Ordernr001', '2022-09-20 09:39:00.505016', '2022-09-20 09:39:00.505044', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(29, 'Ordernr001', '2022-09-20 09:39:00.515553', '2022-09-20 09:39:00.515579', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(30, ' ', '2022-09-20 09:44:41.568736', '2022-09-20 09:44:41.568769', 'Looking for New Videos in /home/jan/video'),
(31, 'Ordernr001', '2022-09-20 09:44:46.854061', '2022-09-20 09:44:46.854091', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(32, 'Ordernr001', '2022-09-20 09:44:46.888348', '2022-09-20 09:44:46.888374', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(33, ' ', '2022-09-20 09:45:41.213858', '2022-09-20 09:45:41.213891', 'Looking for New Videos in /home/jan/video'),
(34, 'Ordernr001', '2022-09-20 09:45:46.504260', '2022-09-20 09:45:46.504291', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(35, 'Ordernr001', '2022-09-20 09:45:46.538797', '2022-09-20 09:45:46.538824', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(36, ' ', '2022-09-20 09:48:15.645866', '2022-09-20 09:48:15.645899', 'Looking for New Videos in /home/jan/video'),
(37, 'Ordernr001', '2022-09-20 09:48:20.916886', '2022-09-20 09:48:20.916918', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(38, 'Ordernr001', '2022-09-20 09:48:20.951420', '2022-09-20 09:48:20.951447', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(39, ' ', '2022-09-20 09:53:00.660833', '2022-09-20 09:53:00.660866', 'Looking for New Videos in /home/jan/video'),
(40, 'Ordernr001', '2022-09-20 09:53:05.982666', '2022-09-20 09:53:05.982697', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(41, 'Ordernr001', '2022-09-20 09:53:06.017638', '2022-09-20 09:53:06.017665', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(42, ' ', '2022-09-20 09:58:40.645578', '2022-09-20 09:58:40.645611', 'Looking for New Videos in /home/jan/video'),
(43, 'Ordernr001', '2022-09-20 09:58:45.923214', '2022-09-20 09:58:45.923247', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(44, 'Ordernr001', '2022-09-20 09:58:45.996037', '2022-09-20 09:58:45.996064', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(45, ' ', '2022-09-20 10:00:22.841968', '2022-09-20 10:00:22.842002', 'Looking for New Videos in /home/jan/video'),
(46, 'Ordernr001', '2022-09-20 10:00:28.100411', '2022-09-20 10:00:28.100443', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(47, 'Ordernr001', '2022-09-20 10:00:28.128062', '2022-09-20 10:00:28.128089', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(48, 'Ordernr001', '2022-09-20 10:00:33.154924', '2022-09-20 10:00:33.154953', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/voordeur264.mp4 Size: 57.10660 MB'),
(49, 'Ordernr001', '2022-09-20 10:00:33.175418', '2022-09-20 10:00:33.175446', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/voordeur264.webm Size: 70.74908 MB Time: 00:00:00'),
(50, 'Ordernr001', '2022-09-20 10:00:38.218579', '2022-09-20 10:00:38.218608', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/auto264.mp4 Size: 180.82865 MB'),
(51, 'Ordernr001', '2022-09-20 10:00:38.239291', '2022-09-20 10:00:38.239318', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto264.webm Size: 133.01850 MB Time: 00:00:00'),
(52, 'Ordernr001', '2022-09-20 10:00:43.270499', '2022-09-20 10:00:43.270535', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1full.mp4 Size: 1067.56470 MB'),
(53, 'Ordernr001', '2022-09-20 10:00:43.332360', '2022-09-20 10:00:43.332387', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1full.webm Size: 735.38562 MB Time: 00:00:00'),
(54, 'Ordernr001', '2022-09-20 10:00:48.358528', '2022-09-20 10:00:48.358558', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1.mp4 Size: 2.24271 MB'),
(55, 'Ordernr001', '2022-09-20 10:00:48.379076', '2022-09-20 10:00:48.379103', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1.webm Size: 2.93726 MB Time: 00:00:00'),
(56, 'Ordernr001', '2022-09-20 10:00:53.410311', '2022-09-20 10:00:53.410339', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny1080Full.mp4 Size: 339.37126 MB'),
(57, 'Ordernr001', '2022-09-20 10:00:53.430977', '2022-09-20 10:00:53.431005', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny1080Full.webm Size: 0.00000 MB Time: 00:00:00'),
(58, 'Ordernr001', '2022-09-20 10:00:58.462176', '2022-09-20 10:00:58.462205', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny360.mp4 Size: 0.94511 MB'),
(59, ' ', '2022-09-20 10:02:19.022834', '2022-09-20 10:02:19.022867', 'Looking for New Videos in /home/jan/video'),
(60, 'Ordernr001', '2022-09-20 10:02:24.282432', '2022-09-20 10:02:24.282484', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(61, 'Ordernr001', '2022-09-20 10:02:24.317013', '2022-09-20 10:02:24.317039', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(62, ' ', '2022-09-20 10:05:05.366094', '2022-09-20 10:05:05.366127', 'Looking for New Videos in /home/jan/video'),
(63, 'Ordernr001', '2022-09-20 10:05:10.658507', '2022-09-20 10:05:10.658540', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(64, 'Ordernr001', '2022-09-20 10:05:10.669085', '2022-09-20 10:05:10.669112', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(65, 'Ordernr001', '2022-09-20 10:05:15.710362', '2022-09-20 10:05:15.710397', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/voordeur264.mp4 Size: 57.10660 MB'),
(66, 'Ordernr001', '2022-09-20 10:05:15.744923', '2022-09-20 10:05:15.744951', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/voordeur264.webm Size: 70.74908 MB Time: 00:00:00'),
(67, 'Ordernr001', '2022-09-20 10:05:20.786077', '2022-09-20 10:05:20.786106', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/auto264.mp4 Size: 180.82865 MB'),
(68, 'Ordernr001', '2022-09-20 10:05:20.820864', '2022-09-20 10:05:20.820891', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto264.webm Size: 133.01850 MB Time: 00:00:00'),
(69, ' ', '2022-09-20 10:05:23.805784', '2022-09-20 10:05:23.805801', 'Looking for New Videos in /home/jan/video'),
(70, 'Ordernr001', '2022-09-20 10:05:25.862114', '2022-09-20 10:05:25.862144', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1full.mp4 Size: 1067.56470 MB'),
(71, 'Ordernr001', '2022-09-20 10:05:25.872865', '2022-09-20 10:05:25.872891', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1full.webm Size: 735.38562 MB Time: 00:00:00'),
(72, 'Ordernr001', '2022-09-20 10:05:29.138182', '2022-09-20 10:05:29.138210', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(73, 'Ordernr001', '2022-09-20 10:05:29.172910', '2022-09-20 10:05:29.172936', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(74, 'Ordernr001', '2022-09-20 10:05:30.902103', '2022-09-20 10:05:30.902135', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1.mp4 Size: 2.24271 MB'),
(75, 'Ordernr001', '2022-09-20 10:05:30.912772', '2022-09-20 10:05:30.912799', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1.webm Size: 2.93726 MB Time: 00:00:00'),
(76, 'Ordernr001', '2022-09-20 10:05:35.942022', '2022-09-20 10:05:35.942051', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny1080Full.mp4 Size: 339.37126 MB'),
(77, 'Ordernr001', '2022-09-20 10:05:35.964711', '2022-09-20 10:05:35.964738', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny1080Full.webm Size: 0.00000 MB Time: 00:00:00'),
(78, 'Ordernr001', '2022-09-20 10:05:40.993959', '2022-09-20 10:05:40.993988', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny360.mp4 Size: 0.94511 MB'),
(79, ' ', '2022-09-20 10:16:50.310574', '2022-09-20 10:16:50.310625', 'Looking for New Videos in /home/jan/video'),
(80, 'Ordernr001', '2022-09-20 10:16:55.594615', '2022-09-20 10:16:55.594644', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(81, 'Ordernr001', '2022-09-20 10:16:55.629096', '2022-09-20 10:16:55.629122', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(82, 'Ordernr001', '2022-09-20 10:17:00.670408', '2022-09-20 10:17:00.670436', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/voordeur264.mp4 Size: 57.10660 MB'),
(83, 'Ordernr001', '2022-09-20 10:17:00.705062', '2022-09-20 10:17:00.705089', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/voordeur264.webm Size: 70.74908 MB Time: 00:00:00'),
(84, 'Ordernr001', '2022-09-20 10:17:05.758313', '2022-09-20 10:17:05.758345', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/auto264.mp4 Size: 180.82865 MB'),
(85, 'Ordernr001', '2022-09-20 10:17:05.780943', '2022-09-20 10:17:05.780970', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto264.webm Size: 133.01850 MB Time: 00:00:00'),
(86, 'Ordernr001', '2022-09-20 10:17:10.810241', '2022-09-20 10:17:10.810270', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1full.mp4 Size: 1067.56470 MB'),
(87, 'Ordernr001', '2022-09-20 10:17:10.820875', '2022-09-20 10:17:10.820901', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1full.webm Size: 735.38562 MB Time: 00:00:00'),
(88, 'Ordernr001', '2022-09-20 10:17:15.850120', '2022-09-20 10:17:15.850148', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1.mp4 Size: 2.24271 MB'),
(89, 'Ordernr001', '2022-09-20 10:17:15.872747', '2022-09-20 10:17:15.872774', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1.webm Size: 2.93726 MB Time: 00:00:00'),
(90, 'Ordernr001', '2022-09-20 10:17:20.902002', '2022-09-20 10:17:20.902030', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny1080Full.mp4 Size: 339.37126 MB'),
(91, 'Ordernr001', '2022-09-20 10:17:20.923665', '2022-09-20 10:17:20.923692', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny1080Full.webm Size: 0.00000 MB Time: 00:00:00'),
(92, 'Ordernr001', '2022-09-20 10:17:25.965895', '2022-09-20 10:17:25.965923', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny360.mp4 Size: 0.94511 MB'),
(93, ' ', '2022-09-20 10:20:12.452196', '2022-09-20 10:20:12.452211', 'Looking for New Videos in /home/jan/video'),
(94, 'Ordernr001', '2022-09-20 10:20:17.718108', '2022-09-20 10:20:17.718140', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(95, 'Ordernr001', '2022-09-20 10:20:17.757284', '2022-09-20 10:20:17.757310', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(96, ' ', '2022-09-20 10:21:59.760020', '2022-09-20 10:21:59.760046', 'Looking for New Videos in /home/jan/video'),
(97, 'Ordernr001', '2022-09-20 10:22:05.043755', '2022-09-20 10:22:05.043784', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/brommer264.mp4 Size: 182.65178 MB'),
(98, 'Ordernr001', '2022-09-20 10:22:05.066302', '2022-09-20 10:22:05.066328', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm Size: 39.18731 MB Time: 00:00:00'),
(99, 'Ordernr001', '2022-09-20 10:22:10.095549', '2022-09-20 10:22:10.095577', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/voordeur264.mp4 Size: 57.10660 MB'),
(100, 'Ordernr001', '2022-09-20 10:22:10.114135', '2022-09-20 10:22:10.114161', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/voordeur264.webm Size: 70.74908 MB Time: 00:00:00'),
(101, 'Ordernr001', '2022-09-20 10:22:15.159449', '2022-09-20 10:22:15.159477', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/auto264.mp4 Size: 180.82865 MB'),
(102, 'Ordernr001', '2022-09-20 10:22:15.221695', '2022-09-20 10:22:15.221721', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto264.webm Size: 133.01850 MB Time: 00:00:00'),
(103, 'Ordernr001', '2022-09-20 10:22:20.270860', '2022-09-20 10:22:20.270895', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1full.mp4 Size: 1067.56470 MB'),
(104, 'Ordernr001', '2022-09-20 10:22:20.282099', '2022-09-20 10:22:20.282125', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1full.webm Size: 735.38562 MB Time: 00:00:00'),
(105, 'Ordernr001', '2022-09-20 10:22:25.311367', '2022-09-20 10:22:25.311401', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/dahua1.mp4 Size: 2.24271 MB'),
(106, 'Ordernr001', '2022-09-20 10:22:25.334024', '2022-09-20 10:22:25.334053', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1.webm Size: 2.93726 MB Time: 00:00:00'),
(107, 'Ordernr001', '2022-09-20 10:22:30.399208', '2022-09-20 10:22:30.399237', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny1080Full.mp4 Size: 339.37126 MB'),
(108, 'Ordernr001', '2022-09-20 10:22:30.433964', '2022-09-20 10:22:30.433990', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny1080Full.webm Size: 0.00000 MB Time: 00:00:00'),
(109, 'Ordernr001', '2022-09-20 10:22:35.475131', '2022-09-20 10:22:35.475160', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/bunny360.mp4 Size: 0.94511 MB'),
(110, 'Ordernr001', '2022-09-20 10:22:35.509833', '2022-09-20 10:22:35.509860', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny360.webm Size: 2.84040 MB Time: 00:00:00'),
(111, 'Ordernr001', '2022-09-20 10:22:40.551007', '2022-09-20 10:22:40.551035', 'Converting   /home/jan/video/Dorpstraat 1/2Convert/Ordernr001/earth.mp4 Size: 1.49729 MB'),
(112, 'Ordernr001', '2022-09-20 10:22:40.594829', '2022-09-20 10:22:40.594856', 'Converted to /home/jan/video/Dorpstraat 1/Converted/Ordernr001/earth.webm Size: 4.16200 MB Time: 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `camera_parameter`
--

CREATE TABLE `camera_parameter` (
  `id` int(11) NOT NULL,
  `videoPath` varchar(100) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `conversion_running` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_parameter`
--

INSERT INTO `camera_parameter` (`id`, `videoPath`, `datum_inserted`, `datum_updated`, `conversion_running`) VALUES
(1, '/home/jan/video', '2022-09-12 00:00:00.000000', '2022-09-20 10:22:00.027840', 0);

-- --------------------------------------------------------

--
-- Table structure for table `camera_video`
--

CREATE TABLE `camera_video` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `opname_van` datetime(6) NOT NULL,
  `opname_tot` datetime(6) NOT NULL,
  `video_link` varchar(500) NOT NULL,
  `codec` varchar(50) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `camera_id` int(11) NOT NULL,
  `ordernr` varchar(50) NOT NULL,
  `duration` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_video`
--

INSERT INTO `camera_video` (`id`, `naam`, `opname_van`, `opname_tot`, `video_link`, `codec`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `camera_id`, `ordernr`, `duration`) VALUES
(1, 'Voordeur', '2021-12-14 21:05:25.000000', '2021-12-15 21:05:25.000000', 'voordeur.mp4', '264', '', 'voordeur-264', '2021-12-14 21:05:26.000000', '2021-12-27 18:40:01.536469', 2, '1', ''),
(2, 'Auto 265', '2021-12-14 00:00:00.000000', '2021-12-14 06:00:00.000000', 'auto265.mp4', '265', '', 'auto-265', '2021-12-14 21:06:04.000000', '2022-01-05 16:01:06.808116', 2, '1', ''),
(3, 'Earth', '2021-12-22 15:08:41.000000', '2021-12-22 15:08:41.000000', 'earth.mp4', '264', '', 'earth', '2021-12-22 15:08:41.000000', '2021-12-27 18:41:33.568474', 3, '1', ''),
(4, 'Auto', '2021-12-22 15:09:47.000000', '2021-12-22 15:09:47.000000', 'auto264.mp4', '264', '', 'auto-264', '2021-12-22 15:09:47.000000', '2022-01-05 15:48:14.440549', 4, '1', ''),
(5, 'Brommer 265', '2021-12-27 12:11:03.000000', '2021-12-27 12:11:03.000000', 'brommer265.mp4', '265', '', 'brommer-265', '2021-12-27 12:11:29.000000', '2022-01-05 15:44:13.160288', 1, '1', ''),
(6, 'Brommer 264', '2021-12-31 09:55:46.000000', '2021-12-31 09:55:46.000000', 'brommer264.mp4', '264', '', 'brommer-264', '2021-12-31 09:56:31.649301', '2022-01-05 15:32:20.510424', 7, '1', ''),
(7, 'Bunny short 265', '2022-01-06 12:35:01.000000', '2022-01-06 12:35:01.000000', 'bunny360265.mp4', '265', '', 'bunny-short-265', '2022-01-06 12:35:40.139294', '2022-01-27 10:11:26.204323', 7, '1', ''),
(8, 'Bunny Full', '2022-01-06 12:56:18.000000', '2022-01-06 12:56:18.000000', 'bunny1080Full.mp4', '264', '', 'bunny-full', '2022-01-06 12:57:18.620661', '2022-01-17 10:52:09.516634', 7, '1', ''),
(9, 'Auto vb9', '2022-01-07 13:58:27.000000', '2022-01-07 13:58:27.000000', 'auto.webm', 'vb9', '', 'auto', '2022-01-07 14:06:32.658192', '2022-01-07 14:07:44.212244', 7, '1', ''),
(10, 'Brommer vb9', '2022-01-10 11:10:35.000000', '2022-01-10 11:10:35.000000', 'brommer.webm', 'vb9', '', 'brommer', '2022-01-10 11:11:39.553519', '2022-01-10 11:11:39.729330', 7, '1', ''),
(11, 'Bunny Short', '2022-01-10 11:50:03.000000', '2022-01-10 11:50:03.000000', 'bunny360.mp4', '264', '', 'bunny-short', '2022-01-10 11:51:19.614014', '2022-01-15 09:04:12.976088', 7, '1', ''),
(12, 'Apple', '2022-01-26 09:21:28.000000', '2022-01-26 09:21:28.000000', 'applehvc1.mov', '265', '', 'apple', '2022-01-26 09:23:33.108971', '2022-09-09 10:20:08.348040', 2, '2', ''),
(13, 'Printer', '2022-01-26 09:24:43.000000', '2022-01-26 09:24:43.000000', 'printer.m4v', '264', '', 'printer', '2022-01-26 09:25:44.877320', '2022-01-26 09:26:44.799709', 5, '1', ''),
(14, 'Bunny Full 265', '2022-01-26 09:28:07.000000', '2022-01-26 09:28:07.000000', 'bunny1089full.webm', 'vb9', '', 'bunny-full-265', '2022-01-26 09:30:11.527413', '2022-01-26 13:06:15.166349', 2, '1', ''),
(15, 'Dahua1 265', '2022-01-27 09:05:15.000000', '2022-01-27 09:05:15.000000', 'dahua1.mp4', '265', '', 'dahua1-265', '2022-01-27 09:06:17.790866', '2022-01-27 09:11:41.166713', 8, '1', ''),
(30, 'brommer264', '2022-09-20 10:22:05.080192', '2022-09-20 10:22:05.080202', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/brommer264.webm', 'vb9', '', 'brommer264', '2022-09-20 10:22:05.080237', '2022-09-20 10:22:05.080349', 9, 'Ordernr001', ''),
(31, 'voordeur264', '2022-09-20 10:22:10.144028', '2022-09-20 10:22:10.144037', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/voordeur264.webm', 'vb9', '', 'voordeur264', '2022-09-20 10:22:10.144064', '2022-09-20 10:22:10.144163', 9, 'Ordernr001', ''),
(32, 'auto264', '2022-09-20 10:22:15.255944', '2022-09-20 10:22:15.255953', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/auto264.webm', 'vb9', '', 'auto264', '2022-09-20 10:22:15.255980', '2022-09-20 10:22:15.256079', 9, 'Ordernr001', ''),
(33, 'dahua1full', '2022-09-20 10:22:20.296082', '2022-09-20 10:22:20.296090', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1full.webm', 'vb9', '', 'dahua1full', '2022-09-20 10:22:20.296122', '2022-09-20 10:22:20.296232', 9, 'Ordernr001', ''),
(34, 'dahua1', '2022-09-20 10:22:25.384113', '2022-09-20 10:22:25.384121', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/dahua1.webm', 'vb9', '', 'dahua1', '2022-09-20 10:22:25.384152', '2022-09-20 10:22:25.384259', 9, 'Ordernr001', ''),
(35, 'bunny1080Full', '2022-09-20 10:22:30.459709', '2022-09-20 10:22:30.459717', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny1080Full.webm', 'vb9', '', 'bunny1080full', '2022-09-20 10:22:30.459745', '2022-09-20 10:22:30.459843', 9, 'Ordernr001', ''),
(36, 'bunny360', '2022-09-20 10:22:35.535663', '2022-09-20 10:22:35.535671', '/home/jan/video/Dorpstraat 1/Converted/Ordernr001/bunny360.webm', 'vb9', '', 'bunny360', '2022-09-20 10:22:35.535699', '2022-09-20 10:22:35.535797', 9, 'Ordernr001', '');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-12-27 13:12:38.144441', '1', 'Video 1', 2, '[{\"changed\": {\"fields\": [\"Video link\", \"Codec\"]}}]', 11, 1),
(2, '2021-12-27 13:13:00.145852', '4', 'Video 2', 2, '[{\"changed\": {\"fields\": [\"Video link\", \"Codec\"]}}]', 11, 1),
(3, '2021-12-27 13:14:27.995170', '2', 'Video 3', 2, '[{\"changed\": {\"fields\": [\"Video link\", \"Codec\"]}}]', 11, 1),
(4, '2021-12-27 13:14:45.880109', '3', 'Video 4', 2, '[{\"changed\": {\"fields\": [\"Video link\", \"Codec\"]}}]', 11, 1),
(5, '2021-12-27 13:15:12.899490', '5', 'Video 5', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Video link\", \"Codec\"]}}]', 11, 1),
(6, '2021-12-27 15:09:47.137629', '1', 'Video 1', 2, '[{\"changed\": {\"fields\": [\"Video link\"]}}]', 11, 1),
(7, '2021-12-27 15:10:55.221972', '4', 'Video 2', 2, '[{\"changed\": {\"fields\": [\"Video link\", \"Codec\"]}}]', 11, 1),
(8, '2021-12-29 09:58:16.422484', '2', 'orson', 1, '[{\"added\": {}}]', 4, 1),
(9, '2021-12-29 10:00:16.891887', '2', 'orson', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\"]}}]', 4, 1),
(10, '2021-12-29 10:05:23.059740', '1', 'django', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'camera', 'bedrijf'),
(8, 'camera', 'camera'),
(9, 'camera', 'gebruiker'),
(12, 'camera', 'log'),
(13, 'camera', 'parameter'),
(11, 'camera', 'video'),
(10, 'camera', 'wijk'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-24 13:10:40.290283'),
(2, 'auth', '0001_initial', '2021-12-24 13:10:44.228266'),
(3, 'admin', '0001_initial', '2021-12-24 13:10:57.168535'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-24 13:11:01.848347'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-24 13:11:01.915143'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-24 13:11:04.491647'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-24 13:11:06.093894'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-24 13:11:06.519640'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-24 13:11:06.622216'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-24 13:11:09.999800'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-24 13:11:10.167135'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-24 13:11:10.309676'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-24 13:11:12.133086'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-24 13:11:14.035485'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-24 13:11:14.230113'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-24 13:11:14.323901'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-24 13:11:15.989833'),
(18, 'camera', '0001_initial', '2021-12-24 13:11:23.024154'),
(19, 'sessions', '0001_initial', '2021-12-24 13:11:34.534198'),
(20, 'camera', '0002_auto_20211224_1520', '2021-12-24 15:20:32.998530'),
(21, 'camera', '0003_auto_20211227_1311', '2021-12-27 13:11:46.452112'),
(22, 'camera', '0004_auto_20220110_1241', '2022-01-10 12:41:28.888954'),
(23, 'camera', '0005_log_video_ordernr', '2022-09-09 09:20:47.652412'),
(24, 'camera', '0006_alter_video_ordernr', '2022-09-09 09:44:14.344252'),
(25, 'camera', '0007_parameter_alter_video_options', '2022-09-12 08:07:03.941859'),
(26, 'camera', '0008_log_datum_updated_parameter_datum_updated_and_more', '2022-09-12 09:08:35.625860'),
(27, 'camera', '0009_alter_log_options', '2022-09-12 09:12:12.453702'),
(28, 'camera', '0010_remove_log_messsage_log_message', '2022-09-12 09:26:27.224341'),
(29, 'camera', '0011_alter_log_message', '2022-09-13 12:31:10.741795'),
(30, 'camera', '0012_parameter_conversion_running', '2022-09-14 06:28:29.463347'),
(31, 'camera', '0013_remove_video_video_image_video_duration_and_more', '2022-09-19 17:02:27.943912');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('30gdj5ddx1xvgvtff4vmbagldid9jbca', '.eJxVjEEOwiAQRe_C2hCmQAsu3XsGwgyDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hTuIsQJx-N4z04LqDdI_11iS1ui4zyl2RB-3y2hI_L4f7d1BiL986Zz-MFjB7p6bRIJMxmJx3PLDmpHQCTzpnFxVMzlIkjdYCGIuaIZN4fwDuCTg5:1o3xKe:UkArc_fEhy0fpe-_CL2AN47cW5_0Wc6GVJRlYibxOnM', '2022-07-06 10:11:32.250892'),
('3qgu1oo6ym3ihhm89z34383en0q1yz5m', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nCRHk:nXioVgd2zkNhlPPTyFVtTOz8iCXkoLyHryT8VQX4Z1c', '2022-02-08 19:15:20.794360'),
('40a76d4spg5kkj2biy7rjpkkuzdm179g', '.eJxVjLEOAiEQRP-F2pAFPBBLe7-BLMsipwaS464y_ruSXKHJVPPezEsE3NYSts5LmJM4CyUOv11EenAdIN2x3pqkVtdljnIocqddXlvi52V3_w4K9vJdAwNnQ6eJbD4qbRnIR9BGA6FjjZNXiaMyBtk5SyrbRCPsLWRwRrw_7F44Ig:1n8MPZ:2sP6mbOvhQyIB6K68V9jS7vZPQZeA0mdjhQyj8G7Sew', '2022-01-28 13:14:33.766060'),
('55y1wpg21yo3qpfx22ktdf48t4yrt1h1', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n0l2F:0KiEbDklOjcOn_6cAoghTGVuW1Gv0vWYFodEd9fSm9M', '2022-01-07 13:55:03.670168'),
('6tcf4tefl2zo3ul214bipjrdnoysu012', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2W8V:Y3rXy3G-p0cVbYfnjDs-ngHHQcEni4n610KeOUcCD_s', '2022-01-12 10:24:47.571561'),
('758f91q6amuayql3o4pucut2ki4qg5e1', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nCR0j:unwaqs6Bm4zugSFaPZR2a4hEvEmLsPfX8iVrC1pCx3U', '2022-02-08 18:57:45.691636'),
('89po124q987bnxvs6usodxocaft5wso4', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nCQKq:DC3d9L3EkJlh0YfOQQMeGVo8vCKK91QA-jwbcTr8dtg', '2022-02-08 18:14:28.237733'),
('8kdzt5biwiibgv7recxq0ak981dw561m', '.eJxVjDsOwjAUBO_iGlnyL8-hpOcM1lvHxgFkS3FSIe4OkVJAuzOzLxF4W0vYelrCPImzUOL0u4HjI9UdTHeutyZjq-syQ-6KPGiX1zal5-Vw_w4K9_KtR880Dnok46ynrG0kuAQyPjlyUBHOgg1DI5MBVCZliTgP1nCOEO8PzrM4EQ:1oXd8W:zcdbC_N_yzvvNFEiqTwS9Mh0-FO_Xmfw-UAbohJ00gs', '2022-09-26 06:41:40.800839'),
('93plp5lsgtny31qubucq4ies2qaostpu', '.eJxVjMsOwiAQRf-FtSHAUKa4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOQovT78YUH7ntIN2p3WYZ57YuE8tdkQft8jqn_Lwc7t9BpV6_NTqN2SjPPBLZSFYrsMoVZ8AXNIyloGcNg_EjUHZgE1mrCyMOyAzi_QHI9zdD:1n9S8j:SmuvLEX5-Qh6Kg1EETkda9utKTHQ3NbEglp_3Xt2QhA', '2022-01-31 13:33:41.572258'),
('9j0qoalc3bpb83fitgtzr1jrf1mjld7v', '.eJxVjDsOwjAUBO_iGlnyL8-hpOcM1lvHxgFkS3FSIe4OkVJAuzOzLxF4W0vYelrCPImzUOL0u4HjI9UdTHeutyZjq-syQ-6KPGiX1zal5-Vw_w4K9_KtR880Dnok46ynrG0kuAQyPjlyUBHOgg1DI5MBVCZliTgP1nCOEO8PzrM4EQ:1oaL2X:BbCeCEq1lGzIhvXRv2sVBMBbgGXcRXzXt6gNEWN26tQ', '2022-10-03 17:58:41.448507'),
('9v5uefyzsebdespi7nlgcx3s7qe780bl', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n58y2:q6I8XYgVRMcQhU1tTjYazZbJNKGOqLqvYmE6Wl_BXxo', '2022-01-19 16:16:50.529383'),
('cc80tt90cjf7t7vhwtzjh7epwoh6ilaf', '.eJxVjEEOwiAQRe_C2hBgWqAu3XsGMswMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzsur0u2Wkh0w74DtOt1nTPK3LmPWu6IM2fZ1ZnpfD_Tuo2Oq3psxdhIECWpBIkEvvnXGRPXgDQgQcJJgOGU3nBEs0xTrIfRkEAKx6fwDtMjfv:1nyawP:CG-Q1NywMau-z4Y-dxrb8YxsQI9f6yLsrU_hkl3eVT0', '2022-06-21 15:16:21.035525'),
('d5gubkbfdvxzga9l6l0pmbkdrzbdxtan', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2Vse:_HXur2oRnIZ8nzyeYOExdJ2POPKW2DFxJTWOqz2ol-U', '2022-01-12 10:08:24.032474'),
('di6yljg39m9pwz0fe52cvp1icxmo54an', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2Vxp:6i6TUvxAsebQF6d1fi7ntm8gX9AIl-VwYNoDkr9_wfA', '2022-01-12 10:13:45.549123'),
('e0h2p68xe42gfijdq4lug0yar3qhuu0p', '.eJxVjLEOAiEQRP-F2pAFPBBLe7-BLMsipwaS464y_ruSXKHJVPPezEsE3NYSts5LmJM4CyUOv11EenAdIN2x3pqkVtdljnIocqddXlvi52V3_w4K9vJdAwNnQ6eJbD4qbRnIR9BGA6FjjZNXiaMyBtk5SyrbRCPsLWRwRrw_7F44Ig:1n7wUq:R3-8zabfLjT9Sbmx_KZ87VD0tikOL70mcsxC-z7hXZU', '2022-01-27 09:34:16.113389'),
('g14bxcjk4e3jmqe47434zy0poi5cgkgw', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n3HGa:Tm9BWEa6icROoT_quX-0VYY2JGC9awOonySAy_qivCU', '2022-01-14 12:44:16.017312'),
('hd610gmjfpbct6b751e5w1nqlgqin4hs', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n3H3R:prwKlF0nbJeg55mVhfFXBC3tyCpDBssYbgTlbFzjL78', '2022-01-14 12:30:41.782434'),
('jf75h5neq4cwilzrr2hpgjaqil87jshv', '.eJxVjMsOwiAQRf-FtSHAUKa4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOQovT78YUH7ntIN2p3WYZ57YuE8tdkQft8jqn_Lwc7t9BpV6_NTqN2SjPPBLZSFYrsMoVZ8AXNIyloGcNg_EjUHZgE1mrCyMOyAzi_QHI9zdD:1n9PZ9:JSB8R8-k9V8rJr1tb7VgNNp9UJCN7Esxm4yhsQkOtfc', '2022-01-31 10:48:47.628813'),
('l70bibx3kcr4frawyhk0gfbetxv06o0k', '.eJxVjDsOwjAUBO_iGlnyL8-hpOcM1lvHxgFkS3FSIe4OkVJAuzOzLxF4W0vYelrCPImzUOL0u4HjI9UdTHeutyZjq-syQ-6KPGiX1zal5-Vw_w4K9_KtR880Dnok46ynrG0kuAQyPjlyUBHOgg1DI5MBVCZliTgP1nCOEO8PzrM4EQ:1oWaEL:WKHYEkmOuo7ZkbY8-ryhKl4CL2Jq3sXXAWvKaVemUUk', '2022-09-23 09:23:21.592787'),
('l7oo652oa33afwkfluqqcqnm66af52x1', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2WDR:xlbjFO6XiUf_oPyJfbVm_GmattrtWRVFUaCiyo06Kw4', '2022-01-12 10:29:53.926273'),
('mxpy92qijh12va4htrdhevzh5n0wepa6', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n3GpI:2S6WebW0Op72er7jrK20ZgIS0OFrjXQyu4esKil-VV4', '2022-01-14 12:16:04.940882'),
('n2wvmrn81zcuenzgj466jxjb7uz3l2ej', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n1rcb:Sju9Tp-HPoezChqcE81yxAmVgxRVQ3ONUvCe5B66MfE', '2022-01-10 15:09:09.431300'),
('ob6ewgedwstmqofa2lvoib3kccetpquj', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n2ZH3:OuSPG3utKSoLhYCE3wqmWwRhJMXKZjHIj6cJvRfMDjE', '2022-01-12 13:45:49.057054'),
('qylqsng6bipg3yw0nvj0lshyf4fkfh5y', '.eJxVjEEOwiAQRe_C2hBgWqAu3XsGMswMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzsur0u2Wkh0w74DtOt1nTPK3LmPWu6IM2fZ1ZnpfD_Tuo2Oq3psxdhIECWpBIkEvvnXGRPXgDQgQcJJgOGU3nBEs0xTrIfRkEAKx6fwDtMjfv:1nybB7:XkuFXI6IuWdTSdv3ppvvh6N99O6yOQxw3Q_cpC-QFIs', '2022-06-21 15:31:33.730831'),
('revl7rk4326prk69zd3shbz77b13sz48', '.eJxVjEEOwiAQRe_C2hBgWqAu3XsGMswMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uzsur0u2Wkh0w74DtOt1nTPK3LmPWu6IM2fZ1ZnpfD_Tuo2Oq3psxdhIECWpBIkEvvnXGRPXgDQgQcJJgOGU3nBEs0xTrIfRkEAKx6fwDtMjfv:1nyq0E:bBkZFHpktEZ9sgGLxtQRbG6Su632Kcp3cSARSOoQ9BM', '2022-06-22 07:21:18.703366'),
('szz2ju6cnpq85l747i4wg34wnolaakc6', '.eJxVjMsOwiAQRf-FtSHAUKa4dO83kBkeUjU0Ke3K-O_apAvd3nPOfYlA21rD1vMSpiTOQovT78YUH7ntIN2p3WYZ57YuE8tdkQft8jqn_Lwc7t9BpV6_NTqN2SjPPBLZSFYrsMoVZ8AXNIyloGcNg_EjUHZgE1mrCyMOyAzi_QHI9zdD:1n9PW7:N8Ywpvsni2rlTgFMiQD5XjUc87LDao1JLf82q1j9oiQ', '2022-01-31 10:45:39.861372'),
('tniedwfz92nftog3bzn32pb3palxegg7', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nD18I:MI31cw_Vsrir3A-EjxKn2MrJs1R7wAlr5UW6oyDuK8E', '2022-02-10 09:31:58.925583'),
('tt9iyc063ie7hezuqjv9j4ti21a7q581', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nCQNh:QW9erQxDJ_yTthtFdXjAo6qLjsRQCS6x7X_i2nOYWRs', '2022-02-08 18:17:25.511058'),
('u4o1iw1ecsp72alg0a8o4o0v652g7btk', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n59CI:T7gmLaoZ7PrxI3nU4xuLYrDMvJdvHhHG5ybLBEP0qyE', '2022-01-19 16:31:34.768906'),
('v67dvhq60yul3op3sxpfx33w4tjkpxh7', '.eJxVjEEOwiAQRe_C2hCmQAsu3XsGwgyDVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hTuIsQJx-N4z04LqDdI_11iS1ui4zyl2RB-3y2hI_L4f7d1BiL986Zz-MFjB7p6bRIJMxmJx3PLDmpHQCTzpnFxVMzlIkjdYCGIuaIZN4fwDuCTg5:1o3wZw:DzATQF-a2R2toy0gjGcP8F-8dSBAPY7yVJkjIcRJ6f4', '2022-07-06 09:23:16.671641'),
('wgpovsmf7za7fmlfe9cftvvukaaoipan', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nBxjD:qISqsmxxLeR3meuwhh3uVqFx8Ym1Q_1BWVer-VIlRDQ', '2022-02-07 11:41:43.505139'),
('wt4kacolxtih0948yyox11lwa7t3v3i4', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n3FR4:_xFR3CaT_eU0CPeLNN9caSIPNbX97KWI_zwJK1R81vM', '2022-01-14 10:46:58.868190'),
('z0eqbfuqqeks8vkw7p5f9j3386di03qi', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n59XO:5wcYNqAZErfawD4tyA5Io9wifV4LTSZpdN2rjHZ2_Wk', '2022-01-19 16:53:22.236636'),
('zj1w96w9y7age79dmw1xdrhhnn21r3v1', '.eJxVjEEOwiAQRe_C2hAGKAWX7j0DGWZAqoYmpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWIE6_W0J65LYDvmO7zZLmti5TkrsiD9rldeb8vBzu30HFXr91KImBFOOQ0JFma0mBB2MyQyrJGvIWULvRmzJ4pymozI4Ygx2dARbvD_wcOCM:1nCPHv:2bIFh2RoK6icmzjyhgbcSLM_-lHcaLJX7NcTiqNH5kc', '2022-02-08 17:07:23.600842'),
('zmvc47gw8v2fjde8a23orhny3sq4oa4j', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n0kQJ:lmrKsjf4XXeX8jBXwSl3-axPNx17dnipoT4U4H7tkqo', '2022-01-07 13:15:51.917587');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `camera_adress`
--
ALTER TABLE `camera_adress`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_camera_slug_9c14c40a` (`slug`);

--
-- Indexes for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_gebruiker_slug_1691fc8f` (`slug`);

--
-- Indexes for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camera_log`
--
ALTER TABLE `camera_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD UNIQUE KEY `camera_video_naam_codec_37e70459_uniq` (`naam`,`codec`),
  ADD KEY `camera_video_camera_id_306b84c4_fk_camera_camera_id` (`camera_id`),
  ADD KEY `camera_video_slug_8e2824f8` (`slug`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camera_adress`
--
ALTER TABLE `camera_adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `camera_log`
--
ALTER TABLE `camera_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD CONSTRAINT `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`);

--
-- Constraints for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD CONSTRAINT `camera_video_camera_id_306b84c4_fk_camera_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera_camera` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
