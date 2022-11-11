-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 11, 2022 at 03:32 PM
-- Server version: 10.6.7-MariaDB-2ubuntu1.1
-- PHP Version: 8.1.2-1ubuntu2.6

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
(60, 'Can view video', 15, 'view_video');

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
(1, 'pbkdf2_sha256$260000$PMiK5UmPs5lqj8lrYGZxXQ$oYZQ6oPxCpZGfbxcvSNfEVKBcur+1mMoybObtCHOWKY=', '2022-11-08 11:37:50.504912', 1, 'django', '', '', 'jandeboer@gmail.com', 1, 1, '2022-10-27 12:52:41.931562');

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
(63, 'Dorpstrraat', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'dorpstrraat', '2022-11-10 14:38:36.487634', '2022-11-10 14:38:36.488034');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `plaats`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `locatie_id`) VALUES
(167, 'cam1_nooduitgang', 'default', 'default', '', '', '2022-11-10 11:00:20.760457', '', 'cam1_nooduitgang', '2022-11-10 11:00:20.760486', '2022-11-10 11:00:20.760632', 69),
(168, 'Remijden 1_ch7', 'default', 'default', '', '', '2022-11-10 11:00:20.827353', '', 'remijden-1_ch7', '2022-11-10 11:00:20.827369', '2022-11-10 11:00:20.827489', 69),
(169, 'Camera Entree', 'default', 'default', '', '', '2022-11-10 11:00:21.010408', '', 'camera-entree', '2022-11-10 11:00:21.010424', '2022-11-10 11:00:21.010546', 70),
(170, 'zuidgorsstraat 9_ch1', 'default', 'default', '', '', '2022-11-10 11:00:21.077082', '', 'zuidgorsstraat-9_ch1', '2022-11-10 11:00:21.077098', '2022-11-10 11:00:21.077227', 71),
(171, 'Camera Entree', 'default', 'default', '', '', '2022-11-10 11:00:21.177180', '', 'camera-entree', '2022-11-10 11:00:21.177196', '2022-11-10 11:00:21.177316', 72),
(172, 'Abraham Kuyperstraat 1-73_ch4', 'default', 'default', '', '', '2022-11-10 11:00:21.235568', '', 'abraham-kuyperstraat-1-73_ch4', '2022-11-10 11:00:21.235585', '2022-11-10 11:00:21.235713', 73),
(173, 'CCTV_ch9_H264', 'default', 'default', '', '', '2022-11-10 11:00:21.360597', '', 'cctv_ch9_h264', '2022-11-10 11:00:21.360614', '2022-11-10 11:00:21.360729', 74),
(174, 'Earth', 'default', 'default', '', '', '2022-11-10 11:00:21.419113', '', 'earth', '2022-11-10 11:00:21.419129', '2022-11-10 11:00:21.419242', 74),
(175, 'voordeur', 'default', 'default', '', '', '2022-11-10 11:00:21.469177', '', 'voordeur', '2022-11-10 11:00:21.469194', '2022-11-10 11:00:21.469307', 74),
(176, 'auto', 'default', 'default', '', '', '2022-11-10 11:00:21.535642', '', 'auto', '2022-11-10 11:00:21.535657', '2022-11-10 11:00:21.535771', 74),
(177, 'brommer', 'default', 'default', '', '', '2022-11-10 11:00:21.594214', '', 'brommer', '2022-11-10 11:00:21.594230', '2022-11-10 11:00:21.594345', 74),
(178, 'bunnyfull', 'default', 'default', '', '', '2022-11-10 11:00:21.719992', '', 'bunnyfull', '2022-11-10 11:00:21.720008', '2022-11-10 11:00:21.720121', 75),
(179, 'Earth', 'default', 'default', '', '', '2022-11-10 11:00:21.844178', '', 'earth', '2022-11-10 11:00:21.844194', '2022-11-10 11:00:21.844306', 75),
(180, 'bunny', 'default', 'default', '', '', '2022-11-10 11:00:21.883049', '', 'bunny', '2022-11-10 11:00:21.883065', '2022-11-10 11:00:21.883178', 75),
(181, 'NVR_ch2_main', 'default', 'default', '', '', '2022-11-10 11:00:21.944483', '', 'nvr_ch2_main', '2022-11-10 11:00:21.944499', '2022-11-10 11:00:21.944625', 75),
(182, 'NVR_ch1_main', 'default', 'default', '', '', '2022-11-10 11:00:21.995563', '', 'nvr_ch1_main', '2022-11-10 11:00:21.995579', '2022-11-10 11:00:21.995695', 75),
(183, 'NVR_ch3_main', 'default', 'default', '', '', '2022-11-10 11:00:22.052353', '', 'nvr_ch3_main', '2022-11-10 11:00:22.052369', '2022-11-10 11:00:22.052484', 75),
(184, 'achter', 'default', 'default', '', '', '2022-11-10 11:00:22.286008', '', 'achter', '2022-11-10 11:00:22.286024', '2022-11-10 11:00:22.286137', 76),
(187, 'dahua1', 'default', 'default', '', '', '2022-11-10 14:38:36.610840', '', 'dahua1', '2022-11-10 14:38:36.610868', '2022-11-10 14:38:36.610991', 78),
(188, 'dahua2', 'default', 'default', '', '', '2022-11-10 14:38:36.702611', '', 'dahua2', '2022-11-10 14:38:36.702629', '2022-11-10 14:38:36.702748', 78);

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
(69, 'Remijden', '', '', 'remijden', '2022-11-10 11:00:20.741005', '2022-11-10 11:00:20.741570', 32, 1, 13),
(70, 'Wasborn Locatie 2', '', '', 'wasborn-locatie-2', '2022-11-10 11:00:20.987594', '2022-11-10 11:00:20.987742', 58, 1, 13),
(71, 'Zuidgorsstraat', '', '', 'zuidgorsstraat', '2022-11-10 11:00:21.058371', '2022-11-10 11:00:21.058510', 6, 1, 13),
(72, 'Wasborn Locatie 1', '', '', 'wasborn-locatie-1', '2022-11-10 11:00:21.154186', '2022-11-10 11:00:21.154329', 59, 1, 13),
(73, 'Abraham Kuyperstraat', '', '', 'abraham-kuyperstraat', '2022-11-10 11:00:21.213954', '2022-11-10 11:00:21.214099', 37, 1, 13),
(74, 'Bellstraat', '', '', 'bellstraat', '2022-11-10 11:00:21.337657', '2022-11-10 11:00:21.337795', 60, 18, 13),
(75, 'Kerkebuurt', '', '', 'kerkebuurt', '2022-11-10 11:00:21.683730', '2022-11-10 11:00:21.683869', 27, 20, 13),
(76, 'Dorpsplein', '', '', 'dorpsplein', '2022-11-10 11:00:22.267816', '2022-11-10 11:00:22.267959', 19, 20, 13),
(78, 'Dorpstrraat', '', '', 'dorpstrraat', '2022-11-10 14:38:36.553698', '2022-11-10 14:38:36.553873', 63, 20, 13);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(203, 'Order K 001', 'WARNING: Default values added for video: NVR_ch1_main_20221018102400_20221018102500 | NVR_ch1_main', '2022-11-10 14:51:13.331266', '2022-11-10 14:51:13.331294');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_parameter`
--

INSERT INTO `camera_parameter` (`id`, `videoPath`, `conversion_running`, `datum_inserted`, `datum_updated`) VALUES
(1, '/home/jan/media/', 0, '2022-09-12 00:00:00.000000', '2022-10-25 14:51:58.996400');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_serviceorder`
--

INSERT INTO `camera_serviceorder` (`id`, `ordernr`, `keep_original`, `auto_cleanup`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `contact_id`, `conversion_ready`, `conversion_started`) VALUES
(1, 'een', 0, 0, '', 'een', '2022-11-11 08:26:14.247058', '2022-11-11 14:29:46.089423', 20, 8, 0, 0),
(2, 'een', 0, 0, '', 'een', '2022-11-11 08:26:39.650105', '2022-11-11 08:26:39.656691', 20, 2, 0, 0),
(3, '0002', 1, 1, '', '0002', '2022-11-11 08:30:14.335015', '2022-11-11 08:30:14.343777', 3, 6, 0, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_video`
--

INSERT INTO `camera_video` (`id`, `naam`, `ordernr`, `opname_van`, `opname_tot`, `video_link`, `duration`, `codec`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `camera_id`) VALUES
(42, 'cam1_nooduitgang', 'Order 001', '2022-11-10 11:00:20.778046', '2022-11-10 11:00:20.778059', 'Stadgenoot/Remijden/Converted/Order 001/cam1_nooduitgang.webm', '', 'vb9', '', 'cam1_nooduitgang', '2022-11-10 11:00:20.778113', '2022-11-10 11:00:20.778250', 167),
(43, 'Remijden 1_ch7_20220620062650_20220620075316', 'Order rem 002', '2022-11-10 11:00:20.878241', '2022-11-10 11:00:20.878251', 'Stadgenoot/Remijden/Converted/Order rem 002/Remijden 1_ch7_20220620062650_20220620075316.webm', '', 'vb9', '', 'remijden-1_ch7_20220620062650_20220620075316', '2022-11-10 11:00:20.878281', '2022-11-10 11:00:20.878387', 168),
(44, 'Camera Entree_20190323_232439', 'Order Was001', '2022-11-10 11:00:21.028097', '2022-11-10 11:00:21.028106', 'Stadgenoot/Wasborn Locatie 2/Converted/Order Was001/Camera Entree_20190323_232439.webm', '', 'vb9', '', 'camera-entree_20190323_232439', '2022-11-10 11:00:21.028136', '2022-11-10 11:00:21.028239', 169),
(45, 'zuidgorsstraat 9_ch1_20220405155243_20220405155619', 'Order Z001', '2022-11-10 11:00:21.095033', '2022-11-10 11:00:21.095043', 'Stadgenoot/Zuidgorsstraat/Converted/Order Z001/zuidgorsstraat 9_ch1_20220405155243_20220405155619.webm', '', 'vb9', '', 'zuidgorsstraat-9_ch1_20220405155243_20220405155619', '2022-11-10 11:00:21.095072', '2022-11-10 11:00:21.095175', 170),
(47, 'CCTV_ch9_H264', 'Order Sm001', '2022-11-10 11:00:21.378523', '2022-11-10 11:00:21.378533', 'Smit Electrotechniek/Bellstraat/Converted/Order Sm001/CCTV_ch9_H264.webm', '', 'vb9', '', 'cctv_ch9_h264', '2022-11-10 11:00:21.378563', '2022-11-10 11:00:21.378659', 173),
(48, 'Earth', 'Order Sm001', '2022-11-10 11:00:21.436645', '2022-11-10 11:00:21.436655', 'Smit Electrotechniek/Bellstraat/Converted/Order Sm001/Earth.webm', '', 'vb9', '', 'earth', '2022-11-10 11:00:21.436684', '2022-11-10 11:00:21.436779', 174),
(49, 'voordeur', 'Order001', '2022-11-10 11:00:21.495277', '2022-11-10 11:00:21.495287', 'Smit Electrotechniek/Bellstraat/Converted/Order001/voordeur.webm', '', 'vb9', '', 'voordeur', '2022-11-10 11:00:21.495317', '2022-11-10 11:00:21.495414', 175),
(50, 'auto', 'Order001', '2022-11-10 11:00:21.553640', '2022-11-10 11:00:21.553649', 'Smit Electrotechniek/Bellstraat/Converted/Order001/auto.webm', '', 'vb9', '', 'auto', '2022-11-10 11:00:21.553679', '2022-11-10 11:00:21.553774', 176),
(51, 'brommer', 'Order001', '2022-11-10 11:00:21.612002', '2022-11-10 11:00:21.612011', 'Smit Electrotechniek/Bellstraat/Converted/Order001/brommer.webm', '', 'vb9', '', 'brommer', '2022-11-10 11:00:21.612041', '2022-11-10 11:00:21.612137', 177),
(52, 'bunnyfull', 'Order 004', '2022-11-10 11:00:21.745377', '2022-11-10 11:00:21.745387', 'Berkhout/Kerkebuurt/Converted/Order 004/bunnyfull.webm', '', 'vb9', '', 'bunnyfull', '2022-11-10 11:00:21.745417', '2022-11-10 11:00:21.745512', 178),
(53, 'bunny', 'Order 004', '2022-11-10 11:00:21.903799', '2022-11-10 11:00:21.903808', 'Berkhout/Kerkebuurt/Converted/Order 004/bunny.webm', '', 'vb9', '', 'bunny', '2022-11-10 11:00:21.903838', '2022-11-10 11:00:21.903933', 180),
(60, 'achter', 'Order 002', '2022-11-10 11:00:22.303957', '2022-11-10 11:00:22.303966', 'Berkhout/Dorpsplein/Converted/Order 002/achter.webm', '', 'vb9', '', 'achter', '2022-11-10 11:00:22.303996', '2022-11-10 11:00:22.304092', 184),
(63, 'dahua1', 'Order003', '2022-11-10 14:38:36.662162', '2022-11-10 14:38:36.662175', 'Berkhout/Dorpstrraat/Converted/Order003/dahua1.webm', '', 'vb9', '', 'dahua1', '2022-11-10 14:38:36.662223', '2022-11-10 14:38:36.662946', 187),
(64, 'dahua2', 'Order003', '2022-11-10 14:38:36.720527', '2022-11-10 14:38:36.720538', 'Berkhout/Dorpstrraat/Converted/Order003/dahua2.webm', '', 'vb9', '', 'dahua2', '2022-11-10 14:38:36.720566', '2022-11-10 14:38:36.720675', 188),
(65, 'Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537', 'Order Abra 001', '2019-07-02 15:43:46.000000', '2019-07-02 15:55:37.000000', 'Stadgenoot/Abraham Kuyperstraat/Converted/Order Abra 001/Abraham Kuyperstraat 1-73_ch4_20190702174346_20190702175537.webm', '', 'vb9', '', 'abraham-kuyperstraat-1-73_ch4_20190702174346_20190702175537', '2022-11-10 14:39:34.397922', '2022-11-10 14:39:34.401826', 172),
(67, 'NVR_ch2_main_20221021104000_20221021104030', 'Order  th03', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Order  th03/NVR_ch2_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch2_main_20221021104000_20221021104030', '2022-11-10 14:51:13.078920', '2022-11-10 14:51:13.079105', 181),
(68, 'NVR_ch1_main_20221021104000_20221021104030', 'Order  th03', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Order  th03/NVR_ch1_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch1_main_20221021104000_20221021104030', '2022-11-10 14:51:13.113533', '2022-11-10 14:51:13.113740', 182),
(69, 'NVR_ch3_main_20221021104000_20221021104030', 'Orderth04', '2022-10-21 08:40:00.000000', '2022-10-21 08:40:30.000000', 'Berkhout/Kerkebuurt/Converted/Orderth04/NVR_ch3_main_20221021104000_20221021104030.webm', '', 'vb9', '', 'nvr_ch3_main_20221021104000_20221021104030', '2022-11-10 14:51:13.151932', '2022-11-10 14:51:13.152223', 183),
(70, 'NVR_ch1_main_20220926074805_20220926082402', 'Order K 001', '2022-09-26 05:48:05.000000', '2022-09-26 06:24:02.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20220926074805_20220926082402.webm', '', 'vb9', '', 'nvr_ch1_main_20220926074805_20220926082402', '2022-11-10 14:51:13.238907', '2022-11-10 14:51:13.239195', 182),
(71, 'NVR_ch1_main_20221018102500_20221018102800', 'Order K 001', '2022-10-18 08:25:00.000000', '2022-10-18 08:28:00.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102500_20221018102800.webm', '', 'vb9', '', 'nvr_ch1_main_20221018102500_20221018102800', '2022-11-10 14:51:13.280610', '2022-11-10 14:51:13.280909', 182),
(72, 'NVR_ch1_main_20221018102400_20221018102500', 'Order K 001', '2022-10-18 08:24:00.000000', '2022-10-18 08:25:00.000000', 'Berkhout/Kerkebuurt/Converted/Order K 001/NVR_ch1_main_20221018102400_20221018102500.webm', '', 'vb9', '', 'nvr_ch1_main_20221018102400_20221018102500', '2022-11-10 14:51:13.321922', '2022-11-10 14:51:13.322217', 182);

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
(20, 'camera', '0002_serviceorder_conversion_ready_and_more', '2022-11-10 15:10:53.146221');

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
('8p0xldzwcbqog4rrbf0qc2dzta9d0l8z', '.eJxVjEEOwiAURO_C2hAqP9Dv0r1nIB8GpWogKe3KeHdt0oVu5703LxVkXUpYe57DBHVSgzr8blHSI9cN4C711nRqdZmnqDdF77TrS0N-nnf376BIL9_6ynYQlwTZUzyyOB6jlwi4mJittwCRT46IwbCeSYDsDI_ZsAGp9wcBADhW:1osMvO:nhUH8kLb0JgOVt0GMf3HCPfA7MXBqNWVGVHoFXAZyNk', '2022-11-22 11:37:50.564240'),
('ju2opqwif4197jdtygfsvusej008bmjr', '.eJxVjEEOwiAQRe_C2hAGBgGX7nsGMjAoVUOT0q6Md7dNutDte-__t4i0LjWuvcxxZHERIE6_LFF-lrYLflC7TzJPbZnHJPdEHrbLYeLyuh7t30GlXre1UwUByXujIJhgyLnE4BHOWeWEJgCjIoXaMllDNyw-JPbZ67IBbcXnC7VTNzQ:1osMDU:_RnpP3najhyj0nItoHJxKU8Owa1PqKQIYxVSI0Xx_O4', '2022-11-22 10:52:28.049724');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=189;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `camera_log`
--
ALTER TABLE `camera_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `camera_serviceorder`
--
ALTER TABLE `camera_serviceorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
