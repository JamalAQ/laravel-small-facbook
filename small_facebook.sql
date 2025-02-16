-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2025 at 01:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `small_facebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE `friends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `friend_id` bigint(20) UNSIGNED NOT NULL,
  `friendship_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sender_id` bigint(20) UNSIGNED NOT NULL,
  `receiver_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','accepted','rejected') NOT NULL DEFAULT 'pending',
  `sent_date` timestamp NULL DEFAULT NULL,
  `result_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_12_06_071547_create_friend_requests_table', 1),
(5, '2024_12_06_071547_create_friends_table', 1),
(6, '2024_12_06_072112_create_posts_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('sR0Ho0VkiaitrEJXOp4uWqG0yFIJM739OLSYQAc2', 112, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaUxkWTU5NGh4VFY0MnVadzRjb3JCS2RjdnJHTWhlY1VGUWQwMHQ3OSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZWdpc3RlciI7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjExMjtzOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjMxOiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZGFzaGJvYXJkIjt9fQ==', 1739708661);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `account_type` enum('user','admin','sub_admin') NOT NULL DEFAULT 'user',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `email_verified_at`, `profile_picture`, `status`, `last_login`, `account_type`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Kari Quitzon I', 'wuckert.marcella@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '1KxaurF5Ni', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(2, 'Eduardo Blanda PhD', 'magnolia36@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'emncfmyTHw', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(3, 'Mr. Boyd Walter II', 'nienow.eryn@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'JcUR6xg0Yu', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(4, 'Prof. Nora Strosin', 'wolf.berniece@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'PbHqqA4z7n', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(5, 'Ms. Earline Wehner Sr.', 'graham.laurie@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '5aKFkMnSqu', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(6, 'Josianne Vandervort IV', 'ztreutel@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'rDBGvlDvHe', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(7, 'Blanche Kshlerin', 'haley.colten@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'xcpVRqFP0j', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(8, 'Gayle Pfeffer', 'spencer.julie@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'SbCrtwGm4T', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(9, 'Dr. Jeramie Kub Sr.', 'juwan06@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '6bCWOOZVrH', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(10, 'Prof. Kayleigh Tromp Jr.', 'lura36@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'xEGHh4SSPO', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(11, 'Jayden Waters', 'alyce18@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '5sEVa4L7Zt', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(12, 'Maximus Champlin', 'rkiehn@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'XWTccfqq1I', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(13, 'Mrs. Zetta Tillman III', 'ziemann.cecile@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '21xP445poG', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(14, 'Johan Rempel', 'renner.julius@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '7iPHHzS2io', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(15, 'Elmer Denesik', 'hilbert.klein@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'q8aAZYNfP4', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(16, 'Madyson Shanahan Jr.', 'donnelly.mazie@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'QmjdRNXy6R', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(17, 'Tyrique Tillman', 'brionna38@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'FbnyTVBJ6V', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(18, 'Rebekah McKenzie I', 'greta.fadel@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'zI6aw8QwGH', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(19, 'Skylar Brown V', 'ajacobson@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'NZigJkyNrZ', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(20, 'Prof. Gordon Pagac PhD', 'dayton.jakubowski@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'XYdMQWnJIS', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(21, 'Parker Quitzon', 'willie.ledner@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'zUx68S7Tvt', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(22, 'Wilfrid Mraz', 'sbahringer@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'BWUBmrceZ8', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(23, 'Felicia Farrell', 'marlon03@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '1w10WctfJ1', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(24, 'Hillard Bartell', 'thodkiewicz@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'KeUjfnnzVX', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(25, 'Prof. Marjory Collins V', 'carmine.kunze@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'ag3aaxauMV', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(26, 'Eldora Goldner', 'ibruen@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'MU6FMNZIt8', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(27, 'Ibrahim Romaguera', 'kallie24@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'fCYgnBHSsJ', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(28, 'Laisha Nitzsche', 'ubaldo17@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'OsnfLYC0Dj', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(29, 'Natasha Lesch', 'bogan.kellie@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'c2lO07Kab6', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(30, 'Gail Ziemann', 'tkutch@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'Qh7AttLOx4', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(31, 'Santino Schinner', 'layne.emmerich@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '3uLTVo6lBK', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(32, 'Christophe Boyle', 'rokeefe@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'CTVXMkEDo6', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(33, 'Anabel Friesen', 'lindsay.dooley@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'Eza0pSnxc5', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(34, 'Gretchen Feil', 'deondre71@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'kM6x3LieBi', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(35, 'Dr. Maggie Marvin Sr.', 'deangelo.parker@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'PhXxulvpBC', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(36, 'Prof. Josiah Hettinger', 'mraz.walker@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'AIOla5b6m0', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(37, 'Mrs. Alicia Kunze', 'tprice@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'xhDOgnWcRS', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(38, 'Loyce Pfeffer Sr.', 'klabadie@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'jtuy9MQNzd', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(39, 'Mr. Jennings Lueilwitz IV', 'durgan.drew@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'tc3FN7Y4xz', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(40, 'Lou Torp', 'nelle46@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'Hzu9Emksjd', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(41, 'Asa Veum', 'xhaley@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'MsM2DnFhHs', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(42, 'Buford Collins', 'adele.schroeder@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '0XTNPB1IDJ', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(43, 'Richie Rath', 'corene.beatty@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'LvJKBM5G2R', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(44, 'Ms. Destinee Herman Sr.', 'smith.emma@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'q2q3Zq3Ib3', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(45, 'Jasmin Harber', 'ansel52@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '1Qv8qjiNCc', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(46, 'Otho Johnston', 'klarson@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '8dcR6lZzI8', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(47, 'Dwight Hills', 'stevie85@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'AckCgG3mi8', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(48, 'Westley Miller', 'gschroeder@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'yBeAkUgwMf', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(49, 'Miss Chelsie Rutherford DDS', 'cristian50@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '6Ehs40Qlya', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(50, 'Carlo Koch', 'adams.brianne@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'ctlX2gqcQU', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(51, 'Madeline Pagac', 'rwolff@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '9CSBrnJpub', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(52, 'Yesenia Hudson', 'rippin.timothy@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '88iW198Pe5', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(53, 'Anika Barrows', 'xjacobi@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'hL1O7ZDiGS', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(54, 'Jessy Mayert', 'kiehn.elvera@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '2YAdIOtLL3', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(55, 'Prof. Erna Greenholt Jr.', 'rcarroll@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'ZPuCZeJhB3', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(56, 'Raheem Anderson MD', 'elta.powlowski@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'PO8KtYsNqK', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(57, 'Aniyah Dare I', 'bheidenreich@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'EiZy2qIvSP', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(58, 'Dr. Tatum Altenwerth IV', 'abshire.antonette@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'EcUojHO37n', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(59, 'Silas Wilkinson', 'nitzsche.marcelle@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'gpqE4H11gj', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(60, 'Alysson Farrell', 'octavia.rempel@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'TFWkrS2UEO', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(61, 'Cristopher Brakus', 'hermann.sophie@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '9sWISbuumO', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(62, 'Mr. Quentin Hoppe III', 'isabella.harvey@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '7w5I1ep2tR', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(63, 'Hollis Bradtke', 'nathen43@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'UrSEMVjBlL', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(64, 'Eliane Crona', 'ryan.eulah@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'oZcgE22Ivz', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(65, 'Dr. Caleigh Brown', 'vhowe@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'SLCFnnLvWN', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(66, 'Johan O\'Hara DVM', 'halvorson.elvera@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'SzBcHZQ28u', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(67, 'Prof. Abel Swift', 'maye.rutherford@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'AHMD0sJeFP', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(68, 'Myriam Altenwerth', 'eriberto22@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'uAK2pqcd2Z', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(69, 'Elisabeth Zulauf IV', 'brekke.helen@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'hv3oFs71xB', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(70, 'Ms. Jude Runolfsdottir MD', 'twhite@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'BQB7afWkdj', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(71, 'Magnus Hoppe', 'ole92@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'zZFJz5HSlV', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(72, 'Alfonso Brekke', 'hamill.jovani@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'VVXnwBCYTU', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(73, 'Jovan Hudson', 'beier.nayeli@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'pneuhrph2a', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(74, 'Linda Kozey', 'karianne77@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'eJiMHbsrjM', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(75, 'Paula O\'Connell Jr.', 'earl.huels@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'yrEJN8MFhL', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(76, 'Dee Lockman', 'luciano.beatty@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'GBPweCg3Hu', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(77, 'Mr. Mohammad DuBuque V', 'otoy@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'HcYqOSr6Bm', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(78, 'Dr. Kelvin Feeney', 'elliott.frami@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'Rk02RhqwpE', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(79, 'Leo Mitchell', 'estella69@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'lMU5rIIToD', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(80, 'Dr. Barry Goldner I', 'lavinia.gislason@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '1bnepqt4ic', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(81, 'Ezekiel McCullough', 'parker17@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'CzXXb7JyTC', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(82, 'Kasandra Terry II', 'daugherty.antoinette@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'cFd1IZ7D0m', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(83, 'Kaci Maggio', 'lpouros@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'ag2pde0Kfx', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(84, 'Dr. Pascale Carroll', 'adrianna.johnston@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'viO55gdvca', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(85, 'Letha West', 'bbalistreri@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '4g1XSPL0OR', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(86, 'Ms. Yessenia Hane Jr.', 'tbahringer@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'Bjf2qJV46G', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(87, 'Harley Kovacek', 'nestor44@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'ROP0R5NJHx', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(88, 'Dr. Marta Tillman IV', 'alexandrine62@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'Dwz1xuvUsH', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(89, 'Dr. Rose Gaylord', 'crona.halie@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', '0xzsBwVeth', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(90, 'Carrie Corwin', 'urban.armstrong@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'N4vXgGChK3', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(91, 'Ms. Luz Auer MD', 'zquigley@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'HOARE3VVDU', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(92, 'Camille Treutel', 'mohammed.haag@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'xZKQQRiVdM', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(93, 'Miss Maritza Pacocha Sr.', 'narciso.towne@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'Gqfm3eyAMn', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(94, 'Eryn Kshlerin', 'jonas38@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', '5GXUOYHxoz', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(95, 'Prof. Pablo Abbott I', 'valentina.connelly@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'FYBisVx0Tp', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(96, 'Beulah Tillman', 'libby.bartoletti@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'nfQri3uJmJ', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(97, 'Jasmin Dooley', 'hank25@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'fisj91WHM3', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(98, 'Dr. Ryder Ankunding II', 'arden51@example.org', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'IDox3c4Yx2', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(99, 'Ms. Kathlyn Fahey Jr.', 'hkutch@example.net', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/man0123890.jpg', 'active', NULL, 'user', 'rw4fikor6D', '2024-12-14 11:18:42', '2024-12-14 11:18:42'),
(100, 'Queen Huel', 'rgleichner@example.com', '$2y$12$TVbMlUWbPma6.ixZHEL5beNcsmeXblynocpwgU.gTJgBwjsJtWVvO', '2024-12-14 11:18:42', 'usersImages/women1290837.jpg', 'active', NULL, 'user', 'XxHVAxc78G', '2024-12-14 11:18:42', '2024-12-14 11:18:42');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friends_user_id_foreign` (`user_id`),
  ADD KEY `friends_friend_id_foreign` (`friend_id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `friend_requests_sender_id_foreign` (`sender_id`),
  ADD KEY `friend_requests_receiver_id_foreign` (`receiver_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_publisher_id_foreign` (`publisher_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friends`
--
ALTER TABLE `friends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `friends`
--
ALTER TABLE `friends`
  ADD CONSTRAINT `friends_friend_id_foreign` FOREIGN KEY (`friend_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friends_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD CONSTRAINT `friend_requests_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `friend_requests_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
