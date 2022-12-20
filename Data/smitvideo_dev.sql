-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 20, 2022 at 12:06 PM
-- Server version: 10.6.11-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.9

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
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(25, 'Can add adress', 7, 'add_adress'),
(26, 'Can change adress', 7, 'change_adress'),
(27, 'Can delete adress', 7, 'delete_adress'),
(28, 'Can view adress', 7, 'view_adress'),
(29, 'Can add bedrijf', 8, 'add_bedrijf'),
(30, 'Can change bedrijf', 8, 'change_bedrijf'),
(31, 'Can delete bedrijf', 8, 'delete_bedrijf'),
(32, 'Can view bedrijf', 8, 'view_bedrijf'),
(33, 'Can add gebruiker', 9, 'add_gebruiker'),
(34, 'Can change gebruiker', 9, 'change_gebruiker'),
(35, 'Can delete gebruiker', 9, 'delete_gebruiker'),
(36, 'Can view gebruiker', 9, 'view_gebruiker'),
(37, 'Can add log', 10, 'add_log'),
(38, 'Can change log', 10, 'change_log'),
(39, 'Can delete log', 10, 'delete_log'),
(40, 'Can view log', 10, 'view_log'),
(41, 'Can add parameter', 11, 'add_parameter'),
(42, 'Can change parameter', 11, 'change_parameter'),
(43, 'Can delete parameter', 11, 'delete_parameter'),
(44, 'Can view parameter', 11, 'view_parameter'),
(45, 'Can add service order', 12, 'add_serviceorder'),
(46, 'Can change service order', 12, 'change_serviceorder'),
(47, 'Can delete service order', 12, 'delete_serviceorder'),
(48, 'Can view service order', 12, 'view_serviceorder'),
(49, 'Can add locatie', 13, 'add_locatie'),
(50, 'Can change locatie', 13, 'change_locatie'),
(51, 'Can delete locatie', 13, 'delete_locatie'),
(52, 'Can view locatie', 13, 'view_locatie'),
(53, 'Can add camera', 14, 'add_camera'),
(54, 'Can change camera', 14, 'change_camera'),
(55, 'Can delete camera', 14, 'delete_camera'),
(56, 'Can view camera', 14, 'view_camera'),
(57, 'Can add video', 15, 'add_video'),
(58, 'Can change video', 15, 'change_video'),
(59, 'Can delete video', 15, 'delete_video'),
(60, 'Can view video', 15, 'view_video'),
(61, 'Can add static device', 16, 'add_staticdevice'),
(62, 'Can change static device', 16, 'change_staticdevice'),
(63, 'Can delete static device', 16, 'delete_staticdevice'),
(64, 'Can view static device', 16, 'view_staticdevice'),
(65, 'Can add static token', 17, 'add_statictoken'),
(66, 'Can change static token', 17, 'change_statictoken'),
(67, 'Can delete static token', 17, 'delete_statictoken'),
(68, 'Can view static token', 17, 'view_statictoken'),
(69, 'Can add TOTP device', 18, 'add_totpdevice'),
(70, 'Can change TOTP device', 18, 'change_totpdevice'),
(71, 'Can delete TOTP device', 18, 'delete_totpdevice'),
(72, 'Can view TOTP device', 18, 'view_totpdevice'),
(73, 'Can add email device', 19, 'add_emaildevice'),
(74, 'Can change email device', 19, 'change_emaildevice'),
(75, 'Can delete email device', 19, 'delete_emaildevice'),
(76, 'Can view email device', 19, 'view_emaildevice');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$uPZUxPEFic5zbDOzHEMjsE$QIliV/d5qC8O8ed6gpwQv7ilK5cNk5RU/TwZir3lfW8=', '2022-12-20 10:10:27.069111', 1, 'django', '', '', 'jandeboer@gmail.com', 1, 1, '2022-10-27 12:52:41.931562'),
(4, 'pbkdf2_sha256$260000$PB2jnueImzQbkrbi1RDfiD$HDVQRl2XBue4sESapHKKHVni4ZHcRQ6DU60xM3bWmjc=', '2022-12-20 10:21:43.316782', 1, 'jan', 'Jan', 'de Boer', 'jandeboer@gmail.com', 1, 1, '2022-12-20 10:03:49.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 4, 3),
(4, 4, 4),
(5, 4, 5),
(6, 4, 6),
(7, 4, 7),
(8, 4, 8),
(9, 4, 9),
(10, 4, 10),
(11, 4, 11),
(12, 4, 12),
(13, 4, 13),
(14, 4, 14),
(15, 4, 15),
(16, 4, 16),
(17, 4, 17),
(18, 4, 18),
(19, 4, 19),
(20, 4, 20),
(21, 4, 21),
(22, 4, 22),
(23, 4, 23),
(24, 4, 24),
(25, 4, 25),
(26, 4, 26),
(27, 4, 27),
(28, 4, 28),
(29, 4, 29),
(30, 4, 30),
(31, 4, 31),
(32, 4, 32),
(33, 4, 33),
(34, 4, 34),
(35, 4, 35),
(36, 4, 36),
(37, 4, 37),
(38, 4, 38),
(39, 4, 39),
(40, 4, 40),
(41, 4, 41),
(42, 4, 42),
(43, 4, 43),
(44, 4, 44),
(45, 4, 45),
(46, 4, 46),
(47, 4, 47),
(48, 4, 48),
(49, 4, 49),
(50, 4, 50),
(51, 4, 51),
(52, 4, 52),
(53, 4, 53),
(54, 4, 54),
(55, 4, 55),
(56, 4, 56),
(57, 4, 57),
(58, 4, 58),
(59, 4, 59),
(60, 4, 60),
(61, 4, 61),
(62, 4, 62),
(63, 4, 63),
(64, 4, 64),
(65, 4, 65),
(66, 4, 66),
(67, 4, 67),
(68, 4, 68),
(69, 4, 69),
(70, 4, 70),
(71, 4, 71),
(72, 4, 72),
(73, 4, 73),
(74, 4, 74),
(75, 4, 75),
(76, 4, 76);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_adress`
--

INSERT INTO `camera_adress` (`id`, `naam`, `straat`, `postcode`, `plaats`, `land`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Stadgenoot', 'Stadsplein 1', '1000AA', 'Amsterdam', 'Nederland', '', 'stadgenoot', '2022-09-21 08:35:37.547255', '2022-09-21 08:35:37.548133'),
(2, 'Smit Electrotechniek', 'Bellstraat 3', '1131JV', 'Volendam', 'Nederland', '', 'smit-electrotechniek', '2022-09-21 09:00:02.426444', '2022-09-21 09:00:02.427923'),
(4, 'Brandweer Volendam', 'Brandstraat 1', '1131AD', 'Volendam', 'Nederland', '', 'brandweer-volendam', '2022-09-23 12:49:56.078694', '2022-09-23 12:55:41.828225'),
(5, 'Politie Purmerend', 'Snelweg 5', '1441AD', 'Purmerend', 'Nederland', '', 'politie-purmerend', '2022-09-23 12:52:14.644682', '2022-09-23 12:52:14.645584'),
(6, 'Zuidgorsstraat', 'Zuidgorsstraat 9', '1025AW', 'Amsterdam', 'Nederland', '', 'zuidgorsstraat', '2022-09-23 12:54:49.946164', '2022-09-23 12:54:49.947149'),
(19, 'Dorpsplein', 'Plein  1', '1234AA', 'Berkhout', 'Nederland', '', 'dorpsplein', '2022-10-06 15:03:05.665315', '2022-10-24 06:48:33.373871'),
(22, 'Stadspark', 'Stadspark 1', '2481ED', 'Den Haag', 'Nederland', '', 'stadspark', '2022-10-17 13:10:17.136692', '2022-10-24 11:26:13.122748'),
(25, 'Dorpstraat', 'Brink 1', '2100AA', 'Berkhout', 'Nederland', '', 'dorpstraat', '2022-10-17 13:42:51.766215', '2022-10-24 06:49:05.919656'),
(27, 'Kerkebuurt', 'Straatnaam 1', '1647ME', 'Berkhout', 'Nederland', '', 'kerkebuurt', '2022-10-17 16:07:57.866982', '2022-10-18 11:48:54.145614'),
(32, 'Remijden', 'Remijden 22', '1068XB', 'Amsterddam', 'Nederland', '', 'remijden', '2022-10-18 11:57:38.496371', '2022-10-24 07:11:29.865937'),
(37, 'Abraham Kuyperstraat', 'Abraham Kuyperstraat 1-73', '1067DH', 'Amsterdam', 'Nederland', '', 'abraham-kuyperstraat', '2022-10-20 14:50:45.181941', '2022-10-24 07:06:23.595017'),
(43, 'Til garnalen', 'Haven 102', '1131AD', 'Volendam', 'Nederland', '', 'til-garnalen', '2022-10-24 06:52:14.388130', '2022-10-24 06:52:14.389046'),
(51, 'Default', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'default', '2022-11-10 10:15:32.005404', '2022-11-10 10:15:32.005989'),
(58, 'Wasborn Locatie 2', 'Wasborn 220', '0000AA', 'Amsterdam', 'Nederland', '', 'wasborn-locatie-2', '2022-11-10 11:00:20.929047', '2022-11-10 11:49:33.576981'),
(59, 'Wasborn Locatie 1', 'Wasborn 36', '0000AA', 'Amsterdam', 'Nederland', '', 'wasborn-locatie-1', '2022-11-10 11:00:21.120407', '2022-11-10 11:49:12.513698'),
(60, 'Bellstraat', 'Straatnaam 1', '0000AA', 'Volendam', 'Nederland', '', 'bellstraat', '2022-11-10 11:00:21.304075', '2022-11-10 11:46:28.272293'),
(61, 'Berkhout', 'Straatnaam 1', '0000AA', 'Berkhout', 'Nederland', '', 'berkhout', '2022-11-10 11:00:21.639595', '2022-11-10 11:47:27.285412'),
(64, 'Dorpstrraat', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'dorpstrraat', '2022-11-29 08:59:48.054458', '2022-11-29 08:59:48.054839'),
(65, 'Nieuwe Weteringstraat', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'nieuwe-weteringstraat', '2022-11-29 09:31:51.868010', '2022-11-29 09:31:51.868097'),
(66, 'Nolenstraat', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'nolenstraat', '2022-11-30 08:02:19.409872', '2022-11-30 08:02:19.433948'),
(67, 'Onbekend', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'onbekend', '2022-11-30 11:07:00.426285', '2022-11-30 11:07:00.426546');

-- --------------------------------------------------------

--
-- Table structure for table `camera_bedrijf`
--

CREATE TABLE `camera_bedrijf` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `adres_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `email`, `website`, `image`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `adres_id`) VALUES
(1, 'Stadgenoot', 'info@bedrijf.nl', '', '', '020-12345678', '', 'stadgenoot', '2022-09-21 09:16:52.906687', '2022-09-23 13:22:31.128431', 1),
(3, 'Brandweer Volendam', 'info@bedrijf.nl', '', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2022-09-23 13:21:26.817460', 4),
(4, 'Politie Purmerend', 'info@bedrijf.nl', '', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-24 14:31:12.949985', 1),
(6, 'Kees Garnalen BV', 'info@bedrijf.nl', '', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786', 1),
(18, 'Smit Electrotechniek', 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'smit-electrotechniek', '2022-10-20 14:58:49.896453', '2022-10-20 14:58:49.896579', 2),
(20, 'Berkhout', 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'berkhout', '2022-11-10 11:00:21.661438', '2022-11-10 11:00:21.661559', 61);

-- --------------------------------------------------------

--
-- Table structure for table `camera_camera`
--

CREATE TABLE `camera_camera` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `plaats` varchar(50) NOT NULL,
  `gps_locatie` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `datum_geplaatst` datetime(6) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `locatie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `plaats`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `locatie_id`) VALUES
(230, 'Remijden 1_ch7', 'default', 'Cam 7 Lift Rechts', '', '', '2022-11-30 18:23:26.000000', '', 'remijden-1_ch7', '2022-11-30 18:23:26.067694', '2022-12-01 14:41:34.349963', 123),
(231, 'cam1_nooduitgang', 'default', 'Cam 11 Nooduitgang', '', '', '2022-12-01 06:37:23.000000', '', 'cam1_nooduitgang', '2022-12-01 06:37:23.610294', '2022-12-01 14:43:24.020753', 123),
(232, 'Camera Entree', 'default', 'Entree', '', '', '2022-12-01 06:37:23.000000', '', 'camera-entree', '2022-12-01 06:37:23.792505', '2022-12-01 14:45:58.046355', 125),
(233, 'Smit spy_ch6', 'default', 'Edge 5', '', '', '2022-12-01 06:37:23.000000', '', 'smit-spy_ch6', '2022-12-01 06:37:23.875910', '2022-12-01 14:39:54.536637', 126),
(234, 'zuidgorsstraat 9_ch1', 'default', 'Cam 1 Hoofdentree', '', '', '2022-12-01 06:37:23.000000', '', 'zuidgorsstraat-9_ch1', '2022-12-01 06:37:23.942790', '2022-12-01 14:47:40.027123', 127),
(235, 'Nolensstraat 170-312_ch5', 'default', 'Cam 1 entree rechts', '', '', '2022-12-01 06:37:24.000000', '', 'nolensstraat-170-312_ch5', '2022-12-01 06:37:24.000705', '2022-12-01 14:36:49.034371', 128),
(236, 'Nolensstraat 170-312_ch6', 'default', 'Cam 2  Entree Links', '', '', '2022-12-01 06:37:24.000000', '', 'nolensstraat-170-312_ch6', '2022-12-01 06:37:24.044056', '2022-12-01 06:43:48.280026', 128),
(237, 'Nolensstraat 170-312_ch2', 'default', 'Cam entree links', '', '', '2022-12-01 06:37:24.000000', '', 'nolensstraat-170-312_ch2', '2022-12-01 06:37:24.119288', '2022-12-01 14:37:57.835526', 128),
(238, 'Camera Entree1', 'default', 'Entree', '', '', '2022-12-01 06:37:24.000000', '', 'camera-entree1', '2022-12-01 06:37:24.200808', '2022-12-01 14:46:45.519575', 129),
(239, 'Abraham Kuyperstraat 1-73_ch4', 'default', 'Garage 2', '', '', '2022-12-01 06:37:24.000000', '', 'abraham-kuyperstraat-1-73_ch4', '2022-12-01 06:37:24.259212', '2022-12-01 14:44:32.206982', 130),
(240, 'CCTV_ch9_H264', 'default', 'Voordeur', '', '', '2022-12-01 06:37:24.000000', '', 'cctv_ch9_h264', '2022-12-01 06:37:24.317765', '2022-12-01 14:59:47.891167', 131),
(241, 'Earth', 'default', 'Op het dak', '', '', '2022-12-01 06:37:24.000000', '', 'earth', '2022-12-01 06:37:24.380354', '2022-12-01 15:00:37.194890', 131),
(242, 'voordeur', 'default', 'Voordeur', '', '', '2022-12-01 06:37:24.000000', '', 'voordeur', '2022-12-01 06:37:24.513165', '2022-12-01 15:02:04.847782', 131),
(243, 'auto', 'default', 'Parkeerplaats', '', '', '2022-12-01 06:37:24.000000', '', 'auto', '2022-12-01 06:37:24.563561', '2022-12-01 14:59:13.380301', 131),
(244, 'brommer', 'default', 'Fietsenstalling', '', '', '2022-12-01 06:37:24.000000', '', 'brommer', '2022-12-01 06:37:24.613801', '2022-12-01 15:01:11.894639', 131),
(245, 'bunnyfull', 'default', 'Filmzaal Achter', '', '', '2022-12-01 06:37:24.000000', '', 'bunnyfull', '2022-12-01 06:37:24.676236', '2022-12-01 14:50:25.895404', 132),
(246, 'Earth', 'default', 'Tuin', '', '', '2022-12-01 06:37:24.000000', '', 'earth', '2022-12-01 06:37:24.738400', '2022-12-01 14:50:58.383214', 132),
(247, 'bunny', 'default', 'Filmzaal', '', '', '2022-12-01 06:37:24.000000', '', 'bunny', '2022-12-01 06:37:24.774380', '2022-12-01 14:49:53.738147', 132),
(248, 'NVR_ch2_main', 'default', 'Dakraam', '', '', '2022-12-01 06:37:24.000000', '', 'nvr_ch2_main', '2022-12-01 06:37:24.821515', '2022-12-01 14:54:23.392932', 132),
(249, 'NVR_ch1_main', 'default', 'Oprit', '', '', '2022-12-01 06:37:24.000000', '', 'nvr_ch1_main', '2022-12-01 06:37:24.872015', '2022-12-01 14:51:46.557505', 132),
(250, 'NVR_ch3_main', 'default', 'Dakgoot', '', '', '2022-12-01 06:37:24.000000', '', 'nvr_ch3_main', '2022-12-01 06:37:24.921478', '2022-12-01 14:57:32.040670', 132),
(251, 'achter', 'default', 'Parkeerplaats', '', '', '2022-12-01 06:37:25.000000', '', 'achter', '2022-12-01 06:37:25.151294', '2022-12-01 14:53:02.400552', 133),
(252, 'dahua1', 'default', 'Werkkamer', '', '', '2022-12-01 06:37:25.000000', '', 'dahua1', '2022-12-01 06:37:25.209624', '2022-12-01 14:55:58.309280', 134),
(253, 'dahua2', 'default', 'Onder werkblad', '', '', '2022-12-01 06:37:25.000000', '', 'dahua2', '2022-12-01 06:37:25.255705', '2022-12-01 14:56:37.176423', 134);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_gebruiker`
--

INSERT INTO `camera_gebruiker` (`id`, `user`, `password`, `naam`, `email`, `telefoon`, `soort`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(2, 'jan', 'test1', 'Jan de Boer', 'jandeboer@gmail.com', '0299 363 889', 0, 'ik kan niet typen\r\n\r\nIk ben een beetje als Markzukkerburg', 'jan-de-boer', '2021-12-14 15:06:35.000000', '2022-10-15 20:20:44.288437'),
(3, 'orson', 'Test1', 'Orson Joon', 'orson@smitelektrotechniek.nl', '0299 363 889', 0, '', 'orson-joon', '2021-12-14 15:07:29.000000', '2021-12-27 12:15:11.747076'),
(4, 'Sint', '', 'Sinterklaas', 'sint@smitelektrotechniek.nl', '0299 363 889', 2, '', 'sinterklaas', '2021-12-23 14:33:18.300634', '2021-12-24 14:13:18.193695'),
(5, 'klaasen', '', 'Agent Klaasen', 'info@me.nl', '0800-8844', 1, '', 'agent-klaasen', '2021-12-24 14:12:29.067839', '2021-12-25 08:11:40.485447'),
(6, 'vries', '', 'Commandant de  Vries', 'info@me.brandweer.nl', '06 11 22 33 44', 1, '', 'commandant-de-vries', '2021-12-24 14:15:35.591461', '2021-12-24 14:16:27.330791'),
(7, 'jansma', '', 'Agent Jansma', 'info@politie.nl', '0800-8844', 1, '', 'agent-jansma', '2021-12-24 14:30:02.647281', '2021-12-24 14:30:02.647952'),
(8, 'tol', '', 'Kees Tol', 'info@keestol.nl', '06 11 22 33 44', 1, '', 'kees-tol', '2021-12-24 14:32:54.840943', '2021-12-24 14:32:54.841784'),
(9, 'margot', '', 'dhr Margot', 'margot@stadgenoot.nl', '06 11 22 33 44', 1, '', 'dhr-margot', '2021-12-24 14:33:37.316037', '2022-09-23 13:43:18.908511'),
(11, 'Viewedpatty', '', 'Viewedpatty', 'viewedpatty@gmail.com', '4257898960337982', 0, 'Over je jezelf', 'viewedpatty', '2022-09-23 13:34:59.904197', '2022-09-23 13:39:49.281729'),
(12, 'vries', '', 'de Vries', 'vries@stadgenoot.nl', '06 11 22 33 44', 1, '', 'de-vries', '2022-09-23 13:44:04.539071', '2022-09-23 13:44:04.540259'),
(14, 'Dassel', '', 'Joost Dassel', 'jdassel@stadgenoot.nl', '0611591251', 1, 'Contactpersoon Remijden, Stadgenoot', 'joost-dassel', '2022-11-28 19:56:54.880327', '2022-11-28 19:56:54.888262'),
(15, 'Oorbeek', '', 'P.D. Oorbeek', 'poorbeek@stadgenoot.nl', '06 - 52 08 67 79', 1, '', 'pd-oorbeek', '2022-11-28 20:09:11.030921', '2022-11-28 20:10:37.180876'),
(16, '', '', 'Onbekend', 'info@me.nl', '06 11 22 33 44', 1, '', 'onbekend', '2022-11-30 11:07:00.468085', '2022-11-30 11:07:00.468130');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_locatie`
--

INSERT INTO `camera_locatie` (`id`, `naam`, `image`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `adres_id`, `bedrijf_id`, `contact_id`) VALUES
(123, 'Remijden', '', '', 'remijden', '2022-11-30 18:23:26.042621', '2022-11-30 18:23:26.042880', 32, 1, 16),
(125, 'Wasborn Locatie 2', '', '', 'wasborn-locatie-2', '2022-12-01 06:37:23.768848', '2022-12-01 06:37:23.768916', 58, 1, 16),
(126, 'Nieuwe Weteringstraat', '', '', 'nieuwe-weteringstraat', '2022-12-01 06:37:23.837081', '2022-12-01 06:37:23.837145', 65, 1, 16),
(127, 'Zuidgorsstraat', '', '', 'zuidgorsstraat', '2022-12-01 06:37:23.928683', '2022-12-01 06:37:23.928749', 6, 1, 16),
(128, 'Nolenstraat', '', '', 'nolenstraat', '2022-12-01 06:37:23.985171', '2022-12-01 06:37:23.985236', 66, 1, 16),
(129, 'Wasborn Locatie 1', '', '', 'wasborn-locatie-1', '2022-12-01 06:37:24.186037', '2022-12-01 06:37:24.186103', 59, 1, 16),
(130, 'Abraham Kuyperstraat', '', '', 'abraham-kuyperstraat', '2022-12-01 06:37:24.243730', '2022-12-01 06:37:24.243795', 37, 1, 16),
(131, 'Bellstraat', '', '', 'bellstraat', '2022-12-01 06:37:24.303779', '2022-12-01 06:37:24.303843', 60, 18, 16),
(132, 'Kerkebuurt', '', '', 'kerkebuurt', '2022-12-01 06:37:24.662358', '2022-12-01 06:37:24.662435', 27, 20, 16),
(133, 'Dorpsplein', '', '', 'dorpsplein', '2022-12-01 06:37:25.115989', '2022-12-01 22:11:30.424377', 19, 20, 2),
(134, 'Dorpstrraat', '', '', 'dorpstrraat', '2022-12-01 06:37:25.193799', '2022-12-01 22:11:47.951739', 64, 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `camera_log`
--

CREATE TABLE `camera_log` (
  `id` int(11) NOT NULL,
  `ordernr` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_log`
--

INSERT INTO `camera_log` (`id`, `ordernr`, `message`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Order 004', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt', '2022-11-08 14:54:58.567195', '2022-11-08 14:54:58.567228'),
(2, 'Order 004', 'WARNING: Default values added for video: bunnyfull | bunnyfull', '2022-11-08 14:54:58.617125', '2022-11-08 14:54:58.617153'),
(3, 'Order 004', 'WARNING: Default values added for camera: bunny | Kerkebuurt', '2022-11-08 14:54:58.683838', '2022-11-08 14:54:58.683865'),
(4, 'Order 004', 'WARNING: Default values added for video: bunny | bunny', '2022-11-08 14:54:58.700489', '2022-11-08 14:54:58.700516'),
(5, 'Order 004', 'WARNING: Default values added for camera: earth | Kerkebuurt', '2022-11-08 14:54:58.733881', '2022-11-08 14:54:58.733908'),
(6, 'Order 004', 'WARNING: Default values added for camera: earth | Kerkebuurt', '2022-11-08 15:18:00.448110', '2022-11-08 15:18:00.448142'),
(7, 'Order 004', 'WARNING: Default values added for video: Earth | earth', '2022-11-08 15:52:29.337350', '2022-11-08 15:52:29.337409'),
(8, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch2_main | Kerkebuurt', '2022-11-08 15:52:29.402394', '2022-11-08 15:52:29.402421'),
(9, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-11-08 15:52:29.419092', '2022-11-08 15:52:29.419119'),
(10, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt', '2022-11-08 15:52:29.460761', '2022-11-08 15:52:29.460788'),
(11, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-08 15:52:29.477441', '2022-11-08 15:52:29.477467'),
(12, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-11-08 15:52:29.552489', '2022-11-08 15:52:29.552516'),
(13, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-11-08 15:52:29.594172', '2022-11-08 15:52:29.594199'),
(14, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-08 15:52:29.635840', '2022-11-08 15:52:29.635867'),
(15, 'Order 002', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Thuis | default', '2022-11-08 15:52:29.694209', '2022-11-08 15:52:29.694235'),
(16, 'Order 002', 'WARNING: Default values added for camera: achter | Dorpsplein', '2022-11-08 15:52:29.710847', '2022-11-08 15:52:29.710873'),
(17, 'Order 002', 'WARNING: Default values added for video: achter | achter', '2022-11-08 15:52:29.727534', '2022-11-08 15:52:29.727561'),
(18, 'Order003', 'WARNING: Default values added for adress: Dorpstraat', '2022-11-08 15:52:29.752555', '2022-11-08 15:52:29.752582'),
(19, 'Order003', 'WARNING: Default values added for locatie: Dorpstraat | Dorpstraat | Thuis | default', '2022-11-08 15:52:29.800374', '2022-11-08 15:52:29.800400'),
(20, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstraat', '2022-11-08 15:52:29.819197', '2022-11-08 15:52:29.819223'),
(21, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-08 15:52:29.835917', '2022-11-08 15:52:29.835944'),
(22, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstraat', '2022-11-08 15:52:29.869293', '2022-11-08 15:52:29.869320'),
(23, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-08 15:52:29.885986', '2022-11-08 15:52:29.886012'),
(24, 'Order Was001', 'WARNING: Default values added for adress: Wasborn 36', '2022-11-08 15:52:29.910947', '2022-11-08 15:52:29.910974'),
(25, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn 36 | Wasborn 36 | Stadgenoot | default', '2022-11-08 15:52:29.944323', '2022-11-08 15:52:29.944349'),
(26, 'Order 004', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt', '2022-11-08 16:19:29.534726', '2022-11-08 16:19:29.534782'),
(27, 'Order 004', 'WARNING: Default values added for video: bunnyfull | bunnyfull', '2022-11-08 16:19:29.551205', '2022-11-08 16:19:29.551233'),
(28, 'Order 004', 'WARNING: Default values added for camera: Earth | Kerkebuurt', '2022-11-08 16:19:29.593484', '2022-11-08 16:19:29.593513'),
(29, 'Order 004', 'WARNING: Default values added for video: Earth | Earth', '2022-11-08 16:19:29.634662', '2022-11-08 16:19:29.634691'),
(30, 'Order 004', 'WARNING: Default values added for camera: bunny | Kerkebuurt', '2022-11-08 16:19:29.693047', '2022-11-08 16:19:29.693075'),
(31, 'Order 004', 'WARNING: Default values added for video: bunny | bunny', '2022-11-08 16:19:29.709711', '2022-11-08 16:19:29.709739'),
(32, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch2_main | Kerkebuurt', '2022-11-08 16:19:29.743049', '2022-11-08 16:19:29.743078'),
(33, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-11-08 16:19:29.759745', '2022-11-08 16:19:29.759774'),
(34, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt', '2022-11-08 16:19:29.818072', '2022-11-08 16:19:29.818101'),
(35, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-08 16:19:29.834793', '2022-11-08 16:19:29.834822'),
(36, 'Orderth04', 'WARNING: Default values added for camera: NVR_ch3_main | Kerkebuurt', '2022-11-08 16:19:29.868132', '2022-11-08 16:19:29.868161'),
(37, 'Orderth04', 'WARNING: Default values added for video: NVR_ch3_main_20221021104000_20221021104030 | NVR_ch3_main', '2022-11-08 16:19:29.884819', '2022-11-08 16:19:29.884847'),
(38, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-11-08 16:19:29.926495', '2022-11-08 16:19:29.926524'),
(39, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-11-08 16:19:29.968199', '2022-11-08 16:19:29.968227'),
(40, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-08 16:19:30.009901', '2022-11-08 16:19:30.009929'),
(41, 'Order 002', 'WARNING: Default values added for camera: achter | Dorpsplein', '2022-11-08 16:19:30.084922', '2022-11-08 16:19:30.084950'),
(42, 'Order 002', 'WARNING: Default values added for video: achter | achter', '2022-11-08 16:19:30.101578', '2022-11-08 16:19:30.101606'),
(43, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstraat', '2022-11-08 16:19:30.134916', '2022-11-08 16:19:30.134944'),
(44, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-08 16:19:30.151569', '2022-11-08 16:19:30.151597'),
(45, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstraat', '2022-11-08 16:19:30.202149', '2022-11-08 16:19:30.202178'),
(46, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-08 16:19:30.226619', '2022-11-08 16:19:30.226647'),
(47, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn 36', '2022-11-08 16:19:30.259902', '2022-11-08 16:19:30.259931'),
(48, 'Order Was001', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree', '2022-11-08 16:19:30.276641', '2022-11-08 16:19:30.276669'),
(49, 'Order 001', 'WARNING: Default values added for adress: Remijden 1', '2022-11-08 16:19:30.293318', '2022-11-08 16:19:30.293346'),
(50, 'Order 001', 'WARNING: Default values added for locatie: Remijden 1 | Remijden 1 | Stadgenoot | default', '2022-11-08 16:19:30.326676', '2022-11-08 16:19:30.326705'),
(51, 'Order 001', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden 1', '2022-11-08 16:19:30.343342', '2022-11-08 16:19:30.343370'),
(52, 'Order 001', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang', '2022-11-08 16:19:30.360034', '2022-11-08 16:19:30.360063'),
(53, 'Order rem 002', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden 1', '2022-11-08 16:19:30.393381', '2022-11-08 16:19:30.393409'),
(54, 'Order rem 002', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7', '2022-11-08 16:19:30.410062', '2022-11-08 16:19:30.410091'),
(55, 'Order Z001', 'WARNING: Default values added for adress: Zuidgorsstraat 9', '2022-11-08 16:19:30.435051', '2022-11-08 16:19:30.435079'),
(56, 'Order Z001', 'WARNING: Default values added for locatie: Zuidgorsstraat 9 | Zuidgorsstraat 9 | Stadgenoot | default', '2022-11-08 16:19:30.468426', '2022-11-08 16:19:30.468454'),
(57, 'Order Z001', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | Zuidgorsstraat 9', '2022-11-08 16:19:30.485082', '2022-11-08 16:19:30.485110'),
(58, 'Order Z001', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1', '2022-11-08 16:19:30.518989', '2022-11-08 16:19:30.519017'),
(59, 'Order Abra 001', 'WARNING: Default values added for adress: Abraham Kuyperstraat 1-73', '2022-11-08 16:19:30.602325', '2022-11-08 16:19:30.602353'),
(60, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat 1-73 | Abraham Kuyperstraat 1-73 | Stadgenoot | default', '2022-11-08 16:19:30.635176', '2022-11-08 16:19:30.635204'),
(61, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat 1-73', '2022-11-08 16:19:30.651764', '2022-11-08 16:19:30.651793'),
(62, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-08 16:19:30.668514', '2022-11-08 16:19:30.668543'),
(63, 'Order Sm001', 'WARNING: Default values added for adress: ', '2022-11-08 16:19:30.685186', '2022-11-08 16:19:30.685215'),
(64, 'Order Sm001', 'WARNING: Default values added for locatie:  |  | Smit Electrotechniek | default', '2022-11-08 16:19:30.735230', '2022-11-08 16:19:30.735259'),
(65, 'Order Sm001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | ', '2022-11-08 16:19:30.751878', '2022-11-08 16:19:30.751907'),
(66, 'Order Sm001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-08 16:19:30.768584', '2022-11-08 16:19:30.768613'),
(67, 'Order Sm001', 'WARNING: Default values added for camera: Earth | ', '2022-11-08 16:23:10.299775', '2022-11-08 16:23:10.299800'),
(68, 'Order 001', 'WARNING: Default values added for camera: voordeur | ', '2022-11-08 16:23:10.341598', '2022-11-08 16:23:10.341626'),
(69, 'Order 001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-08 16:23:10.366397', '2022-11-08 16:23:10.366425'),
(70, 'Order 001', 'WARNING: Default values added for camera: auto | ', '2022-11-08 16:23:10.399837', '2022-11-08 16:23:10.399866'),
(71, 'Order 001', 'WARNING: Default values added for video: auto | auto', '2022-11-08 16:23:10.458212', '2022-11-08 16:23:10.458240'),
(72, 'Order 001', 'WARNING: Default values added for camera: brommer | ', '2022-11-08 16:23:10.491567', '2022-11-08 16:23:10.491595'),
(73, 'Order 001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-08 16:23:10.508230', '2022-11-08 16:23:10.508258'),
(74, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat 1-73 | Abraham Kuyperstraat 1-73 | Stadgenoot | default', '2022-11-09 15:00:15.649826', '2022-11-09 15:00:15.649980'),
(75, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat 1-73', '2022-11-09 15:00:15.691311', '2022-11-09 15:00:15.691337'),
(76, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-09 15:00:15.732007', '2022-11-09 15:00:15.732033'),
(77, 'Order Sm001', 'WARNING: Default values added for locatie:  |  | Smit Electrotechniek | default', '2022-11-09 15:00:15.774814', '2022-11-09 15:00:15.774841'),
(78, 'Order Sm001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | ', '2022-11-09 15:00:15.791467', '2022-11-09 15:00:15.791494'),
(79, 'Order Sm001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-09 15:00:15.841559', '2022-11-09 15:00:15.841585'),
(80, 'Order Sm001', 'WARNING: Default values added for camera: Earth | ', '2022-11-09 15:00:15.883248', '2022-11-09 15:00:15.883275'),
(81, 'Order 001', 'WARNING: Default values added for camera: voordeur | ', '2022-11-09 15:00:15.940756', '2022-11-09 15:00:15.940782'),
(82, 'Order 001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-09 15:00:15.966643', '2022-11-09 15:00:15.966669'),
(83, 'Order 001', 'WARNING: Default values added for camera: auto | ', '2022-11-09 15:00:15.999966', '2022-11-09 15:00:15.999993'),
(84, 'Order 001', 'WARNING: Default values added for video: auto | auto', '2022-11-09 15:00:16.024997', '2022-11-09 15:00:16.025023'),
(85, 'Order 001', 'WARNING: Default values added for camera: brommer | ', '2022-11-09 15:00:16.058342', '2022-11-09 15:00:16.058369'),
(86, 'Order 001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-09 15:00:16.083359', '2022-11-09 15:00:16.083385'),
(87, 'Order001', 'WARNING: Default values added for adress: Bellstraat', '2022-11-10 09:52:35.300002', '2022-11-10 09:52:35.300051'),
(88, 'Order001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-10 09:52:35.341743', '2022-11-10 09:52:35.341778'),
(89, 'Order001', 'WARNING: Default values added for camera: voordeur | Bellstraat', '2022-11-10 09:52:35.392361', '2022-11-10 09:52:35.392388'),
(90, 'Order001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-10 09:52:35.437927', '2022-11-10 09:52:35.437965'),
(91, 'Order001', 'WARNING: Default values added for camera: auto | Bellstraat', '2022-11-10 09:52:35.475157', '2022-11-10 09:52:35.475184'),
(92, 'Order001', 'WARNING: Default values added for video: auto | auto', '2022-11-10 09:52:35.491746', '2022-11-10 09:52:35.491773'),
(93, 'Order001', 'WARNING: Default values added for camera: brommer | Bellstraat', '2022-11-10 09:52:35.525052', '2022-11-10 09:52:35.525080'),
(94, 'Order001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-10 09:52:35.583487', '2022-11-10 09:52:35.583514'),
(95, 'OrderSM001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Bellstraat', '2022-11-10 09:52:35.616829', '2022-11-10 09:52:35.616856'),
(96, 'OrderSM001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-10 09:52:35.633415', '2022-11-10 09:52:35.633442'),
(97, 'OrderSM001', 'WARNING: Default values added for camera: Earth | Bellstraat', '2022-11-10 09:52:35.700258', '2022-11-10 09:52:35.700284'),
(98, 'Order 004', 'WARNING: Default values added for adress: Default', '2022-11-10 10:15:32.021248', '2022-11-10 10:15:32.021332'),
(99, 'Order003', 'WARNING: Default values added for adress: Dorpstraat', '2022-11-10 10:15:32.337852', '2022-11-10 10:15:32.337886'),
(100, 'Order003', 'WARNING: Default values added for locatie: Dorpstraat | Dorpstraat | Thuis | default', '2022-11-10 10:15:32.362839', '2022-11-10 10:15:32.362857'),
(101, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstraat', '2022-11-10 10:15:32.404681', '2022-11-10 10:15:32.404711'),
(102, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-10 10:15:32.429660', '2022-11-10 10:15:32.429686'),
(103, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstraat', '2022-11-10 10:15:32.488056', '2022-11-10 10:15:32.488083'),
(104, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-10 10:15:32.536569', '2022-11-10 10:15:32.536595'),
(105, 'Order Was001', 'WARNING: Default values added for adress: Wasborn 36', '2022-11-10 10:15:32.562836', '2022-11-10 10:15:32.562848'),
(106, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn 36 | Wasborn 36 | Stadgenoot | default', '2022-11-10 10:15:32.588105', '2022-11-10 10:15:32.588132'),
(107, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn 36', '2022-11-10 10:15:32.604790', '2022-11-10 10:15:32.604818'),
(108, 'Order Was001', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree', '2022-11-10 10:15:32.621374', '2022-11-10 10:15:32.621400'),
(109, 'Order 001', 'WARNING: Default values added for adress: Remijden 1', '2022-11-10 10:15:32.638087', '2022-11-10 10:15:32.638114'),
(110, 'Order 001', 'WARNING: Default values added for locatie: Remijden 1 | Remijden 1 | Stadgenoot | default', '2022-11-10 10:15:32.686808', '2022-11-10 10:15:32.686835'),
(111, 'Order 001', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden 1', '2022-11-10 10:15:32.704878', '2022-11-10 10:15:32.704906'),
(112, 'Order 001', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang', '2022-11-10 10:15:32.721432', '2022-11-10 10:15:32.721459'),
(113, 'Order rem 002', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden 1', '2022-11-10 10:15:32.754902', '2022-11-10 10:15:32.754932'),
(114, 'Order rem 002', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7', '2022-11-10 10:15:32.771526', '2022-11-10 10:15:32.771552'),
(115, 'Order Z001', 'WARNING: Default values added for adress: Zuidgorsstraat 9', '2022-11-10 10:15:32.797696', '2022-11-10 10:15:32.797723'),
(116, 'Order Z001', 'WARNING: Default values added for locatie: Zuidgorsstraat 9 | Zuidgorsstraat 9 | Stadgenoot | default', '2022-11-10 10:15:32.821554', '2022-11-10 10:15:32.821581'),
(117, 'Order Z001', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | Zuidgorsstraat 9', '2022-11-10 10:15:32.838301', '2022-11-10 10:15:32.838330'),
(118, 'Order Z001', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1', '2022-11-10 10:15:32.854915', '2022-11-10 10:15:32.854942'),
(119, 'Order Abra 001', 'WARNING: Default values added for adress: Abraham Kuyperstraat 1-73', '2022-11-10 10:15:32.879931', '2022-11-10 10:15:32.879957'),
(120, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat 1-73 | Abraham Kuyperstraat 1-73 | Stadgenoot | default', '2022-11-10 10:15:32.963302', '2022-11-10 10:15:32.963328'),
(121, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat 1-73', '2022-11-10 10:15:32.980016', '2022-11-10 10:15:32.980042'),
(122, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-10 10:15:33.020427', '2022-11-10 10:15:33.020453'),
(123, 'Order001', 'WARNING: Default values added for adress: Bellstraat', '2022-11-10 10:15:33.046681', '2022-11-10 10:15:33.046707'),
(124, 'Order001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-10 10:15:33.071694', '2022-11-10 10:15:33.071721'),
(125, 'Order001', 'WARNING: Default values added for camera: voordeur | Bellstraat', '2022-11-10 10:15:33.113545', '2022-11-10 10:15:33.113573'),
(126, 'Order001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-10 10:15:33.130119', '2022-11-10 10:15:33.130146'),
(127, 'Order001', 'WARNING: Default values added for camera: auto | Bellstraat', '2022-11-10 10:15:33.163556', '2022-11-10 10:15:33.163584'),
(128, 'Order001', 'WARNING: Default values added for video: auto | auto', '2022-11-10 10:15:33.180151', '2022-11-10 10:15:33.180178'),
(129, 'Order001', 'WARNING: Default values added for camera: brommer | Bellstraat', '2022-11-10 10:15:33.213572', '2022-11-10 10:15:33.213599'),
(130, 'Order001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-10 10:15:33.230185', '2022-11-10 10:15:33.230211'),
(131, 'OrderSM001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Bellstraat', '2022-11-10 10:15:33.263587', '2022-11-10 10:15:33.263614'),
(132, 'OrderSM001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-10 10:15:33.280160', '2022-11-10 10:15:33.280187'),
(133, 'OrderSM001', 'WARNING: Default values added for camera: Earth | Bellstraat', '2022-11-10 10:15:33.313631', '2022-11-10 10:15:33.313658'),
(134, 'Order 001', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-10 11:00:20.749587', '2022-11-10 11:00:20.749643'),
(135, 'Order 001', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden', '2022-11-10 11:00:20.766135', '2022-11-10 11:00:20.766162'),
(136, 'Order 001', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang', '2022-11-10 11:00:20.791115', '2022-11-10 11:00:20.791143'),
(137, 'Order rem 002', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden', '2022-11-10 11:00:20.841209', '2022-11-10 11:00:20.841236'),
(138, 'Order rem 002', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7', '2022-11-10 11:00:20.891205', '2022-11-10 11:00:20.891232'),
(139, 'Order Was001', 'WARNING: Default values added for adress: Wasborn Locatie 2', '2022-11-10 11:00:20.941260', '2022-11-10 11:00:20.941287'),
(140, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 2 | Wasborn Locatie 2 | Stadgenoot | default', '2022-11-10 11:00:20.999602', '2022-11-10 11:00:20.999629'),
(141, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn Locatie 2', '2022-11-10 11:00:21.016329', '2022-11-10 11:00:21.016356'),
(142, 'Order Was001', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree', '2022-11-10 11:00:21.032961', '2022-11-10 11:00:21.032987'),
(143, 'Order Z001', 'WARNING: Default values added for locatie: Zuidgorsstraat | Zuidgorsstraat | Stadgenoot | default', '2022-11-10 11:00:21.066301', '2022-11-10 11:00:21.066327'),
(144, 'Order Z001', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | Zuidgorsstraat', '2022-11-10 11:00:21.082986', '2022-11-10 11:00:21.083013'),
(145, 'Order Z001', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1', '2022-11-10 11:00:21.107992', '2022-11-10 11:00:21.108019'),
(146, 'Order Was001', 'WARNING: Default values added for adress: Wasborn Locatie 1', '2022-11-10 11:00:21.133011', '2022-11-10 11:00:21.133038'),
(147, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 1 | Wasborn Locatie 1 | Stadgenoot | default', '2022-11-10 11:00:21.166362', '2022-11-10 11:00:21.166389'),
(148, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn Locatie 1', '2022-11-10 11:00:21.183088', '2022-11-10 11:00:21.183115'),
(149, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat | Abraham Kuyperstraat | Stadgenoot | default', '2022-11-10 11:00:21.224738', '2022-11-10 11:00:21.224766'),
(150, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat', '2022-11-10 11:00:21.241437', '2022-11-10 11:00:21.241464'),
(151, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-10 11:00:21.283747', '2022-11-10 11:00:21.283774'),
(152, 'Order Sm001', 'WARNING: Default values added for adress: Bellstraat', '2022-11-10 11:00:21.316467', '2022-11-10 11:00:21.316494'),
(153, 'Order Sm001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-10 11:00:21.349811', '2022-11-10 11:00:21.349838'),
(154, 'Order Sm001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Bellstraat', '2022-11-10 11:00:21.366421', '2022-11-10 11:00:21.366448'),
(155, 'Order Sm001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-10 11:00:21.391492', '2022-11-10 11:00:21.391519'),
(156, 'Order Sm001', 'WARNING: Default values added for camera: Earth | Bellstraat', '2022-11-10 11:00:21.424873', '2022-11-10 11:00:21.424899'),
(157, 'Order Sm001', 'WARNING: Default values added for video: Earth | Earth', '2022-11-10 11:00:21.441423', '2022-11-10 11:00:21.441450'),
(158, 'Order001', 'WARNING: Default values added for camera: voordeur | Bellstraat', '2022-11-10 11:00:21.483241', '2022-11-10 11:00:21.483267'),
(159, 'Order001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-10 11:00:21.508205', '2022-11-10 11:00:21.508232'),
(160, 'Order001', 'WARNING: Default values added for camera: auto | Bellstraat', '2022-11-10 11:00:21.541611', '2022-11-10 11:00:21.541638'),
(161, 'Order001', 'WARNING: Default values added for video: auto | auto', '2022-11-10 11:00:21.566563', '2022-11-10 11:00:21.566590'),
(162, 'Order001', 'WARNING: Default values added for camera: brommer | Bellstraat', '2022-11-10 11:00:21.599963', '2022-11-10 11:00:21.599989'),
(163, 'Order001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-10 11:00:21.624938', '2022-11-10 11:00:21.624965'),
(164, 'Order 004', 'WARNING: Default values added for adress: Berkhout', '2022-11-10 11:00:21.649896', '2022-11-10 11:00:21.649923'),
(165, 'Order 004', 'WARNING: Default values added for bedrijf: Berkhout', '2022-11-10 11:00:21.666616', '2022-11-10 11:00:21.666643'),
(166, 'Order 004', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-10 11:00:21.691633', '2022-11-10 11:00:21.691659'),
(167, 'Order 004', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt', '2022-11-10 11:00:21.733384', '2022-11-10 11:00:21.733411'),
(168, 'Order 004', 'WARNING: Default values added for video: bunnyfull | bunnyfull', '2022-11-10 11:00:21.758317', '2022-11-10 11:00:21.758343'),
(169, 'Order 004', 'WARNING: Default values added for camera: Earth | Kerkebuurt', '2022-11-10 11:00:21.850108', '2022-11-10 11:00:21.850135'),
(170, 'Order 004', 'WARNING: Default values added for camera: bunny | Kerkebuurt', '2022-11-10 11:00:21.891771', '2022-11-10 11:00:21.891798'),
(171, 'Order 004', 'WARNING: Default values added for video: bunny | bunny', '2022-11-10 11:00:21.916766', '2022-11-10 11:00:21.916793'),
(172, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch2_main | Kerkebuurt', '2022-11-10 11:00:21.950090', '2022-11-10 11:00:21.950116'),
(173, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-11-10 11:00:21.966697', '2022-11-10 11:00:21.966724'),
(174, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt', '2022-11-10 11:00:22.008414', '2022-11-10 11:00:22.008441'),
(175, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-10 11:00:22.024989', '2022-11-10 11:00:22.025016'),
(176, 'Orderth04', 'WARNING: Default values added for camera: NVR_ch3_main | Kerkebuurt', '2022-11-10 11:00:22.058428', '2022-11-10 11:00:22.058454'),
(177, 'Orderth04', 'WARNING: Default values added for video: NVR_ch3_main_20221021104000_20221021104030 | NVR_ch3_main', '2022-11-10 11:00:22.075020', '2022-11-10 11:00:22.075047'),
(178, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-11-10 11:00:22.133390', '2022-11-10 11:00:22.133417'),
(179, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-11-10 11:00:22.175136', '2022-11-10 11:00:22.175164'),
(180, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-10 11:00:22.216839', '2022-11-10 11:00:22.216866'),
(181, 'Order 002', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Berkhout | default', '2022-11-10 11:00:22.275193', '2022-11-10 11:00:22.275220'),
(182, 'Order 002', 'WARNING: Default values added for camera: achter | Dorpsplein', '2022-11-10 11:00:22.291881', '2022-11-10 11:00:22.291908'),
(183, 'Order 002', 'WARNING: Default values added for video: achter | achter', '2022-11-10 11:00:22.316919', '2022-11-10 11:00:22.316946'),
(184, 'Order003', 'WARNING: Default values added for adress: Dorpstrraat', '2022-11-10 11:00:22.358615', '2022-11-10 11:00:22.358642'),
(185, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-10 11:00:22.391936', '2022-11-10 11:00:22.391963'),
(186, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstrraat', '2022-11-10 11:00:22.433622', '2022-11-10 11:00:22.433649'),
(187, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-10 11:00:22.458613', '2022-11-10 11:00:22.458651'),
(188, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstrraat', '2022-11-10 11:00:22.492010', '2022-11-10 11:00:22.492038'),
(189, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-10 11:00:22.508527', '2022-11-10 11:00:22.508554'),
(190, 'Order003', 'WARNING: Default values added for adress: Dorpstrraat', '2022-11-10 14:38:36.525072', '2022-11-10 14:38:36.525122'),
(191, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-10 14:38:36.566694', '2022-11-10 14:38:36.566721'),
(192, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstrraat', '2022-11-10 14:38:36.616799', '2022-11-10 14:38:36.616825'),
(193, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-10 14:38:36.675155', '2022-11-10 14:38:36.675181'),
(194, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstrraat', '2022-11-10 14:38:36.708545', '2022-11-10 14:38:36.708571'),
(195, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-10 14:38:36.725072', '2022-11-10 14:38:36.725098'),
(196, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-10 14:39:34.423073', '2022-11-10 14:39:34.423101'),
(197, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-10 14:39:34.681432', '2022-11-10 14:39:34.681456'),
(198, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-11-10 14:51:13.089520', '2022-11-10 14:51:13.089536'),
(199, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-10 14:51:13.122686', '2022-11-10 14:51:13.122705'),
(200, 'Orderth04', 'WARNING: Default values added for video: NVR_ch3_main_20221021104000_20221021104030 | NVR_ch3_main', '2022-11-10 14:51:13.164529', '2022-11-10 14:51:13.164554'),
(201, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-11-10 14:51:13.247921', '2022-11-10 14:51:13.247948'),
(202, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-11-10 14:51:13.289672', '2022-11-10 14:51:13.289699'),
(203, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-10 14:51:13.331266', '2022-11-10 14:51:13.331294'),
(204, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree1 | Wasborn Locatie 1', '2022-11-28 09:33:36.930286', '2022-11-28 09:33:36.930321'),
(205, 'Order Was001', 'WARNING: Default values added for video: Camera Entree1_20190323_232439 | Camera Entree1', '2022-11-28 09:33:36.955643', '2022-11-28 09:33:36.955670'),
(206, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-28 20:17:49.544299', '2022-11-28 20:17:49.544357'),
(207, 'ION100098803', 'Converting   /home/jan/media/Stadgenoot/Remijden/2Convert/ION100098803/Remijden 1_ch7_20220620062650_20220620075316.mp4 Size: 3656.85775 MB', '2022-11-28 20:17:54.594247', '2022-11-28 20:17:54.594278'),
(208, 'Order003', 'WARNING: Default values added for adress: Dorpstrraat', '2022-11-29 08:59:48.086025', '2022-11-29 08:59:48.086069'),
(209, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-29 08:59:48.144329', '2022-11-29 08:59:48.144356'),
(210, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstrraat', '2022-11-29 08:59:48.202728', '2022-11-29 08:59:48.202754'),
(211, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-29 08:59:48.245089', '2022-11-29 08:59:48.245116'),
(212, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstrraat', '2022-11-29 08:59:48.286087', '2022-11-29 08:59:48.286115'),
(213, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-29 08:59:48.302732', '2022-11-29 08:59:48.302759'),
(214, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-29 09:00:15.631880', '2022-11-29 09:00:15.631905'),
(215, '440244  646781', 'Converting   /home/jan/media/Stadgenoot/Nieuwe Weteringstraat/2Convert/440244  646781/Smit spy_ch6_20200810182455_20200810183116.mp4 Size: 42.35264 MB', '2022-11-29 09:00:20.662902', '2022-11-29 09:00:20.662930'),
(216, '440244  646781', 'Converted to /home/jan/media/Stadgenoot/Nieuwe Weteringstraat/Converted/440244  646781/Smit spy_ch6_20200810182455_20200810183116.webm Size: 131.32993 MB Time: 00:31:31', '2022-11-29 09:31:51.849974', '2022-11-29 09:31:51.850013'),
(217, '440244  646781', 'WARNING: Default values added for adress: Nieuwe Weteringstraat', '2022-11-29 09:31:51.881492', '2022-11-29 09:31:51.881524'),
(218, '440244  646781', 'WARNING: Default values added for locatie: Nieuwe Weteringstraat | Nieuwe Weteringstraat | Stadgenoot | default', '2022-11-29 09:31:51.922555', '2022-11-29 09:31:51.922581'),
(219, '440244  646781', 'WARNING: Default values added for camera: Smit spy_ch6 | Nieuwe Weteringstraat', '2022-11-29 09:31:51.953274', '2022-11-29 09:31:51.953299'),
(220, '440244  646781', 'WARNING: Default values added for video: Smit spy_ch6_20200810182455_20200810183116 | Smit spy_ch6', '2022-11-29 09:31:51.997483', '2022-11-29 09:31:51.997511'),
(221, 'Orderth04', 'Converting   /home/jan/media/Berkhout/Kerkebuurt/2Convert/Orderth04/NVR_ch3_main_20221021104000_20221021104030.mp4 Size: 13.95541 MB', '2022-11-29 09:31:57.013904', '2022-11-29 09:31:57.013935'),
(222, 'Orderth04', 'Converted to /home/jan/media/Berkhout/Kerkebuurt/Converted/Orderth04/NVR_ch3_main_20221021104000_20221021104030.webm Size: 8.47912 MB Time: 00:05:41', '2022-11-29 09:37:38.218503', '2022-11-29 09:37:38.218542'),
(223, ' ', 'Converting Ended ', '2022-11-29 09:37:38.260528', '2022-11-29 09:37:38.260555'),
(224, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-29 11:37:15.849985', '2022-11-29 11:37:15.850010'),
(225, '440244  646781', 'Converting   /home/jan/media/Stadgenoot/Nieuwe Weteringstraat/2Convert/440244  646781/Smit spy_ch6_20200810182455_20200810183116.mp4 Size: 42.35264 MB', '2022-11-29 11:37:20.881780', '2022-11-29 11:37:20.881828'),
(226, '440244  646781', 'Converted to /home/jan/media/Stadgenoot/Nieuwe Weteringstraat/Converted/440244  646781/Smit spy_ch6_20200810182455_20200810183116.webm Size: 131.32993 MB Time: 00:31:34', '2022-11-29 12:08:55.497197', '2022-11-29 12:08:55.497249'),
(227, '03-03-2021 = 92101979', 'Converting   /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-03-2021 = 92101979/Nolensstraat 170-312_ch5_20210222133000_20210222165817.mp4 Size: 1414.78778 MB', '2022-11-29 12:09:00.570876', '2022-11-29 12:09:00.570911'),
(228, '03-03-2021 = 92101979', 'WARNING: Default values added for adress: Nolenstraat', '2022-11-30 08:02:19.453714', '2022-11-30 08:02:19.453728'),
(229, '03-03-2021 = 92101979', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-11-30 08:02:19.486989', '2022-11-30 08:02:19.487002'),
(230, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch5 | Nolenstraat', '2022-11-30 08:02:19.504174', '2022-11-30 08:02:19.504185'),
(231, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210222133000_20210222165817 | Nolensstraat 170-312_ch5', '2022-11-30 08:02:19.595399', '2022-11-30 08:02:19.595417'),
(232, 'Order 001', 'WARNING: Default values added for camera: ._cam1_nooduitgang | Remijden', '2022-11-30 08:06:45.687751', '2022-11-30 08:06:45.687777'),
(233, 'Order 001', 'WARNING: Default values added for video: ._cam1_nooduitgang | ._cam1_nooduitgang', '2022-11-30 08:06:45.704335', '2022-11-30 08:06:45.704345'),
(234, 'Order rem 002', 'WARNING: Default values added for camera: ._Remijden 1_ch7 | Remijden', '2022-11-30 08:06:45.745982', '2022-11-30 08:06:45.745998'),
(235, 'Order rem 002', 'WARNING: Default values added for video: ._Remijden 1_ch7_20220620062650_20220620075316 | ._Remijden 1_ch7', '2022-11-30 08:06:45.819400', '2022-11-30 08:06:45.819414'),
(236, '25-09-2018 = 9185368', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch2 | Nolenstraat', '2022-11-30 08:06:45.896089', '2022-11-30 08:06:45.896101'),
(237, '25-09-2018 = 9185368', 'WARNING: Default values added for video: Nolensstraat 170-312_ch2_20180920103257_20180920103506_h264.mp4 | Nolensstraat 170-312_ch2', '2022-11-30 08:06:45.913246', '2022-11-30 08:06:45.913256'),
(238, 'Order K 001', 'WARNING: Default values added for camera: ._NVR_ch1_main | Kerkebuurt', '2022-11-30 08:06:46.096326', '2022-11-30 08:06:46.096338'),
(239, 'Order K 001', 'WARNING: Default values added for video: ._NVR_ch1_main_20220926074805_20220926082402 | ._NVR_ch1_main', '2022-11-30 08:06:46.137918', '2022-11-30 08:06:46.137932'),
(240, 'Order TH02', 'WARNING: Default values added for video: ._NVR_ch1_main_20221021104000_20221021104030 | ._NVR_ch1_main', '2022-11-30 08:06:46.213003', '2022-11-30 08:06:46.213016'),
(241, 'Order003', 'WARNING: Default values added for camera: ._dahua1 | Dorpstrraat', '2022-11-30 08:06:46.271385', '2022-11-30 08:06:46.271398'),
(242, 'Order003', 'WARNING: Default values added for video: ._dahua1 | ._dahua1', '2022-11-30 08:06:46.288042', '2022-11-30 08:06:46.288054'),
(243, 'Order003', 'WARNING: Default values added for camera: ._dahua2 | Dorpstrraat', '2022-11-30 08:06:46.313070', '2022-11-30 08:06:46.313085'),
(244, 'Order003', 'WARNING: Default values added for video: ._dahua2 | ._dahua2', '2022-11-30 08:06:46.329713', '2022-11-30 08:06:46.329723'),
(245, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-30 08:55:21.193890', '2022-11-30 08:55:21.193902'),
(246, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Links Voor.mp4 Size: 882.04589 MB', '2022-11-30 08:55:26.291347', '2022-11-30 08:55:26.291365'),
(247, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-30 09:02:59.889784', '2022-11-30 09:02:59.889805'),
(248, '440244  646781', 'Converting   /home/jan/media/Stadgenoot/Nieuwe Weteringstraat/2Convert/440244  646781/Smit spy_ch6_20200810182455_20200810183116.mp4 Size: 42.35264 MB', '2022-11-30 09:03:05.143692', '2022-11-30 09:03:05.143721'),
(249, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-11-30 09:05:32.032680', '2022-11-30 09:05:32.032701'),
(250, '03-03-2021 = 92101979', 'Copying h265 /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-03-2021 = 92101979/Nolensstraat 170-312_ch5_20210222133000_20210222165817.mp4 Size: 1414.78778 MB', '2022-11-30 09:05:37.293926', '2022-11-30 09:05:37.293958'),
(251, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210222133000_20210222165817_h264.mp4 | Nolensstraat 170-312_ch5', '2022-11-30 09:05:54.252646', '2022-11-30 09:05:54.252675'),
(252, '03-03-2021 = 92101979', 'Copying h265 /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-03-2021 = 92101979/Nolensstraat 170-312_ch6_20210222133007_20210222170000.mp4 Size: 932.01537 MB', '2022-11-30 09:06:00.917402', '2022-11-30 09:06:00.917434'),
(253, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch6 | Nolenstraat', '2022-11-30 09:06:13.463993', '2022-11-30 09:06:13.464023'),
(254, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch6_20210222133007_20210222170000_h264.mp4 | Nolensstraat 170-312_ch6', '2022-11-30 09:06:13.488838', '2022-11-30 09:06:13.488920'),
(255, '03-02-2021 = 92101295', 'Copying h265 /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-02-2021 = 92101295/Nolensstraat 170-312_ch5_20210130160109_20210130170741.mp4 Size: 489.45247 MB', '2022-11-30 09:06:18.704960', '2022-11-30 09:06:18.704992'),
(256, '03-02-2021 = 92101295', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210130160109_20210130170741_h264.mp4 | Nolensstraat 170-312_ch5', '2022-11-30 09:06:25.202454', '2022-11-30 09:06:25.202486'),
(257, 'Orderth04', 'Converting   /home/jan/media/Berkhout/Kerkebuurt/2Convert/Orderth04/NVR_ch3_main_20221021104000_20221021104030.mp4 Size: 13.95541 MB', '2022-11-30 09:06:30.413983', '2022-11-30 09:06:30.414015'),
(258, 'ION100098803', 'WARNING: Default values added for adress: Onbekend', '2022-11-30 11:07:00.458937', '2022-11-30 11:07:00.458960'),
(259, 'ION100098803', 'WARNING: Default values added for gebruiker: Onbekend', '2022-11-30 11:07:00.475521', '2022-11-30 11:07:00.475532'),
(260, 'Order 001', 'WARNING: Default values added for service order: Order 001', '2022-11-30 11:10:29.112111', '2022-11-30 11:10:29.112143'),
(261, 'Order rem 002', 'WARNING: Default values added for service order: Order rem 002', '2022-11-30 11:10:29.195438', '2022-11-30 11:10:29.195451'),
(262, '440244  646781', 'WARNING: Default values added for service order: 440244  646781', '2022-11-30 11:10:29.287211', '2022-11-30 11:10:29.287224'),
(263, 'Order Z001', 'WARNING: Default values added for service order: Order Z001', '2022-11-30 11:10:29.320499', '2022-11-30 11:10:29.320512'),
(264, '03-03-2021 = 92101979', 'WARNING: Default values added for service order: 03-03-2021 = 92101979', '2022-11-30 11:10:29.353845', '2022-11-30 11:10:29.353858'),
(265, '25-09-2018 = 9185368', 'WARNING: Default values added for service order: 25-09-2018 = 9185368', '2022-11-30 11:10:29.403921', '2022-11-30 11:10:29.403933'),
(266, '03-02-2021 = 92101295', 'WARNING: Default values added for service order: 03-02-2021 = 92101295', '2022-11-30 11:10:29.437196', '2022-11-30 11:10:29.437210'),
(267, 'Order 004', 'WARNING: Default values added for service order: Order 004', '2022-11-30 11:10:29.587185', '2022-11-30 11:10:29.587198'),
(268, 'Order  th03', 'WARNING: Default values added for service order: Order  th03', '2022-11-30 11:10:29.645549', '2022-11-30 11:10:29.645560'),
(269, 'Orderth04', 'WARNING: Default values added for service order: Orderth04', '2022-11-30 11:10:29.687231', '2022-11-30 11:10:29.687242'),
(270, 'Order TH02', 'WARNING: Default values added for service order: Order TH02', '2022-11-30 11:10:29.770630', '2022-11-30 11:10:29.770641'),
(271, 'Order 002', 'WARNING: Default values added for service order: Order 002', '2022-11-30 11:10:29.812273', '2022-11-30 11:10:29.812283'),
(272, 'Order003', 'WARNING: Default values added for service order: Order003', '2022-11-30 11:10:29.845627', '2022-11-30 11:10:29.845637'),
(273, 'ION100098803', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 11:31:42.704700', '2022-11-30 11:31:42.704730'),
(274, 'ION100098803', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden', '2022-11-30 11:31:42.754652', '2022-11-30 11:31:42.754664'),
(275, 'ION100098803', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7', '2022-11-30 11:31:42.812996', '2022-11-30 11:31:42.813007'),
(276, 'ION100098803', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 16:38:27.599603', '2022-11-30 16:38:27.599628'),
(277, 'Order 001', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 16:38:27.632888', '2022-11-30 16:38:27.632904'),
(278, 'Order 001', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden', '2022-11-30 16:38:27.674633', '2022-11-30 16:38:27.674645'),
(279, 'Order 001', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang', '2022-11-30 16:38:27.691824', '2022-11-30 16:38:27.691835'),
(280, 'Order 001', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 16:38:27.758025', '2022-11-30 16:38:27.758038'),
(281, 'Order 001', 'WARNING: Default values added for camera: ._cam1_nooduitgang | Remijden', '2022-11-30 16:38:27.774734', '2022-11-30 16:38:27.774749'),
(282, 'Order 001', 'WARNING: Default values added for video: ._cam1_nooduitgang | ._cam1_nooduitgang', '2022-11-30 16:38:27.816434', '2022-11-30 16:38:27.816447'),
(283, 'Order rem 002', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 16:38:27.841458', '2022-11-30 16:38:27.841468'),
(284, 'Order rem 002', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 16:38:27.874783', '2022-11-30 16:38:27.874797'),
(285, 'Order rem 002', 'WARNING: Default values added for camera: ._Remijden 1_ch7 | Remijden', '2022-11-30 16:38:27.891492', '2022-11-30 16:38:27.891504'),
(286, 'Order rem 002', 'WARNING: Default values added for video: ._Remijden 1_ch7_20220620062650_20220620075316 | ._Remijden 1_ch7', '2022-11-30 16:38:27.908147', '2022-11-30 16:38:27.908158'),
(287, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 2 | Wasborn Locatie 2 | Stadgenoot | default', '2022-11-30 16:38:27.965604', '2022-11-30 16:38:27.965617'),
(288, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn Locatie 2', '2022-11-30 16:38:27.983202', '2022-11-30 16:38:27.983214'),
(289, 'Order Was001', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree', '2022-11-30 16:38:27.999829', '2022-11-30 16:38:27.999842'),
(290, '440244  646781', 'WARNING: Default values added for locatie: Nieuwe Weteringstraat | Nieuwe Weteringstraat | Stadgenoot | default', '2022-11-30 16:38:28.024829', '2022-11-30 16:38:28.024843'),
(291, '440244  646781', 'WARNING: Default values added for camera: Smit spy_ch6 | Nieuwe Weteringstraat', '2022-11-30 16:38:28.041567', '2022-11-30 16:38:28.041580'),
(292, '440244  646781', 'WARNING: Default values added for video: Smit spy_ch6_20200810182455_20200810183116 | Smit spy_ch6', '2022-11-30 16:38:28.058212', '2022-11-30 16:38:28.058226'),
(293, 'Order Z001', 'WARNING: Default values added for locatie: Zuidgorsstraat | Zuidgorsstraat | Stadgenoot | default', '2022-11-30 16:38:28.083187', '2022-11-30 16:38:28.083201'),
(294, 'Order Z001', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | Zuidgorsstraat', '2022-11-30 16:38:28.099937', '2022-11-30 16:38:28.099950'),
(295, 'Order Z001', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1', '2022-11-30 16:38:28.149965', '2022-11-30 16:38:28.149976'),
(296, '03-03-2021 = 92101979', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-11-30 16:38:28.174936', '2022-11-30 16:38:28.174950'),
(297, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch5 | Nolenstraat', '2022-11-30 16:38:28.191640', '2022-11-30 16:38:28.191652'),
(298, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210222133000_20210222165817_h264.mp4 | Nolensstraat 170-312_ch5', '2022-11-30 16:38:28.208265', '2022-11-30 16:38:28.208276'),
(299, '03-03-2021 = 92101979', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-11-30 16:38:28.233296', '2022-11-30 16:38:28.233310'),
(300, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch6 | Nolenstraat', '2022-11-30 16:38:28.266718', '2022-11-30 16:38:28.266731'),
(301, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch6_20210222133007_20210222170000_h264.mp4 | Nolensstraat 170-312_ch6', '2022-11-30 16:38:28.283383', '2022-11-30 16:38:28.283397'),
(302, '25-09-2018 = 9185368', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-11-30 16:38:28.308325', '2022-11-30 16:38:28.308336'),
(303, '25-09-2018 = 9185368', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch2 | Nolenstraat', '2022-11-30 16:38:28.325041', '2022-11-30 16:38:28.325053'),
(304, '25-09-2018 = 9185368', 'WARNING: Default values added for video: Nolensstraat 170-312_ch2_20180920103257_20180920103506_h264.mp4 | Nolensstraat 170-312_ch2', '2022-11-30 16:38:28.341693', '2022-11-30 16:38:28.341704'),
(305, '03-02-2021 = 92101295', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-11-30 16:38:28.366639', '2022-11-30 16:38:28.366652'),
(306, '03-02-2021 = 92101295', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210130160109_20210130170741_h264.mp4 | Nolensstraat 170-312_ch5', '2022-11-30 16:38:28.383403', '2022-11-30 16:38:28.383417');
INSERT INTO `camera_log` (`id`, `ordernr`, `message`, `datum_inserted`, `datum_updated`) VALUES
(307, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 1 | Wasborn Locatie 1 | Stadgenoot | default', '2022-11-30 16:38:28.416729', '2022-11-30 16:38:28.416742'),
(308, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree1 | Wasborn Locatie 1', '2022-11-30 16:38:28.502533', '2022-11-30 16:38:28.502546'),
(309, 'Order Was001', 'WARNING: Default values added for video: Camera Entree1_20190323_232439 | Camera Entree1', '2022-11-30 16:38:28.516846', '2022-11-30 16:38:28.516857'),
(310, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat | Abraham Kuyperstraat | Stadgenoot | default', '2022-11-30 16:38:28.541774', '2022-11-30 16:38:28.541787'),
(311, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat', '2022-11-30 16:38:28.558600', '2022-11-30 16:38:28.558611'),
(312, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-11-30 16:38:28.591696', '2022-11-30 16:38:28.591709'),
(313, 'Order Sm001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-30 16:38:28.616840', '2022-11-30 16:38:28.616853'),
(314, 'Order Sm001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Bellstraat', '2022-11-30 16:38:28.633574', '2022-11-30 16:38:28.633586'),
(315, 'Order Sm001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-11-30 16:38:28.650170', '2022-11-30 16:38:28.650184'),
(316, 'Order Sm001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-30 16:38:28.700218', '2022-11-30 16:38:28.700232'),
(317, 'Order Sm001', 'WARNING: Default values added for camera: Earth | Bellstraat', '2022-11-30 16:38:28.716950', '2022-11-30 16:38:28.716962'),
(318, 'Order Sm001', 'WARNING: Default values added for video: Earth | Earth', '2022-11-30 16:38:28.733542', '2022-11-30 16:38:28.733555'),
(319, 'Order001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-30 16:38:28.758642', '2022-11-30 16:38:28.758655'),
(320, 'Order001', 'WARNING: Default values added for camera: voordeur | Bellstraat', '2022-11-30 16:38:28.775336', '2022-11-30 16:38:28.775348'),
(321, 'Order001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-11-30 16:38:28.792006', '2022-11-30 16:38:28.792020'),
(322, 'Order001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-30 16:38:28.817012', '2022-11-30 16:38:28.817025'),
(323, 'Order001', 'WARNING: Default values added for camera: auto | Bellstraat', '2022-11-30 16:38:28.858747', '2022-11-30 16:38:28.858759'),
(324, 'Order001', 'WARNING: Default values added for video: auto | auto', '2022-11-30 16:38:28.875361', '2022-11-30 16:38:28.875371'),
(325, 'Order001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-11-30 16:38:28.900389', '2022-11-30 16:38:28.900401'),
(326, 'Order001', 'WARNING: Default values added for camera: brommer | Bellstraat', '2022-11-30 16:38:28.917087', '2022-11-30 16:38:28.917099'),
(327, 'Order001', 'WARNING: Default values added for video: brommer | brommer', '2022-11-30 16:38:28.933743', '2022-11-30 16:38:28.933757'),
(328, 'Order 004', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:28.958751', '2022-11-30 16:38:28.958764'),
(329, 'Order 004', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt', '2022-11-30 16:38:28.975455', '2022-11-30 16:38:28.975467'),
(330, 'Order 004', 'WARNING: Default values added for video: bunnyfull | bunnyfull', '2022-11-30 16:38:28.992103', '2022-11-30 16:38:28.992114'),
(331, 'Order 004', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.017129', '2022-11-30 16:38:29.017142'),
(332, 'Order 004', 'WARNING: Default values added for camera: Earth | Kerkebuurt', '2022-11-30 16:38:29.033820', '2022-11-30 16:38:29.033832'),
(333, 'Order 004', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.067168', '2022-11-30 16:38:29.067181'),
(334, 'Order 004', 'WARNING: Default values added for camera: bunny | Kerkebuurt', '2022-11-30 16:38:29.125527', '2022-11-30 16:38:29.125539'),
(335, 'Order 004', 'WARNING: Default values added for video: bunny | bunny', '2022-11-30 16:38:29.142179', '2022-11-30 16:38:29.142192'),
(336, 'Order  th03', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.167189', '2022-11-30 16:38:29.167202'),
(337, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch2_main | Kerkebuurt', '2022-11-30 16:38:29.183849', '2022-11-30 16:38:29.183861'),
(338, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-11-30 16:38:29.216944', '2022-11-30 16:38:29.216958'),
(339, 'Order  th03', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.267250', '2022-11-30 16:38:29.267263'),
(340, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt', '2022-11-30 16:38:29.283918', '2022-11-30 16:38:29.283930'),
(341, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-11-30 16:38:29.300568', '2022-11-30 16:38:29.300578'),
(342, 'Orderth04', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.325573', '2022-11-30 16:38:29.325586'),
(343, 'Orderth04', 'WARNING: Default values added for camera: NVR_ch3_main | Kerkebuurt', '2022-11-30 16:38:29.342271', '2022-11-30 16:38:29.342283'),
(344, 'Orderth04', 'WARNING: Default values added for video: NVR_ch3_main_20221021104000_20221021104030 | NVR_ch3_main', '2022-11-30 16:38:29.358919', '2022-11-30 16:38:29.358930'),
(345, 'Order K 001', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.433975', '2022-11-30 16:38:29.433988'),
(346, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-11-30 16:38:29.450575', '2022-11-30 16:38:29.450586'),
(347, 'Order K 001', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.475673', '2022-11-30 16:38:29.475686'),
(348, 'Order K 001', 'WARNING: Default values added for camera: ._NVR_ch1_main | Kerkebuurt', '2022-11-30 16:38:29.492366', '2022-11-30 16:38:29.492377'),
(349, 'Order K 001', 'WARNING: Default values added for video: ._NVR_ch1_main_20220926074805_20220926082402 | ._NVR_ch1_main', '2022-11-30 16:38:29.509017', '2022-11-30 16:38:29.509030'),
(350, 'Order K 001', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.600713', '2022-11-30 16:38:29.600726'),
(351, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-11-30 16:38:29.642442', '2022-11-30 16:38:29.642454'),
(352, 'Order K 001', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.667430', '2022-11-30 16:38:29.667443'),
(353, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-30 16:38:29.684106', '2022-11-30 16:38:29.684120'),
(354, 'Order TH02', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.709089', '2022-11-30 16:38:29.709103'),
(355, 'Order TH02', 'WARNING: Default values added for video: ._NVR_ch1_main_20221021104000_20221021104030 | ._NVR_ch1_main', '2022-11-30 16:38:29.725762', '2022-11-30 16:38:29.725773'),
(356, 'Order TH02', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-11-30 16:38:29.750733', '2022-11-30 16:38:29.750746'),
(357, 'Order 002', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Berkhout | default', '2022-11-30 16:38:29.784157', '2022-11-30 16:38:29.784170'),
(358, 'Order 002', 'WARNING: Default values added for camera: achter | Dorpsplein', '2022-11-30 16:38:29.800838', '2022-11-30 16:38:29.800850'),
(359, 'Order 002', 'WARNING: Default values added for video: achter | achter', '2022-11-30 16:38:29.817520', '2022-11-30 16:38:29.817533'),
(360, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-30 16:38:29.842515', '2022-11-30 16:38:29.842528'),
(361, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstrraat', '2022-11-30 16:38:29.859212', '2022-11-30 16:38:29.859224'),
(362, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-11-30 16:38:29.875866', '2022-11-30 16:38:29.875876'),
(363, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-30 16:38:29.925913', '2022-11-30 16:38:29.925927'),
(364, 'Order003', 'WARNING: Default values added for camera: ._dahua1 | Dorpstrraat', '2022-11-30 16:38:29.942603', '2022-11-30 16:38:29.942615'),
(365, 'Order003', 'WARNING: Default values added for video: ._dahua1 | ._dahua1', '2022-11-30 16:38:29.959252', '2022-11-30 16:38:29.959266'),
(366, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-30 16:38:29.984260', '2022-11-30 16:38:29.984273'),
(367, 'Order003', 'WARNING: Default values added for camera: ._dahua2 | Dorpstrraat', '2022-11-30 16:38:30.000955', '2022-11-30 16:38:30.000967'),
(368, 'Order003', 'WARNING: Default values added for video: ._dahua2 | ._dahua2', '2022-11-30 16:38:30.017603', '2022-11-30 16:38:30.017614'),
(369, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-11-30 16:38:30.042558', '2022-11-30 16:38:30.042568'),
(370, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstrraat', '2022-11-30 16:38:30.059318', '2022-11-30 16:38:30.059330'),
(371, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-11-30 16:38:30.075998', '2022-11-30 16:38:30.076012'),
(372, 'ION100098803', 'WARNING: Default values added for locatie: Remijden | Remijden | Stadgenoot | default', '2022-11-30 18:23:26.058551', '2022-11-30 18:23:26.058573'),
(373, 'ION100098803', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden', '2022-11-30 18:23:26.074738', '2022-11-30 18:23:26.074750'),
(374, 'ION100098803', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7', '2022-11-30 18:23:26.099724', '2022-11-30 18:23:26.099735'),
(375, 'Order 001', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden', '2022-12-01 06:37:23.632921', '2022-12-01 06:37:23.632946'),
(376, 'Order 001', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang', '2022-12-01 06:37:23.707927', '2022-12-01 06:37:23.707939'),
(377, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 2 | Wasborn Locatie 2 | Stadgenoot | default', '2022-12-01 06:37:23.783017', '2022-12-01 06:37:23.783030'),
(378, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree | Wasborn Locatie 2', '2022-12-01 06:37:23.799705', '2022-12-01 06:37:23.799717'),
(379, 'Order Was001', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree', '2022-12-01 06:37:23.816359', '2022-12-01 06:37:23.816372'),
(380, '440244  646781', 'WARNING: Default values added for locatie: Nieuwe Weteringstraat | Nieuwe Weteringstraat | Stadgenoot | default', '2022-12-01 06:37:23.841316', '2022-12-01 06:37:23.841329'),
(381, '440244  646781', 'WARNING: Default values added for camera: Smit spy_ch6 | Nieuwe Weteringstraat', '2022-12-01 06:37:23.883133', '2022-12-01 06:37:23.883145'),
(382, '440244  646781', 'WARNING: Default values added for video: Smit spy_ch6_20200810182455_20200810183116 | Smit spy_ch6', '2022-12-01 06:37:23.908022', '2022-12-01 06:37:23.908035'),
(383, 'Order Z001', 'WARNING: Default values added for locatie: Zuidgorsstraat | Zuidgorsstraat | Stadgenoot | default', '2022-12-01 06:37:23.933115', '2022-12-01 06:37:23.933127'),
(384, 'Order Z001', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | Zuidgorsstraat', '2022-12-01 06:37:23.949653', '2022-12-01 06:37:23.949666'),
(385, 'Order Z001', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1', '2022-12-01 06:37:23.966308', '2022-12-01 06:37:23.966320'),
(386, '03-03-2021 = 92101979', 'WARNING: Default values added for locatie: Nolenstraat | Nolenstraat | Stadgenoot | default', '2022-12-01 06:37:23.991356', '2022-12-01 06:37:23.991368'),
(387, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch5 | Nolenstraat', '2022-12-01 06:37:24.008043', '2022-12-01 06:37:24.008056'),
(388, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210222133000_20210222165817_h264.mp4 | Nolensstraat 170-312_ch5', '2022-12-01 06:37:24.024724', '2022-12-01 06:37:24.024735'),
(389, '03-03-2021 = 92101979', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch6 | Nolenstraat', '2022-12-01 06:37:24.049745', '2022-12-01 06:37:24.049761'),
(390, '03-03-2021 = 92101979', 'WARNING: Default values added for video: Nolensstraat 170-312_ch6_20210222133007_20210222170000_h264.mp4 | Nolensstraat 170-312_ch6', '2022-12-01 06:37:24.098332', '2022-12-01 06:37:24.098343'),
(391, '25-09-2018 = 9185368', 'WARNING: Default values added for camera: Nolensstraat 170-312_ch2 | Nolenstraat', '2022-12-01 06:37:24.124787', '2022-12-01 06:37:24.124800'),
(392, '25-09-2018 = 9185368', 'WARNING: Default values added for video: Nolensstraat 170-312_ch2_20180920103257_20180920103506_h264.mp4 | Nolensstraat 170-312_ch2', '2022-12-01 06:37:24.141464', '2022-12-01 06:37:24.141475'),
(393, '03-02-2021 = 92101295', 'WARNING: Default values added for video: Nolensstraat 170-312_ch5_20210130160109_20210130170741_h264.mp4 | Nolensstraat 170-312_ch5', '2022-12-01 06:37:24.166529', '2022-12-01 06:37:24.166540'),
(394, 'Order Was001', 'WARNING: Default values added for locatie: Wasborn Locatie 1 | Wasborn Locatie 1 | Stadgenoot | default', '2022-12-01 06:37:24.191437', '2022-12-01 06:37:24.191448'),
(395, 'Order Was001', 'WARNING: Default values added for camera: Camera Entree1 | Wasborn Locatie 1', '2022-12-01 06:37:24.208167', '2022-12-01 06:37:24.208180'),
(396, 'Order Was001', 'WARNING: Default values added for video: Camera Entree1_20190323_232439 | Camera Entree1', '2022-12-01 06:37:24.224821', '2022-12-01 06:37:24.224832'),
(397, 'Order Abra 001', 'WARNING: Default values added for locatie: Abraham Kuyperstraat | Abraham Kuyperstraat | Stadgenoot | default', '2022-12-01 06:37:24.249840', '2022-12-01 06:37:24.249851'),
(398, 'Order Abra 001', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat', '2022-12-01 06:37:24.266638', '2022-12-01 06:37:24.266652'),
(399, 'Order Abra 001', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4', '2022-12-01 06:37:24.283287', '2022-12-01 06:37:24.283300'),
(400, 'Order Sm001', 'WARNING: Default values added for locatie: Bellstraat | Bellstraat | Smit Electrotechniek | default', '2022-12-01 06:37:24.308339', '2022-12-01 06:37:24.308352'),
(401, 'Order Sm001', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Bellstraat', '2022-12-01 06:37:24.326214', '2022-12-01 06:37:24.326227'),
(402, 'Order Sm001', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264', '2022-12-01 06:37:24.356951', '2022-12-01 06:37:24.356965'),
(403, 'Order Sm001', 'WARNING: Default values added for camera: Earth | Bellstraat', '2022-12-01 06:37:24.391663', '2022-12-01 06:37:24.391676'),
(404, 'Order Sm001', 'WARNING: Default values added for video: Earth | Earth', '2022-12-01 06:37:24.491676', '2022-12-01 06:37:24.491690'),
(405, 'Order001', 'WARNING: Default values added for camera: voordeur | Bellstraat', '2022-12-01 06:37:24.525074', '2022-12-01 06:37:24.525087'),
(406, 'Order001', 'WARNING: Default values added for video: voordeur | voordeur', '2022-12-01 06:37:24.541699', '2022-12-01 06:37:24.541713'),
(407, 'Order001', 'WARNING: Default values added for camera: auto | Bellstraat', '2022-12-01 06:37:24.575086', '2022-12-01 06:37:24.575099'),
(408, 'Order001', 'WARNING: Default values added for video: auto | auto', '2022-12-01 06:37:24.591727', '2022-12-01 06:37:24.591738'),
(409, 'Order001', 'WARNING: Default values added for camera: brommer | Bellstraat', '2022-12-01 06:37:24.625114', '2022-12-01 06:37:24.625127'),
(410, 'Order001', 'WARNING: Default values added for video: brommer | brommer', '2022-12-01 06:37:24.641764', '2022-12-01 06:37:24.641775'),
(411, 'Order 004', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Berkhout | default', '2022-12-01 06:37:24.666743', '2022-12-01 06:37:24.666755'),
(412, 'Order 004', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt', '2022-12-01 06:37:24.683487', '2022-12-01 06:37:24.683500'),
(413, 'Order 004', 'WARNING: Default values added for video: bunnyfull | bunnyfull', '2022-12-01 06:37:24.715605', '2022-12-01 06:37:24.715619'),
(414, 'Order 004', 'WARNING: Default values added for camera: Earth | Kerkebuurt', '2022-12-01 06:37:24.750200', '2022-12-01 06:37:24.750214'),
(415, 'Order 004', 'WARNING: Default values added for camera: bunny | Kerkebuurt', '2022-12-01 06:37:24.783547', '2022-12-01 06:37:24.783560'),
(416, 'Order 004', 'WARNING: Default values added for video: bunny | bunny', '2022-12-01 06:37:24.800192', '2022-12-01 06:37:24.800203'),
(417, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch2_main | Kerkebuurt', '2022-12-01 06:37:24.834504', '2022-12-01 06:37:24.834516'),
(418, 'Order  th03', 'WARNING: Default values added for video: NVR_ch2_main_20221021104000_20221021104030 | NVR_ch2_main', '2022-12-01 06:37:24.850215', '2022-12-01 06:37:24.850229'),
(419, 'Order  th03', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt', '2022-12-01 06:37:24.883580', '2022-12-01 06:37:24.883593'),
(420, 'Order  th03', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main', '2022-12-01 06:37:24.900231', '2022-12-01 06:37:24.900242'),
(421, 'Orderth04', 'WARNING: Default values added for camera: NVR_ch3_main | Kerkebuurt', '2022-12-01 06:37:24.925240', '2022-12-01 06:37:24.925254'),
(422, 'Orderth04', 'WARNING: Default values added for video: NVR_ch3_main_20221021104000_20221021104030 | NVR_ch3_main', '2022-12-01 06:37:24.983659', '2022-12-01 06:37:24.983672'),
(423, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main', '2022-12-01 06:37:25.016971', '2022-12-01 06:37:25.016983'),
(424, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main', '2022-12-01 06:37:25.050456', '2022-12-01 06:37:25.050468'),
(425, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-12-01 06:37:25.083661', '2022-12-01 06:37:25.083673'),
(426, 'Order 002', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Berkhout | default', '2022-12-01 06:37:25.140717', '2022-12-01 06:37:25.140728'),
(427, 'Order 002', 'WARNING: Default values added for camera: achter | Dorpsplein', '2022-12-01 06:37:25.158638', '2022-12-01 06:37:25.158651'),
(428, 'Order 002', 'WARNING: Default values added for video: achter | achter', '2022-12-01 06:37:25.175304', '2022-12-01 06:37:25.175314'),
(429, 'Order003', 'WARNING: Default values added for locatie: Dorpstrraat | Dorpstrraat | Berkhout | default', '2022-12-01 06:37:25.200293', '2022-12-01 06:37:25.200304'),
(430, 'Order003', 'WARNING: Default values added for camera: dahua1 | Dorpstrraat', '2022-12-01 06:37:25.217006', '2022-12-01 06:37:25.217019'),
(431, 'Order003', 'WARNING: Default values added for video: dahua1 | dahua1', '2022-12-01 06:37:25.233804', '2022-12-01 06:37:25.233817'),
(432, 'Order003', 'WARNING: Default values added for camera: dahua2 | Dorpstrraat', '2022-12-01 06:37:25.267186', '2022-12-01 06:37:25.267199'),
(433, 'Order003', 'WARNING: Default values added for video: dahua2 | dahua2', '2022-12-01 06:37:25.285049', '2022-12-01 06:37:25.285060'),
(434, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-12-01 08:22:22.842360', '2022-12-01 08:22:22.842389'),
(435, '03-03-2021 = 92101979', 'Copying h264code /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-03-2021 = 92101979/Nolensstraat 170-312_ch5_20210222133000_20210222165817.mp4 Size: 1414.78778 MB', '2022-12-01 08:22:28.835252', '2022-12-01 08:22:28.835275'),
(436, '03-03-2021 = 92101979', 'Copying h264code /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-03-2021 = 92101979/Nolensstraat 170-312_ch6_20210222133007_20210222170000.mp4 Size: 932.01537 MB', '2022-12-01 08:22:51.957028', '2022-12-01 08:22:51.957047'),
(437, '03-02-2021 = 92101295', 'Copying h264code /home/jan/media/Stadgenoot/Nolenstraat/2Convert/03-02-2021 = 92101295/Nolensstraat 170-312_ch5_20210130160109_20210130170741.mp4 Size: 489.45247 MB', '2022-12-01 08:23:09.307533', '2022-12-01 08:23:09.307555'),
(438, 'Orderth04', 'Converting   /home/jan/media/Berkhout/Kerkebuurt/2Convert/Orderth04/NVR_ch3_main_20221021104000_20221021104030.mp4 Size: 13.95541 MB', '2022-12-01 08:23:19.870325', '2022-12-01 08:23:19.870427'),
(439, 'Orderth04', 'Converted to /home/jan/media/Berkhout/Kerkebuurt/Converted/Orderth04/NVR_ch3_main_20221021104000_20221021104030.webm Size: 8.47912 MB Time: 00:06:21', '2022-12-01 08:29:41.126435', '2022-12-01 08:29:41.126458'),
(440, ' ', 'Converting Ended ', '2022-12-01 08:29:41.156252', '2022-12-01 08:29:41.156263'),
(441, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-12-01 09:01:51.281334', '2022-12-01 09:01:51.281347'),
(442, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Links Voor.mp4 Size: 882.04589 MB', '2022-12-01 09:01:57.036367', '2022-12-01 09:01:57.036388'),
(443, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-12-01 16:14:12.705112', '2022-12-01 16:14:12.705134'),
(444, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Links Voor.mp4 Size: 882.04589 MB', '2022-12-01 16:14:19.915839', '2022-12-01 16:14:19.915857'),
(445, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-12-02 12:51:29.501279', '2022-12-02 12:51:29.501302'),
(446, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Links Voor.mp4 Size: 882.04589 MB', '2022-12-02 12:51:38.418246', '2022-12-02 12:51:38.418277'),
(447, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:23:02.885969', '2022-12-02 13:23:02.885994'),
(448, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Rechts Voor.mp4 Size: 881.91215 MB', '2022-12-02 13:23:09.547336', '2022-12-02 13:23:09.547357'),
(449, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:24:40.246606', '2022-12-02 13:24:40.246630'),
(450, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Fietsenstalling Rechts Groot Voor.mp4 Size: 881.96483 MB', '2022-12-02 13:24:45.385189', '2022-12-02 13:24:45.385227'),
(451, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:49:26.457753', '2022-12-02 13:49:26.457778'),
(452, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Fietsenstalling Rechts Groot Achter.mp4 Size: 881.70227 MB', '2022-12-02 13:49:31.608841', '2022-12-02 13:49:31.608866'),
(453, ' ', 'Converting Looking for New Videos in /home/jan/media/', '2022-12-02 13:49:59.647396', '2022-12-02 13:49:59.647419'),
(454, 'Entree Links Voor.mp', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/Entree Links Voor.mp4 Size: 767.00004 MB', '2022-12-02 13:50:04.761296', '2022-12-02 13:50:04.761327'),
(455, 'Entree Links Voor.mp', 'ERROR : Not Converted', '2022-12-02 13:50:04.955114', '2022-12-02 13:50:04.955149'),
(456, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Links Voor.mp4 Size: 882.04589 MB', '2022-12-02 13:50:10.249077', '2022-12-02 13:50:10.249107'),
(457, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:51:49.285252', '2022-12-02 13:51:49.285280'),
(458, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:51:49.288419', '2022-12-02 13:51:49.288448'),
(459, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Lift.mp4 Size: 882.32724 MB', '2022-12-02 13:51:54.423082', '2022-12-02 13:51:54.423110'),
(460, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Entree Rechts Voor.mp4 Size: 881.91215 MB', '2022-12-02 13:51:54.437377', '2022-12-02 13:51:54.437402'),
(461, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:52:55.534603', '2022-12-02 13:52:55.534632'),
(462, '14-11-2022 03.30 - 04.50', 'ERROR : Not Converted', '2022-12-02 13:52:55.535032', '2022-12-02 13:52:55.535050'),
(463, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Fietsenstalling Rechts Groot Voor.mp4 Size: 881.96483 MB', '2022-12-02 13:53:00.667683', '2022-12-02 13:53:00.667719'),
(464, '14-11-2022 03.30 - 04.50', 'Converting   /home/jan/media/Stadgenoot/Descartestraat 21-163/2Convert/14-11-2022 03.30 - 04.50/Fietsenstalling Links Klein.mp4 Size: 881.67138 MB', '2022-12-02 13:53:00.742844', '2022-12-02 13:53:00.742866');

-- --------------------------------------------------------

--
-- Table structure for table `camera_parameter`
--

CREATE TABLE `camera_parameter` (
  `id` int(11) NOT NULL,
  `videoPath` varchar(100) NOT NULL,
  `conversion_running` tinyint(1) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_parameter`
--

INSERT INTO `camera_parameter` (`id`, `videoPath`, `conversion_running`, `datum_inserted`, `datum_updated`) VALUES
(1, '/home/jan/media/', 1, '2022-09-12 00:00:00.000000', '2022-12-02 13:49:59.659244');

-- --------------------------------------------------------

--
-- Table structure for table `camera_serviceorder`
--

CREATE TABLE `camera_serviceorder` (
  `id` int(11) NOT NULL,
  `ordernr` varchar(50) NOT NULL,
  `keep_original` tinyint(1) NOT NULL,
  `auto_cleanup` tinyint(1) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `conversion_ready` tinyint(1) NOT NULL,
  `conversion_started` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_serviceorder`
--

INSERT INTO `camera_serviceorder` (`id`, `ordernr`, `keep_original`, `auto_cleanup`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `contact_id`, `conversion_ready`, `conversion_started`) VALUES
(2, 'een', 1, 0, '', 'een', '2022-11-11 08:26:39.650105', '2022-11-11 08:26:39.656691', 20, 2, 1, 1),
(3, '0002', 1, 1, '', '0002', '2022-11-11 08:30:14.335015', '2022-11-11 08:30:14.343777', 3, 6, 1, 1),
(4, 'Order001', 1, 0, '', 'order001', '2022-11-28 15:07:08.885786', '2022-11-28 15:07:08.896716', 18, 3, 1, 1),
(5, 'Order Abra 001', 1, 0, '', 'order-abra-001', '2022-11-28 15:09:11.477198', '2022-11-28 15:09:11.485294', 1, 9, 1, 1),
(6, 'Order Was001', 1, 0, '', 'order-was001', '2022-11-28 15:09:37.773422', '2022-11-28 15:09:37.781571', 1, 9, 1, 1),
(7, 'Order Sm001', 1, 0, '', 'order-sm001', '2022-11-28 15:10:16.364266', '2022-11-28 15:10:16.372363', 18, 3, 1, 1),
(8, 'Order K 001', 1, 0, '', 'order-k-001', '2022-11-28 15:10:51.212007', '2022-11-30 11:19:55.788108', 20, 2, 1, 1),
(9, 'ION100098803', 1, 0, 'Van: Stadgenoot <wordpress@beheer.smitelektrotechniek.nl> \r\nVerzonden: maandag 20 juni 2022 09:39\r\nAan: Beheer | Smit Elektrotechniek <Beheer@Smitelektrotechniek.nl>; Service | Smit Elektrotechniek <Service@Smitelektrotechniek.nl>; jdassel <jdassel@stadgenoot.nl>\r\nOnderwerp: Remijden\r\n\r\nBedrijfsnaam / aanvragende partij: Stadgenoot\r\nContactpersoon: Joost Dassel\r\nMobiel nummer contactpersoon: 0611591251\r\n\r\nVast nummer contactpersoon: \r\n\r\nE-mailadres 1: jdassel@stadgenoot.nl\r\nE-mailadres 2: \r\nAdres/Locatie/Object: Remijden \r\nPostcode: \r\nWoonplaats: amsterdam\r\n\r\nGewenste beelden incident (wat is er gebeurt, of wie zoeken we, zo duidelijk mogelijke omschrijving): Lift opsluiting (door hondenriem), graag beelden van in de lift en van buiten de lift\r\n\r\nWelke camera(\'s): camera in de grote lift en centrale hal\r\n\r\nBegindatum opname: 20 juni 2022\r\nBegintijd opname: 6:00\r\nEinddatum opname: 20 juni 2022\r\nEindtijd opname: 7:00\r\nFormaat opnames: . . . MP4 (formaat is zonder aanduiding motion detection)\r\nOpdrachtnummer: ION100098803', 'ion100098803', '2022-11-28 19:54:52.049874', '2022-11-29 08:02:56.101887', 1, 14, 0, 1),
(10, '440244 / 646781', 1, 0, 'Werkopdracht\r\nStadgenoot\r\nPostbus 700\r\n1000 AS Amsterdam\r\nBezoekadres: Sarphatistraat 370, Amsterdam\r\nWerkbonnummer: 440244 / 646781\r\nAannemer: Smit Installateurs in elektrotechniek\r\nPrint datum: 11-08-2020\r\nOpdracht verstrekt op: 11-08-2020\r\nUiterlijk gereed: 11-08-2020\r\nAdres Woning of Complex Complexnaam\r\n: Derde Weteringdwarsstraat 18\r\n: DerdeWeteringdwars18,24,28-36Nwe Wetering19-47\r\nMELDER\r\nNaam\r\nAdres/Woonplaats Telefoonnummer 1 Telefoonnummer 2 : Telefoonnummer zakelijk :\r\nEmail Urgentie fonds\r\n: Dhr P.D. Oorbeek\r\n: Sarphatistraat 410 1018 GW AMSTERDAM\r\n: 06 - 52 08 67 79\r\n: poorbeek@stadgenoot.nl\r\n: SPOED\r\n: 417 Sociaal Beheer niet SK\r\nOmschrijving werkzaamheden\r\nCamerabeelden veiligstellen\r\nCamerabeelden veiligstellen en uitlezen 11-08-2020. Bewoners hebben een vuilnioszak over de camera gehangen. Graag de beelden uitlezen en doorsturen naar Sander van Grootheest en Julya Martin.', '440244-646781', '2022-11-28 20:09:52.522682', '2022-11-29 08:03:17.845681', 1, 15, 0, 1),
(11, 'Order 001', 0, 0, '', 'order-001', '2022-11-30 11:10:29.100965', '2022-12-01 11:30:24.112082', 1, 9, 0, 0),
(12, 'Order rem 002', 0, 0, '', 'order-rem-002', '2022-11-30 11:10:29.185620', '2022-12-01 11:31:12.944275', 1, 15, 0, 0),
(13, '440244  646781', 0, 0, '', '440244-646781', '2022-11-30 11:10:29.270479', '2022-12-01 11:29:53.813212', 1, 14, 0, 0),
(14, 'Order Z001', 0, 0, '', 'order-z001', '2022-11-30 11:10:29.311698', '2022-12-01 11:31:45.236047', 1, 9, 1, 1),
(15, '03-03-2021 = 92101979', 0, 0, '', '03-03-2021-92101979', '2022-11-30 11:10:29.344535', '2022-11-30 11:23:02.737516', 1, 14, 0, 0),
(16, '25-09-2018 = 9185368', 0, 0, '', '25-09-2018-9185368', '2022-11-30 11:10:29.396211', '2022-12-01 11:28:11.798844', 1, 14, 0, 1),
(17, '03-02-2021 = 92101295', 0, 0, '', '03-02-2021-92101295', '2022-11-30 11:10:29.428737', '2022-11-30 11:22:12.741451', 1, 9, 0, 0),
(18, 'Order 004', 0, 0, '', 'order-004', '2022-11-30 11:10:29.581972', '2022-11-30 11:20:30.492598', 20, 2, 0, 0),
(19, 'Order  th03', 0, 0, '', 'order-th03', '2022-11-30 11:10:29.635750', '2022-11-30 11:18:47.005335', 20, 2, 0, 0),
(20, 'Orderth04', 0, 0, '', 'orderth04', '2022-11-30 11:10:29.681030', '2022-11-30 11:21:49.460314', 20, 2, 1, 1),
(21, 'Order TH02', 0, 0, '', 'order-th02', '2022-11-30 11:10:29.763312', '2022-11-30 11:21:09.135948', 20, 2, 0, 0),
(22, 'Order 002', 0, 0, '', 'order-002', '2022-11-30 11:10:29.806147', '2022-11-30 11:19:35.981555', 20, 2, 0, 0),
(23, 'Order003', 0, 0, '', 'order003', '2022-11-30 11:10:29.834162', '2022-11-30 11:21:26.907562', 20, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `camera_video`
--

CREATE TABLE `camera_video` (
  `id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
  `ordernr` varchar(50) NOT NULL,
  `opname_van` datetime(6) NOT NULL,
  `opname_tot` datetime(6) NOT NULL,
  `video_link` varchar(500) NOT NULL,
  `duration` varchar(10) NOT NULL,
  `codec` varchar(50) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `camera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `camera_video`
--

INSERT INTO `camera_video` (`id`, `naam`, `ordernr`, `opname_van`, `opname_tot`, `video_link`, `duration`, `codec`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `camera_id`) VALUES
(1, 'Remijden 1_ch7_20220620062650_20220620075316', 'ION100098803', '2022-06-20 04:26:50.000000', '2022-06-20 05:53:16.000000', 'Stadgenoot/Remijden/Converted/ION100098803/Remijden 1_ch7_20220620062650_20220620075316.webm', '', 'vb9', 'Kabel vast in liftdeur', 'remijden-1_ch7_20220620062650_20220620075316', '2022-11-30 18:23:26.084673', '2022-12-01 14:42:16.847247', 230),
(2, 'cam1_nooduitgang', 'Order 001', '2022-12-01 06:37:23.695088', '2022-12-01 06:37:23.695093', 'Stadgenoot/Remijden/Converted/Order 001/cam1_nooduitgang.webm', '', 'vb9', '', 'cam1_nooduitgang', '2022-12-01 06:37:23.695114', '2022-12-01 06:37:23.695422', 231),
(3, 'Camera Entree_20190323_232439', 'Order Was001', '2022-12-01 06:37:23.809420', '2022-12-01 06:37:23.809424', 'Stadgenoot/Wasborn Locatie 2/Converted/Order Was001/Camera Entree_20190323_232439.webm', '', 'vb9', '', 'camera-entree_20190323_232439', '2022-12-01 06:37:23.809437', '2022-12-01 06:37:23.809488', 232),
(4, 'Smit spy_ch6_20200810182455_20200810183116', '440244  646781', '2020-08-10 16:24:55.000000', '2020-08-10 16:31:16.000000', 'Stadgenoot/Nieuwe Weteringstraat/Converted/440244  646781/Smit spy_ch6_20200810182455_20200810183116.webm', '', 'vb9', 'Camera wordt afgeplakt', 'smit-spy_ch6_20200810182455_20200810183116', '2022-12-01 06:37:23.892995', '2022-12-01 10:54:36.086970', 233),
(5, 'zuidgorsstraat 9_ch1_20220405155243_20220405155619', 'Order Z001', '2022-04-05 13:52:43.000000', '2022-04-05 13:56:19.000000', 'Stadgenoot/Zuidgorsstraat/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm', '', 'vb9', '', 'zuidgorsstraat-9_ch1_20220405155243_20220405155619', '2022-12-01 06:37:23.959806', '2022-12-01 06:37:23.959913', 234),
(6, 'Nolensstraat 170-312_ch5_20210222133000_20210222165817_h264.mp4', '03-03-2021 = 92101979', '2021-02-22 12:30:00.000000', '2022-12-01 06:37:24.017650', 'Stadgenoot/Nolenstraat/Converted/03-03-2021 = 92101979/Nolensstraat 170-312_ch5_20210222133000_20210222165817_h264.mp4', '', 'h265', '', 'nolensstraat-170-312_ch5_20210222133000_20210222165817_h264mp4', '2022-12-01 06:37:24.017663', '2022-12-01 06:37:24.017749', 235),
(7, 'Nolensstraat 170-312_ch6_20210222133007_20210222170000_h264.mp4', '03-03-2021 = 92101979', '2021-02-22 12:30:07.000000', '2022-12-01 06:37:24.059339', 'Stadgenoot/Nolenstraat/Converted/03-03-2021 = 92101979/Nolensstraat 170-312_ch6_20210222133007_20210222170000_h264.mp4', '', 'h265', '', 'nolensstraat-170-312_ch6_20210222133007_20210222170000_h264mp4', '2022-12-01 06:37:24.059352', '2022-12-01 06:37:24.059436', 236),
(8, 'Nolensstraat 170-312_ch2_20180920103257_20180920103506_h264.mp4', '25-09-2018 = 9185368', '2018-09-20 08:32:57.000000', '2022-12-01 06:37:24.134500', 'Stadgenoot/Nolenstraat/Converted/25-09-2018 = 9185368/Nolensstraat 170-312_ch2_20180920103257_20180920103506_h264.mp4', '', 'h265', '', 'nolensstraat-170-312_ch2_20180920103257_20180920103506_h264mp4', '2022-12-01 06:37:24.134512', '2022-12-01 06:37:24.134598', 237),
(9, 'Nolensstraat 170-312_ch5_20210130160109_20210130170741_h264.mp4', '03-02-2021 = 92101295', '2021-01-30 15:01:09.000000', '2022-12-01 06:37:24.162301', 'Stadgenoot/Nolenstraat/Converted/03-02-2021 = 92101295/Nolensstraat 170-312_ch5_20210130160109_20210130170741_h264.mp4', '', 'h265', '', 'nolensstraat-170-312_ch5_20210130160109_20210130170741_h264mp4', '2022-12-01 06:37:24.162313', '2022-12-01 06:37:24.162432', 235),
(10, 'Camera Entree1_20190323_232439', 'Order Was001', '2022-12-01 06:37:24.217736', '2022-12-01 06:37:24.217740', 'Stadgenoot/Wasborn Locatie 1/Converted/Order Was001/Camera Entree1_20190323_232439.webm', '', 'vb9', '', 'camera-entree1_20190323_232439', '2022-12-01 06:37:24.217753', '2022-12-01 06:37:24.217804', 238),
(11, 'Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537', 'Order Abra 001', '2019-07-02 15:43:46.000000', '2019-07-02 15:55:37.000000', 'Stadgenoot/Abraham Kuyperstraat/Converted/Order Abra 001/Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537.webm', '', 'vb9', '', 'abraham-kuyperstraat-1-73_ch4_20190702174346_20190702175537', '2022-12-01 06:37:24.276347', '2022-12-01 06:37:24.276452', 239),
(12, 'CCTV_ch9_H264', 'Order Sm001', '2022-12-01 06:37:24.334797', '2022-12-01 06:37:24.334801', 'Smit Electrotechniek/Bellstraat/Converted/Order Sm001/CCTV_ch9_H264.webm', '', 'vb9', '', 'cctv_ch9_h264', '2022-12-01 06:37:24.334814', '2022-12-01 06:37:24.334864', 240),
(13, 'Earth', 'Order Sm001', '2022-12-01 06:37:24.426508', '2022-12-01 06:37:24.426512', 'Smit Electrotechniek/Bellstraat/Converted/Order Sm001/Earth.webm', '', 'vb9', '', 'earth', '2022-12-01 06:37:24.426527', '2022-12-01 06:37:24.426577', 241),
(14, 'voordeur', 'Order001', '2022-12-01 06:37:24.534797', '2022-12-01 06:37:24.534805', 'Smit Electrotechniek/Bellstraat/Converted/Order001/voordeur.webm', '', 'vb9', '', 'voordeur', '2022-12-01 06:37:24.534818', '2022-12-01 06:37:24.534867', 242),
(15, 'auto', 'Order001', '2022-12-01 06:37:24.584769', '2022-12-01 06:37:24.584776', 'Smit Electrotechniek/Bellstraat/Converted/Order001/auto.webm', '', 'vb9', '', 'auto', '2022-12-01 06:37:24.584789', '2022-12-01 06:37:24.584838', 243),
(16, 'brommer', 'Order001', '2022-12-01 06:37:24.634841', '2022-12-01 06:37:24.634846', 'Smit Electrotechniek/Bellstraat/Converted/Order001/brommer.webm', '', 'vb9', '', 'brommer', '2022-12-01 06:37:24.634858', '2022-12-01 06:37:24.634907', 244),
(17, 'bunnyfull', 'Order 004', '2022-12-01 06:37:24.693177', '2022-12-01 06:37:24.693182', 'Berkhout/Kerkebuurt/Converted/Order 004/bunnyfull.webm', '', 'vb9', '', 'bunnyfull', '2022-12-01 06:37:24.693195', '2022-12-01 06:37:24.693244', 245),
(18, 'bunny', 'Order 004', '2022-12-01 06:37:24.793282', '2022-12-01 06:37:24.793287', 'Berkhout/Kerkebuurt/Converted/Order 004/bunny.webm', '', 'vb9', '', 'bunny', '2022-12-01 06:37:24.793300', '2022-12-01 06:37:24.793349', 247),
(19, 'NVR_ch2_main_20221021104000_20221021104030', 'Order  th03', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Order  th03/NVR_ch2_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch2_main_20221021104000_20221021104030', '2022-12-01 06:37:24.843389', '2022-12-01 06:37:24.843494', 248),
(20, 'NVR_ch1_main_20221021104000_20221021104030', 'Order  th03', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Order  th03/NVR_ch1_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch1_main_20221021104000_20221021104030', '2022-12-01 06:37:24.893363', '2022-12-01 06:37:24.893464', 249),
(21, 'NVR_ch3_main_20221021104000_20221021104030', 'Orderth04', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Orderth04/NVR_ch3_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch3_main_20221021104000_20221021104030', '2022-12-01 06:37:24.935005', '2022-12-01 06:37:24.935106', 250),
(22, 'NVR_ch1_main_20220926074805_20220926082402', 'Order K 001', '2022-09-26 05:48:05.000000', '2022-09-26 06:24:02.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20220926074805_20220926082402.webm', '', 'vb9', '', 'nvr_ch1_main_20220926074805_20220926082402', '2022-12-01 06:37:25.006945', '2022-12-01 06:37:25.007052', 249),
(23, 'NVR_ch1_main_20221018102500_20221018102800', 'Order K 001', '2022-10-18 08:25:00.000000', '2022-10-18 08:28:00.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102500_20221018102800.webm', '', 'vb9', '', 'nvr_ch1_main_20221018102500_20221018102800', '2022-12-01 06:37:25.039588', '2022-12-01 06:37:25.039690', 249),
(24, 'NVR_ch1_main_20221018102400_20221018102500', 'Order K 001', '2022-10-18 08:24:00.000000', '2022-10-18 08:25:00.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102400_20221018102500.webm', '', 'vb9', '', 'nvr_ch1_main_20221018102400_20221018102500', '2022-12-01 06:37:25.073332', '2022-12-01 06:37:25.073434', 249),
(25, 'achter', 'Order 002', '2022-12-01 06:37:25.168213', '2022-12-01 06:37:25.168218', 'Berkhout/Dorpsplein/Converted/Order 002/achter.webm', '', 'vb9', '', 'achter', '2022-12-01 06:37:25.168230', '2022-12-01 06:37:25.168280', 251),
(26, 'dahua1', 'Order003', '2022-12-01 06:37:25.226889', '2022-12-01 06:37:25.226893', 'Berkhout/Dorpstrraat/Converted/Order003/dahua1.webm', '', 'vb9', '', 'dahua1', '2022-12-01 06:37:25.226906', '2022-12-01 06:37:25.226955', 252),
(27, 'dahua2', 'Order003', '2022-12-01 06:37:25.276925', '2022-12-01 06:37:25.276929', 'Berkhout/Dorpstrraat/Converted/Order003/dahua2.webm', '', 'vb9', '', 'dahua2', '2022-12-01 06:37:25.276942', '2022-12-01 06:37:25.276991', 253);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-12-19 16:49:02.276374', '2', 'orson', 3, '', 4, 1),
(2, '2022-12-20 10:11:41.150083', '4', 'jan', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\", \"Staff status\", \"Superuser status\", \"User permissions\"]}}]', 4, 1),
(3, '2022-12-20 10:11:59.043514', '3', 'kees', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'camera', 'adress'),
(8, 'camera', 'bedrijf'),
(14, 'camera', 'camera'),
(9, 'camera', 'gebruiker'),
(13, 'camera', 'locatie'),
(10, 'camera', 'log'),
(11, 'camera', 'parameter'),
(12, 'camera', 'serviceorder'),
(15, 'camera', 'video'),
(5, 'contenttypes', 'contenttype'),
(19, 'otp_email', 'emaildevice'),
(16, 'otp_static', 'staticdevice'),
(17, 'otp_static', 'statictoken'),
(18, 'otp_totp', 'totpdevice'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-10-27 12:17:13.542883'),
(2, 'auth', '0001_initial', '2022-10-27 12:17:17.711439'),
(3, 'admin', '0001_initial', '2022-10-27 12:17:18.553356'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-10-27 12:17:18.582523'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-10-27 12:17:18.605284'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-10-27 12:17:19.170244'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-10-27 12:17:19.570432'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-10-27 12:17:19.753828'),
(9, 'auth', '0004_alter_user_username_opts', '2022-10-27 12:17:19.781239'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-10-27 12:17:20.103946'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-10-27 12:17:20.134021'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-10-27 12:17:20.159344'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-10-27 12:17:20.312429'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-10-27 12:17:20.495758'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-10-27 12:17:20.654238'),
(16, 'auth', '0011_update_proxy_permissions', '2022-10-27 12:17:20.681513'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-10-27 12:17:20.837690'),
(18, 'camera', '0001_initial', '2022-10-27 12:17:28.124276'),
(19, 'sessions', '0001_initial', '2022-10-27 12:17:28.465838'),
(20, 'camera', '0002_serviceorder_conversion_ready_and_more', '2022-11-10 15:10:53.146221'),
(21, 'camera', '0003_alter_parameter_options_alter_serviceorder_options_and_more', '2022-11-26 10:08:24.232761'),
(22, 'camera', '0004_remove_camera_eigenaar', '2022-11-28 09:32:16.966840'),
(23, 'camera', '0005_alter_locatie_unique_together', '2022-11-30 18:22:32.428023'),
(24, 'camera', '0006_alter_locatie_unique_together', '2022-11-30 18:22:32.703032'),
(25, 'otp_email', '0001_initial', '2022-12-17 08:43:51.970548'),
(26, 'otp_email', '0002_sidechanneldevice_email', '2022-12-17 08:43:52.637491'),
(27, 'otp_email', '0003_emaildevice_email', '2022-12-17 08:43:52.837590'),
(28, 'otp_email', '0004_throttling', '2022-12-17 08:43:53.262758'),
(29, 'otp_static', '0001_initial', '2022-12-17 08:43:54.354859'),
(30, 'otp_static', '0002_throttling', '2022-12-17 08:43:54.855084'),
(31, 'otp_totp', '0001_initial', '2022-12-17 08:43:55.363591'),
(32, 'otp_totp', '0002_auto_20190420_0723', '2022-12-17 08:43:55.805574'),
(33, 'two_factor', '0001_initial', '2022-12-17 08:43:56.213890'),
(34, 'two_factor', '0002_auto_20150110_0810', '2022-12-17 08:43:56.245983'),
(35, 'two_factor', '0003_auto_20150817_1733', '2022-12-17 08:43:56.337528'),
(36, 'two_factor', '0004_auto_20160205_1827', '2022-12-17 08:43:56.505675'),
(37, 'two_factor', '0005_auto_20160224_0450', '2022-12-17 08:43:56.603037'),
(38, 'two_factor', '0006_phonedevice_key_default', '2022-12-17 08:43:56.645470'),
(39, 'two_factor', '0007_auto_20201201_1019', '2022-12-17 08:43:57.156020');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0korvi892oyoay7eyz45kmb9lz1rbwui', '.eJxVjMtugzAQRf_F6wr5QRzMsvt8gzVmxsGtZSJsSFXEvwdSFmU3Z869d2HP8Asj2jjcQ7JzoCdrF5YLPVibphg_3rdFKLCJ9UAfIuU_pp8ywj8_QwwbEdpTcTMWptLbKdNoA7KWCXb6Oei-Ke0CvyDdh6obUhmDq_ZIddhc3Qak-HlkTwM95H6fldJ5rgh011wEN6i5R-O9IF5LXmsNHhuljbqQrJ27GskVKFOLRuKVULD1BRlHXj4:1p6sgv:akKkgzRJIiN4Xf_aAxKC5C9LAGKEXhSTOlI8xkyKCVg', '2023-01-01 12:22:53.509498'),
('8yie97td2hlfhiiilaq6pmtnmo38ilbk', '.eJxVjEsOwiAUAO_C2hB-peDSfc9AHryHVA0kpV0Z725IutDtzGTeLMCxl3B02sKK7Moku_yyCOlJdQh8QL03nlrdtzXykfDTdr40pNftbP8GBXoZW6ViFprAJjdJ4dGKjD5nScIoYayFjE5brydSJsbZK6FBeyOdwplQss8X0mI3Og:1p0nM4:-UlSR8t-D8jcaVFvo5D0CtobZqvIHakmiHQXTQZ1QPk', '2022-12-15 17:28:12.582923'),
('8zodisydry33mntrmhklshsnwsc9je68', '.eJxVjMtugzAQRf_F6wr5QRzMsvt8gzVmxsGtZSJsSFXEvwdSFmU3Z869d2HP8Asj2jjcQ7JzoCdrF5YLPVibphg_3rdFKLCJ9UAfIuU_pp8ywj8_QwwbEdpTcTMWptLbKdNoA7KWCXb6Oei-Ke0CvyDdh6obUhmDq_ZIddhc3Qak-HlkTwM95H6fldJ5rgh011wEN6i5R-O9IF5LXmsNHhuljbqQrJ27GskVKFOLRuKVULD1BRlHXj4:1p6SxS:ldKdNkn4QcXtRZbkfpp_2l20yfwLvHR1HylLeaQnRLM', '2022-12-31 08:54:14.687731'),
('b3red92hwv0r4velo4o845q6hkillawz', '.eJxVjs1uxCAMhN-Fc0UTfrc59t5nQAbMhhaFVSDZqqt995Imh-Yy8sw3tvwg9_gDszcpX-Nk1oh3MjxIqXgjw7Sk9PI3Gw8VGngeNsSEZff4XWf4x1dIsTn05rTYiIGljmYpOJvoyUAYOWUW3BdOG_CfMF0zdXmqc7R0q9CDFvqRPab3o3s6MEIZ2zYXilsuwiVA6CR3OmiwWnL15kH5llrGLkxptCGo0Peh6wVKJbXorHRMtaO5tsdxjQ73Tzdfm9BNdvAqyPMXKlRtXA:1p7Ikx:l-4OoFJzuWpheFjEvCYdp076l0gJWk6NBbm6bQ_kwx0', '2023-01-02 16:12:47.799449'),
('bdyxa3zift9ajyzvq9tkfahgaeir0l3m', '.eJy1kMFuwyAMht-F88SApGnIcfc9A3Ji07AhqAJJp1Z994Ylh-UBdrH88dkW-h_s5u4wofHx4oJZHN1Y92Ap05V1Yfb-7bc3CBlW8dzROk9pY_rJE_zxC3i3EqE5LK7GwJxHMyeajEPWMckObz0M3xSKwC8Il8iHGPLkel5G-G4T_4xI_mOfPRwYIY3lrFK9FRVBM7QnKTQ2wqK2VpKolaibBiy2VaOrE6m6789aiQoqXctW4Zmw_GrPJFGer_-bScwr0uIG2jIpnNfCS9nEu2TPFy6jk9Q:1p6T3P:aBfT0BPUuQBGx0wxSPJy1jT9HQ2dBg5DrUDrhRH0mPo', '2022-12-31 09:00:23.071119'),
('diilre33odpnv89x7v4frszity4o0vk8', '.eJyrVirPrEosSonPyU_PzIsvy0wtV7KqViouSS1QslJKLC3JUNIB8-JTEksSgVK1UG5aZk5qMYSfWlFSlIgkX5aYkwnkpabEo2isrQUAhp8oDA:1p7GVG:hFJSpImaoFS20jSL8-ti_S0uCuxDo8PzU4-QnaXHsqg', '2023-01-02 13:48:26.987026'),
('edykej7kasazmp8rx8dx5lgoqadcswvm', '.eJxVjsFuxCAMRP-Fc5USyLIhx977DcjEZkOLQhVItupq_73Q5NBcLI_feDQPdvc_sKAJ8eZns3m6s-HBUqYvNsxrCC9_u0HIUMDzkM4HSrum77zAP75B8EURmtNjIQbWPJk10WI8soG17HSzMH7SXAF-wHyLzRjnvHjbVEtz0NS8R6TwdnhPAROkqcYKYR2XBGrsLy3XqLhD7VxLvBO8Uwoc9lJpeSHRWXvVgkuQumt7gVfC2irmUpw2P9LetOpcRlPHDl4le_4C-TFsug:1p7CYK:1MffIlVGSKmzjHrGH99FJ1rRpflMAgdHM_9l8V4b5Ac', '2023-01-02 09:35:20.251757'),
('hykriti1qyedg02p98fkgeplspbdxg4y', '.eJxVjEsOwiAUAO_C2hB-peDSfc9AHryHVA0kpV0Z725IutDtzGTeLMCxl3B02sKK7Moku_yyCOlJdQh8QL03nlrdtzXykfDTdr40pNftbP8GBXoZW6ViFprAJjdJ4dGKjD5nScIoYayFjE5brydSJsbZK6FBeyOdwplQss8X0mI3Og:1ozbUm:iyCBNwC0n1azW2IJ-L-2HKS2WZ0b2qeWZb5i1-iHcgI', '2022-12-12 10:36:16.775131'),
('hzhzokwicsl2od5pwba0uym4nhfjhble', '.eJyrVirPrEosSonPyU_PzIsvy0wtV7KqViouSS1QslJKLC3JUNIB8-JTEksSgVK1UG5aZk5qMYSfWlFSlIgkX5aYkwnkpabEo2isrQUAhp8oDA:1p7HDj:Xa4XfPd7igW1b6QGKqBBwRVyo5sMuAtEnQnTa1u3FbQ', '2023-01-02 14:34:23.335229'),
('ju2opqwif4197jdtygfsvusej008bmjr', '.eJxVjEEOwiAQRe_C2hAGBgGX7nsGMjAoVUOT0q6Md7dNutDte-__t4i0LjWuvcxxZHERIE6_LFF-lrYLflC7TzJPbZnHJPdEHrbLYeLyuh7t30GlXre1UwUByXujIJhgyLnE4BHOWeWEJgCjIoXaMllDNyw-JPbZ67IBbcXnC7VTNzQ:1osMDU:_RnpP3najhyj0nItoHJxKU8Owa1PqKQIYxVSI0Xx_O4', '2022-11-22 10:52:28.049724'),
('k3uhn4dgwumgiimnd2hdighd797o861o', '.eJxVjsFuxCAMRP-Fc0V3SQghx977DcjEzoYWQRVItupq_73Q5NBcRh4_z8gPdnc_sKDx8eaC2Rzd2fBgKdMXG8Lq_cvfbBAyFPA87OQ8pd3Td17gH9_Au-IIzSlYiIE1z2ZNtBiHbGAtO-0sjJ8UKsAPCLfIxxjy4iyvJ_ygib9HJP923J4KZkhzTQspxWR1J7ur1Y3Wl6nXApseFShUF9HSKNtrUaFEZ7HpWiFVSfSSSImmlMZcHqfNjbR_Wn0uwqvs4FWy5y_hIWyA:1p7Zkl:sNELxDSQ2Bvb4Rw04rDtfJ6mnc8_E-tV1NO4u-bZfI8', '2023-01-03 10:21:43.319112'),
('n14hksdkpk8wvn3o5ccxktkg6tncopz5', '.eJxVjEsOwiAUAO_C2hB-peDSfc9AHryHVA0kpV0Z725IutDtzGTeLMCxl3B02sKK7Moku_yyCOlJdQh8QL03nlrdtzXykfDTdr40pNftbP8GBXoZW6ViFprAJjdJ4dGKjD5nScIoYayFjE5brydSJsbZK6FBeyOdwplQss8X0mI3Og:1p0duv:EC0KS1hlfFjuuZQ00H_yya4bu7AUYR37-S6RybZiKRo', '2022-12-15 07:23:33.570004'),
('o5wkp8rci5czqqyaia9ndq8u42sqsk5s', '.eJxVjsFuxCAMRP-Fc5USyLIhx977DcjEZkOLQhVItupq_73Q5NBcLI_feDQPdvc_sKAJ8eZns3m6s-HBUqYvNsxrCC9_u0HIUMDzkM4HSrum77zAP75B8EURmtNjIQbWPJk10WI8soG17HSzMH7SXAF-wHyLzRjnvHjbVEtz0NS8R6TwdnhPAROkqcYKYR2XBGrsLy3XqLhD7VxLvBO8Uwoc9lJpeSHRWXvVgkuQumt7gVfC2irmUpw2P9LetOpcRlPHDl4le_4C-TFsug:1p7DM3:G4wajtxx-J8XMELNgDnPfO9c_meHDZRKZn-Z0k5decQ', '2023-01-02 10:26:43.421540'),
('omch4liqx38jqnrwknsufrl34hfjcuvn', '.eJytkEFuwyAQRe_CurIw2MRk2X3OgAbPENMiHBkcR4ly95jUi7rrLv-8mafRf7DF32FCE8azj-bqaWHHB0uZLuzIYM4D-3gng5BhRc8tOh8o_WS65Ql-8SsEvyZCsztciSlCMyeajMfVX7PdzEL_TbEA_IJ4Hqt-jHnytior1UZTdRqRwue2uxMMkIaiFcI6LglU37U116i4Q-1cTbwRvFEKHHZSadmSaKw9aMElSN3UncADYflqayVRni9_WolzCP_WyfMFmryFlQ:1p6TY2:kvjK9Q3DtUx4tz9KPcmJwcYIS7VNx1OPLRe9RJCYJZU', '2022-12-31 09:32:02.957916'),
('r5t1bmnf1golhfai0cnt9xfp56b58s8i', '.eJyrVirPrEosSonPyU_PzIsvy0wtV7KqViouSS1QslJKLC3JUNIB8-JTEksSgVK1UG5aZk5qMYSfWlFSlIgkX5aYkwnkpabEo2isrQUAhp8oDA:1p6TTX:8lu2C4H4NH6Zry69iCSCLtTw5UFWkirYO7ixA-hizLw', '2022-12-31 09:27:23.013643'),
('s0raxqmyshzraq09uui5vvqeje7s98jr', '.eJxVjEsOwiAUAO_C2hB-peDSfc9AHryHVA0kpV0Z725IutDtzGTeLMCxl3B02sKK7Moku_yyCOlJdQh8QL03nlrdtzXykfDTdr40pNftbP8GBXoZW6ViFprAJjdJ4dGKjD5nScIoYayFjE5brydSJsbZK6FBeyOdwplQss8X0mI3Og:1p0e8S:S8L_BF90COAaVCr2YTYSdeOaE9q7j31FsyG8biP5w-4', '2022-12-15 07:37:32.392872'),
('tbj62w8uuon385oxq8mz5qzut9a3999k', '.eJxVjEsOwiAUAO_C2hB-peDSfc9AHryHVA0kpV0Z725IutDtzGTeLMCxl3B02sKK7Moku_yyCOlJdQh8QL03nlrdtzXykfDTdr40pNftbP8GBXoZW6ViFprAJjdJ4dGKjD5nScIoYayFjE5brydSJsbZK6FBeyOdwplQss8X0mI3Og:1p0dVh:g4CK8NqgZqPsGB6fQdZHqqqIyEO9ueuxbI7epAg1rBs', '2022-12-15 06:57:29.381811'),
('vqp46qfjzob2tcil6iwwuhpl6o9bv6bi', '.eJyrVirPrEosSonPyU_PzIsvy0wtV7KqViouSS1QslJKLC3JUNIB8-JTEksSgVK1UG5aZk5qMYSfWlFSlIgkX5aYkwnkpabEo2isrQUAhp8oDA:1p7YXj:4euVx1btz8uB6mVRUVpt743phkWAQXwFPFmBvqTIegA', '2023-01-03 09:04:11.655320'),
('xhjl4ozada886t96pvz6rzu6ig036ir3', '.eJxVjsFuxCAMRP-Fc0UJZLMhx977DcjEZkOLQhVItupq_73Q5NBcLI_feDQPdvc_sKAJ8eZns3m6s-HBUqYvNsxrCC9_u0HIUMDzkM4HSrum77zAP75B8EURmtNjIQbWPJk10WI8soE17HSzMH7SXAF-wHyLfIxzXrzl1cIPmvh7RApvh_cUMEGaaqyU1glF0I39pREaO-FQO9eQaKVouw4c9qrT6kKytfaqpVCgdNv0Eq-EtVXMpThtfqS9adW5DF7HDl4b9vwF-StsuA:1p6TF2:OmQ0otfoYEVZKajvCSvB-N62YdE18fyb3dk7D39oZRU', '2022-12-31 09:12:24.548583');

-- --------------------------------------------------------

--
-- Table structure for table `otp_email_emaildevice`
--

CREATE TABLE `otp_email_emaildevice` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(16) DEFAULT NULL,
  `valid_until` datetime(6) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `throttling_failure_count` int(10) UNSIGNED NOT NULL CHECK (`throttling_failure_count` >= 0),
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `otp_static_staticdevice`
--

CREATE TABLE `otp_static_staticdevice` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `throttling_failure_count` int(10) UNSIGNED NOT NULL CHECK (`throttling_failure_count` >= 0),
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_static_staticdevice`
--

INSERT INTO `otp_static_staticdevice` (`id`, `name`, `confirmed`, `user_id`, `throttling_failure_count`, `throttling_failure_timestamp`) VALUES
(2, 'backup', 1, 1, 13, '2022-12-20 09:02:16.025244'),
(4, 'backup', 1, 4, 1, '2022-12-20 10:21:43.297083');

-- --------------------------------------------------------

--
-- Table structure for table `otp_static_statictoken`
--

CREATE TABLE `otp_static_statictoken` (
  `id` int(11) NOT NULL,
  `token` varchar(16) NOT NULL,
  `device_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_static_statictoken`
--

INSERT INTO `otp_static_statictoken` (`id`, `token`, `device_id`) VALUES
(11, 'guih265y', 2),
(12, 'kcootfg7', 2),
(13, '275iyaeg', 2),
(14, 'hzn7yhft', 2),
(15, 'phwthrqx', 2),
(16, 'jr6uwvgp', 2),
(17, 'czlkidbt', 2),
(18, '6rzb2ss2', 2),
(19, 'ujltczip', 2),
(20, '6ohw7z5i', 2),
(31, 'valtb4ms', 4),
(32, 'ddlzjyzh', 4),
(33, 'ak5vi6ob', 4),
(34, 'ouqyx7rh', 4),
(35, 'fg3wy2wz', 4),
(36, 'anxtchze', 4),
(37, '4siz63ww', 4),
(38, 'yhl4lmdc', 4),
(39, 'f4ugk7g7', 4),
(40, 'yjn3yaxs', 4);

-- --------------------------------------------------------

--
-- Table structure for table `otp_totp_totpdevice`
--

CREATE TABLE `otp_totp_totpdevice` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `key` varchar(80) NOT NULL,
  `step` smallint(5) UNSIGNED NOT NULL CHECK (`step` >= 0),
  `t0` bigint(20) NOT NULL,
  `digits` smallint(5) UNSIGNED NOT NULL CHECK (`digits` >= 0),
  `tolerance` smallint(5) UNSIGNED NOT NULL CHECK (`tolerance` >= 0),
  `drift` smallint(6) NOT NULL,
  `last_t` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `throttling_failure_count` int(10) UNSIGNED NOT NULL CHECK (`throttling_failure_count` >= 0),
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_totp_totpdevice`
--

INSERT INTO `otp_totp_totpdevice` (`id`, `name`, `confirmed`, `key`, `step`, `t0`, `digits`, `tolerance`, `drift`, `last_t`, `user_id`, `throttling_failure_count`, `throttling_failure_timestamp`) VALUES
(3, 'default', 1, '36ac0d65c7a244b3abbb9758cce952429427e18d', 30, 0, 6, 1, 0, 55717700, 1, 0, NULL),
(5, 'default', 1, 'eda19ff125f46fc0b44558b9f01dbb3f247b574d', 30, 0, 6, 1, 0, 55717723, 4, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `two_factor_phonedevice`
--

CREATE TABLE `two_factor_phonedevice` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `number` varchar(128) NOT NULL,
  `key` varchar(40) NOT NULL,
  `method` varchar(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `throttling_failure_count` int(10) UNSIGNED NOT NULL CHECK (`throttling_failure_count` >= 0),
  `throttling_failure_timestamp` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `two_factor_phonedevice`
--

INSERT INTO `two_factor_phonedevice` (`id`, `name`, `confirmed`, `number`, `key`, `method`, `user_id`, `throttling_failure_count`, `throttling_failure_timestamp`) VALUES
(1, 'backup', 1, '+31611268505', 'd341014895311ce35388d54191108a661f99f2d7', 'sms', 1, 0, NULL);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_adress_slug_0495c28b` (`slug`);

--
-- Indexes for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_bedrijf_adres_id_ef29d0ee_fk_camera_adress_id` (`adres_id`),
  ADD KEY `camera_bedrijf_slug_6cf0579f` (`slug`);

--
-- Indexes for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camera_camera_naam_locatie_id_1828c446_uniq` (`naam`,`locatie_id`),
  ADD KEY `camera_camera_locatie_id_4b75514e_fk_camera_locatie_id` (`locatie_id`),
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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camera_locatie_naam_adres_id_3ed759b9_uniq` (`naam`,`adres_id`),
  ADD KEY `camera_locatie_adres_id_5817d9a9_fk_camera_adress_id` (`adres_id`),
  ADD KEY `camera_locatie_bedrijf_id_c6f1819c_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_locatie_contact_id_b3e27958_fk_camera_gebruiker_id` (`contact_id`),
  ADD KEY `camera_locatie_slug_94a01eb8` (`slug`);

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
-- Indexes for table `camera_serviceorder`
--
ALTER TABLE `camera_serviceorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_serviceorder_bedrijf_id_eb08bc98_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_serviceorder_contact_id_b4cff7d6_fk_camera_gebruiker_id` (`contact_id`),
  ADD KEY `camera_serviceorder_slug_a008c2c3` (`slug`);

--
-- Indexes for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camera_video_naam_camera_id_ed472bbb_uniq` (`naam`,`camera_id`),
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
-- Indexes for table `otp_email_emaildevice`
--
ALTER TABLE `otp_email_emaildevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_email_emaildevice_user_id_0215c274_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `otp_static_staticdevice`
--
ALTER TABLE `otp_static_staticdevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `otp_static_statictoken`
--
ALTER TABLE `otp_static_statictoken`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` (`device_id`),
  ADD KEY `otp_static_statictoken_token_d0a51866` (`token`);

--
-- Indexes for table `otp_totp_totpdevice`
--
ALTER TABLE `otp_totp_totpdevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `two_factor_phonedevice`
--
ALTER TABLE `two_factor_phonedevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `two_factor_phonedevice_user_id_54718003_fk_auth_user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `camera_adress`
--
ALTER TABLE `camera_adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `camera_log`
--
ALTER TABLE `camera_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=465;

--
-- AUTO_INCREMENT for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `camera_serviceorder`
--
ALTER TABLE `camera_serviceorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `otp_email_emaildevice`
--
ALTER TABLE `otp_email_emaildevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `otp_static_staticdevice`
--
ALTER TABLE `otp_static_staticdevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `otp_static_statictoken`
--
ALTER TABLE `otp_static_statictoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `otp_totp_totpdevice`
--
ALTER TABLE `otp_totp_totpdevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `two_factor_phonedevice`
--
ALTER TABLE `two_factor_phonedevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- Constraints for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  ADD CONSTRAINT `camera_bedrijf_adres_id_ef29d0ee_fk_camera_adress_id` FOREIGN KEY (`adres_id`) REFERENCES `camera_adress` (`id`);

--
-- Constraints for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD CONSTRAINT `camera_camera_locatie_id_4b75514e_fk_camera_locatie_id` FOREIGN KEY (`locatie_id`) REFERENCES `camera_locatie` (`id`);

--
-- Constraints for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  ADD CONSTRAINT `camera_locatie_adres_id_5817d9a9_fk_camera_adress_id` FOREIGN KEY (`adres_id`) REFERENCES `camera_adress` (`id`),
  ADD CONSTRAINT `camera_locatie_bedrijf_id_c6f1819c_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_locatie_contact_id_b3e27958_fk_camera_gebruiker_id` FOREIGN KEY (`contact_id`) REFERENCES `camera_gebruiker` (`id`);

--
-- Constraints for table `camera_serviceorder`
--
ALTER TABLE `camera_serviceorder`
  ADD CONSTRAINT `camera_serviceorder_bedrijf_id_eb08bc98_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_serviceorder_contact_id_b4cff7d6_fk_camera_gebruiker_id` FOREIGN KEY (`contact_id`) REFERENCES `camera_gebruiker` (`id`);

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

--
-- Constraints for table `otp_email_emaildevice`
--
ALTER TABLE `otp_email_emaildevice`
  ADD CONSTRAINT `otp_email_emaildevice_user_id_0215c274_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `otp_static_staticdevice`
--
ALTER TABLE `otp_static_staticdevice`
  ADD CONSTRAINT `otp_static_staticdevice_user_id_7f9cff2b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `otp_static_statictoken`
--
ALTER TABLE `otp_static_statictoken`
  ADD CONSTRAINT `otp_static_statictok_device_id_74b7c7d1_fk_otp_stati` FOREIGN KEY (`device_id`) REFERENCES `otp_static_staticdevice` (`id`);

--
-- Constraints for table `otp_totp_totpdevice`
--
ALTER TABLE `otp_totp_totpdevice`
  ADD CONSTRAINT `otp_totp_totpdevice_user_id_0fb18292_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `two_factor_phonedevice`
--
ALTER TABLE `two_factor_phonedevice`
  ADD CONSTRAINT `two_factor_phonedevice_user_id_54718003_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
