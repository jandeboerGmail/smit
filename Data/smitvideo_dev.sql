-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 21, 2022 at 03:15 PM
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
(37, 'Can add video', 10, 'add_video'),
(38, 'Can change video', 10, 'change_video'),
(39, 'Can delete video', 10, 'delete_video'),
(40, 'Can view video', 10, 'view_video'),
(41, 'Can add log', 11, 'add_log'),
(42, 'Can change log', 11, 'change_log'),
(43, 'Can delete log', 11, 'delete_log'),
(44, 'Can view log', 11, 'view_log'),
(45, 'Can add parameter', 12, 'add_parameter'),
(46, 'Can change parameter', 12, 'change_parameter'),
(47, 'Can delete parameter', 12, 'delete_parameter'),
(48, 'Can view parameter', 12, 'view_parameter'),
(49, 'Can add adress', 13, 'add_adress'),
(50, 'Can change adress', 13, 'change_adress'),
(51, 'Can delete adress', 13, 'delete_adress'),
(52, 'Can view adress', 13, 'view_adress'),
(53, 'Can add locatie', 14, 'add_locatie'),
(54, 'Can change locatie', 14, 'change_locatie'),
(55, 'Can delete locatie', 14, 'delete_locatie'),
(56, 'Can view locatie', 14, 'view_locatie');

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
(1, 'pbkdf2_sha256$390000$pSKdyTt50QpZoSZJRA5asI$4hgLSdySnrUDW9B5lWCSzsuszAJ0HpXFO5B4j0azHqk=', '2022-10-21 12:33:28.073945', 1, 'django', '', '', 'jandeboer@gmail.com', 1, 1, '2022-09-20 17:52:09.829279');

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

--
-- Dumping data for table `camera_adress`
--

INSERT INTO `camera_adress` (`id`, `naam`, `straat`, `postcode`, `plaats`, `land`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Stadgenoot', 'Stadsplein 1', '1000AA', 'Amsterdam', 'Nederland', '', 'stadgenoot', '2022-09-21 08:35:37.547255', '2022-09-21 08:35:37.548133'),
(2, 'Smit Electrotechniek', 'Bellstraat 3', '1131JV', 'Volendam', 'Nederland', '', 'smit-electrotechniek', '2022-09-21 09:00:02.426444', '2022-09-21 09:00:02.427923'),
(3, 'Remijden', 'Remijden 1', '1000AA', 'Amsterdam', 'Nederland', '', 'remijden', '2022-09-23 12:35:17.672524', '2022-09-23 12:45:53.466989'),
(4, 'Brandweer Volendam', 'Brandstraat 1', '1131AD', 'Volendam', 'Nederland', '', 'brandweer-volendam', '2022-09-23 12:49:56.078694', '2022-09-23 12:55:41.828225'),
(5, 'Politie Purmerend', 'Snelweg 5', '1441AD', 'Purmerend', 'Nederland', '', 'politie-purmerend', '2022-09-23 12:52:14.644682', '2022-09-23 12:52:14.645584'),
(6, 'Zuidgorsstraat', 'Zuidgorsstraat 9', '1025AW', 'Amsterdam', 'Nederland', '', 'zuidgorsstraat', '2022-09-23 12:54:49.946164', '2022-09-23 12:54:49.947149'),
(7, 'Berkhout', 'Kerkebuurt 167', '1647ME', 'Berkhout', 'Nederland', '', 'berkhout', '2022-09-23 13:23:45.142609', '2022-09-23 13:35:44.216391'),
(14, 'Default', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'default', '2022-10-06 12:14:13.964973', '2022-10-06 12:14:13.965054'),
(19, 'Dorpsplein', 'Brink 1', '1234AA', 'Ons Dorp', 'Nederland', '', 'dorpsplein', '2022-10-06 15:03:05.665315', '2022-10-06 17:33:20.856627'),
(22, 'Stadspark', 'Stadspark 1', '0000AA', 'Den Haag', 'Nederland', '', 'stadspark', '2022-10-17 13:10:17.136692', '2022-10-18 11:47:30.479513'),
(25, 'Dorpstraat 1', 'Straatnaam 1', '0000AA', 'Ons Dorp', 'Nederland', '', 'dorpstraat-1', '2022-10-17 13:42:51.766215', '2022-10-18 11:47:59.698956'),
(27, 'Kerkebuurt', 'Straatnaam 1', '1647ME', 'Berkhout', 'Nederland', '', 'kerkebuurt', '2022-10-17 16:07:57.866982', '2022-10-18 11:48:54.145614'),
(31, 'wasborn 36', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'wasborn-36', '2022-10-18 11:57:38.339272', '2022-10-18 11:57:38.339350'),
(32, 'Remijden 1', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'remijden-1', '2022-10-18 11:57:38.496371', '2022-10-18 11:57:38.496441'),
(35, 'Thuis', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'thuis', '2022-10-20 14:50:44.423227', '2022-10-20 14:50:44.423313'),
(37, 'Abraham Kuyperstraat 1-73', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'abraham-kuyperstraat-1-73', '2022-10-20 14:50:45.181941', '2022-10-20 14:50:45.182018'),
(39, 'zuidgorsstraat 9', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'zuidgorsstraat-9', '2022-10-20 15:41:51.261887', '2022-10-20 15:41:51.261961'),
(40, '', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', '', '2022-10-20 15:41:51.525392', '2022-10-20 15:41:51.525454');

-- --------------------------------------------------------

--
-- Table structure for table `camera_bedrijf`
--

CREATE TABLE `camera_bedrijf` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `adres_id` int(11) NOT NULL,
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
(1, 'Stadgenoot', 1, 'info@bedrijf.nl', '', '', '020-12345678', '', 'stadgenoot', '2022-09-21 09:16:52.906687', '2022-09-23 13:22:31.128431'),
(3, 'Brandweer Volendam', 4, 'info@bedrijf.nl', '', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2022-09-23 13:21:26.817460'),
(4, 'Politie Purmerend', 1, 'info@bedrijf.nl', '', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-24 14:31:12.949985'),
(6, 'Kees Garnalen BV', 1, 'info@bedrijf.nl', '', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786'),
(7, 'Thuis', 7, 'jandeboer@gmail.com', '', '', '0611268505', '', 'thuis', '2022-01-27 09:09:06.039126', '2022-09-23 13:25:39.804019'),
(18, 'Smit Electrotechniek', 2, 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'smit-electrotechniek', '2022-10-20 14:58:49.896453', '2022-10-20 14:58:49.896579');

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
  `locatie_id` int(11) NOT NULL,
  `plaats` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `locatie_id`, `plaats`) VALUES
(7, 'nvr 4', 'Dahua 2002', '', '', '2022-10-10 08:39:57.000000', '', 'nvr-4', '2022-10-10 08:39:57.505738', '2022-10-17 15:38:26.939821', 9, 'Fietsenstalling'),
(14, 'nvr 41', 'Dahau 2002', '', '', '2022-10-17 13:10:17.000000', '', 'nvr-41', '2022-10-17 13:10:17.241871', '2022-10-17 15:39:55.077498', 14, 'Bij de Ingang'),
(63, 'recorder', 'Videomaster', '', '', '2022-10-17 17:51:13.000000', '', 'recorder', '2022-10-17 17:51:13.224405', '2022-10-18 11:53:40.205184', 31, 'Op het scherm'),
(71, 'Camera Entree', 'Omega', '', '', '2022-10-18 11:57:38.000000', '', 'camera-entree', '2022-10-18 11:57:38.433338', '2022-10-20 14:44:32.717142', 32, 'Entree'),
(72, 'cam1_nooduitgang', 'default', '', '', '2022-10-18 11:57:38.000000', '', 'cam1_nooduitgang', '2022-10-18 11:57:38.553373', '2022-10-19 09:50:12.792828', 33, 'Nooduitgang'),
(73, 'achter', 'default', '', '', '2022-10-18 11:57:38.000000', '', 'achter', '2022-10-18 11:57:38.611361', '2022-10-21 13:01:13.104058', 34, 'Parkeerplaats'),
(75, 'dahua2', 'default', '', '', '2022-10-18 12:20:08.000000', '', 'dahua2', '2022-10-18 12:20:08.137729', '2022-10-21 12:57:11.752406', 27, 'Buro'),
(76, 'dahua1', 'default', '', '', '2022-10-18 12:20:08.000000', '', 'dahua1', '2022-10-18 12:20:08.209592', '2022-10-20 14:45:49.951949', 27, 'Werkkamer'),
(78, 'NVR_ch1_main', 'Dahua 100', '', '', '2022-10-18 12:22:59.000000', '', 'nvr_ch1_main', '2022-10-18 12:22:59.956475', '2022-10-18 12:26:56.796027', 31, 'Werkkamer'),
(86, 'Remijden 1_ch7', 'Dahua 1000', '', '', '2022-10-19 09:09:36.000000', '', 'remijden-1_ch7', '2022-10-19 09:09:36.034228', '2022-10-20 14:43:10.082501', 33, 'Lift Rechts'),
(87, 'bunnyfull', 'default', '', '', '2022-10-20 14:50:44.000000', '', 'bunnyfull', '2022-10-20 14:50:44.540736', '2022-10-21 12:45:51.749420', 38, 'Boom'),
(88, 'bunny', 'default', '', '', '2022-10-20 14:50:44.000000', '', 'bunny', '2022-10-20 14:50:44.615572', '2022-10-21 12:47:09.909931', 38, 'Filmzaal'),
(89, 'earth', 'default', '', '', '2022-10-20 14:50:44.000000', '', 'earth', '2022-10-20 14:50:44.707119', '2022-10-21 13:02:34.330029', 38, 'Buiten'),
(90, 'NVR_ch1_main', 'Dahua 200', '', '', '2022-10-20 14:50:44.774378', '', 'nvr_ch1_main', '2022-10-20 14:50:44.774393', '2022-10-20 14:50:44.774507', 38, 'Werkkamer'),
(92, 'Abraham Kuyperstraat 1-73_ch4', 'default', '', '', '2022-10-20 14:50:45.000000', '', 'abraham-kuyperstraat-1-73_ch4', '2022-10-20 14:50:45.257733', '2022-10-20 15:06:56.076324', 40, 'Garage 2'),
(97, 'zuidgorsstraat 9_ch1', 'default', '', '', '2022-10-20 15:41:51.000000', '', 'zuidgorsstraat-9_ch1', '2022-10-20 15:41:51.359845', '2022-10-21 13:14:29.553038', 42, 'Voordeur'),
(98, 'CCTV_ch9_H264', 'default', '', '', '2022-10-20 15:41:51.000000', '', 'cctv_ch9_h264', '2022-10-20 15:41:51.585058', '2022-10-21 08:46:45.719219', 45, 'Voordeur'),
(99, 'voordeur', 'default', '', '', '2022-10-20 15:41:51.000000', '', 'voordeur', '2022-10-20 15:41:51.699273', '2022-10-21 08:47:35.656352', 45, 'Voordeur'),
(100, 'auto', 'default', '', '', '2022-10-20 15:41:51.000000', '', 'auto', '2022-10-20 15:41:51.759003', '2022-10-21 08:45:11.527627', 45, 'Parkeerplaats'),
(101, 'brommer', 'default', '', '', '2022-10-20 15:41:51.000000', '', 'brommer', '2022-10-20 15:41:51.810295', '2022-10-21 08:46:04.917602', 45, 'Brommerstalling');

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
(13, '', '', 'Default', 'info@me.nl', '06 11 22 33 44', 1, '', 'default', '2022-10-06 12:32:07.860977', '2022-10-06 12:32:07.861478');

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

--
-- Dumping data for table `camera_locatie`
--

INSERT INTO `camera_locatie` (`id`, `naam`, `image`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `adres_id`, `bedrijf_id`, `contact_id`) VALUES
(2, 'Hoogbouw Remijden', '', '', 'hoogbouw-remijden', '2022-09-23 12:44:51.451229', '2022-10-06 18:00:23.377709', 3, 4, 9),
(3, 'Laagbouw Remijden', '', '', 'laagbouw-remijden', '2022-09-23 12:56:49.669472', '2022-10-06 18:00:58.348866', 3, 1, 4),
(8, 'Dorpsplein', '', '', 'dorpsplein', '2022-10-06 17:14:35.255324', '2022-10-07 09:35:02.425977', 7, 1, 2),
(9, 'Remijden', '', '', 'remijden', '2022-10-07 07:04:49.165642', '2022-10-07 09:30:26.563956', 3, 1, 12),
(14, 'Stadspark', '', '', 'stadspark', '2022-10-17 13:10:17.193564', '2022-10-17 17:38:19.596609', 22, 1, 6),
(16, 'Dorpstraat 1', '', '', 'dorpstraat-1', '2022-10-17 13:42:51.826537', '2022-10-17 14:29:57.018356', 25, 1, 2),
(27, 'Dorpstraat 1', '', '', 'dorpstraat-1', '2022-10-17 17:51:12.928543', '2022-10-17 17:51:12.929121', 25, 1, 13),
(31, 'Berkhout', '', '', 'berkhout', '2022-10-18 11:39:31.796227', '2022-10-18 11:39:31.821176', 7, 7, 2),
(32, 'wasborn 36', '', '', 'wasborn-36', '2022-10-18 11:57:38.377116', '2022-10-18 11:57:38.377253', 31, 1, 13),
(33, 'Remijden 1', '', '', 'remijden-1', '2022-10-18 11:57:38.535416', '2022-10-18 11:57:38.535544', 32, 1, 13),
(34, 'Dorpsplein', '', '', 'dorpsplein', '2022-10-18 11:57:38.595515', '2022-10-20 15:02:09.903802', 19, 1, 8),
(38, 'Kerkebuurt', '', '', 'kerkebuurt', '2022-10-20 14:50:44.490770', '2022-10-20 14:50:44.490919', 27, 7, 13),
(40, 'Abraham Kuyperstraat 1-73', '', '', 'abraham-kuyperstraat-1-73', '2022-10-20 14:50:45.234588', '2022-10-20 15:01:43.295433', 37, 1, 9),
(42, 'zuidgorsstraat 9', '', '', 'zuidgorsstraat-9', '2022-10-20 15:41:51.302704', '2022-10-20 15:41:51.302854', 39, 1, 13),
(43, 'Dorpsplein', '', '', 'dorpsplein', '2022-10-20 15:41:51.431855', '2022-10-20 15:41:51.431996', 19, 1, 13),
(44, 'Abraham Kuyperstraat 1-73', '', '', 'abraham-kuyperstraat-1-73', '2022-10-20 15:41:51.495418', '2022-10-20 15:41:51.495566', 37, 1, 13),
(45, 'Smit', '', '', 'smit', '2022-10-20 15:41:51.553030', '2022-10-21 08:43:21.240689', 2, 18, 3);

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
(1, 'Order 1', '2022-10-17 16:07:57.620479', '2022-10-17 16:07:57.620536', 'WARNING: Default values added for locatie: Dorpstraat 1 | Dorpstraat 1 | Stadgenoot | default'),
(2, 'Order 1', '2022-10-17 16:07:57.637058', '2022-10-17 16:07:57.637087', 'WARNING: Default values added for camera: dahua1 | Dorpstraat 1'),
(3, 'Order 1', '2022-10-17 16:07:57.695423', '2022-10-17 16:07:57.695450', 'WARNING: Default values added for video: dahua1 | dahua1'),
(4, 'Order 1', '2022-10-17 16:07:57.737111', '2022-10-17 16:07:57.737138', 'WARNING: Default values added for camera: dahua2 | Dorpstraat 1'),
(5, 'Order 1', '2022-10-17 16:07:57.753766', '2022-10-17 16:07:57.753793', 'WARNING: Default values added for video: dahua2 | dahua2'),
(6, 'Order 002', '2022-10-17 16:07:57.787115', '2022-10-17 16:07:57.787142', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Stadgenoot | default'),
(7, 'Order 002', '2022-10-17 16:07:57.803780', '2022-10-17 16:07:57.803806', 'WARNING: Default values added for camera: achter | Dorpsplein'),
(8, 'Order 002', '2022-10-17 16:07:57.820456', '2022-10-17 16:07:57.820483', 'WARNING: Default values added for video: achter | achter'),
(9, 'Order 001', '2022-10-17 16:07:57.837021', '2022-10-17 16:07:57.837047', 'WARNING: Default values added for adress: Converted'),
(10, 'Order 001', '2022-10-17 16:07:57.878851', '2022-10-17 16:07:57.878878', 'WARNING: Default values added for adress: Kerkebuurt'),
(11, 'Order 001', '2022-10-17 16:07:57.895476', '2022-10-17 16:07:57.895502', 'WARNING: Default values added for bedrijf: Kerkebuurt'),
(12, 'Order 001', '2022-10-17 16:07:57.920520', '2022-10-17 16:07:57.920547', 'WARNING: Default values added for locatie: Converted | Converted | Kerkebuurt | default'),
(13, 'Order 001', '2022-10-17 16:07:57.937208', '2022-10-17 16:07:57.937235', 'WARNING: Default values added for camera: bunnyfull | Converted'),
(14, 'Order 001', '2022-10-17 16:07:57.953831', '2022-10-17 16:07:57.953858', 'WARNING: Default values added for video: bunnyfull | bunnyfull'),
(15, 'Order 001', '2022-10-17 16:07:57.987209', '2022-10-17 16:07:57.987236', 'WARNING: Default values added for camera: bunny | Converted'),
(16, 'Order 001', '2022-10-17 16:07:58.003854', '2022-10-17 16:07:58.003881', 'WARNING: Default values added for video: bunny | bunny'),
(17, 'Order 001', '2022-10-17 16:07:58.037232', '2022-10-17 16:07:58.037258', 'WARNING: Default values added for camera: earth | Converted'),
(18, 'Order 001', '2022-10-17 16:07:58.053925', '2022-10-17 16:07:58.053952', 'WARNING: Default values added for video: earth | earth'),
(19, 'Order 001', '2022-10-17 16:07:58.078936', '2022-10-17 16:07:58.078963', 'WARNING: Default values added for adress: smit'),
(20, 'Order 001', '2022-10-17 16:07:58.095605', '2022-10-17 16:07:58.095631', 'WARNING: Default values added for bedrijf: smit'),
(21, 'Order 001', '2022-10-17 16:07:58.120620', '2022-10-17 16:07:58.120647', 'WARNING: Default values added for locatie: Converted | Converted | smit | default'),
(22, 'Order 001', '2022-10-17 16:07:58.137288', '2022-10-17 16:07:58.137314', 'WARNING: Default values added for camera: voordeur | Converted'),
(23, 'Order 001', '2022-10-17 16:07:58.153943', '2022-10-17 16:07:58.153970', 'WARNING: Default values added for video: voordeur | voordeur'),
(24, 'Order 001', '2022-10-17 16:07:58.187314', '2022-10-17 16:07:58.187340', 'WARNING: Default values added for camera: auto | Converted'),
(25, 'Order 001', '2022-10-17 16:07:58.223826', '2022-10-17 16:07:58.223852', 'WARNING: Default values added for video: auto | auto'),
(26, 'Order 001', '2022-10-17 16:07:58.262366', '2022-10-17 16:07:58.262392', 'WARNING: Default values added for camera: brommer | Converted'),
(27, 'Order 001', '2022-10-17 16:07:58.279040', '2022-10-17 16:07:58.279066', 'WARNING: Default values added for video: brommer | brommer'),
(28, 'Order003', '2022-10-17 17:25:05.094354', '2022-10-17 17:25:05.094408', 'WARNING: Default values added for locatie: Dorpstraat 1 | Dorpstraat 1 | Stadgenoot | default'),
(29, 'Order003', '2022-10-17 17:25:05.110945', '2022-10-17 17:25:05.110984', 'WARNING: Default values added for camera: dahua1 | Dorpstraat 1'),
(30, 'Order003', '2022-10-17 17:25:05.166062', '2022-10-17 17:25:05.166102', 'WARNING: Default values added for video: dahua1 | dahua1'),
(31, 'Order003', '2022-10-17 17:25:05.236014', '2022-10-17 17:25:05.236040', 'WARNING: Default values added for camera: dahua2 | Dorpstraat 1'),
(32, 'Order003', '2022-10-17 17:25:05.252688', '2022-10-17 17:25:05.252715', 'WARNING: Default values added for video: dahua2 | dahua2'),
(33, 'Order 002', '2022-10-17 17:25:05.285973', '2022-10-17 17:25:05.285999', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Stadgenoot | default'),
(34, 'Order 002', '2022-10-17 17:25:05.336106', '2022-10-17 17:25:05.336133', 'WARNING: Default values added for camera: achter | Dorpsplein'),
(35, 'Order 004', '2022-10-17 17:30:34.343480', '2022-10-17 17:30:34.343518', 'WARNING: Default values added for locatie: Converted | Converted | Kerkebuurt | default'),
(36, 'Order 004', '2022-10-17 17:30:34.371542', '2022-10-17 17:30:34.371568', 'WARNING: Default values added for camera: bunnyfull | Converted'),
(37, 'Order 004', '2022-10-17 17:30:34.426891', '2022-10-17 17:30:34.426917', 'WARNING: Default values added for video: bunnyfull | bunnyfull'),
(38, 'Order 004', '2022-10-17 17:30:34.471574', '2022-10-17 17:30:34.471600', 'WARNING: Default values added for camera: bunny | Converted'),
(39, 'Order 004', '2022-10-17 17:30:34.488239', '2022-10-17 17:30:34.488265', 'WARNING: Default values added for video: bunny | bunny'),
(40, 'Order 004', '2022-10-17 17:30:34.554953', '2022-10-17 17:30:34.554979', 'WARNING: Default values added for camera: earth | Converted'),
(41, 'Order 004', '2022-10-17 17:30:34.571608', '2022-10-17 17:30:34.571634', 'WARNING: Default values added for video: earth | earth'),
(42, 'Order 001', '2022-10-17 17:30:34.605033', '2022-10-17 17:30:34.605060', 'WARNING: Default values added for locatie: Converted | Converted | smit | default'),
(43, 'Order 001', '2022-10-17 17:30:34.621630', '2022-10-17 17:30:34.621656', 'WARNING: Default values added for camera: voordeur | Converted'),
(44, 'Order 001', '2022-10-17 17:30:34.638331', '2022-10-17 17:30:34.638357', 'WARNING: Default values added for video: voordeur | voordeur'),
(45, 'Order 001', '2022-10-17 17:30:34.671708', '2022-10-17 17:30:34.671735', 'WARNING: Default values added for camera: auto | Converted'),
(46, 'Order 001', '2022-10-17 17:30:34.688342', '2022-10-17 17:30:34.688368', 'WARNING: Default values added for video: auto | auto'),
(47, 'Order 001', '2022-10-17 17:30:34.721644', '2022-10-17 17:30:34.721670', 'WARNING: Default values added for camera: brommer | Converted'),
(48, 'Order 001', '2022-10-17 17:30:34.738359', '2022-10-17 17:30:34.738386', 'WARNING: Default values added for video: brommer | brommer'),
(49, 'Order003', '2022-10-17 17:51:12.955773', '2022-10-17 17:51:12.955828', 'WARNING: Default values added for locatie: Dorpstraat 1 | Dorpstraat 1 | Stadgenoot | default'),
(50, 'Order003', '2022-10-17 17:51:13.005247', '2022-10-17 17:51:13.005274', 'WARNING: Default values added for camera: dahua1 | Dorpstraat 1'),
(51, 'Order003', '2022-10-17 17:51:13.021921', '2022-10-17 17:51:13.021947', 'WARNING: Default values added for video: dahua1 | dahua1'),
(52, 'Order003', '2022-10-17 17:51:13.071978', '2022-10-17 17:51:13.072004', 'WARNING: Default values added for camera: dahua2 | Dorpstraat 1'),
(53, 'Order003', '2022-10-17 17:51:13.121982', '2022-10-17 17:51:13.122008', 'WARNING: Default values added for video: dahua2 | dahua2'),
(54, 'Order 004', '2022-10-17 17:51:13.172046', '2022-10-17 17:51:13.172072', 'WARNING: Default values added for adress: Converted'),
(55, 'Order 004', '2022-10-17 17:51:13.213723', '2022-10-17 17:51:13.213749', 'WARNING: Default values added for locatie: Converted | Converted | Kerkebuurt | default'),
(56, 'Order 004', '2022-10-17 17:51:13.238674', '2022-10-17 17:51:13.238700', 'WARNING: Default values added for camera: bunnyfull | Converted'),
(57, 'Order 004', '2022-10-17 17:51:13.255347', '2022-10-17 17:51:13.255372', 'WARNING: Default values added for video: bunnyfull | bunnyfull'),
(58, 'Order 004', '2022-10-17 17:51:13.288717', '2022-10-17 17:51:13.288743', 'WARNING: Default values added for camera: bunny | Converted'),
(59, 'Order 004', '2022-10-17 17:51:13.305383', '2022-10-17 17:51:13.305410', 'WARNING: Default values added for video: bunny | bunny'),
(60, 'Order 004', '2022-10-17 17:51:13.338723', '2022-10-17 17:51:13.338749', 'WARNING: Default values added for camera: earth | Converted'),
(61, 'Order 004', '2022-10-17 17:51:13.355405', '2022-10-17 17:51:13.355431', 'WARNING: Default values added for video: earth | earth'),
(62, 'Order 001', '2022-10-17 17:51:13.405441', '2022-10-17 17:51:13.405467', 'WARNING: Default values added for adress: Smit\\ Electrotechniek'),
(63, 'Order 001', '2022-10-17 17:51:13.422689', '2022-10-17 17:51:13.422717', 'WARNING: Default values added for bedrijf: Smit\\ Electrotechniek'),
(64, 'Order 001', '2022-10-17 17:51:13.447150', '2022-10-17 17:51:13.447177', 'WARNING: Default values added for locatie: Converted | Converted | Smit\\ Electrotechniek | default'),
(65, 'Order 001', '2022-10-17 17:51:13.463796', '2022-10-17 17:51:13.463822', 'WARNING: Default values added for camera: voordeur | Converted'),
(66, 'Order 001', '2022-10-17 17:51:13.480473', '2022-10-17 17:51:13.480499', 'WARNING: Default values added for video: voordeur | voordeur'),
(67, 'Order 001', '2022-10-17 17:51:13.513828', '2022-10-17 17:51:13.513854', 'WARNING: Default values added for camera: auto | Converted'),
(68, 'Order 001', '2022-10-17 17:51:13.547155', '2022-10-17 17:51:13.547180', 'WARNING: Default values added for video: auto | auto'),
(69, 'Order 001', '2022-10-17 17:51:13.580521', '2022-10-17 17:51:13.580548', 'WARNING: Default values added for camera: brommer | Converted'),
(70, 'Order 001', '2022-10-17 17:51:13.597219', '2022-10-17 17:51:13.597245', 'WARNING: Default values added for video: brommer | brommer'),
(71, ' ', '2022-10-17 18:17:35.837054', '2022-10-17 18:17:35.837108', 'Looking for New Videos in /home/jan/video/'),
(72, ' ', '2022-10-17 18:18:22.671682', '2022-10-17 18:18:22.671707', 'Looking for New Videos in /home/jan/video/'),
(73, 'Order 001', '2022-10-17 18:18:27.700926', '2022-10-17 18:18:27.700957', 'Converting   /home/jan/video/Smit Electrotechniek/2Convert/Order 001/CCTV_ch9_H264.mp4 Size: 57.10660 MB'),
(74, 'Order 001', '2022-10-17 18:34:04.196695', '2022-10-17 18:34:04.196734', 'Converted to /home/jan/video/Smit Electrotechniek/Converted/Order 001/CCTV_ch9_H264.webm Size: 70.74908 MB Time: 00:15:36'),
(75, ' ', '2022-10-17 18:38:39.672488', '2022-10-17 18:38:39.672544', 'Converting Looking for New Videos in /home/jan/video/'),
(76, 'Order 001', '2022-10-17 18:38:44.712721', '2022-10-17 18:38:44.712751', 'Converting   /home/jan/video/Stadgenoot/Remijden/2Convert/Order 001/cam1_nooduitgang.mp4 Size: 55.13723 MB'),
(77, 'Order 001', '2022-10-17 19:46:37.599905', '2022-10-17 19:46:37.599954', 'Converted to /home/jan/video/Stadgenoot/Remijden/Converted/Order 001/cam1_nooduitgang.webm Size: 155.60920 MB Time: 01:07:52'),
(78, ' ', '2022-10-17 19:46:37.612314', '2022-10-17 19:46:37.612341', 'Converting Ended '),
(79, ' ', '2022-10-18 08:20:08.490849', '2022-10-18 08:20:08.490874', 'Converting Looking for New Videos in /home/jan/video/'),
(80, 'Order 001', '2022-10-18 08:20:13.544635', '2022-10-18 08:20:13.544666', 'Converting   /home/jan/video/Stadgenoot/Remijden/2Convert/Order 001/cam1_nooduitgang.mp4 Size: 55.13723 MB'),
(81, ' ', '2022-10-18 10:38:42.114247', '2022-10-18 10:38:42.114273', 'Converting Looking for New Videos in /home/jan/video/'),
(82, 'Order Was001', '2022-10-18 10:38:47.138577', '2022-10-18 10:38:47.138605', 'Converting   /home/jan/video/Stadgenoot/wasborn 36/2Convert/Order Was001/Camera Entree_20190323_232439.mp4 Size: 16.64026 MB'),
(83, 'Order Was001', '2022-10-18 10:41:53.524762', '2022-10-18 10:41:53.524794', 'Converted to /home/jan/video/Stadgenoot/wasborn 36/Converted/Order Was001/Camera Entree_20190323_232439.webm Size: 8.28224 MB Time: 00:03:06'),
(84, 'Order K 001', '2022-10-18 10:41:58.554964', '2022-10-18 10:41:58.554999', 'Converting   /home/jan/video/Kerkebuurt/2Convert/Order K 001/NVR_ch1_main_20221018102400_20221018102500.mp4 Size: 30.60393 MB'),
(85, 'Order K 001', '2022-10-18 10:55:04.457871', '2022-10-18 10:55:04.457891', 'Converted to /home/jan/video/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102400_20221018102500.webm Size: 18.92587 MB Time: 00:13:05'),
(86, 'Order K 001', '2022-10-18 10:55:09.481532', '2022-10-18 10:55:09.481565', 'Converting   /home/jan/video/Kerkebuurt/2Convert/Order K 001/NVR_ch1_main_20220926074805_20220926082402.mp4 Size: 138.41555 MB'),
(87, 'Order K 001', '2022-10-18 11:44:35.675887', '2022-10-18 11:44:35.675925', 'Converted to /home/jan/video/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20220926074805_20220926082402.webm Size: 78.93704 MB Time: 00:49:26'),
(88, 'Order K 001', '2022-10-18 11:44:40.695893', '2022-10-18 11:44:40.695927', 'Converting   /home/jan/video/Kerkebuurt/2Convert/Order K 001/NVR_ch1_main_20221018102500_20221018102800.mp4 Size: 89.42254 MB'),
(89, 'Order003', '2022-10-18 11:57:38.134544', '2022-10-18 11:57:38.134563', 'WARNING: Default values added for camera: dahua2 | Dorpstraat 1'),
(90, 'Order003', '2022-10-18 11:57:38.173972', '2022-10-18 11:57:38.173993', 'WARNING: Default values added for video: dahua2 | dahua2'),
(91, 'Order003', '2022-10-18 11:57:38.221188', '2022-10-18 11:57:38.221220', 'WARNING: Default values added for camera: dahua1 | Dorpstraat 1'),
(92, 'Order003', '2022-10-18 11:57:38.234599', '2022-10-18 11:57:38.234627', 'WARNING: Default values added for video: dahua1 | dahua1'),
(93, 'Order Was001', '2022-10-18 11:57:38.351400', '2022-10-18 11:57:38.351432', 'WARNING: Default values added for adress: wasborn 36'),
(94, 'Order Was001', '2022-10-18 11:57:38.384735', '2022-10-18 11:57:38.384766', 'WARNING: Default values added for locatie: wasborn 36 | wasborn 36 | Stadgenoot | default'),
(95, 'Order Was001', '2022-10-18 11:57:38.457608', '2022-10-18 11:57:38.457641', 'WARNING: Default values added for camera: Camera Entree | wasborn 36'),
(96, 'Order Was001', '2022-10-18 11:57:38.484825', '2022-10-18 11:57:38.484853', 'WARNING: Default values added for video: Camera Entree_20190323_232439 | Camera Entree'),
(97, 'Order 001', '2022-10-18 11:57:38.516030', '2022-10-18 11:57:38.516061', 'WARNING: Default values added for adress: Remijden 1'),
(98, 'Order 001', '2022-10-18 11:57:38.543154', '2022-10-18 11:57:38.543181', 'WARNING: Default values added for locatie: Remijden 1 | Remijden 1 | Stadgenoot | default'),
(99, 'Order 001', '2022-10-18 11:57:38.559795', '2022-10-18 11:57:38.559819', 'WARNING: Default values added for camera: cam1_nooduitgang | Remijden 1'),
(100, 'Order 001', '2022-10-18 11:57:38.576474', '2022-10-18 11:57:38.576493', 'WARNING: Default values added for video: cam1_nooduitgang | cam1_nooduitgang'),
(101, 'Order 002', '2022-10-18 11:57:38.601468', '2022-10-18 11:57:38.601486', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Stadgenoot | default'),
(102, 'Order 002', '2022-10-18 11:57:38.618142', '2022-10-18 11:57:38.618160', 'WARNING: Default values added for camera: achter | Dorpsplein'),
(103, 'Order 002', '2022-10-18 11:57:38.634812', '2022-10-18 11:57:38.634831', 'WARNING: Default values added for video: achter | achter'),
(104, 'Order 004', '2022-10-18 11:57:38.660827', '2022-10-18 11:57:38.660850', 'WARNING: Default values added for adress: Converted'),
(105, 'Order 004', '2022-10-18 11:57:38.684921', '2022-10-18 11:57:38.684945', 'WARNING: Default values added for locatie: Converted | Converted | Kerkebuurt | default'),
(106, 'Order 004', '2022-10-18 11:57:38.701669', '2022-10-18 11:57:38.701690', 'WARNING: Default values added for camera: bunnyfull | Converted'),
(107, 'Order003', '2022-10-18 12:20:08.165972', '2022-10-18 12:20:08.166004', 'WARNING: Default values added for camera: dahua2 | Dorpstraat 1'),
(108, 'Order003', '2022-10-18 12:20:08.182490', '2022-10-18 12:20:08.182517', 'WARNING: Default values added for video: dahua2 | dahua2'),
(109, 'Order003', '2022-10-18 12:20:08.224208', '2022-10-18 12:20:08.224234', 'WARNING: Default values added for camera: dahua1 | Dorpstraat 1'),
(110, 'Order003', '2022-10-18 12:20:08.240797', '2022-10-18 12:20:08.240824', 'WARNING: Default values added for video: dahua1 | dahua1'),
(111, 'Order 004', '2022-10-18 12:20:08.416043', '2022-10-18 12:20:08.416070', 'WARNING: Default values added for locatie: Converted | Converted | Kerkebuurt | default'),
(112, 'Order 004', '2022-10-18 12:20:08.432654', '2022-10-18 12:20:08.432681', 'WARNING: Default values added for camera: bunnyfull | Converted'),
(113, 'Order K 001', '2022-10-18 12:22:59.977623', '2022-10-18 12:22:59.977648', 'WARNING: Default values added for camera: NVR_ch1_main | Converted'),
(114, 'Order K 001', '2022-10-18 12:22:59.994238', '2022-10-18 12:22:59.994265', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main'),
(115, 'Order K 001', '2022-10-18 12:23:00.060897', '2022-10-18 12:23:00.060931', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main'),
(116, 'Order K 001', '2022-10-18 12:23:00.102644', '2022-10-18 12:23:00.102671', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main'),
(117, 'Order 001', '2022-10-18 12:23:00.142917', '2022-10-18 12:23:00.142945', 'WARNING: Default values added for adress: Smit\\ Electrotechniek'),
(118, 'Order 001', '2022-10-18 12:23:00.169370', '2022-10-18 12:23:00.169398', 'WARNING: Default values added for bedrijf: Smit\\ Electrotechniek'),
(119, 'Order 001', '2022-10-18 12:23:00.217456', '2022-10-18 12:23:00.217484', 'WARNING: Default values added for locatie: Converted | Converted | Smit\\ Electrotechniek | default'),
(120, 'Order 001', '2022-10-18 12:23:00.277800', '2022-10-18 12:23:00.277827', 'WARNING: Default values added for camera: CCTV_ch9_H264 | Converted'),
(121, 'Order 001', '2022-10-18 12:23:00.294479', '2022-10-18 12:23:00.294506', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264'),
(122, 'Order 001', '2022-10-18 12:23:00.327833', '2022-10-18 12:23:00.327860', 'WARNING: Default values added for camera: voordeur | Converted'),
(123, 'Order 001', '2022-10-18 12:23:00.344500', '2022-10-18 12:23:00.344526', 'WARNING: Default values added for video: voordeur | voordeur'),
(124, 'Order 001', '2022-10-18 12:23:00.377850', '2022-10-18 12:23:00.377876', 'WARNING: Default values added for camera: auto | Converted'),
(125, 'Order 001', '2022-10-18 12:23:00.394520', '2022-10-18 12:23:00.394546', 'WARNING: Default values added for video: auto | auto'),
(126, 'Order 001', '2022-10-18 12:23:00.452978', '2022-10-18 12:23:00.453006', 'WARNING: Default values added for camera: brommer | Converted'),
(127, 'Order 001', '2022-10-18 12:23:00.469564', '2022-10-18 12:23:00.469590', 'WARNING: Default values added for video: brommer | brommer'),
(128, 'Order K 001', '2022-10-18 12:29:20.799607', '2022-10-18 12:29:20.799633', 'WARNING: Default values added for camera: NVR_ch1_main | Converted'),
(129, 'Order 004', '2022-10-18 12:30:20.907792', '2022-10-18 12:30:20.907817', 'WARNING: Default values added for camera: bunny | Converted'),
(130, 'Order 004', '2022-10-18 12:30:43.240774', '2022-10-18 12:30:43.240800', 'WARNING: Default values added for camera: earth | Converted'),
(131, 'Order 004', '2022-10-18 12:30:43.257320', '2022-10-18 12:30:43.257344', 'WARNING: Default values added for video: earth | earth'),
(132, ' ', '2022-10-18 15:15:03.451496', '2022-10-18 15:15:03.451522', 'Converting Looking for New Videos in /home/jan/video/'),
(133, 'Order rem 002', '2022-10-18 15:15:08.483026', '2022-10-18 15:15:08.483057', 'Converting   /home/jan/video/Stadgenoot/Remijden 1/2Convert/Order rem 002/Remijden 1_ch7_20220620062650_20220620075316.mp4 Size: 3656.85775 MB'),
(134, 'Order rem 002', '2022-10-19 09:09:36.042481', '2022-10-19 09:09:36.042507', 'WARNING: Default values added for camera: Remijden 1_ch7 | Remijden 1'),
(135, 'Order rem 002', '2022-10-19 09:09:36.066270', '2022-10-19 09:09:36.066296', 'WARNING: Default values added for video: Remijden 1_ch7_20220620062650_20220620075316 | Remijden 1_ch7'),
(136, ' ', '2022-10-19 10:49:10.820957', '2022-10-19 10:49:10.820985', 'Converting Looking for New Videos in /home/jan/video/'),
(137, 'Order Z001', '2022-10-19 10:49:15.850943', '2022-10-19 10:49:15.850976', 'Converting   /home/jan/video/Stadgenoot/zuidgorsstraat 9/2Convert/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.mp4 Size: 67.75668 MB'),
(138, 'Order Z001', '2022-10-19 11:09:02.398290', '2022-10-19 11:09:02.398335', 'Converted to /home/jan/video/Stadgenoot/zuidgorsstraat 9/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm Size: 36.75284 MB Time: 00:19:46'),
(139, 'Order Abra 001', '2022-10-19 11:09:07.419537', '2022-10-19 11:09:07.419571', 'Converting   /home/jan/video/Stadgenoot/Abraham Kuyperstraat 1-73/2Convert/Order Abra 001/Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537.mp4 Size: 215.29160 MB'),
(140, 'Order Abra 001', '2022-10-19 12:06:18.201276', '2022-10-19 12:06:18.201295', 'Converted to /home/jan/video/Stadgenoot/Abraham Kuyperstraat 1-73/Converted/Order Abra 001/Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537.webm Size: 395.66920 MB Time: 00:57:10'),
(141, 'Order Sm001', '2022-10-19 12:06:23.240090', '2022-10-19 12:06:23.240124', 'Converting   /home/jan/video/Smit Electrotechniek/2Convert/Order Sm001/CCTV_ch9_H264.mp4 Size: 57.10660 MB'),
(142, 'Order Sm001', '2022-10-19 12:21:42.006342', '2022-10-19 12:21:42.006371', 'Converted to /home/jan/video/Smit Electrotechniek/Converted/Order Sm001/CCTV_ch9_H264.webm Size: 70.74908 MB Time: 00:15:18'),
(143, ' ', '2022-10-19 12:21:42.039236', '2022-10-19 12:21:42.039263', 'Converting Ended '),
(144, 'bunnyfull.webm', '2022-10-20 14:50:44.463602', '2022-10-20 14:50:44.463663', 'WARNING: Default values added for adress: Thuis'),
(145, 'bunnyfull.webm', '2022-10-20 14:50:44.504924', '2022-10-20 14:50:44.504952', 'WARNING: Default values added for locatie: Kerkebuurt | Kerkebuurt | Thuis | default'),
(146, 'bunnyfull.webm', '2022-10-20 14:50:44.546644', '2022-10-20 14:50:44.546671', 'WARNING: Default values added for camera: bunnyfull | Kerkebuurt'),
(147, 'bunnyfull.webm', '2022-10-20 14:50:44.588347', '2022-10-20 14:50:44.588374', 'WARNING: Default values added for video: bunnyfull | bunnyfull'),
(148, 'Order 004', '2022-10-20 14:50:44.621717', '2022-10-20 14:50:44.621745', 'WARNING: Default values added for camera: bunny | Kerkebuurt'),
(149, 'Order 004', '2022-10-20 14:50:44.638414', '2022-10-20 14:50:44.638442', 'WARNING: Default values added for video: bunny | bunny'),
(150, 'Order 004', '2022-10-20 14:50:44.713463', '2022-10-20 14:50:44.713489', 'WARNING: Default values added for camera: earth | Kerkebuurt'),
(151, 'Order 004', '2022-10-20 14:50:44.730014', '2022-10-20 14:50:44.730041', 'WARNING: Default values added for video: earth | earth'),
(152, 'Order K 001', '2022-10-20 14:50:44.780158', '2022-10-20 14:50:44.780185', 'WARNING: Default values added for camera: NVR_ch1_main | Kerkebuurt'),
(153, 'Order K 001', '2022-10-20 14:50:44.796831', '2022-10-20 14:50:44.796858', 'WARNING: Default values added for video: NVR_ch1_main_20220926074805_20220926082402 | NVR_ch1_main'),
(154, 'Order K 001', '2022-10-20 14:50:44.838524', '2022-10-20 14:50:44.838551', 'WARNING: Default values added for video: NVR_ch1_main_20221018102500_20221018102800 | NVR_ch1_main'),
(155, 'Order K 001', '2022-10-20 14:50:44.880252', '2022-10-20 14:50:44.880285', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main'),
(156, 'Order003', '2022-10-20 14:50:44.921917', '2022-10-20 14:50:44.921944', 'WARNING: Default values added for video: dahua2 | dahua2'),
(157, 'Order Z001', '2022-10-20 14:50:45.080375', '2022-10-20 14:50:45.080400', 'WARNING: Default values added for adress: zuidgorsstraat 9'),
(158, 'Order Z001', '2022-10-20 14:50:45.113662', '2022-10-20 14:50:45.113689', 'WARNING: Default values added for locatie: zuidgorsstraat 9 | zuidgorsstraat 9 | Stadgenoot | default'),
(159, 'Order Z001', '2022-10-20 14:50:45.130318', '2022-10-20 14:50:45.130345', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | zuidgorsstraat 9'),
(160, 'Order Z001', '2022-10-20 14:50:45.146920', '2022-10-20 14:50:45.146946', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1'),
(161, 'Order Abra 001', '2022-10-20 14:50:45.205900', '2022-10-20 14:50:45.205927', 'WARNING: Default values added for adress: Abraham Kuyperstraat 1-73'),
(162, 'Order Abra 001', '2022-10-20 14:50:45.247075', '2022-10-20 14:50:45.247103', 'WARNING: Default values added for locatie: Abraham Kuyperstraat 1-73 | Abraham Kuyperstraat 1-73 | Stadgenoot | default'),
(163, 'Order Abra 001', '2022-10-20 14:50:45.263730', '2022-10-20 14:50:45.263757', 'WARNING: Default values added for camera: Abraham Kuyperstraat 1-73_ch4 | Abraham Kuyperstraat 1-73'),
(164, 'Order Abra 001', '2022-10-20 14:58:49.850606', '2022-10-20 14:58:49.850655', 'WARNING: Default values added for video: Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537 | Abraham Kuyperstraat 1-73_ch4'),
(165, 'Order Sm001', '2022-10-20 14:58:49.876099', '2022-10-20 14:58:49.876126', 'WARNING: Default values added for adress: '),
(166, 'Order Sm001', '2022-10-20 14:58:49.908852', '2022-10-20 14:58:49.908879', 'WARNING: Default values added for bedrijf: Smit Electrotechniek'),
(167, 'Order Sm001', '2022-10-20 14:58:49.967302', '2022-10-20 14:58:49.967350', 'WARNING: Default values added for locatie:  |  | Smit Electrotechniek | default'),
(168, 'Order Sm001', '2022-10-20 14:58:50.017308', '2022-10-20 14:58:50.017336', 'WARNING: Default values added for camera: CCTV_ch9_H264 | '),
(169, 'Order Sm001', '2022-10-20 14:58:50.033990', '2022-10-20 14:58:50.034016', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264'),
(170, 'Order 001', '2022-10-20 14:58:50.092956', '2022-10-20 14:58:50.092984', 'WARNING: Default values added for camera: voordeur | '),
(171, 'Order 001', '2022-10-20 14:58:50.109469', '2022-10-20 14:58:50.109496', 'WARNING: Default values added for video: voordeur | voordeur'),
(172, 'Order 001', '2022-10-20 14:58:50.193066', '2022-10-20 14:58:50.193093', 'WARNING: Default values added for camera: auto | '),
(173, 'Order 001', '2022-10-20 14:58:50.209647', '2022-10-20 14:58:50.209674', 'WARNING: Default values added for video: auto | auto'),
(174, 'Order 001', '2022-10-20 14:58:50.243063', '2022-10-20 14:58:50.243106', 'WARNING: Default values added for camera: brommer | '),
(175, 'Order 001', '2022-10-20 14:58:50.293090', '2022-10-20 14:58:50.293117', 'WARNING: Default values added for video: brommer | brommer'),
(176, ' ', '2022-10-20 15:37:47.755234', '2022-10-20 15:37:47.755288', 'Converting Looking for New Videos in /home/jan/video/'),
(177, 'Order Z001', '2022-10-20 15:37:52.808350', '2022-10-20 15:37:52.808378', 'Converting   /home/jan/video/Stadgenoot/zuidgorsstraat 9/2Convert/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.mp4 Size: 67.75668 MB'),
(178, 'Order Z001', '2022-10-20 15:37:53.139558', '2022-10-20 15:37:53.139596', 'Converted to /home/jan/video/Stadgenoot/zuidgorsstraat 9/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm Size: 0.00140 MB Time: 00:00:00'),
(179, ' ', '2022-10-20 15:37:53.153415', '2022-10-20 15:37:53.153443', 'Converting Ended '),
(180, 'Order003', '2022-10-20 15:41:51.099124', '2022-10-20 15:41:51.099150', 'WARNING: Default values added for video: dahua2 | dahua2'),
(181, 'Order Z001', '2022-10-20 15:41:51.274219', '2022-10-20 15:41:51.274244', 'WARNING: Default values added for adress: zuidgorsstraat 9'),
(182, 'Order Z001', '2022-10-20 15:41:51.332423', '2022-10-20 15:41:51.332450', 'WARNING: Default values added for locatie: zuidgorsstraat 9 | zuidgorsstraat 9 | Stadgenoot | default'),
(183, 'Order Z001', '2022-10-20 15:41:51.365828', '2022-10-20 15:41:51.365855', 'WARNING: Default values added for camera: zuidgorsstraat 9_ch1 | zuidgorsstraat 9'),
(184, 'Order Z001', '2022-10-20 15:41:51.407522', '2022-10-20 15:41:51.407549', 'WARNING: Default values added for video: zuidgorsstraat 9_ch1_20220405155243_20220405155619 | zuidgorsstraat 9_ch1'),
(185, 'Order 002', '2022-10-20 15:41:51.440970', '2022-10-20 15:41:51.441005', 'WARNING: Default values added for locatie: Dorpsplein | Dorpsplein | Stadgenoot | default'),
(186, 'Order Abra 001', '2022-10-20 15:41:51.507634', '2022-10-20 15:41:51.507661', 'WARNING: Default values added for locatie: Abraham Kuyperstraat 1-73 | Abraham Kuyperstraat 1-73 | Stadgenoot | default'),
(187, 'Order Sm001', '2022-10-20 15:41:51.532564', '2022-10-20 15:41:51.532591', 'WARNING: Default values added for adress: '),
(188, 'Order Sm001', '2022-10-20 15:41:51.557642', '2022-10-20 15:41:51.557669', 'WARNING: Default values added for locatie:  |  | Smit Electrotechniek | default'),
(189, 'Order Sm001', '2022-10-20 15:41:51.599371', '2022-10-20 15:41:51.599398', 'WARNING: Default values added for camera: CCTV_ch9_H264 | '),
(190, 'Order Sm001', '2022-10-20 15:41:51.649443', '2022-10-20 15:41:51.649469', 'WARNING: Default values added for video: CCTV_ch9_H264 | CCTV_ch9_H264'),
(191, 'Order 001', '2022-10-20 15:41:51.716124', '2022-10-20 15:41:51.716151', 'WARNING: Default values added for camera: voordeur | '),
(192, 'Order 001', '2022-10-20 15:41:51.732760', '2022-10-20 15:41:51.732787', 'WARNING: Default values added for video: voordeur | voordeur'),
(193, 'Order 001', '2022-10-20 15:41:51.766134', '2022-10-20 15:41:51.766161', 'WARNING: Default values added for camera: auto | '),
(194, 'Order 001', '2022-10-20 15:41:51.782798', '2022-10-20 15:41:51.782825', 'WARNING: Default values added for video: auto | auto'),
(195, 'Order 001', '2022-10-20 15:41:51.816095', '2022-10-20 15:41:51.816122', 'WARNING: Default values added for camera: brommer | '),
(196, 'Order 001', '2022-10-20 15:41:51.832758', '2022-10-20 15:41:51.832785', 'WARNING: Default values added for video: brommer | brommer'),
(197, ' ', '2022-10-20 15:47:39.674151', '2022-10-20 15:47:39.674193', 'Converting Looking for New Videos in /home/jan/video/'),
(198, 'Order Z001', '2022-10-20 15:47:44.727591', '2022-10-20 15:47:44.727619', 'Converting   /home/jan/video/Stadgenoot/zuidgorsstraat 9/2Convert/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.mp4 Size: 67.75668 MB'),
(199, 'Order Z001', '2022-10-20 16:07:29.508973', '2022-10-20 16:07:29.509018', 'Converted to /home/jan/video/Stadgenoot/zuidgorsstraat 9/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm Size: 36.75284 MB Time: 00:19:44'),
(200, ' ', '2022-10-20 16:07:29.526045', '2022-10-20 16:07:29.526072', 'Converting Ended '),
(201, ' ', '2022-10-21 10:04:20.303210', '2022-10-21 10:04:20.303236', 'Converting Looking for New Videos in /home/jan/video/'),
(202, 'Order TH02', '2022-10-21 10:04:25.352844', '2022-10-21 10:04:25.352872', 'Converting   /home/jan/video/Thuis/Kerkebuurt/2Convert/Order TH02/NVR_ch1_main_20221021104000_20221021104030.mp4 Size: 13.95541 MB'),
(203, 'Order TH02', '2022-10-21 10:10:08.528852', '2022-10-21 10:10:08.528873', 'Converted to /home/jan/video/Thuis/Kerkebuurt/Converted/Order TH02/NVR_ch1_main_20221021104000_20221021104030.webm Size: 8.47912 MB Time: 00:05:43'),
(204, ' ', '2022-10-21 10:10:08.542324', '2022-10-21 10:10:08.542336', 'Converting Ended '),
(205, ' ', '2022-10-21 11:40:58.883841', '2022-10-21 11:40:58.883871', 'Converting Looking for New Videos in /home/jan/video/'),
(206, 'Order TH02', '2022-10-21 11:41:03.909980', '2022-10-21 11:41:03.910008', 'Converting   /home/jan/video/Thuis/Kerkebuurt/2Convert/Order TH02/NVR_ch1_main_20221021104000_20221021104030.mp4 Size: 13.95541 MB'),
(207, 'Order TH02', '2022-10-21 11:46:45.115734', '2022-10-21 11:46:45.115771', 'Converted to /home/jan/video/Thuis/Kerkebuurt/Converted/Order TH02/NVR_ch1_main_20221021104000_20221021104030.webm Size: 8.47912 MB Time: 00:05:41'),
(208, 'Order TH02', '2022-10-21 11:46:45.166105', '2022-10-21 11:46:45.166132', 'WARNING: Default values added for video: NVR_ch1_main_20221021104000_20221021104030 | NVR_ch1_main'),
(209, ' ', '2022-10-21 11:46:45.178087', '2022-10-21 11:46:45.178115', 'Converting Ended ');

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
(1, '/home/jan/video/', '2022-09-12 00:00:00.000000', '2022-10-21 11:46:45.183783', 0);

-- --------------------------------------------------------

--
-- Table structure for table `camera_video`
--

CREATE TABLE `camera_video` (
  `id` int(11) NOT NULL,
  `naam` varchar(100) NOT NULL,
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
(31, 'Camera Entree_20190323_232439', '2022-10-18 11:57:38.478946', '2022-10-18 11:57:38.478956', 'Stadgenoot/wasborn 36/Converted/Order Was001/Camera Entree_20190323_232439.webm', 'vb9', '', 'camera-entree_20190323_232439', '2022-10-18 11:57:38.478983', '2022-10-18 11:57:38.479082', 71, 'Order Was001', ''),
(32, 'cam1_nooduitgang', '2022-10-18 11:57:38.570368', '2022-10-18 11:57:38.570377', 'Stadgenoot/Remijden 1/Converted/Order 001/cam1_nooduitgang.webm', 'vb9', '', 'cam1_nooduitgang', '2022-10-18 11:57:38.570404', '2022-10-18 11:57:38.570494', 72, 'Order 001', ''),
(33, 'achter', '2022-10-18 11:57:38.628438', '2022-10-18 11:57:38.628445', 'Stadgenoot/Dorpsplein/Converted/Order 002/achter.webm', 'vb9', '', 'achter', '2022-10-18 11:57:38.628466', '2022-10-18 11:57:38.628537', 73, 'Order 002', ''),
(36, 'dahua1', '2022-10-18 12:20:08.235443', '2022-10-18 12:20:08.235452', 'Stadgenoot/Dorpstraat 1/Converted/Order003/dahua1.webm', 'vb9', '', 'dahua1', '2022-10-18 12:20:08.235479', '2022-10-18 12:20:08.235573', 76, 'Order003', ''),
(47, 'Remijden 1_ch7_20220620062650_20220620075316', '2022-10-19 09:09:36.052252', '2022-10-19 09:09:36.052263', 'Stadgenoot/Remijden 1/Converted/Order rem 002/Remijden 1_ch7_20220620062650_20220620075316.webm', 'vb9', '', 'remijden-1_ch7_20220620062650_20220620075316', '2022-10-19 09:09:36.052291', '2022-10-19 09:09:36.052394', 86, 'Order rem 002', ''),
(48, 'bunnyfull', '2022-10-20 14:50:44.000000', '2022-10-20 14:50:44.000000', 'Thuis/Kerkebuurt/Converted/bunnyfull.webm', 'vb9', '', 'bunnyfull', '2022-10-20 14:50:44.583039', '2022-10-21 11:57:57.819957', 87, '01', ''),
(49, 'bunny', '2022-10-20 14:50:44.632970', '2022-10-20 14:50:44.632980', 'Thuis/Kerkebuurt/Converted/Order 004/bunny.webm', 'vb9', '', 'bunny', '2022-10-20 14:50:44.633009', '2022-10-20 14:50:44.633101', 88, 'Order 004', ''),
(50, 'earth', '2022-10-20 14:50:44.724670', '2022-10-20 14:50:44.724680', 'Thuis/Kerkebuurt/Converted/Order 004/earth.webm', 'vb9', '', 'earth', '2022-10-20 14:50:44.724708', '2022-10-20 14:50:44.724802', 89, 'Order 004', ''),
(51, 'NVR_ch1_main_20220926074805_20220926082402', '2022-10-20 14:50:44.791464', '2022-10-20 14:50:44.791474', 'Thuis/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20220926074805_20220926082402.webm', 'vb9', '', 'nvr_ch1_main_20220926074805_20220926082402', '2022-10-20 14:50:44.791503', '2022-10-20 14:50:44.791600', 90, 'Order K 001', ''),
(52, 'NVR_ch1_main_20221018102500_20221018102800', '2022-10-20 14:50:44.827182', '2022-10-20 14:50:44.827192', 'Thuis/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102500_20221018102800.webm', 'vb9', '', 'nvr_ch1_main_20221018102500_20221018102800', '2022-10-20 14:50:44.827221', '2022-10-20 14:50:44.827319', 90, 'Order K 001', ''),
(53, 'NVR_ch1_main_20221018102400_20221018102500', '2022-10-20 14:50:44.869558', '2022-10-20 14:50:44.869568', 'Thuis/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102400_20221018102500.webm', 'vb9', '', 'nvr_ch1_main_20221018102400_20221018102500', '2022-10-20 14:50:44.869598', '2022-10-20 14:50:44.869695', 90, 'Order K 001', ''),
(56, 'Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537', '2022-10-20 14:58:49.834362', '2022-10-20 14:58:49.834374', 'Stadgenoot/Abraham Kuyperstraat 1-73/Converted/Order Abra 001/Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537.webm', 'vb9', '', 'abraham-kuyperstraat-1-73_ch4_20190702174346_20190702175537', '2022-10-20 14:58:49.834418', '2022-10-20 14:58:49.834838', 92, 'Order Abra 001', ''),
(61, 'dahua2', '2022-10-20 15:41:51.000000', '2022-10-20 15:41:51.000000', 'Stadgenoot/Dorpstraat 1/Converted/Order003/dahua2.webm', 'vb9', '', 'dahua2', '2022-10-20 15:41:51.085226', '2022-10-21 12:56:01.935128', 75, 'Order003', ''),
(62, 'zuidgorsstraat 9_ch1_20220405155243_20220405155619', '2022-10-20 15:41:51.402015', '2022-10-20 15:41:51.402025', 'Stadgenoot/zuidgorsstraat 9/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm', 'vb9', '', 'zuidgorsstraat-9_ch1_20220405155243_20220405155619', '2022-10-20 15:41:51.402053', '2022-10-20 15:41:51.402153', 97, 'Order Z001', ''),
(63, 'CCTV_ch9_H264', '2022-10-20 15:41:51.618869', '2022-10-20 15:41:51.618879', 'Smit Electrotechniek/Bellstraat/Converted/Order Sm001/CCTV_ch9_H264.webm', 'vb9', '', 'cctv_ch9_h264', '2022-10-20 15:41:51.618907', '2022-10-20 15:41:51.619000', 98, 'Order Sm001', ''),
(64, 'voordeur', '2022-10-20 15:41:51.727261', '2022-10-20 15:41:51.727271', 'Smit Electrotechniek/Bellstraat/Converted/Order 001/voordeur.webm', 'vb9', '', 'voordeur', '2022-10-20 15:41:51.727299', '2022-10-20 15:41:51.727392', 99, 'Order 001', ''),
(65, 'auto', '2022-10-20 15:41:51.777221', '2022-10-20 15:41:51.777230', 'Smit Electrotechniek/Bellstraat/Converted/Order 001/auto.webm', 'vb9', '', 'auto', '2022-10-20 15:41:51.777258', '2022-10-20 15:41:51.777350', 100, 'Order 001', ''),
(66, 'brommer', '2022-10-20 15:41:51.827257', '2022-10-20 15:41:51.827266', 'Smit Electrotechniek/Bellstraat/Converted/Order 001/brommer.webm', 'vb9', '', 'brommer', '2022-10-20 15:41:51.827294', '2022-10-20 15:41:51.827386', 101, 'Order 001', ''),
(67, 'NVR_ch1_main_20221021104000_20221021104030', '2022-10-21 11:46:45.000000', '2022-10-21 11:46:45.000000', 'Thuis/Kerkebuurt/Converted/Order TH02/NVR_ch1_main_20221021104000_20221021104030.webm', 'vb9', '', 'nvr_ch1_main_20221021104000_20221021104030', '2022-10-21 11:46:45.156625', '2022-10-21 12:01:14.404309', 78, 'Order TH02', '');

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
(13, 'camera', 'adress'),
(7, 'camera', 'bedrijf'),
(8, 'camera', 'camera'),
(9, 'camera', 'gebruiker'),
(14, 'camera', 'locatie'),
(11, 'camera', 'log'),
(12, 'camera', 'parameter'),
(10, 'camera', 'video'),
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
(1, 'contenttypes', '0001_initial', '2022-09-20 12:10:33.358747'),
(2, 'auth', '0001_initial', '2022-09-20 12:10:37.474510'),
(3, 'admin', '0001_initial', '2022-09-20 12:10:38.374560'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-09-20 12:10:38.395797'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-20 12:10:38.421824'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-09-20 12:10:38.902535'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-09-20 12:10:39.262648'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-09-20 12:10:40.438605'),
(9, 'auth', '0004_alter_user_username_opts', '2022-09-20 12:10:40.591894'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-09-20 12:10:41.794629'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-09-20 12:10:41.873774'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-09-20 12:10:41.899965'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-09-20 12:10:42.550618'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-09-20 12:10:42.742564'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-09-20 12:10:42.934562'),
(16, 'auth', '0011_update_proxy_permissions', '2022-09-20 12:10:42.955684'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-09-20 12:10:43.150566'),
(18, 'camera', '0001_initial', '2022-09-20 12:10:49.030564'),
(19, 'camera', '0002_auto_20211224_1520', '2022-09-20 12:10:49.686806'),
(20, 'camera', '0003_auto_20211227_1311', '2022-09-20 12:10:49.806731'),
(21, 'camera', '0004_auto_20220110_1241', '2022-09-20 12:10:50.662561'),
(22, 'camera', '0005_log_video_ordernr', '2022-09-20 12:10:51.130438'),
(23, 'camera', '0006_alter_video_ordernr', '2022-09-20 12:10:51.151151'),
(24, 'camera', '0007_parameter_alter_video_options', '2022-09-20 12:10:51.346145'),
(25, 'camera', '0008_log_datum_updated_parameter_datum_updated_and_more', '2022-09-20 12:10:52.282538'),
(26, 'camera', '0009_alter_log_options', '2022-09-20 12:10:52.294215'),
(27, 'camera', '0010_remove_log_messsage_log_message', '2022-09-20 12:10:52.846632'),
(28, 'camera', '0011_alter_log_message', '2022-09-20 12:10:53.050461'),
(29, 'camera', '0012_parameter_conversion_running', '2022-09-20 12:10:53.762116'),
(30, 'camera', '0013_remove_video_video_image_video_duration_and_more', '2022-09-20 12:10:56.578021'),
(31, 'camera', '0014_adress_remove_bedrijf_contact_remove_bedrijf_land_and_more', '2022-09-20 12:11:06.658002'),
(32, 'sessions', '0001_initial', '2022-09-20 12:11:07.029940'),
(33, 'camera', '0015_alter_locatie_unique_together', '2022-09-23 13:02:40.771112'),
(34, 'camera', '0016_alter_adress_straat_alter_bedrijf_telefoon_and_more', '2022-10-07 06:48:43.621584'),
(35, 'camera', '0017_camera_plaats_alter_camera_locatie', '2022-10-07 07:08:03.335176'),
(36, 'camera', '0018_alter_video_options_alter_video_unique_together_and_more', '2022-10-07 11:08:11.626335');

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
('9vbysqt5tg92elmn1m66byxcbj4j9szs', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1olrDM:Xz7wwRU9itn0hsnt_DlIFtV1m5LNi319lQlrCynOsxQ', '2022-11-04 12:33:28.096143'),
('aw3wj2rxxjl4vvvoqpe11fhdix6vmpbi', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1okkp6:jtl8gm0QezVfM2uZtzYyrXeTNmcGMf69aWm7XVBv8Z0', '2022-11-01 11:31:52.362839'),
('awg4n9w121g0adog0xq3ywn0n4gfei16', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1ognvE:lPZDUzkCb6eJZrN6uxXs2F031ZD5yKpQWyrgU_W1umc', '2022-10-21 14:01:52.019231'),
('dtrw5guqp21reymdq0c15ff5l8mfvhw3', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1olnWL:nN53bQcMWKg-o0Nz6goQGFmBxLDlBzLV2lIxFJKv35Y', '2022-11-04 08:36:49.944374'),
('ewynojxsnqqjbbuxb261kajrri1j1s9y', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1obiUf:H2_Fg8dp89Hc7CAor5TKafAF1HEtdiL0eNx7_VxU9B8', '2022-10-07 13:13:25.853991'),
('jc5q88a6m0k64wq3kpjo5geuapvd5sjh', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1ob13W:ixqGo0j1GWB4APDolJiYZeQr1U6ZbQ6-7wUsUNwSnRA', '2022-10-05 14:50:30.327328'),
('jdijonm3r3zqklwbl0alwzs3up5dtql2', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1obilY:n093mBcjJlH26yDeXUxSnuE3Q7yr50c-7kydU0O1nMk', '2022-10-07 13:30:52.002415'),
('ymij39607cpw24tbono4fz846rtqvmzy', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1ojnOG:wzUqRqfg_1VjX8ng0EswgFJ_kOhdLrEsHf6iyZ400i4', '2022-10-29 20:04:12.524021');

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
  ADD KEY `camera_bedrijf_slug_6cf0579f` (`slug`),
  ADD KEY `camera_bedrijf_adres_id_ef29d0ee` (`adres_id`);

--
-- Indexes for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `camera_camera_naam_locatie_id_1828c446_uniq` (`naam`,`locatie_id`),
  ADD KEY `camera_camera_slug_9c14c40a` (`slug`),
  ADD KEY `camera_camera_locatie_id_4b75514e` (`locatie_id`,`naam`) USING BTREE;

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
  ADD UNIQUE KEY `camera_locatie_naam_adres_id_3ed759b9_uniq` (`naam`,`adres_id`,`bedrijf_id`,`contact_id`) USING BTREE,
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
-- Indexes for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `camera_log`
--
ALTER TABLE `camera_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

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
