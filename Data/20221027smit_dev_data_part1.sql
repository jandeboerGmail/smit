SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+02:00";

--
-- Database: `smitvideo_dev`
--

--
-- Dumping data for table `camera_adress`
--

INSERT INTO `camera_adress` (`id`, `naam`, `straat`, `postcode`, `plaats`, `land`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Stadgenoot', 'Stadsplein 1', '1000AA', 'Amsterdam', 'Nederland', '', 'stadgenoot', '2022-09-21 08:35:37.547255', '2022-09-21 08:35:37.548133'),
(2, 'Smit Electrotechniek', 'Bellstraat 3', '1131JV', 'Volendam', 'Nederland', '', 'smit-electrotechniek', '2022-09-21 09:00:02.426444', '2022-09-21 09:00:02.427923'),
(4, 'Brandweer Volendam', 'Brandstraat 1', '1131AD', 'Volendam', 'Nederland', '', 'brandweer-volendam', '2022-09-23 12:49:56.078694', '2022-09-23 12:55:41.828225'),
(5, 'Politie Purmerend', 'Snelweg 5', '1441AD', 'Purmerend', 'Nederland', '', 'politie-purmerend', '2022-09-23 12:52:14.644682', '2022-09-23 12:52:14.645584'),
(6, 'Zuidgorsstraat', 'Zuidgorsstraat 9', '1025AW', 'Amsterdam', 'Nederland', '', 'zuidgorsstraat', '2022-09-23 12:54:49.946164', '2022-09-23 12:54:49.947149'),
(14, 'Default', 'Straatnaam 1', '0000AA', 'Plaats', 'Nederland', '', 'default', '2022-10-06 12:14:13.964973', '2022-10-06 12:14:13.965054'),
(19, 'Dorpsplein', 'Plein  1', '1234AA', 'Berkhout', 'Nederland', '', 'dorpsplein', '2022-10-06 15:03:05.665315', '2022-10-24 06:48:33.373871'),
(22, 'Stadspark', 'Stadspark 1', '2481ED', 'Den Haag', 'Nederland', '', 'stadspark', '2022-10-17 13:10:17.136692', '2022-10-24 11:26:13.122748'),
(25, 'Dorpstraat', 'Brink 1', '2100AA', 'Berkhout', 'Nederland', '', 'dorpstraat', '2022-10-17 13:42:51.766215', '2022-10-24 06:49:05.919656'),
(27, 'Kerkebuurt', 'Straatnaam 1', '1647ME', 'Berkhout', 'Nederland', '', 'kerkebuurt', '2022-10-17 16:07:57.866982', '2022-10-18 11:48:54.145614'),
(31, 'Wasborn', 'wasborn 36', '1025CB', 'Amsterdam', 'Nederland', '', 'wasborn', '2022-10-18 11:57:38.339272', '2022-10-24 07:04:00.389398'),
(32, 'Remijden', 'Remijden 22', '1068XB', 'Amsterddam', 'Nederland', '', 'remijden', '2022-10-18 11:57:38.496371', '2022-10-24 07:11:29.865937'),
(35, 'Thuis', 'Kerkebuurt 167', '1647ME', 'Berkhout', 'Nederland', '', 'thuis', '2022-10-20 14:50:44.423227', '2022-10-24 07:12:46.082742'),
(37, 'Abraham Kuyperstraat', 'Abraham Kuyperstraat 1-73', '1067DH', 'Amsterdam', 'Nederland', '', 'abraham-kuyperstraat', '2022-10-20 14:50:45.181941', '2022-10-24 07:06:23.595017'),
(43, 'Til garnalen', 'Haven 102', '1131AD', 'Volendam', 'Nederland', '', 'til-garnalen', '2022-10-24 06:52:14.388130', '2022-10-24 06:52:14.389046');


--
-- Dumping data for table `camera_bedrijf`
--

INSERT INTO `camera_bedrijf` (`id`, `naam`, `adres_id`, `email`, `website`, `image`, `telefoon`, `memo`, `slug`, `datum_inserted`, `datum_updated`) VALUES
(1, 'Stadgenoot', 1, 'info@bedrijf.nl', '', '', '020-12345678', '', 'stadgenoot', '2022-09-21 09:16:52.906687', '2022-09-23 13:22:31.128431'),
(3, 'Brandweer Volendam', 4, 'info@bedrijf.nl', '', '', '112', '', 'brandweer-volendam', '2021-12-14 14:55:57.000000', '2022-09-23 13:21:26.817460'),
(4, 'Politie Purmerend', 1, 'info@bedrijf.nl', '', '', '0900 - 8844', '', 'politie-purmerend', '2021-12-14 14:58:28.000000', '2021-12-24 14:31:12.949985'),
(6, 'Kees Garnalen BV', 1, 'info@bedrijf.nl', '', '', '0229 - 11  22 33', '', 'kees-garnalen-bv', '2021-12-23 14:32:20.338618', '2021-12-23 16:53:23.452786'),
(18, 'Smit Electrotechniek', 2, 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'smit-electrotechniek', '2022-10-20 14:58:49.896453', '2022-10-20 14:58:49.896579'),
(19, 'Thuis', 35, 'info@bedrijf.nl', 'www.bedrijf.nl', '', '000 1234567', '', 'thuis', '2022-10-25 14:51:58.819479', '2022-10-25 14:51:58.819619');


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


--
--
-- Dumping data for table `camera_locatie`
--

INSERT INTO `camera_locatie` (`id`, `naam`, `image`, `memo`, `slug`, `datum_inserted`, `datum_updated`, `adres_id`, `bedrijf_id`, `contact_id`) VALUES
(32, 'Wasborn', '', '', 'wasborn', '2022-10-18 11:57:38.377116', '2022-10-24 07:18:52.507783', 31, 1, 12),
(33, 'Remijden', '', '', 'remijden', '2022-10-18 11:57:38.535416', '2022-10-24 06:59:21.988568', 32, 1, 9),
(40, 'Abraham Kuyperstraat', '', '', 'abraham-kuyperstraat', '2022-10-20 14:50:45.234588', '2022-10-24 06:56:18.289694', 37, 1, 9),
(45, 'Smit', '', '', 'smit', '2022-10-20 15:41:51.553030', '2022-10-21 08:43:21.240689', 2, 18, 3),
(51, 'Kerkebuurt', '', '', 'kerkebuurt', '2022-10-25 14:51:58.878632', '2022-10-25 14:51:58.878781', 27, 19, 13);

COMMIT;