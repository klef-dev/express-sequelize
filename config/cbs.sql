-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2020 at 02:33 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(22, '1503250034279_user', 1, '2020-01-04 11:09:57'),
(23, '1503250034280_token', 1, '2020-01-04 11:09:59'),
(24, '1573311039354_project_schema', 1, '2020-01-04 11:09:59'),
(25, '1573656474568_tutorial_schema', 1, '2020-01-04 11:10:00'),
(26, '1573762660522_seminar_schema', 1, '2020-01-04 11:10:00'),
(27, '1573898927424_member_schema', 1, '2020-01-04 11:10:02'),
(28, '1578076821856_article_schema', 1, '2020-01-04 11:10:03'),
(29, '1578076872414_comment_schema', 1, '2020-01-04 11:10:05'),
(30, '1578131831042_clap_schema', 1, '2020-01-04 11:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

CREATE TABLE `articles` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `topic` varchar(100) NOT NULL,
  `body` varchar(400) NOT NULL,
  `image` varchar(191) NOT NULL,
  `btn_text` varchar(20) NOT NULL,
  `comments` int(11) NOT NULL,
  `claps` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `user_id`, `topic`, `body`, `image`, `btn_text`, `comments`, `claps`, `created_at`, `updated_at`) VALUES
(1, 1, 'Let you know', 'Flume, London Grammar', '/uploads/posts/1578136309951.jpg', 'Full Gist', 0, 0, '2020-01-04 12:11:50', '2020-01-31 15:37:22'),
(3, 1, 'Highest in the room', 'She feel my mind with ideas, cos I\'m the highest in the room', '/uploads/posts/1578156062635.jpg', 'Learn More', 0, 0, '2020-01-04 17:41:02', '2020-01-31 15:37:22'),
(4, 1, 'Reading fast', '<p>Words are like x-rays if you only use them properly</p>', '/uploads/posts/1578737740409.jpg', 'Read', 0, 0, '2020-01-11 11:15:40', '2020-01-31 15:37:22'),
(5, 1, 'Bearer on management', 'It is a management scope', '/uploads/image.png', 'Read More', 0, 0, '2020-01-31 15:41:02', '2020-01-31 15:41:02');

-- --------------------------------------------------------

--
-- Table structure for table `claps`
--

CREATE TABLE `claps` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `article_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` varchar(200) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `seminar_id` int(10) UNSIGNED DEFAULT NULL,
  `reg_no` int(7) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `seminars`
--

CREATE TABLE `seminars` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic` varchar(200) NOT NULL,
  `venue` varchar(65) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `seat` int(11) NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `total` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seminars`
--

INSERT INTO `seminars` (`id`, `topic`, `venue`, `description`, `seat`, `start`, `end`, `total`, `created_at`, `updated_at`) VALUES
(1, 'Dancing with the stranger', 'LT2', 'No description', 150, '2020-01-04 09:00:00', '2020-01-04 09:00:00', 0, '2020-01-04 17:19:40', '2020-01-04 17:19:40'),
(2, 'Testing', 'Omu-aran Junction', 'Tochukwu', 100, '2020-01-08 09:00:00', '2020-01-08 09:00:00', 0, '2020-01-07 23:11:39', '2020-01-07 23:11:39'),
(3, 'Testing2', 'Offa', 'Describe', 100, '2020-01-11 09:30:00', '2020-01-11 09:30:00', 0, '2020-01-10 15:49:27', '2020-01-10 15:49:27');

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `type` varchar(80) NOT NULL,
  `is_revoked` tinyint(1) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tutorials`
--

CREATE TABLE `tutorials` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `venue` varchar(65) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  `course_code` varchar(6) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `day` varchar(10) NOT NULL,
  `time` time NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutorials`
--

INSERT INTO `tutorials` (`id`, `name`, `venue`, `description`, `course_code`, `image`, `day`, `time`, `created_at`, `updated_at`) VALUES
(1, 'Izubike', 'Econometry lab', NULL, 'CBS413', NULL, 'Saturday', '10:00:00', NULL, '2020-01-30 21:56:07'),
(2, 'Izu', 'Econometry lab', NULL, 'CBS413', NULL, 'Saturday', '10:00:00', '2020-01-30 22:00:50', '2020-01-30 22:00:50'),
(3, 'Toba', 'LT2', NULL, 'CBS311', NULL, 'Sunday', '14:00:00', '2020-01-31 14:52:35', '2020-01-31 14:57:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(65) NOT NULL,
  `email` varchar(200) NOT NULL,
  `reg_no` int(7) NOT NULL,
  `programme` varchar(65) NOT NULL,
  `password` varchar(60) NOT NULL,
  `position` varchar(20) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `reg_no`, `programme`, `password`, `position`, `created_at`, `updated_at`) VALUES
(1, 'Izuchukwu', 'maduekwe.izuchukwu', 'maduekwe.izuchukwu@lmu.edu.ng', 1600343, 'Economics', '$2a$10$hFXl0olW/d4wwnDMkd1wT.5PhlZz05vZozA.6mk5zF56nMmldMNGi', 'Admin', '2020-01-04 12:10:20', '2020-01-04 12:10:20'),
(2, 'Ugbeshe Abraham', 'ugbeshe.abraham', 'ugbeshe.abraham@lmu.edu.ng', 1700172, 'Computer Science', '$2a$10$/W2q0g8m8Ojx/WmMV7acueR.NKH4wx6Y3FPpBzds8HiTqQBcg3rGa', 'Developer', '2020-01-10 15:25:04', '2020-01-10 15:25:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articles_user_id_foreign` (`user_id`);

--
-- Indexes for table `claps`
--
ALTER TABLE `claps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `claps_article_id_foreign` (`article_id`),
  ADD KEY `claps_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_article_id_foreign` (`article_id`),
  ADD KEY `comments_user_id_foreign` (`user_id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `members_seminar_id_foreign` (`seminar_id`),
  ADD KEY `members_reg_no_foreign` (`reg_no`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_user_id_foreign` (`user_id`);

--
-- Indexes for table `seminars`
--
ALTER TABLE `seminars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tokens_token_unique` (`token`),
  ADD KEY `tokens_user_id_foreign` (`user_id`),
  ADD KEY `tokens_token_index` (`token`);

--
-- Indexes for table `tutorials`
--
ALTER TABLE `tutorials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_reg_no_unique` (`reg_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `articles`
--
ALTER TABLE `articles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `claps`
--
ALTER TABLE `claps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seminars`
--
ALTER TABLE `seminars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tutorials`
--
ALTER TABLE `tutorials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `claps`
--
ALTER TABLE `claps`
  ADD CONSTRAINT `claps_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `claps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_article_id_foreign` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`),
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_reg_no_foreign` FOREIGN KEY (`reg_no`) REFERENCES `users` (`reg_no`),
  ADD CONSTRAINT `members_seminar_id_foreign` FOREIGN KEY (`seminar_id`) REFERENCES `seminars` (`id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `tokens`
--
ALTER TABLE `tokens`
  ADD CONSTRAINT `tokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
