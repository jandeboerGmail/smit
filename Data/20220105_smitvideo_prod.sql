-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 05, 2022 at 07:22 PM
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
(44, 'Can view video', 11, 'view_video');

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
(1, 'pbkdf2_sha256$260000$aH1ABS7nFL3OS2Y2RRdGKc$cPdRXWP1sjjPTkdZnD0tb/m5V8g3aF6GWv/UDyu1oSI=', '2022-01-05 17:38:47.056874', 1, 'django', 'Jan', 'de Boer', 'jandeboer@gmail.com', 1, 1, '2021-12-24 13:13:33.000000'),
(2, 'pbkdf2_sha256$260000$mrThJj21hEaJyqhzKjUuin$HnX8Cq7nWjnISDREXZeia7kx15pekyCAbuQjVgHrWx0=', '2021-12-31 09:19:28.641859', 1, 'orson', 'orson', 'Joon', 'orsonjoon1@gmail.com', 1, 1, '2021-12-29 09:58:16.000000');

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
-- Table structure for table `camera_bedrijf`
--

CREATE TABLE `camera_bedrijf` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `postcode` varchar(6) NOT NULL,
  `plaats` varchar(50) NOT NULL,
  `land` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `adres`, `postcode`, `plaats`, `land`, `email`, `website`, `image`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `contact_id`) VALUES
(1, 'Brandweer Volendam', 'Julianaweg  137B', '1131DH', 'Volendam', 'Nederland', 'info@bedrijf.nl', '', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2021-12-24 14:28:08.249174', 6),
(2, 'Politie Purmerend', 'Component 96', '1000AA', 'Purmerend', 'Nederland', 'info@bedrijf.nl', '', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-24 14:31:12.949985', 7),
(3, 'Firma Tol Visbedrijf', 'Viskade 2', '1111AA', 'Volendam', 'Nederland', 'info@bedrijf.nl', '', '', '0229-123456', '', 'firma-tol-visbedrijf', '2021-12-14 15:01:44.000000', '2021-12-24 14:33:59.257053', 8),
(4, 'Stadsgenoot', 'Stadsplein 1', '1000AA', 'Volendam', 'Nederland', 'info@bedrijf.nl', '', '', '020-110110', '', 'stadsgenoot', '2021-12-22 14:43:49.461489', '2021-12-29 15:40:56.462088', 9),
(5, 'Kees Garnalen BV', 'Tolstraat 1', '1679TA', 'Berkhout', 'Netherlands', 'info@bedrijf.nl', '', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786', 2),
(6, 'Smit Electrotechniek', 'Bellstraat 3', '1131JV', 'Volendam', 'Nederland', 'info@bedrijf.nl', '', '', '0229-363889', '', 'smit-electrotechniek', '2021-12-23 14:39:01.084730', '2021-12-24 14:31:34.113242', 3);

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
  `wijk_id` int(11) NOT NULL,
  `locatie` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `wijk_id`, `locatie`) VALUES
(1, 'Ingang Buro Edam', 'Videomaster', '', '', '2021-12-14 15:10:50.000000', '', 'ingang-buro-edam', '2021-12-14 15:10:50.000000', '2021-12-27 11:56:28.878695', 1, 1, 'Aan de Paal'),
(2, 'Ingang Buro', 'Videomaster', '', '', '2021-12-14 15:17:58.000000', '', 'ingang-buro', '2021-12-14 15:17:58.000000', '2021-12-27 11:56:09.577064', 1, 2, 'Op het dak'),
(3, 'Plein Noord', 'Videomaster', '', '', '2021-12-22 15:06:56.000000', '', 'plein-noord', '2021-12-22 15:06:56.000000', '2021-12-27 11:57:06.727835', 4, 4, 'In de lichtmast'),
(4, 'Plein Zuid', 'Videomaster 1', '', '', '2021-12-22 15:07:55.000000', '', 'plein-zuid', '2021-12-22 15:07:55.000000', '2021-12-27 11:58:18.825169', 4, 6, 'In het verkeerslicht'),
(5, 'Camera 1', '', '', '', '2021-12-24 15:34:04.469881', '', 'camera-1', '2021-12-24 15:34:04.469896', '2021-12-25 08:53:28.481828', 2, 1, 'Ingang Buro'),
(6, 'Cam 2', '', '', '', '2021-12-25 08:48:55.102762', '', 'cam-2', '2021-12-25 08:48:55.102783', '2021-12-25 08:48:55.113805', 3, 1, 'Op het Dak'),
(7, 'Brommer Stalling', '', '', '', '2021-12-31 09:57:21.924133', '', 'brommer-stalling', '2021-12-31 09:57:21.924152', '2021-12-31 09:57:21.961277', 6, 3, 'locatie');

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
  `camera_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_video`
--

INSERT INTO `camera_video` (`id`, `naam`, `opname_van`, `opname_tot`, `video_image`, `video_link`, `codec`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `camera_id`) VALUES
(1, 'Voordeur', '2021-12-14 21:05:25.000000', '2021-12-15 21:05:25.000000', '', 'Voordeur264.mp4', 'h264', '', 'voordeur-264', '2021-12-14 21:05:26.000000', '2021-12-27 18:40:01.536469', 2),
(2, 'Auto 265', '2021-12-14 00:00:00.000000', '2021-12-14 06:00:00.000000', '', 'Auto265.mp4', 'h265', '', 'auto-265', '2021-12-14 21:06:04.000000', '2022-01-05 16:01:06.808116', 2),
(3, 'Earth', '2021-12-22 15:08:41.000000', '2021-12-22 15:08:41.000000', '', 'Earth.mp4', 'h264', '', 'earth', '2021-12-22 15:08:41.000000', '2021-12-27 18:41:33.568474', 3),
(4, 'Auto 264', '2021-12-22 15:09:47.000000', '2021-12-22 15:09:47.000000', '', 'Auto264.mp4', 'h264', '', 'auto-264', '2021-12-22 15:09:47.000000', '2022-01-05 15:48:14.440549', 4),
(5, 'Brommer 265', '2021-12-27 12:11:03.000000', '2021-12-27 12:11:03.000000', '', 'Brommer265.mp4', 'h265', '', 'brommer-265', '2021-12-27 12:11:29.000000', '2022-01-05 15:44:13.160288', 1),
(6, 'Brommer 264', '2021-12-31 09:55:46.000000', '2021-12-31 09:55:46.000000', '', 'Brommer264.mp4', 'h264', '', 'brommer-264', '2021-12-31 09:56:31.649301', '2022-01-05 15:32:20.510424', 7);

-- --------------------------------------------------------

--
-- Table structure for table `camera_wijk`
--

CREATE TABLE `camera_wijk` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `plaats` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_wijk`
--

INSERT INTO `camera_wijk` (`id`, `naam`, `plaats`, `image`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `contact_id`) VALUES
(1, 'Buro Edam', 'Edam', '', '', 'buro-edam', '2021-12-14 15:08:05.000000', '2021-12-24 14:34:48.782537', 2, 7),
(2, 'Buro Volendam', 'Volendam', '', '', 'buro-volendam', '2021-12-14 15:10:02.000000', '2021-12-24 14:34:58.951301', 2, 5),
(3, 'Stadsdeel Oost', 'Amsterdam', '', '', 'stadsdeel-oost', '2021-12-22 14:45:17.000000', '2021-12-24 14:35:15.895468', 4, 4),
(4, 'Stadsdeel  Noord', 'Amsterdam', '', '', 'stadsdeel-noord', '2021-12-22 14:53:27.000000', '2021-12-24 14:35:51.765778', 4, 4),
(5, 'Stadsdeel West', 'Amsterdam', '', '', 'stadsdeel-west', '2021-12-22 14:53:56.000000', '2021-12-24 14:35:30.185074', 4, 4),
(6, 'Stadsdeel Zuid', 'Amsterdam', '', '', 'stadsdeel-zuid', '2021-12-22 14:54:39.000000', '2021-12-24 14:35:42.069633', 4, 4),
(7, 'Slotervaart', 'Volendam', '', '', 'slotervaart', '2021-12-25 08:30:40.416483', '2021-12-25 08:30:40.425079', 1, 6),
(8, 'Visserswijk', 'Volendam', '', '', 'visserswijk', '2021-12-25 08:34:33.891628', '2021-12-25 08:34:33.899343', 3, 8);

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
(21, 'camera', '0003_auto_20211227_1311', '2021-12-27 13:11:46.452112');

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
('32sy9vape9uv8w8iql2ivs030z1z2o4p', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n58fj:fwS8iKAp1784yN0eftpmGDjB55QzMNQgGGNxZQIQ1bc', '2022-01-19 15:57:55.392191'),
('3yzgdop1monh1j6e6cjtlomsodhubta3', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n53EX:1JwSz2WHHF45tLkpKAbUeQbRQhnVG96_4LfixsFabNs', '2022-01-19 10:09:29.536406'),
('55y1wpg21yo3qpfx22ktdf48t4yrt1h1', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n0l2F:0KiEbDklOjcOn_6cAoghTGVuW1Gv0vWYFodEd9fSm9M', '2022-01-07 13:55:03.670168'),
('6tcf4tefl2zo3ul214bipjrdnoysu012', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2W8V:Y3rXy3G-p0cVbYfnjDs-ngHHQcEni4n610KeOUcCD_s', '2022-01-12 10:24:47.571561'),
('80nkji5vi744asa68nnbr4hc4xwtx7uu', '.eJxVjMsOwiAQRf-FtSEUGCku3fcbyDAzSNWUpI-V8d-1SRe6veec-1IJt7WmbZE5jawuyqrT75aRHjLtgO843ZqmNq3zmPWu6IMuemgsz-vh_h1UXOq3zj0CkoHu3HH2oQQDQcBFJiEIzhSQ3jN5th4LiQeKLpMVXzCbUqJ6fwD3ADjz:1n3CEN:-WD7W6ke-6ps4jQJyrmeWgnrbwEqKm_CGukGbzRH1os', '2022-01-14 07:21:39.969525'),
('d5gubkbfdvxzga9l6l0pmbkdrzbdxtan', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2Vse:_HXur2oRnIZ8nzyeYOExdJ2POPKW2DFxJTWOqz2ol-U', '2022-01-12 10:08:24.032474'),
('di6yljg39m9pwz0fe52cvp1icxmo54an', '.eJxVjEEOwiAQRe_C2hAYYaAu3fcMZIBBqqYkpV0Z765NutDtf-_9lwi0rTVsnZcwZXERIE6_W6T04HkH-U7zrcnU5nWZotwVedAux5b5eT3cv4NKvX5r51Uij0URFpsoAlkGHtBjjNYaQM-ZNCDpwTmvCbTRqRQEGNioM4j3B-dzN24:1n2Vxp:6i6TUvxAsebQF6d1fi7ntm8gX9AIl-VwYNoDkr9_wfA', '2022-01-12 10:13:45.549123'),
('hfftn79bgv1wiu6aojn7a5wyedqas6rb', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n5AFL:LvGsvf_nkaIQs997M6pGdrjw_GyhgKCDsMf0zfSe3sU', '2022-01-19 17:38:47.382770'),
('ibbkq6qw809q6kl0b6a8kels6jusgjam', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n4KPm:w2RgKPnymH2StukKUiOpiiRqThPUhB24WWfpYW4-7yM', '2022-01-17 10:18:06.883601'),
('n2wvmrn81zcuenzgj466jxjb7uz3l2ej', '.eJxVjEEOwiAQRe_C2pAyhSlx6d4zkIEZpGogKe3KeHdt0oVu_3vvv1SgbS1h67KEmdVZGXX63SKlh9Qd8J3qrenU6rrMUe-KPmjX18byvBzu30GhXr41eJ-IGdBYctkJMEzRjQJZImWTHSawJqOZiNAP6CGPYL2LAAZxQPX-AO6vN2c:1n1rcb:Sju9Tp-HPoezChqcE81yxAmVgxRVQ3ONUvCe5B66MfE', '2022-01-10 15:09:09.431300'),
('of2bete1c0mf4cmhv8qk5t8mv70by39f', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n3C4q:I4ml9bLU1Z50cZrYwjopKcA5fshEv9S506Mmwz28SzU', '2022-01-14 07:11:48.797325'),
('qxw7er1lnmj0t3qbtgd7teq16q0r3b61', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n3GSo:GVKIuHC-KglU9srgOeL6J5pTV4_92FtU-EHBpIIRfH4', '2022-01-14 11:52:50.611693'),
('y8pfs0471ovne6xue80r60c6vuvftkc0', '.eJxVjEEOgjAQRe_StWkYWlpw6Z4zNNOZjkVNSSisjHcXEha6fe_9_1YBtzWHraYlTKyuCtTll0WkZyqH4AeW-6xpLusyRX0k-rRVjzOn1-1s_w4y1ryvHQK1g0lCHfoEru_Ze27sIEwWwccmEuw8sUEx0EWwYpyHlqIREFCfL_ZAOFA:1n3FXw:46MdQU6Cc5QEk7yMXoeV5TmkGfTIAg-F1crYkFZr_bU', '2022-01-14 10:54:04.456051'),
('zkm90r3zopvhfo52uywwd8ormip634a9', '.eJxVjMsOwiAQRf-FtSEUGCku3fcbyDAzSNWUpI-V8d-1SRe6veec-1IJt7WmbZE5jawuyqrT75aRHjLtgO843ZqmNq3zmPWu6IMuemgsz-vh_h1UXOq3zj0CkoHu3HH2oQQDQcBFJiEIzhSQ3jN5th4LiQeKLpMVXzCbUqJ6fwD3ADjz:1n3E4O:6KhXwKiInP8ZPTW9-3_W84wePnZjDbNAYKQ4MKXZNMY', '2022-01-14 09:19:28.694479'),
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
-- Indexes for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_bedrijf_contact_id_ef402b2c_fk_camera_gebruiker_id` (`contact_id`),
  ADD KEY `camera_bedrijf_slug_6cf0579f` (`slug`);

--
-- Indexes for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD UNIQUE KEY `camera_camera_naam_bedrijf_id_wijk_id_59eeda16_uniq` (`naam`,`bedrijf_id`,`wijk_id`),
  ADD KEY `camera_camera_wijk_id_2f439d92_fk_camera_wijk_id` (`wijk_id`),
  ADD KEY `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_camera_slug_9c14c40a` (`slug`);

--
-- Indexes for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_gebruiker_slug_1691fc8f` (`slug`);

--
-- Indexes for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD KEY `camera_video_camera_id_306b84c4_fk_camera_camera_id` (`camera_id`),
  ADD KEY `camera_video_slug_8e2824f8` (`slug`);

--
-- Indexes for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camera_wijk_bedrijf_id_c591b2eb_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_wijk_contact_id_8340dfd0_fk_camera_gebruiker_id` (`contact_id`),
  ADD KEY `camera_wijk_slug_65f2b4da` (`slug`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

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
  ADD CONSTRAINT `camera_bedrijf_contact_id_ef402b2c_fk_camera_gebruiker_id` FOREIGN KEY (`contact_id`) REFERENCES `camera_gebruiker` (`id`);

--
-- Constraints for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD CONSTRAINT `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_camera_wijk_id_2f439d92_fk_camera_wijk_id` FOREIGN KEY (`wijk_id`) REFERENCES `camera_wijk` (`id`);

--
-- Constraints for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD CONSTRAINT `camera_video_camera_id_306b84c4_fk_camera_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera_camera` (`id`);

--
-- Constraints for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  ADD CONSTRAINT `camera_wijk_bedrijf_id_c591b2eb_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_wijk_contact_id_8340dfd0_fk_camera_gebruiker_id` FOREIGN KEY (`contact_id`) REFERENCES `camera_gebruiker` (`id`);

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
