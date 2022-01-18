-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 24, 2021 at 02:20 PM
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
(33, 'Can add wijk', 9, 'add_wijk'),
(34, 'Can change wijk', 9, 'change_wijk'),
(35, 'Can delete wijk', 9, 'delete_wijk'),
(36, 'Can view wijk', 9, 'view_wijk'),
(37, 'Can add video', 10, 'add_video'),
(38, 'Can change video', 10, 'change_video'),
(39, 'Can delete video', 10, 'delete_video'),
(40, 'Can view video', 10, 'view_video'),
(41, 'Can add gebruiker', 11, 'add_gebruiker'),
(42, 'Can change gebruiker', 11, 'change_gebruiker'),
(43, 'Can delete gebruiker', 11, 'delete_gebruiker'),
(44, 'Can view gebruiker', 11, 'view_gebruiker');

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
(1, 'pbkdf2_sha256$216000$eFRrtfcQuEsY$poGgK0DOIlVaTxCuD2bVpRrbN8NHM7Wu8D7h4zMENGE=', '2021-12-23 15:10:14.958669', 1, 'django', '', '', 'jandeboer@gmail.com', 1, 1, '2021-12-14 14:55:15.831614');

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
  `image` varchar(100) DEFAULT NULL,
  `telefoon` varchar(16) NOT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `website` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `adres`, `postcode`, `plaats`, `land`, `image`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `email`, `website`) VALUES
(1, 'Brandweer Volendam', 'Julianaweg  137B', '1131DH', 'Volendam', 'Nederland', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2021-12-23 15:32:45.734413', 'info@bedrijf.nl', ''),
(2, 'Politie Purmerend', 'Component 96', '', 'Purmerend', 'Nederland', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-23 16:39:13.865644', 'info@bedrijf.nl', ''),
(3, 'Firma Tol Visbedrijf', 'Viskade 2', '1111AA', 'Volendam', 'Nederland', '', '0229-123456', '', 'firma-tol-visbedrijf', '2021-12-14 15:01:44.000000', '2021-12-24 08:14:21.214277', 'info@bedrijf.nl', ''),
(4, 'Stadswoningen', 'Stadsplein 1', '1000AA', 'Volendam', 'Nederland', '', '020-110110', '', 'stadswoningen', '2021-12-22 14:43:49.461489', '2021-12-23 15:28:22.064365', 'info@bedrijf.nl', ''),
(5, 'Kees Garnalen BV', 'Tolstraat 1', '1679TA', 'Berkhout', 'Netherlands', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786', 'info@bedrijf.nl', ''),
(6, 'Smit Electrotechniek', 'Bellstraat 3', '1131JV', 'Volendam', 'Nederland', '', '0229-363889', '', 'smit-electrotechniek', '2021-12-23 14:39:01.084730', '2021-12-23 14:39:01.085667', 'info@bedrijf.nl', '');

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
  `wijk_id` int(11) NOT NULL,
  `bedrijf_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_camera`
--

INSERT INTO `camera_camera` (`id`, `naam`, `type`, `gps_locatie`, `image`, `datum_geplaatst`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `wijk_id`, `bedrijf_id`) VALUES
(1, 'Ingang Buro Edam', 'Videomaster', '', '', '2021-12-14 15:10:50.000000', '', 'ingang-buro-edam', '2021-12-14 15:10:50.000000', '2021-12-14 15:18:59.291551', 1, 1),
(2, 'Ingang Buro', 'Videomaster', '', '', '2021-12-14 15:17:58.000000', '', 'ingang-buro', '2021-12-14 15:17:58.000000', '2021-12-14 15:18:21.214808', 2, 1),
(3, 'Plein Noord', 'Videomaster', '', '', '2021-12-22 15:06:56.000000', '', 'plein-noord', '2021-12-22 15:06:56.000000', '2021-12-22 15:07:51.122696', 4, 4),
(4, 'Plein Zuid', 'Videomaster 1', '', '', '2021-12-22 15:07:55.000000', '', 'plein-zuid', '2021-12-22 15:07:55.000000', '2021-12-22 15:08:32.568655', 6, 4);

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
  `bedrijf_id` int(11) NOT NULL,
  `email` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_gebruiker`
--

INSERT INTO `camera_gebruiker` (`id`, `user`, `password`, `naam`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `email`) VALUES
(1, 'jan', 'test1', 'Jan de Boer', '0299 363 889', '', 'jan-de-boer', '2021-12-14 15:06:35.000000', '2021-12-23 14:24:00.388987', 1, 'jandeboer@gmail.com'),
(2, 'Orson', 'Test1', 'Orson Joon', '0299 363 889', '', 'orson-joon', '2021-12-14 15:07:29.000000', '2021-12-14 15:07:56.220845', 1, 'info@smitelektrotechniek.nl'),
(3, 'Sint', '', 'Sinterklaas', '0299 363 889', '', 'sinterklaas', '2021-12-23 14:33:18.300634', '2021-12-23 14:33:54.520906', 4, 'sint@smitelektrotechniek.nl');

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
(1, 'Video 1', '2021-12-14 21:05:25.000000', '2021-12-14 21:05:25.000000', '', '', '', '', 'video-1', '2021-12-14 21:05:26.000000', '2021-12-22 15:04:46.379354', 2),
(2, 'Video 3', '2021-12-14 00:00:00.000000', '2021-12-14 06:00:00.000000', '', '', '', '', 'video-3', '2021-12-14 21:06:04.000000', '2021-12-22 15:06:08.588400', 2),
(3, 'Video 4', '2021-12-22 15:08:41.000000', '2021-12-22 15:08:41.000000', '', '', '', '', 'video-4', '2021-12-22 15:08:41.000000', '2021-12-22 15:09:22.873181', 3),
(4, 'Vide0 2', '2021-12-22 15:09:47.000000', '2021-12-22 15:09:47.000000', '', '', '', '', 'vide0-2', '2021-12-22 15:09:47.000000', '2021-12-22 15:10:17.391814', 4);

-- --------------------------------------------------------

--
-- Table structure for table `camera_wijk`
--

CREATE TABLE `camera_wijk` (
  `id` int(11) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `memo` longtext NOT NULL,
  `slug` varchar(120) NOT NULL,
  `datum_inserted` datetime(6) NOT NULL,
  `datum_updated` datetime(6) NOT NULL,
  `bedrijf_id` int(11) NOT NULL,
  `plaats` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `camera_wijk`
--

INSERT INTO `camera_wijk` (`id`, `naam`, `image`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `bedrijf_id`, `plaats`) VALUES
(1, 'Buro Edam', '', '', 'buro-edam', '2021-12-14 15:08:05.000000', '2021-12-23 16:49:26.965946', 2, ''),
(2, 'Buro Volendam', '', '', 'buro-volendam', '2021-12-14 15:10:02.000000', '2021-12-23 16:47:09.066872', 2, ''),
(3, 'Stadsdeel Oost', '', '', 'stadsdeel-oost', '2021-12-22 14:45:17.000000', '2021-12-22 14:49:11.422761', 4, ''),
(4, 'Stadsdeel  Noord', '', '', 'stadsdeel-noord', '2021-12-22 14:53:27.000000', '2021-12-22 14:53:53.938564', 4, ''),
(5, 'Stadsdeel West', '', '', 'stadsdeel-west', '2021-12-22 14:53:56.000000', '2021-12-22 14:54:37.753094', 4, ''),
(6, 'Stadsdeel Zuid', '', '', 'stadsdeel-zuid', '2021-12-22 14:54:39.000000', '2021-12-22 14:56:10.930893', 4, '');

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
(1, '2021-12-14 14:58:28.739943', '1', 'Brandweer Volendam', 1, '[{\"added\": {}}]', 7, 1),
(2, '2021-12-14 15:01:38.625935', '2', 'Politie PURMEREND', 1, '[{\"added\": {}}]', 7, 1),
(3, '2021-12-14 15:01:44.191404', '2', 'Politie PURMEREND', 2, '[]', 7, 1),
(4, '2021-12-14 15:02:35.065553', '3', 'Tol visbedijf', 1, '[{\"added\": {}}]', 7, 1),
(5, '2021-12-14 15:07:18.932635', '1', 'Jan de Boer', 1, '[{\"added\": {}}]', 11, 1),
(6, '2021-12-14 15:07:56.224071', '2', 'Orson Joon', 1, '[{\"added\": {}}]', 11, 1),
(7, '2021-12-14 15:09:21.431764', '1', 'Edam', 1, '[{\"added\": {}}]', 9, 1),
(8, '2021-12-14 15:09:57.761023', '1', 'Buro Edam', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Bedrijf\"]}}]', 9, 1),
(9, '2021-12-14 15:10:36.069297', '2', 'Buro Volendam', 1, '[{\"added\": {}}]', 9, 1),
(10, '2021-12-14 15:12:13.126466', '1', 'Ingag', 1, '[{\"added\": {}}]', 8, 1),
(11, '2021-12-14 15:12:33.756216', '1', 'Ingag Buro', 2, '[{\"changed\": {\"fields\": [\"Naam\"]}}]', 8, 1),
(12, '2021-12-14 15:18:21.218587', '2', 'Ingang Buro', 1, '[{\"added\": {}}]', 8, 1),
(13, '2021-12-14 15:18:59.295303', '1', 'Ingang Buro Edam', 2, '[{\"changed\": {\"fields\": [\"Naam\"]}}]', 8, 1),
(14, '2021-12-14 21:06:00.232104', '1', 'Video 1', 1, '[{\"added\": {}}]', 10, 1),
(15, '2021-12-14 21:06:51.960274', '2', 'Video2', 1, '[{\"added\": {}}]', 10, 1),
(16, '2021-12-22 14:45:49.264730', '3', 'Stadseel Noord', 1, '[{\"added\": {}}]', 9, 1),
(17, '2021-12-22 14:46:59.911663', '3', 'Stadseel West', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Contact naam\", \"Slug\"]}}]', 9, 1),
(18, '2021-12-22 14:47:41.175283', '3', 'Stadseel Zuid', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Contact naam\", \"Slug\"]}}]', 9, 1),
(19, '2021-12-22 14:48:07.595641', '3', 'Stadseel Oost', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Contact naam\", \"Slug\"]}}]', 9, 1),
(20, '2021-12-22 14:49:11.425825', '3', 'Stadsdeel Oost', 2, '[{\"changed\": {\"fields\": [\"Naam\"]}}]', 9, 1),
(21, '2021-12-22 14:53:53.940891', '4', 'Stadsdeeel  Noord', 1, '[{\"added\": {}}]', 9, 1),
(22, '2021-12-22 14:54:37.793580', '5', 'Stadsdeel West', 1, '[{\"added\": {}}]', 9, 1),
(23, '2021-12-22 14:56:10.934652', '6', 'Stadsdeel Zuid', 1, '[{\"added\": {}}]', 9, 1),
(24, '2021-12-22 15:04:46.382419', '1', 'Video 1', 2, '[]', 10, 1),
(25, '2021-12-22 15:06:08.607890', '2', 'Video 3', 2, '[{\"changed\": {\"fields\": [\"Naam\", \"Bedrijf\", \"Camera\"]}}]', 10, 1),
(26, '2021-12-22 15:07:51.125102', '3', 'Plein Noord', 1, '[{\"added\": {}}]', 8, 1),
(27, '2021-12-22 15:08:32.571452', '4', 'Plein Zuid', 1, '[{\"added\": {}}]', 8, 1),
(28, '2021-12-22 15:09:22.875656', '3', 'Video 4', 1, '[{\"added\": {}}]', 10, 1),
(29, '2021-12-22 15:10:17.395513', '4', 'Vide0 2', 1, '[{\"added\": {}}]', 10, 1);

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
(11, 'camera', 'gebruiker'),
(10, 'camera', 'video'),
(9, 'camera', 'wijk'),
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
(1, 'contenttypes', '0001_initial', '2021-12-14 14:47:15.686671'),
(2, 'auth', '0001_initial', '2021-12-14 14:47:18.965212'),
(3, 'admin', '0001_initial', '2021-12-14 14:47:28.702458'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-14 14:47:32.307353'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-14 14:47:32.465532'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-14 14:47:34.525706'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-14 14:47:36.016044'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-14 14:47:36.232462'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-14 14:47:36.339202'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-14 14:47:37.551924'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-14 14:47:37.644867'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-14 14:47:37.715217'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-14 14:47:39.353874'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-14 14:47:40.654886'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-14 14:47:40.789092'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-14 14:47:40.884307'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-14 14:47:42.330445'),
(18, 'camera', '0001_initial', '2021-12-14 14:47:46.543897'),
(19, 'sessions', '0001_initial', '2021-12-14 14:47:56.893006'),
(20, 'camera', '0002_auto_20211214_1517', '2021-12-14 15:17:22.622077'),
(21, 'camera', '0003_auto_20211222_1503', '2021-12-22 15:04:02.596553'),
(22, 'camera', '0004_gebruiker_email', '2021-12-22 18:10:31.739993'),
(23, 'camera', '0005_auto_20211224_0748', '2021-12-24 07:49:17.903725'),
(24, 'camera', '0006_bedrijf_website', '2021-12-24 08:02:26.681422');

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
('blkkb44mmcjrjub8cge1g9p16s7a8rsk', '.eJxVjM0OwiAQhN-FsyH8rAIevfcZyC4sUjU0Ke3J-O62SQ96m8z3zbxFxHWpce08xzGLq9Di9NsRpie3HeQHtvsk09SWeSS5K_KgXQ5T5tftcP8OKva6rR0p1EZRgYCZPAcFTOCsgUBep2DLORhbrC8aYUvgLpRd0eyyUcok8fkC2pw3bg:1n0PjT:78gPxBtDl1kM-2H6Vxw31oifbBWUPMyN6xl9569diw0', '2022-01-06 15:10:15.151309'),
('c76oubfgm9kt7b7icev79xcclyi9rjfs', '.eJxVjM0OwiAQhN-FsyH8rAIevfcZyC4sUjU0Ke3J-O62SQ96m8z3zbxFxHWpce08xzGLq9Di9NsRpie3HeQHtvsk09SWeSS5K_KgXQ5T5tftcP8OKva6rR0p1EZRgYCZPAcFTOCsgUBep2DLORhbrC8aYUvgLpRd0eyyUcok8fkC2pw3bg:1n0LE8:6IjNcKCdisDhii0vIQ5QIczBrYyBRqPWkm197Wr5AFM', '2022-01-06 10:21:36.869880'),
('g1a6bof5h2nvlome7j51duywjh5zwa2k', '.eJxVjDkOwjAUBe_iGlm2871ASc8ZrL9BAiiR4qRC3B0ipYD2zcx7mYrr0te16VwHMSfjzeF3I-SHjhuQO463yfI0LvNAdlPsTpu9TKLP8-7-HfTY-m9dwBensQBl32kAAeUERYGgCxIUY-bE4So5dkmRIuCRMIFnyo6zM-8P0iQ3yg:1mzgkc:ABQr0KauHCK4Va-oPNf2oXjZVHW2-4LxBS3rd62lQxE', '2022-01-04 15:08:26.053342'),
('g4xaovlon461toa0xcw3boqv7pb47o9f', '.eJxVjM0OwiAQhN-FsyH8rAIevfcZyC4sUjU0Ke3J-O62SQ96m8z3zbxFxHWpce08xzGLq9Di9NsRpie3HeQHtvsk09SWeSS5K_KgXQ5T5tftcP8OKva6rR0p1EZRgYCZPAcFTOCsgUBep2DLORhbrC8aYUvgLpRd0eyyUcok8fkC2pw3bg:1n0LFj:NO6tE-2wrvdJYN6rC_mwh4oSS3-XcTfDR-CqXrNhADg', '2022-01-06 10:23:15.316217'),
('ris9mktnoj8syhb0mlg9aenakvinprsf', '.eJxVjM0OwiAQhN-FsyH8rAIevfcZyC4sUjU0Ke3J-O62SQ96m8z3zbxFxHWpce08xzGLq9Di9NsRpie3HeQHtvsk09SWeSS5K_KgXQ5T5tftcP8OKva6rR0p1EZRgYCZPAcFTOCsgUBep2DLORhbrC8aYUvgLpRd0eyyUcok8fkC2pw3bg:1n01ur:lnPUDnAOdg-aBfMPeTpQTK0WgxzVyb2Ksv3XlLDcf4M', '2022-01-05 13:44:25.951426');

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
  ADD KEY `camera_bedrijf_slug_6cf0579f` (`slug`);

--
-- Indexes for table `camera_camera`
--
ALTER TABLE `camera_camera`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `naam` (`naam`),
  ADD UNIQUE KEY `camera_camera_naam_bedrijf_id_locatie_id_cc976f17_uniq` (`naam`,`bedrijf_id`,`wijk_id`),
  ADD KEY `camera_camera_slug_9c14c40a` (`slug`),
  ADD KEY `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` (`bedrijf_id`),
  ADD KEY `camera_camera_wijk_id_2f439d92_fk_camera_wijk_id` (`wijk_id`);

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
-- AUTO_INCREMENT for table `camera_bedrijf`
--
ALTER TABLE `camera_bedrijf`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `camera_camera`
--
ALTER TABLE `camera_camera`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `camera_video`
--
ALTER TABLE `camera_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

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
  ADD CONSTRAINT `camera_camera_bedrijf_id_661cd7af_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`),
  ADD CONSTRAINT `camera_camera_wijk_id_2f439d92_fk_camera_wijk_id` FOREIGN KEY (`wijk_id`) REFERENCES `camera_wijk` (`id`);

--
-- Constraints for table `camera_gebruiker`
--
ALTER TABLE `camera_gebruiker`
  ADD CONSTRAINT `camera_gebruiker_bedrijf_id_d690ec4b_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`);

--
-- Constraints for table `camera_video`
--
ALTER TABLE `camera_video`
  ADD CONSTRAINT `camera_video_camera_id_306b84c4_fk_camera_camera_id` FOREIGN KEY (`camera_id`) REFERENCES `camera_camera` (`id`);

--
-- Constraints for table `camera_wijk`
--
ALTER TABLE `camera_wijk`
  ADD CONSTRAINT `camera_wijk_bedrijf_id_c591b2eb_fk_camera_bedrijf_id` FOREIGN KEY (`bedrijf_id`) REFERENCES `camera_bedrijf` (`id`);

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
