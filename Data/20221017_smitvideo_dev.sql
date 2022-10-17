-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 17, 2022 at 07:53 PM
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
(1, 'pbkdf2_sha256$390000$pSKdyTt50QpZoSZJRA5asI$4hgLSdySnrUDW9B5lWCSzsuszAJ0HpXFO5B4j0azHqk=', '2022-10-15 20:04:12.506793', 1, 'django', '', '', 'jandeboer@gmail.com', 1, 1, '2022-09-20 17:52:09.829279');

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
(22, 'Stadspark', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'stadspark', '2022-10-17 13:10:17.136692', '2022-10-17 13:10:17.137086'),
(25, 'Dorpstraat 1', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'dorpstraat-1', '2022-10-17 13:42:51.766215', '2022-10-17 13:42:51.766524'),
(27, 'Kerkebuurt', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'kerkebuurt', '2022-10-17 16:07:57.866982', '2022-10-17 16:07:57.867054'),
(29, 'Converted', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'converted', '2022-10-17 17:51:13.163528', '2022-10-17 17:51:13.163603'),
(30, 'Smit\\ Electrotechniek', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'smit-electrotechniek', '2022-10-17 17:51:13.390076', '2022-10-17 17:51:13.390154');

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
(14, 'Kerkebuurt', 27, 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'kerkebuurt', '2022-10-17 16:07:57.889115', '2022-10-17 16:07:57.889236'),
(16, 'Smit\\ Electrotechniek', 30, 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'smit-electrotechniek', '2022-10-17 17:51:13.415699', '2022-10-17 17:51:13.415827');

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
(2, 'dahua 1', 'Dahua 23', '', '', '2022-09-23 14:16:12.000000', '', 'nvr-1', '2022-09-23 14:16:44.429870', '2022-10-07 09:39:41.746344', 8, 'Voorgevel Gemeente gebouw'),
(7, 'nvr 4', 'Dahua 2002', '', '', '2022-10-10 08:39:57.000000', '', 'nvr-4', '2022-10-10 08:39:57.505738', '2022-10-17 15:38:26.939821', 9, 'Fietsenstalling'),
(14, 'nvr 41', 'Dahau 2002', '', '', '2022-10-17 13:10:17.000000', '', 'nvr-41', '2022-10-17 13:10:17.241871', '2022-10-17 15:39:55.077498', 14, 'Bij de Ingang'),
(30, 'dahua 1', 'Dahua', '', '', '2022-10-17 13:42:51.000000', '', 'dahua-1', '2022-10-17 13:42:51.965600', '2022-10-17 15:12:59.796023', 16, 'Gemeentehuis Ingang'),
(33, 'dahua 3', 'Dahua 102', '', '', '2022-10-17 13:42:52.000000', '', 'dahua-3', '2022-10-17 13:42:52.157158', '2022-10-17 15:33:34.733705', 16, 'Bij de voordeur'),
(35, 'bosch 1', 'Bosch 102', '', '', '2022-10-17 13:42:52.000000', '', 'bosch-1', '2022-10-17 13:42:52.256828', '2022-10-17 15:43:08.611606', 16, 'kruip ruimte'),
(40, 'dahua 2', 'Daua 2022', '', '', '2022-10-17 13:42:52.000000', '', 'dahua-2', '2022-10-17 13:42:52.532318', '2022-10-17 15:12:23.652521', 16, 'Dorpshuis ingang'),
(61, 'dahua1', 'default', '', '', '2022-10-17 17:51:12.999606', '', 'dahua1', '2022-10-17 17:51:12.999636', '2022-10-17 17:51:12.999767', 27, 'default'),
(62, 'dahua2', 'default', '', '', '2022-10-17 17:51:13.049235', '', 'dahua2', '2022-10-17 17:51:13.049251', '2022-10-17 17:51:13.049364', 27, 'default'),
(63, 'bunnyfull', 'default', '', '', '2022-10-17 17:51:13.224388', '', 'bunnyfull', '2022-10-17 17:51:13.224405', '2022-10-17 17:51:13.224517', 28, 'default'),
(64, 'bunny', 'default', '', '', '2022-10-17 17:51:13.282909', '', 'bunny', '2022-10-17 17:51:13.282925', '2022-10-17 17:51:13.283039', 28, 'default'),
(65, 'earth', 'default', '', '', '2022-10-17 17:51:13.332348', '', 'earth', '2022-10-17 17:51:13.332364', '2022-10-17 17:51:13.332477', 28, 'default'),
(66, 'voordeur', 'default', '', '', '2022-10-17 17:51:13.457818', '', 'voordeur', '2022-10-17 17:51:13.457834', '2022-10-17 17:51:13.457946', 29, 'default'),
(67, 'auto', 'default', '', '', '2022-10-17 17:51:13.507564', '', 'auto', '2022-10-17 17:51:13.507581', '2022-10-17 17:51:13.507693', 29, 'default'),
(68, 'brommer', 'default', '', '', '2022-10-17 17:51:13.574243', '', 'brommer', '2022-10-17 17:51:13.574259', '2022-10-17 17:51:13.574370', 29, 'default');

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
(28, 'Converted', '', '', 'converted', '2022-10-17 17:51:13.201488', '2022-10-17 17:51:13.201626', 29, 14, 13),
(29, 'Converted', '', '', 'converted', '2022-10-17 17:51:13.439144', '2022-10-17 17:51:13.439284', 29, 16, 13);

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
(70, 'Order 001', '2022-10-17 17:51:13.597219', '2022-10-17 17:51:13.597245', 'WARNING: Default values added for video: brommer | brommer');

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
(1, '/home/jan/video/', '2022-09-12 00:00:00.000000', '2022-10-17 12:53:52.546484', 0);

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
(21, 'dahua1', '2022-10-17 17:51:13.016748', '2022-10-17 17:51:13.016761', 'Stadgenoot/Dorpstraat 1/Converted/Order003/dahua1.webm', 'vb9', '', 'dahua1', '2022-10-17 17:51:13.016812', '2022-10-17 17:51:13.016956', 61, 'Order003', ''),
(22, 'dahua2', '2022-10-17 17:51:13.116545', '2022-10-17 17:51:13.116554', 'Stadgenoot/Dorpstraat 1/Converted/Order003/dahua2.webm', 'vb9', '', 'dahua2', '2022-10-17 17:51:13.116584', '2022-10-17 17:51:13.116677', 62, 'Order003', ''),
(23, 'bunnyfull', '2022-10-17 17:51:13.250013', '2022-10-17 17:51:13.250023', 'Kerkebuurt/Converted/Order 004/bunnyfull.webm', 'vb9', '', 'bunnyfull', '2022-10-17 17:51:13.250052', '2022-10-17 17:51:13.250144', 63, 'Order 004', ''),
(24, 'bunny', '2022-10-17 17:51:13.299990', '2022-10-17 17:51:13.300000', 'Kerkebuurt/Converted/Order 004/bunny.webm', 'vb9', '', 'bunny', '2022-10-17 17:51:13.300030', '2022-10-17 17:51:13.300122', 64, 'Order 004', ''),
(25, 'earth', '2022-10-17 17:51:13.349880', '2022-10-17 17:51:13.349890', 'Kerkebuurt/Converted/Order 004/earth.webm', 'vb9', '', 'earth', '2022-10-17 17:51:13.349919', '2022-10-17 17:51:13.350011', 65, 'Order 004', ''),
(26, 'voordeur', '2022-10-17 17:51:13.475041', '2022-10-17 17:51:13.475051', 'Smit Electrotechniek/Converted/Order 001/voordeur.webm', 'vb9', '', 'voordeur', '2022-10-17 17:51:13.475081', '2022-10-17 17:51:13.475173', 66, 'Order 001', ''),
(27, 'auto', '2022-10-17 17:51:13.525028', '2022-10-17 17:51:13.525037', 'Smit Electrotechniek/Converted/Order 001/auto.webm', 'vb9', '', 'auto', '2022-10-17 17:51:13.525067', '2022-10-17 17:51:13.525160', 67, 'Order 001', ''),
(28, 'brommer', '2022-10-17 17:51:13.591755', '2022-10-17 17:51:13.591765', 'Smit Electrotechniek/Converted/Order 001/brommer.webm', 'vb9', '', 'brommer', '2022-10-17 17:51:13.591794', '2022-10-17 17:51:13.591886', 68, 'Order 001', '');

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
('awg4n9w121g0adog0xq3ywn0n4gfei16', '.eJxVjDsOwjAQBe_iGln-Lg4lfc5grXdXOIAcKU4qxN0hUgpo38y8l8q4rTVvXZY8sbooq06_W0F6SNsB37HdZk1zW5ep6F3RB-16nFme18P9O6jY67d2jiH4gOlsAEsBAow2okmuiPUEkihYQJE4sGEWz4mBLAyF2AQv6v0B4H44UQ:1ognvE:lPZDUzkCb6eJZrN6uxXs2F031ZD5yKpQWyrgU_W1umc', '2022-10-21 14:01:52.019231'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `camera_locatie`
--
ALTER TABLE `camera_locatie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `camera_log`
--
ALTER TABLE `camera_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `camera_parameter`
--
ALTER TABLE `camera_parameter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
