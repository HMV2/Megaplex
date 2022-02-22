-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 22, 2022 at 04:46 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `megaplex`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_profile`
--

CREATE TABLE `account_profile` (
  `id` bigint(20) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `plan` varchar(20) NOT NULL,
  `district` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cover_pic` varchar(100) DEFAULT NULL,
  `desc` longtext DEFAULT NULL,
  `verified` tinyint(1) NOT NULL,
  `balance` decimal(12,2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `product_sold` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_profile`
--

INSERT INTO `account_profile` (`id`, `firstname`, `lastname`, `email`, `phone`, `plan`, `district`, `city`, `profile_pic`, `created_date`, `user_id`, `cover_pic`, `desc`, `verified`, `balance`, `username`, `product_sold`, `active`) VALUES
(1, 'Thomas', 'Selby', 'bimalstha291@gmail.com', '9840031602', 'Individual', 'Kathmandu', 'Pokhara', 'profiles/download_2.jpg', '2022-02-14 19:14:26.974898', 1, 'cover.jpg', 'Founder and C.E.O of Selby Company Limited.', 1, '85.00', 'bimalstha', 0, 0),
(2, 'test', 'test', 'test@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-14 19:23:13.023646', 3, 'cover.jpg', NULL, 0, '90.00', 'test', 0, 1),
(3, 'Salil', 'Timalsina', 'salil.ragani@gmail.com', '9868800000', 'Individual', 'Kathmandu', 'Baghbazar', 'profiles/salil.jpg', '2022-02-15 06:20:26.186779', 4, 'cover.jpg', '', 1, '15.00', 'saliltimalsina', 0, 1),
(4, 'sujan', 'lama', 'nischalchan@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-15 06:20:41.776138', 5, 'cover.jpg', NULL, 1, '122.00', 'sujan', 0, 1),
(5, 'ashok', 'shrestha', 'ashokshrestha102@gmail.com', '9823232448', 'Individual', 'Kathmandu', 'Baghbazar', 'profiles/ashok.png', '2022-02-15 16:10:43.259221', 6, 'cover.jpg', 'Stay Hard', 1, '48.00', 'shrestha01', 0, 1),
(6, 'Chirag', 'Simkhada', 'chiragsimkhada@gmail.com', '9868823820', 'Individual', 'Kathmandu', 'Baghbazar', 'profiles/CS_98TLS4u.png', '2022-02-16 08:48:31.581161', 7, 'cover.jpg', 'abc', 0, '40.00', 'Chirag', 0, 1),
(7, 'Upendra', 'Bhattarai', 'upendra@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-17 11:49:17.211250', 8, 'cover.jpg', NULL, 1, '50.00', 'upeng', 0, 1),
(8, 'April', 'King', 'aprilchhetri1@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-17 14:22:16.330765', 9, 'cover.jpg', NULL, 0, '50.00', 'Aprilkto', 0, 1),
(9, 'Nabin', 'Bhattarai', 'bhattarainabin64@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-17 17:11:56.860493', 10, 'cover.jpg', NULL, 1, '50.00', '200027', 0, 0),
(10, 'manish', 'silwal', 'manishtest@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-20 06:11:52.448517', 11, 'cover.jpg', NULL, 0, '50.00', 'rhino', 0, 1),
(11, 'Bimal', 'Shrestha', 'bimalstha291@gmail.com', '', 'Individual', 'Kathmandu', 'Baghbazar', 'default.png', '2022-02-20 09:05:17.390393', 12, 'cover.jpg', NULL, 0, '85.00', 'bimalstha', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_profile_followers`
--

CREATE TABLE `account_profile_followers` (
  `id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_profile_followers`
--

INSERT INTO `account_profile_followers` (`id`, `profile_id`, `user_id`) VALUES
(2, 1, 6),
(8, 3, 5),
(9, 4, 1),
(7, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_profile_following`
--

CREATE TABLE `account_profile_following` (
  `id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_profile_following`
--

INSERT INTO `account_profile_following` (`id`, `profile_id`, `user_id`) VALUES
(9, 1, 5),
(7, 1, 6),
(8, 4, 4),
(2, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `account_transaction`
--

CREATE TABLE `account_transaction` (
  `id` bigint(20) NOT NULL,
  `receiver_id` int(11) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `txn_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_transaction`
--

INSERT INTO `account_transaction` (`id`, `receiver_id`, `amount`, `txn_id`, `sender_id`) VALUES
(11, 1, '10.00', 2648454, 3),
(12, 1, '20.00', 6277962, 4),
(13, 4, '10.00', 2504804, 12),
(14, 12, '10.00', 5319990, 4),
(15, 4, '1.00', 3914842, 12),
(16, 4, '1.00', 9245026, 12),
(17, 4, '1.00', 3388374, 12);

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
  `id` bigint(20) NOT NULL,
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
(25, 'Can add profile', 7, 'add_profile'),
(26, 'Can change profile', 7, 'change_profile'),
(27, 'Can delete profile', 7, 'delete_profile'),
(28, 'Can view profile', 7, 'view_profile'),
(29, 'Can add transaction', 8, 'add_transaction'),
(30, 'Can change transaction', 8, 'change_transaction'),
(31, 'Can delete transaction', 8, 'delete_transaction'),
(32, 'Can view transaction', 8, 'view_transaction'),
(33, 'Can add chat_ message', 9, 'add_chat_message'),
(34, 'Can change chat_ message', 9, 'change_chat_message'),
(35, 'Can delete chat_ message', 9, 'delete_chat_message'),
(36, 'Can view chat_ message', 9, 'view_chat_message'),
(37, 'Can add brand', 10, 'add_brand'),
(38, 'Can change brand', 10, 'change_brand'),
(39, 'Can delete brand', 10, 'delete_brand'),
(40, 'Can view brand', 10, 'view_brand'),
(41, 'Can add category', 11, 'add_category'),
(42, 'Can change category', 11, 'change_category'),
(43, 'Can delete category', 11, 'delete_category'),
(44, 'Can view category', 11, 'view_category'),
(45, 'Can add color', 12, 'add_color'),
(46, 'Can change color', 12, 'change_color'),
(47, 'Can delete color', 12, 'delete_color'),
(48, 'Can view color', 12, 'view_color'),
(49, 'Can add sub_ category', 13, 'add_sub_category'),
(50, 'Can change sub_ category', 13, 'change_sub_category'),
(51, 'Can delete sub_ category', 13, 'delete_sub_category'),
(52, 'Can view sub_ category', 13, 'view_sub_category'),
(53, 'Can add product', 14, 'add_product'),
(54, 'Can change product', 14, 'change_product'),
(55, 'Can delete product', 14, 'delete_product'),
(56, 'Can view product', 14, 'view_product'),
(57, 'Can add comment', 15, 'add_comment'),
(58, 'Can change comment', 15, 'change_comment'),
(59, 'Can delete comment', 15, 'delete_comment'),
(60, 'Can view comment', 15, 'view_comment'),
(61, 'Can add broadcast notification', 16, 'add_broadcastnotification'),
(62, 'Can change broadcast notification', 16, 'change_broadcastnotification'),
(63, 'Can delete broadcast notification', 16, 'delete_broadcastnotification'),
(64, 'Can view broadcast notification', 16, 'view_broadcastnotification'),
(65, 'Can add task result', 17, 'add_taskresult'),
(66, 'Can change task result', 17, 'change_taskresult'),
(67, 'Can delete task result', 17, 'delete_taskresult'),
(68, 'Can view task result', 17, 'view_taskresult'),
(69, 'Can add chord counter', 18, 'add_chordcounter'),
(70, 'Can change chord counter', 18, 'change_chordcounter'),
(71, 'Can delete chord counter', 18, 'delete_chordcounter'),
(72, 'Can view chord counter', 18, 'view_chordcounter'),
(73, 'Can add group result', 19, 'add_groupresult'),
(74, 'Can change group result', 19, 'change_groupresult'),
(75, 'Can delete group result', 19, 'delete_groupresult'),
(76, 'Can view group result', 19, 'view_groupresult'),
(77, 'Can add crontab', 20, 'add_crontabschedule'),
(78, 'Can change crontab', 20, 'change_crontabschedule'),
(79, 'Can delete crontab', 20, 'delete_crontabschedule'),
(80, 'Can view crontab', 20, 'view_crontabschedule'),
(81, 'Can add interval', 21, 'add_intervalschedule'),
(82, 'Can change interval', 21, 'change_intervalschedule'),
(83, 'Can delete interval', 21, 'delete_intervalschedule'),
(84, 'Can view interval', 21, 'view_intervalschedule'),
(85, 'Can add periodic task', 22, 'add_periodictask'),
(86, 'Can change periodic task', 22, 'change_periodictask'),
(87, 'Can delete periodic task', 22, 'delete_periodictask'),
(88, 'Can view periodic task', 22, 'view_periodictask'),
(89, 'Can add periodic tasks', 23, 'add_periodictasks'),
(90, 'Can change periodic tasks', 23, 'change_periodictasks'),
(91, 'Can delete periodic tasks', 23, 'delete_periodictasks'),
(92, 'Can view periodic tasks', 23, 'view_periodictasks'),
(93, 'Can add solar event', 24, 'add_solarschedule'),
(94, 'Can change solar event', 24, 'change_solarschedule'),
(95, 'Can delete solar event', 24, 'delete_solarschedule'),
(96, 'Can view solar event', 24, 'view_solarschedule'),
(97, 'Can add clocked', 25, 'add_clockedschedule'),
(98, 'Can change clocked', 25, 'change_clockedschedule'),
(99, 'Can delete clocked', 25, 'delete_clockedschedule'),
(100, 'Can view clocked', 25, 'view_clockedschedule');

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
(1, 'pbkdf2_sha256$260000$UrnuA2RjlBD8CyyNtSDTrd$i4bDWxSjAf8Jpv9hBlfE19Tpuje/jpUCSyhlWtwmGls=', '2022-02-21 17:34:16.031562', 0, 'Thomas', 'Bimal', 'Shrestha', 'bimalstha291@gmail.com', 0, 1, '2022-02-14 19:14:26.000000'),
(2, 'pbkdf2_sha256$260000$PUWtsmdxmaQRrpSc4m0FB8$0E9Im9FXaLaRnAW2zf4f7xRJBFylFJlSFpR0SgS7TXw=', '2022-02-21 19:00:34.579410', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-02-14 19:16:58.130369'),
(3, 'pbkdf2_sha256$260000$b4yvkRZnnoGuQAdbye3g9n$YXi30/RLyXv2pb8GxPVoZ2jrX4Yib8V7dMJGRNzmkyg=', '2022-02-20 09:02:17.787282', 0, 'test', 'test', 'test', 'test@gmail.com', 0, 1, '2022-02-14 19:23:12.758085'),
(4, 'pbkdf2_sha256$260000$wyvbC4guw49BrBizr5w9ET$XdAv9TVA/jVArwiy3ha04yKWAp0ORMzSWuIAkaNxOzQ=', '2022-02-20 06:14:35.084332', 0, 'saliltimalsina', 'Salil', 'Timalsina', 'salil.ragani@gmail.com', 0, 1, '2022-02-15 06:20:25.000000'),
(5, 'pbkdf2_sha256$260000$27nfyOF5WvtOW9nOdsI6xf$HW3/SelFAfaTuK2rrvMOHwaZjCwBEUCmTrJBwu3aAvU=', '2022-02-21 16:21:24.374885', 0, 'sujan', 'sujan', 'lama', 'nischalchan@gmail.com', 0, 1, '2022-02-15 06:20:41.541764'),
(6, 'pbkdf2_sha256$260000$JsCrSNEojPpt2m0weAxpbQ$Sc+fPeBhlWSrmgSiQkXpqexi2GI53njWC2yv3OWIdvM=', '2022-02-17 10:04:32.978771', 0, 'shrestha01', 'ashok', 'shrestha', 'ashokshrestha102@gmail.com', 0, 1, '2022-02-15 16:10:42.361447'),
(7, 'pbkdf2_sha256$260000$jVTJFcdRD9kLgZi8xHFhP0$/6HylY9nuQCJH8P/Ai4XWrsQMdR6/0ifldvHBGkwy0I=', '2022-02-16 08:49:11.253001', 1, 'Chirag', 'Chirag', 'Simkhada', 'chiragsimkhada@gmail.com', 1, 1, '2022-02-16 08:48:31.237408'),
(8, 'pbkdf2_sha256$260000$9d5JZgqVk2Np4VZ30uyQLF$Q/J1tqRQ7iRIVjV/q7/radeDpZ+lBoP7Qxrh7XaJ+wA=', '2022-02-17 11:49:58.244211', 0, 'upeng', 'Upendra', 'Bhattarai', 'upendra@gmail.com', 0, 1, '2022-02-17 11:49:06.096464'),
(9, 'pbkdf2_sha256$260000$HMTwQ2uqQJcDKZroFyAUOi$a1JIKDbnDwGKU8TvNeXWXs18bSF9I0m0MZ+Uh4w7ZQU=', NULL, 0, 'Aprilkto', 'April', 'King', 'aprilchhetri1@gmail.com', 0, 1, '2022-02-17 14:22:16.111992'),
(10, 'pbkdf2_sha256$260000$A6Nfd7XoJxyR2UYo1C89l7$d83UdJHhbcWfkvh2pbmBNQekQsp7zxrI3zGal/fviac=', '2022-02-17 17:12:06.438655', 0, '200027', 'Nabin', 'Bhattarai', 'bhattarainabin64@gmail.com', 0, 1, '2022-02-17 17:11:56.610550'),
(11, 'pbkdf2_sha256$260000$GTz39hygkPKg0MCbwO9A9A$epcfMI2sosOA6j/9iqAfcXIiEnHhDQrCZs8a407VqI8=', '2022-02-20 06:12:14.182960', 0, 'rhino', 'manish', 'silwal', 'manishtest@gmail.com', 0, 1, '2022-02-20 06:11:52.214229'),
(12, 'pbkdf2_sha256$260000$qDCEGkM3nE0m0qhYOC44jx$TV2sVFS5fyF1ZDzuFWSlGfB2eNnPo5X6WE1rtK1Ljms=', '2022-02-20 09:05:26.359100', 0, 'bimalstha', 'Bimal', 'Shrestha', 'bimalstha291@gmail.com', 0, 1, '2022-02-20 09:05:17.124771');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `directchat_chat_message`
--

CREATE TABLE `directchat_chat_message` (
  `id` bigint(20) NOT NULL,
  `body` longtext DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `directchat_chat_message`
--

INSERT INTO `directchat_chat_message` (`id`, `body`, `date`, `is_read`, `recipient_id`, `sender_id`, `user_id`) VALUES
(1, 'hello', '2022-02-14 19:23:59.085993', 1, 1, 3, 3),
(2, 'hello', '2022-02-14 19:23:59.085993', 1, 3, 3, 1),
(3, 'Hy', '2022-02-14 19:24:23.536636', 1, 3, 1, 1),
(4, 'Hy', '2022-02-14 19:24:23.536636', 1, 1, 1, 3),
(5, 'Mula', '2022-02-14 19:24:38.816530', 1, 1, 3, 3),
(6, 'Mula', '2022-02-14 19:24:38.816530', 1, 3, 3, 1),
(7, 'yo', '2022-02-15 06:24:24.734776', 1, 1, 5, 5),
(8, 'yo', '2022-02-15 06:24:24.734776', 1, 5, 5, 1),
(9, 'Hello', '2022-02-15 06:29:18.070077', 1, 5, 1, 1),
(10, 'Hello', '2022-02-15 06:29:18.070077', 1, 1, 1, 5),
(11, 'Hello salil', '2022-02-15 06:48:54.385196', 1, 4, 1, 1),
(12, 'Hello salil', '2022-02-15 06:48:54.400851', 1, 1, 1, 4),
(13, 'Heyy', '2022-02-15 06:49:08.447463', 1, 1, 4, 4),
(14, 'Heyy', '2022-02-15 06:49:08.447463', 1, 4, 4, 1),
(15, 'Received', '2022-02-15 06:49:33.086344', 1, 4, 1, 1),
(16, 'Received', '2022-02-15 06:49:33.101940', 1, 1, 1, 4),
(17, 'Discount hudaina', '2022-02-15 06:49:44.961175', 1, 1, 4, 4),
(18, 'Discount hudaina', '2022-02-15 06:49:44.976803', 1, 4, 4, 1),
(19, 'ok xa ta', '2022-02-15 06:53:07.554703', 1, 4, 1, 1),
(20, 'ok xa ta', '2022-02-15 06:53:07.570320', 1, 1, 1, 4),
(21, 'hello', '2022-02-15 16:13:44.396593', 1, 1, 6, 6),
(22, 'hello', '2022-02-15 16:13:44.798282', 1, 6, 6, 1),
(23, 'Hello...', '2022-02-15 16:15:06.602224', 1, 6, 1, 1),
(24, 'Hello...', '2022-02-15 16:15:06.842611', 1, 1, 1, 6),
(25, 'Had meal?', '2022-02-15 16:15:31.930566', 1, 1, 6, 6),
(26, 'Had meal?', '2022-02-15 16:15:31.930566', 1, 6, 6, 1),
(27, '', '2022-02-15 16:15:38.063389', 1, 1, 6, 6),
(28, '', '2022-02-15 16:15:38.224009', 1, 6, 6, 1),
(29, 'Yes', '2022-02-15 16:17:03.303707', 1, 6, 1, 1),
(30, 'Yes', '2022-02-15 16:17:03.381685', 1, 1, 1, 6),
(31, 'k xa bro?', '2022-02-16 03:00:02.511751', 1, 6, 1, 1),
(32, 'k xa bro?', '2022-02-16 03:00:02.590795', 1, 1, 1, 6),
(33, 'kati wota product vayo?', '2022-02-16 06:24:30.055047', 1, 4, 1, 1),
(34, 'kati wota product vayo?', '2022-02-16 06:24:30.296063', 1, 1, 1, 4),
(35, '..\r\n', '2022-02-16 09:11:09.771141', 1, 7, 1, 1),
(36, '..\r\n', '2022-02-16 09:11:09.771141', 1, 1, 1, 7),
(37, 'jb', '2022-02-16 09:39:36.307399', 1, 1, 7, 7),
(38, 'jb', '2022-02-16 09:39:36.369889', 1, 7, 7, 1),
(39, 'Vyana xa, same image xa', '2022-02-16 09:54:01.073598', 1, 7, 1, 1),
(40, 'Vyana xa, same image xa', '2022-02-16 09:54:01.089223', 1, 1, 1, 7),
(41, 'local ma ta fix bhayo', '2022-02-16 10:09:18.569039', 1, 1, 7, 7),
(42, 'local ma ta fix bhayo', '2022-02-16 10:09:18.709606', 1, 7, 7, 1),
(43, 'Ani nexe vaneko Explore page', '2022-02-16 11:42:53.698256', 1, 7, 1, 1),
(44, 'Ani nexe vaneko Explore page', '2022-02-16 11:42:53.713810', 1, 1, 1, 7),
(45, 'Ani navbar ma notification ma message auda 1 auxa ani notification ma pani 1 ', '2022-02-16 11:45:18.091457', 1, 7, 1, 1),
(46, 'Ani navbar ma notification ma message auda 1 auxa ani notification ma pani 1 ', '2022-02-16 11:45:18.091457', 1, 1, 1, 7),
(47, 'You can change profile now..\r\n', '2022-02-16 11:59:57.486068', 1, 6, 1, 1),
(48, 'You can change profile now..\r\n', '2022-02-16 11:59:57.501695', 1, 1, 1, 6),
(49, 'louds', '2022-02-16 12:49:20.190751', 1, 4, 7, 7),
(50, 'louds', '2022-02-16 12:49:20.206394', 1, 7, 7, 4),
(51, 'hdsb', '2022-02-16 13:19:54.379151', 1, 1, 7, 7),
(52, 'hdsb', '2022-02-16 13:19:54.426086', 1, 7, 7, 1),
(53, 'kasndk', '2022-02-16 13:20:12.926066', 1, 1, 7, 7),
(54, 'kasndk', '2022-02-16 13:20:12.926066', 1, 7, 7, 1),
(55, 'asldas;ld', '2022-02-16 13:21:11.646517', 1, 1, 7, 7),
(56, 'asldas;ld', '2022-02-16 13:21:11.646517', 1, 7, 7, 1),
(57, 'Hello', '2022-02-16 15:28:10.667487', 1, 1, 7, 7),
(58, 'Hello', '2022-02-16 15:28:10.683176', 1, 7, 7, 1),
(59, 'h', '2022-02-16 15:28:50.348518', 1, 1, 7, 7),
(60, 'h', '2022-02-16 15:28:50.364143', 1, 7, 7, 1),
(61, 'knkl', '2022-02-16 15:36:41.013812', 1, 1, 7, 7),
(62, 'knkl', '2022-02-16 15:36:41.029443', 1, 7, 7, 1),
(63, 'kbbjl', '2022-02-16 15:37:36.681518', 1, 1, 7, 7),
(64, 'kbbjl', '2022-02-16 15:37:36.681518', 1, 7, 7, 1),
(65, 'Im all fine', '2022-02-16 18:31:16.406233', 1, 1, 6, 6),
(66, 'Im all fine', '2022-02-16 18:31:16.421929', 1, 6, 6, 1),
(67, 'What about you', '2022-02-16 18:31:35.434324', 1, 1, 6, 6),
(68, 'What about you', '2022-02-16 18:31:35.434324', 1, 6, 6, 1),
(69, 'Still error while add product', '2022-02-16 18:31:51.621972', 1, 1, 6, 6),
(70, 'Still error while add product', '2022-02-16 18:31:51.621972', 1, 6, 6, 1),
(71, 'Now fixed!', '2022-02-17 12:35:31.693393', 1, 6, 1, 1),
(72, 'Now fixed!', '2022-02-17 12:35:31.702391', 1, 1, 1, 6),
(73, 'Now fixed!', '2022-02-17 12:35:35.969203', 1, 6, 1, 1),
(74, 'Now fixed!', '2022-02-17 12:35:36.052675', 1, 1, 1, 6),
(75, 'Now fixed!', '2022-02-17 12:35:42.562125', 1, 6, 1, 1),
(76, 'Now fixed!', '2022-02-17 12:35:42.643639', 1, 1, 1, 6),
(77, 'df', '2022-02-17 14:30:45.831937', 1, 6, 1, 1),
(78, 'df', '2022-02-17 14:30:45.831937', 1, 1, 1, 6),
(79, 'zdsds', '2022-02-17 17:13:11.370168', 1, 4, 10, 10),
(80, 'zdsds', '2022-02-17 17:13:11.370168', 1, 10, 10, 4),
(81, 'cvc', '2022-02-18 07:42:42.092916', 1, 7, 1, 1),
(82, 'cvc', '2022-02-18 07:42:43.058779', 1, 1, 1, 7),
(83, 'Huss', '2022-02-19 14:11:55.943162', 1, 1, 6, 6),
(84, 'Huss', '2022-02-19 14:11:57.299882', 1, 6, 6, 1),
(85, 'Huss', '2022-02-19 14:12:00.178043', 1, 1, 6, 6),
(86, 'Huss', '2022-02-19 14:12:00.498911', 1, 6, 6, 1),
(87, 'hell don', '2022-02-20 06:13:59.068716', 1, 1, 11, 11),
(88, 'hell don', '2022-02-20 06:13:59.068716', 1, 11, 11, 1),
(89, 'yo', '2022-02-21 05:00:50.523160', 1, 4, 5, 5),
(90, 'yo', '2022-02-21 05:00:53.174039', 0, 5, 5, 4);

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
(1, '2022-02-14 19:18:32.734375', '1', 'Apple', 1, '[{\"added\": {}}]', 10, 2),
(2, '2022-02-14 19:18:45.469440', '1', 'Smartphone', 1, '[{\"added\": {}}]', 11, 2),
(3, '2022-02-14 19:18:57.040368', '1', 'Macro', 1, '[{\"added\": {}}]', 13, 2),
(4, '2022-02-14 19:19:08.484809', '1', 'Red', 1, '[{\"added\": {}}]', 12, 2),
(5, '2022-02-15 06:23:48.719470', '2', 'Beauty and Health', 1, '[{\"added\": {}}]', 11, 2),
(6, '2022-02-15 06:31:51.978250', '3', 'Books', 1, '[{\"added\": {}}]', 11, 2),
(7, '2022-02-15 06:32:08.681817', '3', 'Books', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(8, '2022-02-15 06:32:27.869080', '4', 'Cars', 1, '[{\"added\": {}}]', 11, 2),
(9, '2022-02-15 06:32:51.636797', '2', 'Beauty and Health', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(10, '2022-02-15 06:33:26.495807', '5', 'Fashion', 1, '[{\"added\": {}}]', 11, 2),
(11, '2022-02-15 06:33:43.839386', '6', 'Clothing', 1, '[{\"added\": {}}]', 11, 2),
(12, '2022-02-15 06:33:47.418638', '7', 'Furnitures', 1, '[{\"added\": {}}]', 11, 2),
(13, '2022-02-15 06:34:11.346389', '8', 'Musical Instrument', 1, '[{\"added\": {}}]', 11, 2),
(14, '2022-02-15 06:34:14.283896', '2', 'Shoes', 1, '[{\"added\": {}}]', 13, 2),
(15, '2022-02-15 06:34:19.596331', '8', 'Musical Instrument', 2, '[]', 11, 2),
(16, '2022-02-15 06:34:37.580550', '1', 'Smartphone', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(17, '2022-02-15 06:35:03.453838', '9', 'Smartphone', 1, '[{\"added\": {}}]', 11, 2),
(18, '2022-02-15 06:35:16.391239', '10', 'Games', 1, '[{\"added\": {}}]', 11, 2),
(19, '2022-02-15 06:35:18.266269', '2', 'Nike', 1, '[{\"added\": {}}]', 10, 2),
(20, '2022-02-15 06:35:29.188016', '3', 'Addidas', 1, '[{\"added\": {}}]', 10, 2),
(21, '2022-02-15 06:35:36.562970', '11', 'Adoption', 1, '[{\"added\": {}}]', 11, 2),
(22, '2022-02-15 06:36:00.237078', '12', 'Real Estate', 1, '[{\"added\": {}}]', 11, 2),
(23, '2022-02-15 06:36:13.221369', '13', 'Services', 1, '[{\"added\": {}}]', 11, 2),
(24, '2022-02-15 06:36:16.236991', '4', 'Converse', 1, '[{\"added\": {}}]', 10, 2),
(25, '2022-02-15 06:36:27.846317', '5', 'Gold Start', 1, '[{\"added\": {}}]', 10, 2),
(26, '2022-02-15 06:36:31.580631', '14', 'Toys', 1, '[{\"added\": {}}]', 11, 2),
(27, '2022-02-15 06:36:36.658745', '6', 'Puma', 1, '[{\"added\": {}}]', 10, 2),
(28, '2022-02-15 06:37:04.988964', '3', 'Shirts', 1, '[{\"added\": {}}]', 13, 2),
(29, '2022-02-15 06:37:08.645171', '15', 'Grocery', 1, '[{\"added\": {}}]', 11, 2),
(30, '2022-02-15 06:37:25.113844', '16', 'Tours and Travels', 1, '[{\"added\": {}}]', 11, 2),
(31, '2022-02-15 06:37:26.223223', '16', 'Tours and Travels', 2, '[]', 11, 2),
(32, '2022-02-15 06:37:30.301304', '4', 'Pants', 1, '[{\"added\": {}}]', 13, 2),
(33, '2022-02-15 06:39:01.482962', '9', 'Electronics', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 11, 2),
(34, '2022-02-15 06:39:12.967262', '9', 'Electronics', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(35, '2022-02-15 06:40:13.945608', '5', 'Smartphone', 1, '[{\"added\": {}}]', 13, 2),
(36, '2022-02-15 06:40:44.351757', '6', 'PC and Laptops', 1, '[{\"added\": {}}]', 13, 2),
(37, '2022-02-15 06:40:45.726752', '6', 'PC and Laptops', 2, '[]', 13, 2),
(38, '2022-02-16 06:28:39.808429', '7', 'No brand', 1, '[{\"added\": {}}]', 10, 2),
(39, '2022-02-16 06:30:07.604678', '7', 'Gadgets', 1, '[{\"added\": {}}]', 13, 2),
(40, '2022-02-16 13:03:20.745780', '1', 'Thomas', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 4, 2),
(41, '2022-02-16 13:12:46.767293', '3', 'Salil Timalsina', 2, '[{\"changed\": {\"fields\": [\"Firstname\", \"Lastname\", \"Phone\"]}}]', 7, 7),
(42, '2022-02-16 13:13:05.361109', '4', 'saliltimalsina', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 7),
(43, '2022-02-17 09:55:20.901022', '8', 'Tesla', 1, '[{\"added\": {}}]', 10, 2),
(44, '2022-02-17 09:55:57.907886', '9', 'One Plus', 1, '[{\"added\": {}}]', 10, 2),
(45, '2022-02-17 09:56:29.892590', '2', 'Black', 1, '[{\"added\": {}}]', 12, 2),
(46, '2022-02-17 09:56:38.611429', '3', 'Gold', 1, '[{\"added\": {}}]', 12, 2),
(47, '2022-02-17 09:56:47.158390', '4', 'White', 1, '[{\"added\": {}}]', 12, 2),
(48, '2022-02-17 09:57:06.333491', '5', 'Mix Color', 1, '[{\"added\": {}}]', 12, 2),
(49, '2022-02-17 09:57:13.958567', '6', 'Yellow', 1, '[{\"added\": {}}]', 12, 2),
(50, '2022-02-17 09:57:21.889148', '7', 'Pink', 1, '[{\"added\": {}}]', 12, 2),
(51, '2022-02-17 09:57:28.014208', '8', 'Blue', 1, '[{\"added\": {}}]', 12, 2),
(52, '2022-02-17 09:57:33.233014', '9', 'Green', 1, '[{\"added\": {}}]', 12, 2),
(53, '2022-02-17 10:00:29.030775', '17', 'Electric Car', 1, '[{\"added\": {}}]', 11, 2),
(54, '2022-02-17 10:00:40.390234', '18', 'Bike', 1, '[{\"added\": {}}]', 11, 2),
(55, '2022-02-17 10:00:46.827797', '19', 'Scooter', 1, '[{\"added\": {}}]', 11, 2),
(56, '2022-02-17 10:01:01.984166', '20', 'Car', 1, '[{\"added\": {}}]', 11, 2),
(57, '2022-02-17 10:02:48.893568', '8', 'Car', 1, '[{\"added\": {}}]', 13, 2),
(58, '2022-02-17 10:03:26.704346', '9', 'Bike', 1, '[{\"added\": {}}]', 13, 2),
(59, '2022-02-17 10:21:15.331322', '18', 'Tesla Model Y', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 14, 2),
(60, '2022-02-19 05:27:34.706645', '4', 'Jordan', 3, '', 14, 2),
(61, '2022-02-19 05:40:26.736649', '22', 'Iphone X', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 14, 2),
(62, '2022-02-19 05:40:47.899098', '21', 'Shrestha Watch', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 14, 2),
(63, '2022-02-19 05:41:09.555358', '10', 'Washing Machine', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 14, 2),
(64, '2022-02-19 05:41:09.867847', '10', 'Washing Machine', 2, '[]', 14, 2),
(65, '2022-02-19 05:41:30.387917', '20', 'Galaxy Fold Series', 2, '[{\"changed\": {\"fields\": [\"Seller\"]}}]', 14, 2),
(66, '2022-02-19 05:48:04.250751', '22', 'Iphone X', 2, '[{\"changed\": {\"fields\": [\"Image1\"]}}]', 14, 2),
(67, '2022-02-19 05:48:38.176445', '14', 'Iphone X', 2, '[]', 14, 2),
(68, '2022-02-19 06:41:08.048771', '20', 'Car', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(69, '2022-02-19 06:41:22.314365', '3', 'Books', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(70, '2022-02-19 06:41:31.283127', '4', 'Cars', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(71, '2022-02-19 06:41:38.736242', '7', 'Furnitures', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(72, '2022-02-19 06:41:47.658118', '11', 'Adoption', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(73, '2022-02-19 06:41:51.439365', '13', 'Services', 2, '[]', 11, 2),
(74, '2022-02-19 06:41:59.298745', '13', 'Services', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(75, '2022-02-19 06:42:03.527483', '14', 'Toys', 2, '[]', 11, 2),
(76, '2022-02-19 06:42:10.824346', '14', 'Toys', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(77, '2022-02-19 06:42:19.386852', '15', 'Grocery', 2, '[{\"changed\": {\"fields\": [\"Picture\"]}}]', 11, 2),
(78, '2022-02-19 07:12:00.053211', '22', 'Electronics', 1, '[{\"added\": {}}]', 11, 2),
(79, '2022-02-19 09:10:23.571308', '10', 'Smartphone', 1, '[{\"added\": {}}]', 13, 2),
(80, '2022-02-19 09:10:36.540118', '11', 'PC & Laptops', 1, '[{\"added\": {}}]', 13, 2),
(81, '2022-02-20 06:10:38.931531', '28', 'Clothing', 1, '[{\"added\": {}}]', 11, 2),
(82, '2022-02-20 06:11:01.650287', '5', 'Gold Star', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 10, 2),
(83, '2022-02-20 06:11:30.540906', '12', 'Shoes', 1, '[{\"added\": {}}]', 13, 2),
(84, '2022-02-20 06:11:41.261020', '29', 'Adoption', 1, '[{\"added\": {}}]', 11, 2),
(85, '2022-02-20 06:11:49.057895', '10', 'Cyan', 1, '[{\"added\": {}}]', 12, 2),
(86, '2022-02-20 06:11:53.198529', '30', 'Beauty and Health', 1, '[{\"added\": {}}]', 11, 2),
(87, '2022-02-20 06:12:05.573519', '31', 'Books', 1, '[{\"added\": {}}]', 11, 2),
(88, '2022-02-20 06:12:21.657343', '32', 'Cars', 1, '[{\"added\": {}}]', 11, 2),
(89, '2022-02-20 06:12:33.297970', '33', 'Fashion', 1, '[{\"added\": {}}]', 11, 2),
(90, '2022-02-20 06:12:46.886571', '34', 'Electronics', 1, '[{\"added\": {}}]', 11, 2),
(91, '2022-02-20 06:13:01.167824', '35', 'Musical Instrument', 1, '[{\"added\": {}}]', 11, 2),
(92, '2022-02-20 06:13:10.480317', '13', 'Shirts', 1, '[{\"added\": {}}]', 13, 2),
(93, '2022-02-20 06:13:13.230330', '36', 'Real Estate', 1, '[{\"added\": {}}]', 11, 2),
(94, '2022-02-20 06:13:23.417829', '37', 'Services', 1, '[{\"added\": {}}]', 11, 2),
(95, '2022-02-20 06:13:39.271901', '38', 'Tours and travals', 1, '[{\"added\": {}}]', 11, 2),
(96, '2022-02-20 06:13:48.803090', '39', 'Toys', 1, '[{\"added\": {}}]', 11, 2),
(97, '2022-02-20 06:14:01.068729', '40', 'Grocerry', 1, '[{\"added\": {}}]', 11, 2),
(98, '2022-02-20 07:04:22.800115', '7', 'BroadcastNotification object (7)', 3, '', 16, 2),
(99, '2022-02-20 07:04:22.800115', '2', 'BroadcastNotification object (2)', 3, '', 16, 2),
(100, '2022-02-20 07:04:22.800115', '10', 'BroadcastNotification object (10)', 3, '', 16, 2),
(101, '2022-02-20 07:04:22.800115', '9', 'BroadcastNotification object (9)', 3, '', 16, 2),
(102, '2022-02-20 07:04:22.800115', '8', 'BroadcastNotification object (8)', 3, '', 16, 2),
(103, '2022-02-20 07:04:22.815671', '6', 'BroadcastNotification object (6)', 3, '', 16, 2),
(104, '2022-02-20 07:04:23.018773', '5', 'BroadcastNotification object (5)', 3, '', 16, 2),
(105, '2022-02-20 07:04:23.018773', '4', 'BroadcastNotification object (4)', 3, '', 16, 2),
(106, '2022-02-20 07:04:23.018773', '3', 'BroadcastNotification object (3)', 3, '', 16, 2),
(107, '2022-02-20 07:04:23.018773', '1', 'BroadcastNotification object (1)', 3, '', 16, 2),
(108, '2022-02-20 07:10:53.590055', '14', 'BroadcastNotification object (14)', 2, '[{\"changed\": {\"fields\": [\"Sent\"]}}]', 16, 2),
(109, '2022-02-20 07:11:06.886990', '13', 'BroadcastNotification object (13)', 2, '[{\"changed\": {\"fields\": [\"Sent\"]}}]', 16, 2),
(110, '2022-02-20 07:11:15.492300', '12', 'BroadcastNotification object (12)', 2, '[{\"changed\": {\"fields\": [\"Sent\"]}}]', 16, 2),
(111, '2022-02-20 07:11:24.086083', '11', 'BroadcastNotification object (11)', 2, '[{\"changed\": {\"fields\": [\"Sent\"]}}]', 16, 2);

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_clockedschedule`
--

CREATE TABLE `django_celery_beat_clockedschedule` (
  `id` int(11) NOT NULL,
  `clocked_time` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_crontabschedule`
--

CREATE TABLE `django_celery_beat_crontabschedule` (
  `id` int(11) NOT NULL,
  `minute` varchar(240) NOT NULL,
  `hour` varchar(96) NOT NULL,
  `day_of_week` varchar(64) NOT NULL,
  `day_of_month` varchar(124) NOT NULL,
  `month_of_year` varchar(64) NOT NULL,
  `timezone` varchar(63) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_celery_beat_crontabschedule`
--

INSERT INTO `django_celery_beat_crontabschedule` (`id`, `minute`, `hour`, `day_of_week`, `day_of_month`, `month_of_year`, `timezone`) VALUES
(1, '42', '12', '*', '15', '2', 'Asia/Kathmandu'),
(2, '47', '12', '*', '20', '2', 'Asia/Kathmandu'),
(3, '9', '13', '*', '19', '2', 'Asia/Kathmandu'),
(4, '10', '13', '*', '19', '2', 'Asia/Kathmandu'),
(5, '17', '13', '*', '19', '2', 'Asia/Kathmandu'),
(6, '0', '4', '*', '*', '*', 'Asia/Kathmandu'),
(7, '5', '12', '*', '20', '2', 'Asia/Kathmandu'),
(8, '5', '12', '*', '20', '12', 'Asia/Kathmandu'),
(9, '18', '12', '*', '20', '2', 'Asia/Kathmandu'),
(10, '19', '12', '*', '20', '2', 'Asia/Kathmandu'),
(11, '50', '12', '*', '20', '2', 'Asia/Kathmandu'),
(12, '52', '12', '*', '20', '2', 'Asia/Kathmandu'),
(13, '54', '12', '*', '20', '2', 'Asia/Kathmandu'),
(14, '55', '12', '*', '20', '2', 'Asia/Kathmandu'),
(15, '57', '12', '*', '20', '2', 'Asia/Kathmandu');

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_intervalschedule`
--

CREATE TABLE `django_celery_beat_intervalschedule` (
  `id` int(11) NOT NULL,
  `every` int(11) NOT NULL,
  `period` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictask`
--

CREATE TABLE `django_celery_beat_periodictask` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `task` varchar(200) NOT NULL,
  `args` longtext NOT NULL,
  `kwargs` longtext NOT NULL,
  `queue` varchar(200) DEFAULT NULL,
  `exchange` varchar(200) DEFAULT NULL,
  `routing_key` varchar(200) DEFAULT NULL,
  `expires` datetime(6) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `last_run_at` datetime(6) DEFAULT NULL,
  `total_run_count` int(10) UNSIGNED NOT NULL CHECK (`total_run_count` >= 0),
  `date_changed` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `crontab_id` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `solar_id` int(11) DEFAULT NULL,
  `one_off` tinyint(1) NOT NULL,
  `start_time` datetime(6) DEFAULT NULL,
  `priority` int(10) UNSIGNED DEFAULT NULL CHECK (`priority` >= 0),
  `headers` longtext NOT NULL,
  `clocked_id` int(11) DEFAULT NULL,
  `expire_seconds` int(10) UNSIGNED DEFAULT NULL CHECK (`expire_seconds` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_celery_beat_periodictask`
--

INSERT INTO `django_celery_beat_periodictask` (`id`, `name`, `task`, `args`, `kwargs`, `queue`, `exchange`, `routing_key`, `expires`, `enabled`, `last_run_at`, `total_run_count`, `date_changed`, `description`, `crontab_id`, `interval_id`, `solar_id`, `one_off`, `start_time`, `priority`, `headers`, `clocked_id`, `expire_seconds`) VALUES
(1, 'broadcast-notification-1', 'notification.tasks.broadcast_notification', '[1]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-15 06:56:34.268141', '', 1, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(2, 'broadcast-notification-2', 'notification.tasks.broadcast_notification', '[2]', '{}', NULL, NULL, NULL, NULL, 1, '2022-02-20 07:02:00.051509', 1, '2022-02-20 07:04:00.837471', '', 2, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(3, 'broadcast-notification-3', 'notification.tasks.broadcast_notification', '[3]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-19 07:23:42.813702', '', 3, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(4, 'broadcast-notification-4', 'notification.tasks.broadcast_notification', '[4]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-19 07:24:08.297121', '', 4, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(5, 'broadcast-notification-5', 'notification.tasks.broadcast_notification', '[5]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-19 07:31:10.123553', '', 5, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(6, 'celery.backend_cleanup', 'celery.backend_cleanup', '[]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-22 03:40:46.417823', '', 6, NULL, NULL, 0, NULL, NULL, '{}', NULL, 43200),
(7, 'broadcast-notification-6', 'notification.tasks.broadcast_notification', '[6]', '{}', NULL, NULL, NULL, NULL, 1, '2022-02-20 06:20:00.014971', 1, '2022-02-20 06:21:06.098604', '', 7, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(8, 'broadcast-notification-7', 'notification.tasks.broadcast_notification', '[7]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 06:21:01.741137', '', 8, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(9, 'broadcast-notification-8', 'notification.tasks.broadcast_notification', '[8]', '{}', NULL, NULL, NULL, NULL, 1, '2022-02-20 06:33:00.013963', 1, '2022-02-20 06:33:15.404537', '', 9, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(10, 'broadcast-notification-9', 'notification.tasks.broadcast_notification', '[9]', '{}', NULL, NULL, NULL, NULL, 1, '2022-02-20 06:34:00.036412', 1, '2022-02-20 06:36:50.417851', '', 10, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(11, 'broadcast-notification-10', 'notification.tasks.broadcast_notification', '[10]', '{}', NULL, NULL, NULL, NULL, 1, '2022-02-20 06:34:00.005168', 1, '2022-02-20 06:36:50.449084', '', 10, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(12, 'broadcast-notification-11', 'notification.tasks.broadcast_notification', '[11]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 07:05:31.178601', '', 11, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(13, 'broadcast-notification-12', 'notification.tasks.broadcast_notification', '[12]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 07:08:09.506333', '', 12, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(14, 'broadcast-notification-13', 'notification.tasks.broadcast_notification', '[13]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 07:09:24.225004', '', 13, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(15, 'broadcast-notification-14', 'notification.tasks.broadcast_notification', '[14]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 07:10:24.543113', '', 14, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL),
(16, 'broadcast-notification-15', 'notification.tasks.broadcast_notification', '[15]', '{}', NULL, NULL, NULL, NULL, 1, NULL, 0, '2022-02-20 07:12:19.262938', '', 15, NULL, NULL, 0, NULL, NULL, '{}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_periodictasks`
--

CREATE TABLE `django_celery_beat_periodictasks` (
  `ident` smallint(6) NOT NULL,
  `last_update` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_celery_beat_periodictasks`
--

INSERT INTO `django_celery_beat_periodictasks` (`ident`, `last_update`) VALUES
(1, '2022-02-22 03:40:46.402190');

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_beat_solarschedule`
--

CREATE TABLE `django_celery_beat_solarschedule` (
  `id` int(11) NOT NULL,
  `event` varchar(24) NOT NULL,
  `latitude` decimal(9,6) NOT NULL,
  `longitude` decimal(9,6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_results_chordcounter`
--

CREATE TABLE `django_celery_results_chordcounter` (
  `id` int(11) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `sub_tasks` longtext NOT NULL,
  `count` int(10) UNSIGNED NOT NULL CHECK (`count` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_results_groupresult`
--

CREATE TABLE `django_celery_results_groupresult` (
  `id` int(11) NOT NULL,
  `group_id` varchar(255) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_done` datetime(6) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_celery_results_taskresult`
--

CREATE TABLE `django_celery_results_taskresult` (
  `id` int(11) NOT NULL,
  `task_id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `content_type` varchar(128) NOT NULL,
  `content_encoding` varchar(64) NOT NULL,
  `result` longtext DEFAULT NULL,
  `date_done` datetime(6) NOT NULL,
  `traceback` longtext DEFAULT NULL,
  `meta` longtext DEFAULT NULL,
  `task_args` longtext DEFAULT NULL,
  `task_kwargs` longtext DEFAULT NULL,
  `task_name` varchar(255) DEFAULT NULL,
  `worker` varchar(100) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_celery_results_taskresult`
--

INSERT INTO `django_celery_results_taskresult` (`id`, `task_id`, `status`, `content_type`, `content_encoding`, `result`, `date_done`, `traceback`, `meta`, `task_args`, `task_kwargs`, `task_name`, `worker`, `date_created`) VALUES
(1, '2bc31ccf-7151-4d03-9748-ab4898bf7937', 'SUCCESS', 'application/json', 'utf-8', '\"Done\"', '2022-02-20 06:20:03.528276', NULL, '{\"children\": []}', '\"[6]\"', '\"{}\"', 'notification.tasks.broadcast_notification', 'celery@EC2AMAZ-PINNM57', '2022-02-20 06:20:03.528276'),
(2, '845eb131-a081-48e0-b0f6-799f514be76c', 'SUCCESS', 'application/json', 'utf-8', '\"Done\"', '2022-02-20 06:33:02.092126', NULL, '{\"children\": []}', '\"[8]\"', '\"{}\"', 'notification.tasks.broadcast_notification', 'celery@EC2AMAZ-PINNM57', '2022-02-20 06:33:02.092126'),
(3, '4cad3ae1-2de4-4697-bc6a-e71d05ea0d46', 'SUCCESS', 'application/json', 'utf-8', '\"Done\"', '2022-02-20 06:34:01.098897', NULL, '{\"children\": []}', '\"[10]\"', '\"{}\"', 'notification.tasks.broadcast_notification', 'celery@EC2AMAZ-PINNM57', '2022-02-20 06:34:01.098897'),
(4, '38e90c8b-686a-4478-903e-93be15b0f09b', 'SUCCESS', 'application/json', 'utf-8', '\"Done\"', '2022-02-20 06:34:02.145791', NULL, '{\"children\": []}', '\"[9]\"', '\"{}\"', 'notification.tasks.broadcast_notification', 'celery@EC2AMAZ-PINNM57', '2022-02-20 06:34:02.145791'),
(5, '8dd0c0e1-ddd2-4b49-853b-d1a1aa29ac7c', 'SUCCESS', 'application/json', 'utf-8', '\"Done\"', '2022-02-20 07:02:02.600288', NULL, '{\"children\": []}', '\"[2]\"', '\"{}\"', 'notification.tasks.broadcast_notification', 'celery@EC2AMAZ-PINNM57', '2022-02-20 07:02:02.600288');

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
(7, 'account', 'profile'),
(8, 'account', 'transaction'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(9, 'directChat', 'chat_message'),
(25, 'django_celery_beat', 'clockedschedule'),
(20, 'django_celery_beat', 'crontabschedule'),
(21, 'django_celery_beat', 'intervalschedule'),
(22, 'django_celery_beat', 'periodictask'),
(23, 'django_celery_beat', 'periodictasks'),
(24, 'django_celery_beat', 'solarschedule'),
(18, 'django_celery_results', 'chordcounter'),
(19, 'django_celery_results', 'groupresult'),
(17, 'django_celery_results', 'taskresult'),
(16, 'notification', 'broadcastnotification'),
(10, 'product', 'brand'),
(11, 'product', 'category'),
(12, 'product', 'color'),
(15, 'product', 'comment'),
(14, 'product', 'product'),
(13, 'product', 'sub_category'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-02-14 18:52:28.340737'),
(2, 'auth', '0001_initial', '2022-02-14 18:52:29.574867'),
(3, 'account', '0001_initial', '2022-02-14 18:52:30.074780'),
(4, 'account', '0002_auto_20220112_1945', '2022-02-14 18:52:30.184114'),
(5, 'account', '0003_auto_20220129_1422', '2022-02-14 18:52:30.418446'),
(6, 'account', '0004_auto_20220129_1430', '2022-02-14 18:52:30.465310'),
(7, 'account', '0005_alter_transaction_txn_id', '2022-02-14 18:52:30.480930'),
(8, 'account', '0006_alter_transaction_txn_id', '2022-02-14 18:52:30.480930'),
(9, 'account', '0007_alter_transaction_txn_id', '2022-02-14 18:52:30.480930'),
(10, 'account', '0008_remove_transaction_txn_id', '2022-02-14 18:52:30.512177'),
(11, 'account', '0009_transaction_txn_id', '2022-02-14 18:52:30.543422'),
(12, 'account', '0010_alter_transaction_txn_id', '2022-02-14 18:52:30.668417'),
(13, 'account', '0011_alter_transaction_txn_id', '2022-02-14 18:52:30.762128'),
(14, 'account', '0012_alter_transaction_txn_id', '2022-02-14 18:52:30.855857'),
(15, 'account', '0003_profile_product_sold', '2022-02-14 18:52:30.902734'),
(16, 'account', '0004_profile_active', '2022-02-14 18:52:30.933967'),
(17, 'account', '0013_merge_20220211_1839', '2022-02-14 18:52:30.949634'),
(18, 'account', '0014_auto_20220211_1839', '2022-02-14 18:52:31.324511'),
(19, 'account', '0015_auto_20220211_1924', '2022-02-14 18:52:31.855670'),
(20, 'account', '0013_merge_20220212_2258', '2022-02-14 18:52:31.855670'),
(21, 'account', '0016_merge_20220214_1053', '2022-02-14 18:52:31.855670'),
(22, 'account', '0017_auto_20220214_1059', '2022-02-14 18:52:32.168105'),
(23, 'account', '0018_rename_sender_id_transaction_sender', '2022-02-14 18:52:32.339936'),
(24, 'account', '0019_alter_profile_balance', '2022-02-14 18:52:32.371174'),
(25, 'admin', '0001_initial', '2022-02-14 18:52:32.699248'),
(26, 'admin', '0002_logentry_remove_auto_add', '2022-02-14 18:52:32.730483'),
(27, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-14 18:52:32.761724'),
(28, 'contenttypes', '0002_remove_content_type_name', '2022-02-14 18:52:33.089786'),
(29, 'auth', '0002_alter_permission_name_max_length', '2022-02-14 18:52:33.199150'),
(30, 'auth', '0003_alter_user_email_max_length', '2022-02-14 18:52:33.230381'),
(31, 'auth', '0004_alter_user_username_opts', '2022-02-14 18:52:33.246002'),
(32, 'auth', '0005_alter_user_last_login_null', '2022-02-14 18:52:33.370980'),
(33, 'auth', '0006_require_contenttypes_0002', '2022-02-14 18:52:33.386600'),
(34, 'auth', '0007_alter_validators_add_error_messages', '2022-02-14 18:52:33.464727'),
(35, 'auth', '0008_alter_user_username_max_length', '2022-02-14 18:52:33.589691'),
(36, 'auth', '0009_alter_user_last_name_max_length', '2022-02-14 18:52:33.652177'),
(37, 'auth', '0010_alter_group_name_max_length', '2022-02-14 18:52:33.699070'),
(38, 'auth', '0011_update_proxy_permissions', '2022-02-14 18:52:33.714675'),
(39, 'auth', '0012_alter_user_first_name_max_length', '2022-02-14 18:52:33.761553'),
(40, 'directChat', '0001_initial', '2022-02-14 18:52:34.089586'),
(41, 'django_celery_beat', '0001_initial', '2022-02-14 18:52:34.495759'),
(42, 'django_celery_beat', '0002_auto_20161118_0346', '2022-02-14 18:52:34.683227'),
(43, 'django_celery_beat', '0003_auto_20161209_0049', '2022-02-14 18:52:34.714465'),
(44, 'django_celery_beat', '0004_auto_20170221_0000', '2022-02-14 18:52:34.730088'),
(45, 'django_celery_beat', '0005_add_solarschedule_events_choices', '2022-02-14 18:52:34.745706'),
(46, 'django_celery_beat', '0006_auto_20180322_0932', '2022-02-14 18:52:34.839450'),
(47, 'django_celery_beat', '0007_auto_20180521_0826', '2022-02-14 18:52:34.886306'),
(48, 'django_celery_beat', '0008_auto_20180914_1922', '2022-02-14 18:52:34.901930'),
(49, 'django_celery_beat', '0006_auto_20180210_1226', '2022-02-14 18:52:34.933202'),
(50, 'django_celery_beat', '0006_periodictask_priority', '2022-02-14 18:52:34.948798'),
(51, 'django_celery_beat', '0009_periodictask_headers', '2022-02-14 18:52:34.995658'),
(52, 'django_celery_beat', '0010_auto_20190429_0326', '2022-02-14 18:52:35.136253'),
(53, 'django_celery_beat', '0011_auto_20190508_0153', '2022-02-14 18:52:35.261237'),
(54, 'django_celery_beat', '0012_periodictask_expire_seconds', '2022-02-14 18:52:35.308097'),
(55, 'django_celery_beat', '0013_auto_20200609_0727', '2022-02-14 18:52:35.308097'),
(56, 'django_celery_beat', '0014_remove_clockedschedule_enabled', '2022-02-14 18:52:35.323722'),
(57, 'django_celery_beat', '0015_edit_solarschedule_events_choices', '2022-02-14 18:52:35.339344'),
(58, 'django_celery_results', '0001_initial', '2022-02-14 18:52:35.511183'),
(59, 'django_celery_results', '0002_add_task_name_args_kwargs', '2022-02-14 18:52:35.573671'),
(60, 'django_celery_results', '0003_auto_20181106_1101', '2022-02-14 18:52:35.573671'),
(61, 'django_celery_results', '0004_auto_20190516_0412', '2022-02-14 18:52:35.745512'),
(62, 'django_celery_results', '0005_taskresult_worker', '2022-02-14 18:52:35.792387'),
(63, 'django_celery_results', '0006_taskresult_date_created', '2022-02-14 18:52:35.886123'),
(64, 'django_celery_results', '0007_remove_taskresult_hidden', '2022-02-14 18:52:35.901806'),
(65, 'django_celery_results', '0008_chordcounter', '2022-02-14 18:52:35.948617'),
(66, 'django_celery_results', '0009_groupresult', '2022-02-14 18:52:36.354804'),
(67, 'django_celery_results', '0010_remove_duplicate_indices', '2022-02-14 18:52:36.370416'),
(68, 'notification', '0001_initial', '2022-02-14 18:52:36.432881'),
(69, 'product', '0001_initial', '2022-02-14 18:52:37.510797'),
(70, 'product', '0002_product_likes', '2022-02-14 18:52:37.760746'),
(71, 'product', '0003_alter_product_likes', '2022-02-14 18:52:37.791997'),
(72, 'product', '0004_remove_product_likes', '2022-02-14 18:52:37.870120'),
(73, 'product', '0005_comment_likes', '2022-02-14 18:52:38.182548'),
(74, 'product', '0006_product_product_likes', '2022-02-14 18:52:38.479361'),
(75, 'product', '0007_category_picture', '2022-02-14 18:52:38.526238'),
(76, 'product', '0008_alter_category_picture', '2022-02-14 18:52:38.541847'),
(77, 'product', '0009_alter_category_picture', '2022-02-14 18:52:38.541847'),
(78, 'sessions', '0001_initial', '2022-02-14 18:52:38.619968'),
(79, 'account', '0020_alter_transaction_amount', '2022-02-19 06:53:23.141741'),
(80, 'notification', '0002_broadcastnotification_title', '2022-02-19 06:53:23.816420'),
(81, 'product', '0010_auto_20220219_1213', '2022-02-19 06:53:24.579878');

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
('018b3y6rna8g28rhja0duz7a8uf079h7', '.eJxVjMEOwiAQRP-FsyGASMGj934DWXZZqRqalPZk_Hdp0oPeJvPezFtE2NYSt5aXOJG4CidOv10CfOa6A3pAvc8S57ouU5K7Ig_a5DhTft0O9--gQCt9HQaXk0veWO7J-0zaDgYvCpEYIJEHC0hBsULugvYOkLUxnPQ5eCM-XwkXONE:1nKdeK:btbhufhMNqZ-jKYxppocdaP3ZIlX91jDbwGuD107_hA', '2022-03-03 10:04:32.994402'),
('4wf5ohmy6vs6xiqof7ggjnuhr4qfu1i3', '.eJxVjE0OwiAYBe_C2hBaQMCle89Avh-QqqFJaVfGu0uTLnQ7M--9RYRtLXFraYkTi4uw4vTLEOiZ6i74AfU-S5rrukwo90QetsnbzOl1Pdq_gwKt9LUnk4MlnYK3kLwiJIOjYhiAnQpD9piN1qaTM7NzXlkKY-9RaSJM4vMF_Zk4vA:1nLfTr:l0q36l4x9kqLipVi2gyKKnyGFBa06_ehLqDzH5Vv5PM', '2022-03-06 06:13:59.037464'),
('6snrfneb51yic38czyitncn3sbrnbmjw', '.eJxVjMEOwiAQRP-FsyGASMGj934DWXZZqRqalPZk_Hdp0oPeJvPezFtE2NYSt5aXOJG4CidOv10CfOa6A3pAvc8S57ouU5K7Ig_a5DhTft0O9--gQCt9HQaXk0veWO7J-0zaDgYvCpEYIJEHC0hBsULugvYOkLUxnPQ5eCM-XwkXONE:1nK0QB:wten0ne1Yf3EJP__bhyZeAKlZ9LRKuahyLsTkggUtCc', '2022-03-01 16:11:19.222028'),
('79o8hb12qh16y3bjjv9bujqo521812nr', '.eJxVjEEOwiAQRe_C2hCZgQ64dN8zEGBAqoYmpV0Z765NutDtf-_9l_BhW6vfel78xOIitDj9bjGkR2474Htot1mmua3LFOWuyIN2Oc6cn9fD_TuooddvDcBcmKk4QiJjDWqFmANgIWu1PmuyA6BjtKAiIRYHyMkUawaMWYn3B732NqQ:1nLfUR:k7bt2SeKMlchsldFYdxGoYkx6j9oKmSinI02-6Nvyd8', '2022-03-06 06:14:35.115621'),
('7c1x09rkjbwljws0s3xtfcca5r78v9g8', '.eJxVjEEOwiAQRe_C2hBnGAu6dN8zkAEGqRpISrsy3l2bdKHb_977L-V5XYpfu8x-SuqirDr8boHjQ-oG0p3rrenY6jJPQW-K3mnXY0vyvO7u30HhXr41QpaTiMkQQmJwwTggYTgmRHceiCNF68QAEWLOkQWEhmQFY84opN4f_144uA:1nKFzr:6b0xoWyLsW21RbyjBdMCBDC-shBhO-TC_badUIaZQPs', '2022-03-02 08:49:11.284284'),
('80aan7k19mcrfdcuvnq8zgjgqzern7g7', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nJqSY:glytMG6r1XY8UYpttBSgUcQkrf7v2K-p50X4nb0zaZs', '2022-03-01 05:33:06.107796'),
('9rycgs3rpoew732cwzqmigo2dhd3ac21', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nJrIy:sNrA30_CdlkZ5gsCoika5TQ-TMgkLeDirRq4l9YL50U', '2022-03-01 06:27:16.387077'),
('a28o3p8o72wmr9ed7p2f46cbjuo7e237', '.eJxVjEEOwiAQRe_C2pACAx1cuvcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaLOyqrT75aJH2Xagdxpus2a52ldxqx3RR-06ess5Xk53L-DgdrwrTshiL4aZyDELmQCW3oTmGO1BIZNtejFIdaM7DEC9Fb6KB5cYIdBvT_J7Tb6:1nKCnX:CBrbbqV5ny0-AIY3nOHQrqqvyUK1lRh8JuyJQTW1pCE', '2022-03-02 05:24:15.957414'),
('c12x8ain4hq0xmn4ltd2k0ym37c905ro', '.eJxVjEEOwiAQRe_C2pACAx1cuvcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaLOyqrT75aJH2Xagdxpus2a52ldxqx3RR-06ess5Xk53L-DgdrwrTshiL4aZyDELmQCW3oTmGO1BIZNtejFIdaM7DEC9Fb6KB5cYIdBvT_J7Tb6:1nKDn7:gU-1611NpdiLNn5qCPkWWMUrKUWgdBfnOJcyCCAh0yU', '2022-03-02 06:27:53.281593'),
('c4s60mzpptnmxj4etcmjtcmx3p16optr', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nJgtK:1wxIiZgCc7MngJp0g9z9HEW9gQ2_bOS23dj2BDgIt4Y', '2022-02-28 19:20:06.884727'),
('ctyeztp4ebkx2jx53yo0mg9kxr5nepr2', '.eJxVjE0OwiAYBe_C2hBaQMCle89Avh-QqqFJaVfGu0uTLnQ7M--9RYRtLXFraYkTi4uw4vTLEOiZ6i74AfU-S5rrukwo90QetsnbzOl1Pdq_gwKt9LUnk4MlnYK3kLwiJIOjYhiAnQpD9piN1qaTM7NzXlkKY-9RaSJM4vMF_Zk4vA:1nLJZh:nNTdZby35UvBgm7ZErBj5e3IPVVcWM4tH84FCO5mU84', '2022-03-05 06:50:33.652826'),
('gm2cm69mvg8cyq1dojkxcxu5e7yi39b9', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nJsKf:QOHuGECvvLFbCx8KWCh8UmoBSti4_uZyhJtP0aO0oZA', '2022-03-01 07:33:05.279012'),
('jrrps1h9ywv9aagv39e1q853vvg8pao5', '.eJxVjDsOwjAQBe_iGln-sP5Q0ucM1q7XwgFkS3FSIe4OkVJA-2bmvUTCba1pG2VJM4uL0OL0uxHmR2k74Du2W5e5t3WZSe6KPOiQU-fyvB7u30HFUb-1j0hKsUOAs7cQSRFaCuy9Dc4CllwMR7Ds0URLYDQhFu1dBlBOBfH-ANd0N2k:1nKftj:P83ooxGHxScdFgTfJd82UJt-wG_hblwkrgBUh3Ke1p4', '2022-03-03 12:28:35.698567'),
('jxbr1naxgf7cp82hhm5e4tglhccfphtm', '.eJxVjE0OwiAYBe_C2hBaQMCle89Avh-QqqFJaVfGu0uTLnQ7M--9RYRtLXFraYkTi4uw4vTLEOiZ6i74AfU-S5rrukwo90QetsnbzOl1Pdq_gwKt9LUnk4MlnYK3kLwiJIOjYhiAnQpD9piN1qaTM7NzXlkKY-9RaSJM4vMF_Zk4vA:1nJrWx:Q6b0nfZo326WdFAos_s0Gu291jLEGlSPKr4H4bEKbaw', '2022-03-01 06:41:43.739662'),
('k64ovv2v5j6u1rdl89gt13qbxdym36lm', '.eJxVjEEOwiAQRe_C2pACAx1cuvcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaLOyqrT75aJH2Xagdxpus2a52ldxqx3RR-06ess5Xk53L-DgdrwrTshiL4aZyDELmQCW3oTmGO1BIZNtejFIdaM7DEC9Fb6KB5cYIdBvT_J7Tb6:1nMDvG:EE83QX2mINKJGf-aIryL2zga0Efw-p4GhI7Jnn4EqfU', '2022-03-07 19:00:34.610664'),
('myoaylou9kfc72064b9k29d0t0bnncv2', '.eJxVjEEOwiAQRe_C2hCZgQ64dN8zEGBAqoYmpV0Z765NutDtf-_9l_BhW6vfel78xOIitDj9bjGkR2474Htot1mmua3LFOWuyIN2Oc6cn9fD_TuooddvDcBcmKk4QiJjDWqFmANgIWu1PmuyA6BjtKAiIRYHyMkUawaMWYn3B732NqQ:1nKCuC:6InEel6nCfJeNKAR9G93QvovZhklkMrpksxWVIuGrQs', '2022-03-02 05:31:08.328895'),
('nro4m8q219ibfyimzj4w8wnuyybkt8d4', '.eJxVjDsOwjAQBe_iGln-sP5Q0ucM1q7XwgFkS3FSIe4OkVJA-2bmvUTCba1pG2VJM4uL0OL0uxHmR2k74Du2W5e5t3WZSe6KPOiQU-fyvB7u30HFUb-1j0hKsUOAs7cQSRFaCuy9Dc4CllwMR7Ds0URLYDQhFu1dBlBOBfH-ANd0N2k:1nMCZk:if-TbaP-DIsLlol7P7by44eLWoNftbRHH5vzzM4xXBM', '2022-03-07 17:34:16.078439'),
('po7dlkc45se571u3v1ra3pvnunzsiyn2', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nKAXQ:UFSS0lAcUCj8k1NKfbteacIT2T2-nogwKWDvQfleG0g', '2022-03-02 02:59:28.562988'),
('s6qn2esng1z10vtnros7s28mp832yzam', '.eJxVjEEOwiAQRe_C2pACAx1cuvcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaLOyqrT75aJH2Xagdxpus2a52ldxqx3RR-06ess5Xk53L-DgdrwrTshiL4aZyDELmQCW3oTmGO1BIZNtejFIdaM7DEC9Fb6KB5cYIdBvT_J7Tb6:1nLIH5:FABwu2MkCE6a96P8Jq_llb47-0pXA-kxcMSuTtDLMU4', '2022-03-05 05:27:15.894255'),
('ubjxmtdg4apdak61owtmjsleqaevpyvy', '.eJxVjDsOwjAQBe_iGlmx179Q0nMGa-1d4wBypDipEHeHSCmgfTPzXiLitta4dV7iROIsQJx-t4T5wW0HdMd2m2We27pMSe6KPGiX15n4eTncv4OKvX5ro4pyCBDAYDLEWltAYpc9ASY7krVeYQnWmQK2sDaFQ0lDGL0ewCnx_gDi-jen:1nJgwt:EkwFpJTuo343IEqtpGMO8CaoxymGg3w3LZrlASLeY4w', '2022-02-28 19:23:47.534680'),
('v2vpu9r1xvi7fj29shk6cpeoi0f6gs4t', '.eJxVjE0OwiAYBe_C2hBaQMCle89Avh-QqqFJaVfGu0uTLnQ7M--9RYRtLXFraYkTi4uw4vTLEOiZ6i74AfU-S5rrukwo90QetsnbzOl1Pdq_gwKt9LUnk4MlnYK3kLwiJIOjYhiAnQpD9piN1qaTM7NzXlkKY-9RaSJM4vMF_Zk4vA:1nMBRE:BRp93fJGeD_wJ519qDNvSpggu5njdfmxNLsP3h61quo', '2022-03-07 16:21:24.421763'),
('vklgwx8wpsm21qhidvuxnjdekd9zwf9e', '.eJxVjEEOwiAQRe_C2hCY0gIu3fcMZAYGqRqalHZlvLtt0oVu33v_v0XAbS1ha7yEKYmrcOLyywjjk-sh0gPrfZZxrusykTwSedomxznx63a2fwcFW9nXELU2jqGz0Gs2mK3xPShlMWUzEINxRrnBO1CJiD2rLiIjMeUdJys-X8YYN9E:1nKfIM:lltdknjug24ndugg7uvLLj1LX3mE373rvlQrfo7M5O8', '2022-03-03 11:49:58.572956'),
('vlb84yeb41bzpyue0svnxg32ujuqxakd', '.eJxVjEEOwiAQRe_C2hDAMlCX7nsGMsMMUjVtUtqV8e7apAvd_vfef6mE21rT1mRJI6uLsladfkfC_JBpJ3zH6TbrPE_rMpLeFX3QpoeZ5Xk93L-Diq1-a5cDQgQP0ZCwAwQGL-QgdMRydsb3xZMrsUQhHz1h6RyHzgizCb1V7w8JUjhD:1nLfSA:uEbeh6OyAnBUAXeCLEQbO9g4YzJaEynlNW98fJAnd-4', '2022-03-06 06:12:14.182960'),
('w5cuqp58zgky4ze0vrpk6r72xdmkm6y5', '.eJxVjEEOwiAQRe_C2pACAx1cuvcMZJgBWzVtUtqV8e7apAvd_vfef6lE2zqkrZUljaLOyqrT75aJH2Xagdxpus2a52ldxqx3RR-06ess5Xk53L-DgdrwrTshiL4aZyDELmQCW3oTmGO1BIZNtejFIdaM7DEC9Fb6KB5cYIdBvT_J7Tb6:1nKCnL:m-vj5wurFiS7YBd1-LOYhaQqKLboL9tZCE_DkKYm8R4', '2022-03-02 05:24:03.530924'),
('z125e4yej1flcjch4oxyugl1q7o9jhbn', '.eJxVjDsOwjAQRO_iGll2_FtT0nMGa9decADFUpxUiLuTSCmgGmnem3mLhOtS09p5TmMRZ6GVOP2WhPnJ007KA6d7k7lNyzyS3BV50C6vrfDrcrh_BxV73dZklA4QsopRsY7aRjTaWO8B2VFByEN27qaIBl84kAaALUxGsINjJT5f5m83oQ:1nKkK6:PRzzk_NQsxmw4TasazTo3m5Ms9InMOGL8tQcAppG7LY', '2022-03-03 17:12:06.454287'),
('zcgk8nvhi36373abilznh8x8u15eld3q', '.eJxVjEEOwiAQRe_C2hDaocC4dO8ZyAxDpWpKUtqV8e7apAvd_vfef6lI21ri1vISJ1Fn1anT78aUHnnegdxpvlWd6rwuE-td0Qdt-lolPy-H-3dQqJVvbT12IyQA1zEOQgS-dyJiERCh74H9AN6PhoMLTshgYsxCMhrwwVj1_gDGtzdU:1nJoPt:XET0YCAmBQfSvK__mW6-z61a9TcUM8332bBtxXw_w8s', '2022-03-01 03:22:13.669264');

-- --------------------------------------------------------

--
-- Table structure for table `notification_broadcastnotification`
--

CREATE TABLE `notification_broadcastnotification` (
  `id` bigint(20) NOT NULL,
  `message` longtext NOT NULL,
  `broadcast_on` datetime(6) NOT NULL,
  `sent` tinyint(1) NOT NULL,
  `title` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notification_broadcastnotification`
--

INSERT INTO `notification_broadcastnotification` (`id`, `message`, `broadcast_on`, `sent`, `title`) VALUES
(11, 'Megaplex will be live on the internet on 20th February', '2022-02-20 07:05:00.000000', 1, 'Product Lunch'),
(12, 'New Product added.', '2022-02-20 07:07:00.000000', 1, 'Megaplex Notification'),
(13, 'Megaplex is going to launching beta version of another similar website.', '2022-02-20 07:09:00.000000', 1, 'Megaplex Notification'),
(14, 'Megaplex offers special discount to the regular customer.', '2022-02-20 07:10:00.000000', 1, 'Megaplex Notification'),
(15, 'Don\'t miss the opportunity. We are launching tesla model for the first time in Nepal.', '2022-02-20 07:12:00.000000', 0, 'Megaplex Notification');

-- --------------------------------------------------------

--
-- Table structure for table `product_brand`
--

CREATE TABLE `product_brand` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_brand`
--

INSERT INTO `product_brand` (`id`, `name`) VALUES
(1, 'Apple'),
(2, 'Nike'),
(3, 'Addidas'),
(4, 'Converse'),
(5, 'Gold Star'),
(6, 'Puma'),
(7, 'No brand'),
(8, 'Tesla'),
(9, 'One Plus');

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `picture`) VALUES
(23, 'Electronics', 'category_images/s2_TUgbH0b.jpg'),
(27, 'Gadgets', 'category_images/hector-martinez-EG49vTtKdvI-unsplash_g9xBmhs.jpg'),
(28, 'Clothing', 'category_images/471cb9100089591.5f01508c2d371_lc4DID6.jpg'),
(29, 'Adoption', 'category_images/adoption.jpg'),
(30, 'Beauty and Health', 'category_images/beauty_and_health.jpg'),
(31, 'Books', 'category_images/books.jpg'),
(32, 'Cars', 'category_images/cars.jpg'),
(33, 'Fashion', 'category_images/fashion.jpg'),
(34, 'Electronics', 'category_images/computer_and_peripherals.jpg'),
(35, 'Musical Instrument', 'category_images/music_ins.jpg'),
(36, 'Real Estate', 'category_images/real_estatr.jpg'),
(37, 'Services', 'category_images/services.jpg'),
(38, 'Tours and travals', 'def.jpeg'),
(39, 'Toys', 'category_images/toys.jpg'),
(40, 'Grocerry', 'category_images/veg_and_meat.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `product_color`
--

CREATE TABLE `product_color` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_color`
--

INSERT INTO `product_color` (`id`, `name`) VALUES
(1, 'Red'),
(2, 'Black'),
(3, 'Gold'),
(4, 'White'),
(5, 'Mix Color'),
(6, 'Yellow'),
(7, 'Pink'),
(8, 'Blue'),
(9, 'Green'),
(10, 'Cyan');

-- --------------------------------------------------------

--
-- Table structure for table `product_comment`
--

CREATE TABLE `product_comment` (
  `sno` int(11) NOT NULL,
  `comment_text` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_comment`
--

INSERT INTO `product_comment` (`sno`, `comment_text`, `timestamp`, `parent_id`, `product_id`, `user_id`) VALUES
(14, 'jk\r\n', '2022-02-21 18:25:33.321156', NULL, 26, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_comment_likes`
--

CREATE TABLE `product_comment_likes` (
  `id` bigint(20) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product_product`
--

CREATE TABLE `product_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `picture` varchar(100) NOT NULL,
  `price` double NOT NULL,
  `image1` varchar(100) NOT NULL,
  `image2` varchar(100) NOT NULL,
  `image3` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `warranty` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `specifications` longtext NOT NULL,
  `quantity` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `view_count` int(11) NOT NULL,
  `brand_id` bigint(20) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `color_id` bigint(20) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `sub_category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_product`
--

INSERT INTO `product_product` (`id`, `name`, `picture`, `price`, `image1`, `image2`, `image3`, `date`, `warranty`, `description`, `specifications`, `quantity`, `is_active`, `view_count`, `brand_id`, `category_id`, `color_id`, `seller_id`, `sub_category_id`) VALUES
(25, 'Iphone X', 'product_images/s1_hiua8wn.jpg', 266, 'product_images/s1_H3FeoLk.jpg', 'product_images/s4_3t2Zrlp.jpg', 'product_images/s2_01gufOR.jpg', '2022-02-19', '1 Year', 'he iPhone X used a glass and stainless-steel form factor and \"bezel-less\" design, shrinking the bezels while not having a \"chin\", unlike many Android phones. It was the first iPhone to use an OLED screen. The home button\'s fingerprint sensor was replaced with a new type of authentication called Face ID, which used sensors to scan the user\'s face to unlock the device. This face-recognition capability also enabled emojis to be animated following the user\'s expression (Animoji). With a bezel-less design, iPhone user interaction changed significantly, using gestures to navigate the operating system rather than the home button used in all previous iPhones. At the time of its November 2017 launch, its price tag of US$999 also made it the most expensive iPhone ever, with even higher prices internationally due to additional local sales and import taxes.', 'The iPhone X received positive reviews. Its display and build quality were strongly praised, and the camera also scored positively on tests. However, the sensor housing \"notch\" at the top of the screen and the introduction of an all-new authentication method were polarizing for critics and consumers. The notch was heavily mocked by users on social media, although app developers responded either neutrally or positively to the changes it brought to the user experience in their apps and games. Face ID facial recognition was praised for its simple setup, but criticized for requiring direct eyes on the screen, though that option can be disabled within the system preferences.', 1, 1, 37, 1, 23, 5, 1, 10),
(26, 'Jordan', 'product_images/download_nu3CfdS.jpg', 50000, 'product_images/download_7oHirnM.jpg', 'product_images/download_VDveLg5.jpg', 'product_images/download_FQA819x.jpg', '2022-02-20', '1 Year', 'The Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.', 'OUBLE THE AF-1.DOUBLE THE FUN.\r\n\r\n\r\nThe Nike Air Force 1 Shadow puts a playful twist on a classic b-ball design.Using a layered approach, doubling the branding and exaggerating the midsole, it highlights AF-1 DNA with a bold, new look.\r\n\r\n\r\nLayered Look\r\n\r\nWith 2 eyestays, 2 mudguards, 2 back tabs and 2 Swoosh designs, you get a layered look with double the branding.\r\n\r\n\r\nLightweight Comfort\r\n\r\nA foam midsole and a grooved outsole ensure that the shoe is lightweight, flexible and comfortable.\r\n\r\n\r\nIconic Shape\r\n\r\nFeaturing the same iconic shape as the original Air Force 1, a slightly exaggerated midsole makes the shoe instantly recognisable while also playing with proportions.', 1, 1, 28, 2, 33, 1, 4, 12),
(28, 'Addidas light', 'product_images/shoes-2_kDoCZJw.jpg', 1000, 'product_images/shoes-6_Rv9aNog.jpg', 'product_images/shoes-5_eKRgiLG.jpg', 'product_images/addidas_4J036x8.jpg', '2022-02-20', '3 Years', 'When the adidas Forum entered the scene, they were the first adidas basketball shoes of their kind. Players unleashed a fury of energy on the court and soon that same energy moved right off of it as it was adopted by the rest of the world. Just like the OG, this version has the signature ankle strap and X-detail that makes the Forum unmistakable. An icon through and through, the famed sneakers\' legend is still shaping. Lace into them and help tell it.', 'Lace closure,Leather upper,Textile lining,Gum rubber outsole', 1, 1, 38, 3, 28, 4, 5, 12),
(29, 'Nike Air', 'product_images/shoes-4_wp9Cesv.png', 2000, 'product_images/shoes-7_JWIejNO.png', 'product_images/shoes-4_ppsQgPV.png', 'product_images/shoes-7_18wh4dh.png', '2022-02-20', '1 Year', 'The redesigned shape returns to the OG roots, adding old-school hoops DNA.Originally designed for performance b-ball, Nike Air cushioning ,adds lightweight comfort.The new liner features plush padding for a soft and comfortable feel.', 'Rubber sole Colour Shown: White/Noble Green/Metallic,Silver', 1, 1, 2, 2, 28, 4, 5, 12),
(30, 'Nivea Facewash', 'product_images/61LmABL6JKL._SL1500_.jpg', 300, 'product_images/61LmABL6JKL._SL1500__dVaxxai.jpg', 'product_images/61LmABL6JKL._SL1500__4UO0Mil.jpg', 'product_images/61LmABL6JKL._SL1500__VqZsWMT.jpg', '2022-02-20', '1 Year', 'Deeply cleanses pores while reducing excesss sebum\r\nIts microbead formula contains ocean algae extracts and hydra IQ\r\nCleanses your pores and vitalizes the skin making it look pure and clear.\r\nMaintains skin\'s natural moisture balance\r\nBest suited for combination skin', 'Deeply cleanses pores while reducing excesss sebum\r\nIts microbead formula contains ocean algae extracts and hydra IQ\r\nCleanses your pores and vitalizes the skin making it look pure and clear.\r\nMaintains skin\'s natural moisture balance\r\nBest suited for combination skin', 1, 1, 0, 7, 30, 5, 4, 13),
(31, 'Nike crocs', 'product_images/715618def4fed6879c9a910c820f904769293580-1250x833_7y1U8jc.jpg', 1500, 'product_images/28ad5f106681925.5f95c83c3e3b1_n8oy26f.png', 'product_images/715618def4fed6879c9a910c820f904769293580-1250x833_v9iFZ8r.jpg', 'product_images/28ad5f106681925.5f95c83c3e3b1_8l3cgtz.png', '2022-02-20', '2 Years', 'Generated from production waste, e.g. cutting scraps, and post-consumer household waste  to avoid the larger environmental impact of producing virgin content.', 'Leather upper,Textile lining,Gum rubber outsole', 1, 1, 0, 2, 28, 4, 5, 12),
(32, 'Washing Machine', 'product_images/FHM1065ZDL-Washing-Machines-Front-View-D-01.jpg', 2000000, 'product_images/FHM1065ZDL-Washing-Machines-Front-View-D-01_WbgnVgW.jpg', 'product_images/FHM1065ZDL-Washing-Machines-Front-View-D-01_bB4tZh7.jpg', 'product_images/FHM1065ZDL-Washing-Machines-Front-View-D-01_2TV9dDo.jpg', '2022-02-20', '1 Year', 'SAMSUNG WW81J54EOBX - 8Kg Fully Automatic Front Loading Washing Machine With Eco Bubble & Hygiene Steam Wash', 'About this item\r\nDeeply cleanses pores while reducing excesss sebum\r\nIts microbead formula contains ocean algae extracts and hydra IQ\r\nCleanses your pores and vitalizes the skin making it look pure and clear.\r\nMaintains skin\'s natural moisture balance\r\nBest suited for combination skin', 1, 1, 5, 9, 23, 10, 4, 10),
(33, 'Nike Watch', 'product_images/download_1.jpg', 6262, 'product_images/download_1_J1JhI2C.jpg', 'product_images/download_1_mYCKLnl.jpg', 'product_images/download_1_6FMs1wS.jpg', '2022-02-20', '1 Year', 'Apple Watch Nike with the Nike Run Club app is your ultimate running partner. The new Nike watch face moves with you. Guided Runs give you a coach that cheers you on. And that’s just the start. Take the next step to better running with Apple Watch Nike.', 'Apple Watch Studio\r\nAny case. Any band.\r\nAny style you want.\r\n\r\n\r\nCreate your style\r\nWhich Apple Watch Nike is right for you?\r\nNew\r\nApple Watch Series 7\r\nFrom $399\r\n\r\nBuy\r\nLearn more\r\n45mm or 41mm\r\nSwimproof1\r\n\r\nMost crack-resistant\r\nfront crystal\r\n\r\nCertified IP6X dust resistant1\r\n\r\nAlways-On Retina display\r\nNearly 20% larger than\r\nApple Watch SE\r\n\r\nOver 50% larger\r\nthan Series 3\r\n\r\nBlood Oxygen app2\r\n\r\nECG app3\r\n\r\nHigh and low heart\r\nrate notifications\r\n\r\nIrregular heart\r\nrhythm notification4\r\n\r\nEmergency SOS5\r\n\r\nInternational\r\nemergency calling6\r\n\r\nFall detection\r\n\r\nCellular available7\r\n\r\nFamily Setup — pair multiple\r\nwatches with one iPhone8\r\n\r\nApple Watch SE\r\nFrom $279\r\n\r\nBuy\r\nLearn more\r\n44mm or 40mm\r\nSwimproof1\r\n\r\n \r\n\r\n \r\n\r\nRetina display\r\nOver 30% larger\r\nthan Series 3', 1, 1, 15, 2, 33, 4, 4, 11),
(34, 'Addidas Z', 'product_images/shoes-3_2nYhIxa.png', 1000, 'product_images/converse-3.jpg', 'product_images/shoes-2_mDrYJn1.jpg', 'product_images/shoes-3_uFeAqO2.png', '2022-02-20', '2 Years', 'When the adidas Forum entered the scene, they were the first adidas basketball shoes of their kind. Players unleashed a fury of energy on the court and soon that same energy moved right off of it as it was adopted by the rest of the world. Just like the OG, this version has the signature ankle strap and X-detail that makes the Forum unmistakable. An icon through and through, the famed sneakers\' legend is still shaping. Lace into them and help tell it.', 'EVA sockliner,Rubber outsole,Imported,Product color: Cloud White/Legend Ink / Vivid Red Product code: GY5543', 1, 1, 13, 3, 28, 4, 5, 12),
(35, 'Dog for Adoption', 'product_images/images_EdjFx8q.jpg', 6969, 'product_images/images_XyuvSEZ.jpg', 'product_images/images_AOwwAGt.jpg', 'product_images/images_T8jn5i6.jpg', '2022-02-20', 'None', 'nfant adoption during Antiquity appears rare.[4][7] Abandoned children were often picked up for slavery[8] and composed a significant percentage of the Empire\'s slave supply.[9][10] Roman legal records indicate that foundlings were occasionally taken in by families and raised as a son or daughter. Although not normally adopted under Roman Law, the children, called alumni, were reared in an arrangement similar to guardianship, being considered the property of the father who abandoned them.[11]', 'nfant adoption during Antiquity appears rare.[4][7] Abandoned children were often picked up for slavery[8] and composed a significant percentage of the Empire\'s slave supply.[9][10] Roman legal records indicate that foundlings were occasionally taken in by families and raised as a son or daughter. Although not normally adopted under Roman Law, the children, called alumni, were reared in an arrangement similar to guardianship, being considered the property of the father who abandoned them.[11]', 1, 1, 0, 7, 29, 4, 4, 10),
(36, 'Gold Air', 'product_images/0acc473342fe7feb55e1f03ecb150066_YciTvn0.jpg', 1500, 'product_images/shoes-7_sVj317b.png', 'product_images/0acc473342fe7feb55e1f03ecb150066_XhXguOJ.jpg', 'product_images/shoes-7_6wZ604M.png', '2022-02-20', '4 Years', 'Goldstar shoes for men, women and children. Goldstar Shoes- Nepal\'s leading shoes brand. High quality and affordable price. Exclusive deals and discounts.', '25% of the components used to make the upper contain a minimum of 50% recycled content Imported Product color: Cloud White / Vivid Red / Cloud White Product code: GY5819', 1, 1, 2, 5, 28, 4, 5, 12),
(37, 'Bunglow', 'product_images/220px-Townhouses_in_Victoria_Australia.jpg', 50000000000, 'product_images/220px-Townhouses_in_Victoria_Australia_98ph35n.jpg', 'product_images/220px-Townhouses_in_Victoria_Australia_RagZ2gz.jpg', 'product_images/220px-Townhouses_in_Victoria_Australia_5w4bFja.jpg', '2022-02-20', '5 Years', 'A beautifully presented brick character cottage, having once been the village shop, situated in the centre of this popular Vale of Belvoir village. Gas CH, quality UPVC double glazed windows and doors, many character features throughout. Entrance hall, living room, inner hall, large dining kitche...', 'A beautifully presented brick character cottage, having once been the village shop, situated in the centre of this popular Vale of Belvoir village. Gas CH, quality UPVC double glazed windows and doors, many character features throughout. Entrance hall, living room, inner hall, large dining kitche...', 1, 1, 0, 7, 36, 8, 4, 10);

-- --------------------------------------------------------

--
-- Table structure for table `product_product_product_likes`
--

CREATE TABLE `product_product_product_likes` (
  `id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_product_product_likes`
--

INSERT INTO `product_product_product_likes` (`id`, `product_id`, `user_id`) VALUES
(70, 25, 1),
(63, 26, 1),
(60, 28, 5),
(71, 31, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_sub_category`
--

CREATE TABLE `product_sub_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_sub_category`
--

INSERT INTO `product_sub_category` (`id`, `name`, `category_id`) VALUES
(10, 'Smartphone', 23),
(11, 'PC & Laptops', 23),
(12, 'Shoes', 28),
(13, 'Shirts', 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_profile`
--
ALTER TABLE `account_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `account_profile_followers`
--
ALTER TABLE `account_profile_followers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_profile_followers_profile_id_user_id_3f45c1fb_uniq` (`profile_id`,`user_id`),
  ADD KEY `account_profile_followers_user_id_14400f54_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_profile_following`
--
ALTER TABLE `account_profile_following`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_profile_following_profile_id_user_id_97d7940a_uniq` (`profile_id`,`user_id`),
  ADD KEY `account_profile_following_user_id_e07bf05e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `account_transaction`
--
ALTER TABLE `account_transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_transaction_receiver_id_5cd730d0` (`receiver_id`),
  ADD KEY `account_transaction_sender_id_91921e3b_fk_auth_user_id` (`sender_id`);

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
-- Indexes for table `directchat_chat_message`
--
ALTER TABLE `directchat_chat_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `directChat_chat_message_recipient_id_860c1923_fk_auth_user_id` (`recipient_id`),
  ADD KEY `directChat_chat_message_sender_id_b33a6234_fk_auth_user_id` (`sender_id`),
  ADD KEY `directChat_chat_message_user_id_6ab61274_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` (`crontab_id`),
  ADD KEY `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` (`interval_id`),
  ADD KEY `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` (`solar_id`),
  ADD KEY `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` (`clocked_id`);

--
-- Indexes for table `django_celery_beat_periodictasks`
--
ALTER TABLE `django_celery_beat_periodictasks`
  ADD PRIMARY KEY (`ident`);

--
-- Indexes for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq` (`event`,`latitude`,`longitude`);

--
-- Indexes for table `django_celery_results_chordcounter`
--
ALTER TABLE `django_celery_results_chordcounter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`);

--
-- Indexes for table `django_celery_results_groupresult`
--
ALTER TABLE `django_celery_results_groupresult`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_id` (`group_id`),
  ADD KEY `django_cele_date_cr_bd6c1d_idx` (`date_created`),
  ADD KEY `django_cele_date_do_caae0e_idx` (`date_done`);

--
-- Indexes for table `django_celery_results_taskresult`
--
ALTER TABLE `django_celery_results_taskresult`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `task_id` (`task_id`),
  ADD KEY `django_cele_task_na_08aec9_idx` (`task_name`),
  ADD KEY `django_cele_status_9b6201_idx` (`status`),
  ADD KEY `django_cele_worker_d54dd8_idx` (`worker`),
  ADD KEY `django_cele_date_cr_f04a50_idx` (`date_created`),
  ADD KEY `django_cele_date_do_f59aad_idx` (`date_done`);

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
-- Indexes for table `notification_broadcastnotification`
--
ALTER TABLE `notification_broadcastnotification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_brand`
--
ALTER TABLE `product_brand`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_color`
--
ALTER TABLE `product_color`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_comment`
--
ALTER TABLE `product_comment`
  ADD PRIMARY KEY (`sno`),
  ADD KEY `product_comment_parent_id_05a1b58a_fk_product_comment_sno` (`parent_id`),
  ADD KEY `product_comment_product_id_b32e96a2_fk_product_product_id` (`product_id`),
  ADD KEY `product_comment_user_id_ac70fe86_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `product_comment_likes`
--
ALTER TABLE `product_comment_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_comment_likes_comment_id_user_id_fbee90fa_uniq` (`comment_id`,`user_id`),
  ADD KEY `product_comment_likes_user_id_db122c2c_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `product_product`
--
ALTER TABLE `product_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_product_brand_id_fcf1b3f3_fk_product_brand_id` (`brand_id`),
  ADD KEY `product_product_category_id_0c725779_fk_product_category_id` (`category_id`),
  ADD KEY `product_product_color_id_3e70209c_fk_product_color_id` (`color_id`),
  ADD KEY `product_product_seller_id_7f1925e5_fk_auth_user_id` (`seller_id`),
  ADD KEY `product_product_sub_category_id_378678a0_fk_product_s` (`sub_category_id`);

--
-- Indexes for table `product_product_product_likes`
--
ALTER TABLE `product_product_product_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_product_product_likes_product_id_user_id_c42f8aca_uniq` (`product_id`,`user_id`),
  ADD KEY `product_product_product_likes_user_id_5733f455_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_sub_category_category_id_ebb97679_fk_product_category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_profile`
--
ALTER TABLE `account_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `account_profile_followers`
--
ALTER TABLE `account_profile_followers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_profile_following`
--
ALTER TABLE `account_profile_following`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `account_transaction`
--
ALTER TABLE `account_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `directchat_chat_message`
--
ALTER TABLE `directchat_chat_message`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT for table `django_celery_beat_clockedschedule`
--
ALTER TABLE `django_celery_beat_clockedschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_crontabschedule`
--
ALTER TABLE `django_celery_beat_crontabschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `django_celery_beat_intervalschedule`
--
ALTER TABLE `django_celery_beat_intervalschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `django_celery_beat_solarschedule`
--
ALTER TABLE `django_celery_beat_solarschedule`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_results_chordcounter`
--
ALTER TABLE `django_celery_results_chordcounter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_results_groupresult`
--
ALTER TABLE `django_celery_results_groupresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_celery_results_taskresult`
--
ALTER TABLE `django_celery_results_taskresult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `notification_broadcastnotification`
--
ALTER TABLE `notification_broadcastnotification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_brand`
--
ALTER TABLE `product_brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `product_color`
--
ALTER TABLE `product_color`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product_comment`
--
ALTER TABLE `product_comment`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product_comment_likes`
--
ALTER TABLE `product_comment_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_product`
--
ALTER TABLE `product_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `product_product_product_likes`
--
ALTER TABLE `product_product_product_likes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_profile`
--
ALTER TABLE `account_profile`
  ADD CONSTRAINT `account_profile_user_id_bdd52018_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_profile_followers`
--
ALTER TABLE `account_profile_followers`
  ADD CONSTRAINT `account_profile_foll_profile_id_ac365f18_fk_account_p` FOREIGN KEY (`profile_id`) REFERENCES `account_profile` (`id`),
  ADD CONSTRAINT `account_profile_followers_user_id_14400f54_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_profile_following`
--
ALTER TABLE `account_profile_following`
  ADD CONSTRAINT `account_profile_foll_profile_id_0016a31b_fk_account_p` FOREIGN KEY (`profile_id`) REFERENCES `account_profile` (`id`),
  ADD CONSTRAINT `account_profile_following_user_id_e07bf05e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `account_transaction`
--
ALTER TABLE `account_transaction`
  ADD CONSTRAINT `account_transaction_receiver_id_5cd730d0_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `account_transaction_sender_id_91921e3b_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`);

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
-- Constraints for table `directchat_chat_message`
--
ALTER TABLE `directchat_chat_message`
  ADD CONSTRAINT `directChat_chat_message_recipient_id_860c1923_fk_auth_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `directChat_chat_message_sender_id_b33a6234_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `directChat_chat_message_user_id_6ab61274_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_celery_beat_periodictask`
--
ALTER TABLE `django_celery_beat_periodictask`
  ADD CONSTRAINT `django_celery_beat_p_clocked_id_47a69f82_fk_django_ce` FOREIGN KEY (`clocked_id`) REFERENCES `django_celery_beat_clockedschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_crontab_id_d3cba168_fk_django_ce` FOREIGN KEY (`crontab_id`) REFERENCES `django_celery_beat_crontabschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_interval_id_a8ca27da_fk_django_ce` FOREIGN KEY (`interval_id`) REFERENCES `django_celery_beat_intervalschedule` (`id`),
  ADD CONSTRAINT `django_celery_beat_p_solar_id_a87ce72c_fk_django_ce` FOREIGN KEY (`solar_id`) REFERENCES `django_celery_beat_solarschedule` (`id`);

--
-- Constraints for table `product_comment`
--
ALTER TABLE `product_comment`
  ADD CONSTRAINT `product_comment_parent_id_05a1b58a_fk_product_comment_sno` FOREIGN KEY (`parent_id`) REFERENCES `product_comment` (`sno`),
  ADD CONSTRAINT `product_comment_product_id_b32e96a2_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_comment_user_id_ac70fe86_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_comment_likes`
--
ALTER TABLE `product_comment_likes`
  ADD CONSTRAINT `product_comment_likes_comment_id_1587ed00_fk_product_comment_sno` FOREIGN KEY (`comment_id`) REFERENCES `product_comment` (`sno`),
  ADD CONSTRAINT `product_comment_likes_user_id_db122c2c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_product`
--
ALTER TABLE `product_product`
  ADD CONSTRAINT `product_product_brand_id_fcf1b3f3_fk_product_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`),
  ADD CONSTRAINT `product_product_category_id_0c725779_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  ADD CONSTRAINT `product_product_color_id_3e70209c_fk_product_color_id` FOREIGN KEY (`color_id`) REFERENCES `product_color` (`id`),
  ADD CONSTRAINT `product_product_seller_id_7f1925e5_fk_auth_user_id` FOREIGN KEY (`seller_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `product_product_sub_category_id_378678a0_fk_product_s` FOREIGN KEY (`sub_category_id`) REFERENCES `product_sub_category` (`id`);

--
-- Constraints for table `product_product_product_likes`
--
ALTER TABLE `product_product_product_likes`
  ADD CONSTRAINT `product_product_prod_product_id_7a0089bb_fk_product_p` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  ADD CONSTRAINT `product_product_product_likes_user_id_5733f455_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `product_sub_category`
--
ALTER TABLE `product_sub_category`
  ADD CONSTRAINT `product_sub_category_category_id_ebb97679_fk_product_category_id` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
