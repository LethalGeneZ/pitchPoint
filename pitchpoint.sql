-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 05, 2025 at 10:28 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pitchpoint`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `log_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `activity_description` text NOT NULL,
  `status` enum('Success','Failed','Warning') NOT NULL DEFAULT 'Success',
  `logged_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`log_id`, `admin_id`, `activity_description`, `status`, `logged_at`) VALUES
(1, 1, 'Admin account created successfully.', 'Success', '2025-10-29 11:59:23'),
(6, 1, 'Failed login', 'Failed', '2025-11-21 16:31:02'),
(7, 1, 'Failed login', 'Failed', '2025-11-21 16:34:55'),
(8, 1, 'Failed login', 'Failed', '2025-11-21 16:35:13'),
(9, 1, 'Failed login', 'Failed', '2025-11-21 16:36:01'),
(10, 1, 'Failed login', 'Failed', '2025-11-21 16:39:07'),
(11, 1, 'Failed login', 'Failed', '2025-11-21 16:53:06'),
(12, 1, 'Failed login', 'Failed', '2025-11-21 16:53:41'),
(13, 1, 'Logged in', 'Success', '2025-11-21 17:07:21'),
(14, 1, 'Logged out', 'Success', '2025-11-21 17:07:50'),
(15, 1, 'Logged in', 'Success', '2025-11-21 17:08:07'),
(16, 1, 'Logged out', 'Success', '2025-11-21 17:57:00'),
(17, 1, 'Logged in', 'Success', '2025-11-21 18:25:47'),
(18, 1, 'Logged in', 'Success', '2025-11-21 18:28:37'),
(19, 1, 'Logged in', 'Success', '2025-11-21 18:44:04'),
(20, 1, 'Logged in', 'Success', '2025-11-21 18:46:05'),
(21, 1, 'Logged out', 'Success', '2025-11-21 18:47:38'),
(22, 1, 'Logged in', 'Success', '2025-11-21 18:50:31'),
(23, 1, 'Logged out', 'Success', '2025-11-21 18:50:34'),
(24, 1, 'Logged in', 'Success', '2025-11-21 19:14:19'),
(25, 1, 'Logged in', 'Success', '2025-11-21 22:13:27'),
(26, 1, 'Logged in', 'Success', '2025-11-23 04:20:09'),
(27, 1, 'Logged out', 'Success', '2025-11-23 04:31:57'),
(28, 1, 'Logged in', 'Success', '2025-11-23 04:32:25'),
(29, 1, 'Logged in', 'Success', '2025-11-26 11:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `admin_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`admin_id`, `admin_name`, `email`, `password_hash`, `is_active`, `last_login`) VALUES
(1, 'Rafia Tasnim', 'rafia@pitchpoint.com', '$2y$10$Mn7T8jnozDpcpF1DhiwM/uZbuGOspX7UATHNypvQHo9j/5N5xa4p6', 1, '2025-11-26 11:27:39');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `message` text NOT NULL,
  `receiver_email` varchar(190) DEFAULT NULL,
  `sent_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`notification_id`, `admin_id`, `message`, `receiver_email`, `sent_date`) VALUES
(1, 1, 'New project submitted: Time Management (ID 10). Please review.', 'rafia@pitchpoint.com', '2025-11-14 11:10:00'),
(2, 1, 'New investment recorded on project Rent-A-Skill Marketplace (ID 15).', 'rafia@pitchpoint.com', '2025-11-17 10:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `description`) VALUES
(1, 'Health', NULL),
(2, 'FinTech', NULL),
(3, 'EdTech', NULL),
(4, 'Technology', NULL),
(5, 'Education', NULL),
(6, 'Food', NULL),
(7, 'Social Impact', NULL),
(8, 'Other', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_management`
--

CREATE TABLE `email_management` (
  `email_id` int(10) UNSIGNED NOT NULL,
  `sender_email` varchar(190) NOT NULL,
  `receiver_email` varchar(190) NOT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `body` text DEFAULT NULL,
  `sent_date` datetime NOT NULL DEFAULT current_timestamp(),
  `is_read` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `email_management`
--

INSERT INTO `email_management` (`email_id`, `sender_email`, `receiver_email`, `subject`, `body`, `sent_date`, `is_read`) VALUES
(1, 'admin@example.com', 'bob@example.com', 'Welcome to PitchPoint', 'Hi Bob, your entrepreneur account has been created successfully.', '2025-10-29 12:05:00', 1),
(2, 'admin@example.com', 'alice@example.com', 'New projects available', 'Hi Alice, new projects are now available in your interest area (FinTech).', '2025-11-13 11:30:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `entrepreneurs`
--

CREATE TABLE `entrepreneurs` (
  `entrepreneur_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(200) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `entrepreneurs`
--

INSERT INTO `entrepreneurs` (`entrepreneur_id`, `user_id`, `company_name`, `website`, `location`, `created_at`, `updated_at`) VALUES
(5, 34, NULL, NULL, NULL, '2025-12-04 18:20:04', '2025-12-04 18:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `idea_approval`
--

CREATE TABLE `idea_approval` (
  `approval_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `decision` enum('Approved','Rejected','Pending') NOT NULL DEFAULT 'Pending',
  `comments` text DEFAULT NULL,
  `approval_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investments`
--

CREATE TABLE `investments` (
  `investment_id` int(10) UNSIGNED NOT NULL,
  `investor_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `payment_method` enum('card','bank','wallet','other') NOT NULL,
  `investment_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `investors`
--

CREATE TABLE `investors` (
  `investor_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `interest_area` varchar(120) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `sender_user_id` int(10) UNSIGNED NOT NULL,
  `receiver_user_id` int(10) UNSIGNED NOT NULL,
  `body` text NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(80) NOT NULL,
  `payload_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload_json`)),
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(10) UNSIGNED NOT NULL,
  `entrepreneur_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(180) NOT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `problem` text DEFAULT NULL,
  `solution` text DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `stage` enum('idea','mvp','beta','launched') NOT NULL DEFAULT 'idea',
  `status` enum('draft','published','archived') NOT NULL DEFAULT 'draft',
  `visibility` enum('public','private') NOT NULL DEFAULT 'public',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `entrepreneur_id`, `title`, `summary`, `problem`, `solution`, `category_id`, `budget`, `stage`, `status`, `visibility`, `created_at`, `updated_at`) VALUES
(22, 5, 'demo project', 'demo pitch', 'demo problem', 'demo solution', NULL, 1234.00, 'idea', 'published', 'public', '2025-12-04 22:35:29', '2025-12-04 23:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `file_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `storage_path` varchar(255) NOT NULL,
  `mime_type` varchar(100) DEFAULT NULL,
  `file_size_bytes` int(10) UNSIGNED DEFAULT NULL,
  `uploaded_by` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_files`
--

INSERT INTO `project_files` (`file_id`, `project_id`, `file_name`, `storage_path`, `mime_type`, `file_size_bytes`, `uploaded_by`, `created_at`) VALUES
(27, 22, 'Screenshot 2025-12-01 at 22.17.54.png', 'uploads/cover_image_6931fea11b25d7.86611825.png', 'image/png', 5495084, 34, '2025-12-04 22:35:29'),
(29, 22, 'Danish work culture and impressions.pdf', 'uploads/project_proposal_69321003324500.17609657.pdf', 'application/pdf', 2017708, 34, '2025-12-04 23:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `project_interests`
--

CREATE TABLE `project_interests` (
  `interest_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `investor_id` int(10) UNSIGNED NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_reviews`
--

CREATE TABLE `project_reviews` (
  `review_id` int(10) UNSIGNED NOT NULL,
  `staff_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `decision` enum('approved','rejected','changes_requested') NOT NULL,
  `comments` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_views`
--

CREATE TABLE `project_views` (
  `view_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `viewer_investor_id` int(10) UNSIGNED DEFAULT NULL,
  `viewed_at` datetime NOT NULL DEFAULT current_timestamp(),
  `ip_hash` char(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `department` varchar(120) DEFAULT NULL,
  `phone` varchar(40) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(10) UNSIGNED NOT NULL,
  `investment_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_amount` decimal(12,2) NOT NULL,
  `transaction_status` enum('pending','succeeded','failed','refunded') NOT NULL DEFAULT 'pending',
  `transaction_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(190) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `bio` text DEFAULT NULL,
  `role` enum('entrepreneur','investor','staff','admin') NOT NULL DEFAULT 'entrepreneur',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verify_token` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password_hash`, `bio`, `role`, `is_active`, `created_at`, `updated_at`, `is_verified`, `verify_token`) VALUES
(34, 'zahid', 'bishal2485@gmail.com', '$2y$10$i4lsZTDRi.FspRkd.zsBEefPONhViwsWvjuYE3pwiP0IEpgklDEku', NULL, 'entrepreneur', 1, '2025-12-04 18:20:04', '2025-12-04 18:20:04', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_management`
--

CREATE TABLE `user_management` (
  `user_manage_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `admin_id` int(10) UNSIGNED NOT NULL,
  `action` varchar(50) NOT NULL,
  `action_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `idx_log_admin_time` (`admin_id`,`logged_at`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_admin_notifications_admin` (`admin_id`,`sent_date`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `email_management`
--
ALTER TABLE `email_management`
  ADD PRIMARY KEY (`email_id`);

--
-- Indexes for table `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  ADD PRIMARY KEY (`entrepreneur_id`),
  ADD UNIQUE KEY `uq_entrepreneur_user` (`user_id`);

--
-- Indexes for table `idea_approval`
--
ALTER TABLE `idea_approval`
  ADD PRIMARY KEY (`approval_id`),
  ADD KEY `idx_ia_admin_project` (`admin_id`,`project_id`),
  ADD KEY `fk_ia_project` (`project_id`);

--
-- Indexes for table `investments`
--
ALTER TABLE `investments`
  ADD PRIMARY KEY (`investment_id`),
  ADD KEY `idx_investments_investor` (`investor_id`),
  ADD KEY `idx_investments_project` (`project_id`);

--
-- Indexes for table `investors`
--
ALTER TABLE `investors`
  ADD PRIMARY KEY (`investor_id`),
  ADD UNIQUE KEY `uq_investor_user` (`user_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `idx_messages_project_time` (`project_id`,`created_at`),
  ADD KEY `fk_messages_sender` (`sender_user_id`),
  ADD KEY `fk_messages_receiver` (`receiver_user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_notifications_user` (`user_id`,`is_read`,`created_at`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `idx_projects_owner_status` (`entrepreneur_id`,`status`),
  ADD KEY `fk_projects_category` (`category_id`);
ALTER TABLE `projects` ADD FULLTEXT KEY `ft_projects_text` (`title`,`summary`,`problem`,`solution`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `idx_files_project` (`project_id`),
  ADD KEY `fk_files_uploader` (`uploaded_by`);

--
-- Indexes for table `project_interests`
--
ALTER TABLE `project_interests`
  ADD PRIMARY KEY (`interest_id`),
  ADD UNIQUE KEY `uq_interest_once` (`project_id`,`investor_id`),
  ADD KEY `idx_interests_investor` (`investor_id`);

--
-- Indexes for table `project_reviews`
--
ALTER TABLE `project_reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `idx_reviews_staff` (`staff_id`),
  ADD KEY `idx_reviews_project` (`project_id`);

--
-- Indexes for table `project_views`
--
ALTER TABLE `project_views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `idx_views_project_time` (`project_id`,`viewed_at`),
  ADD KEY `fk_views_viewer` (`viewer_investor_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`),
  ADD UNIQUE KEY `uq_staff_user` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `idx_transactions_investment` (`investment_id`),
  ADD KEY `fk_transactions_project` (`project_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_users_role_active` (`role`,`is_active`);

--
-- Indexes for table `user_management`
--
ALTER TABLE `user_management`
  ADD PRIMARY KEY (`user_manage_id`),
  ADD KEY `idx_um_admin_time` (`admin_id`,`action_date`),
  ADD KEY `fk_um_user` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `log_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `admin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `email_management`
--
ALTER TABLE `email_management`
  MODIFY `email_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  MODIFY `entrepreneur_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `idea_approval`
--
ALTER TABLE `idea_approval`
  MODIFY `approval_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `investments`
--
ALTER TABLE `investments`
  MODIFY `investment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `investors`
--
ALTER TABLE `investors`
  MODIFY `investor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `file_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `project_interests`
--
ALTER TABLE `project_interests`
  MODIFY `interest_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `project_reviews`
--
ALTER TABLE `project_reviews`
  MODIFY `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_views`
--
ALTER TABLE `project_views`
  MODIFY `view_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user_management`
--
ALTER TABLE `user_management`
  MODIFY `user_manage_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `fk_log_admin` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD CONSTRAINT `fk_admin_notifications_admin` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `entrepreneurs`
--
ALTER TABLE `entrepreneurs`
  ADD CONSTRAINT `fk_entrepreneurs_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `idea_approval`
--
ALTER TABLE `idea_approval`
  ADD CONSTRAINT `fk_ia_admin` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ia_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investments`
--
ALTER TABLE `investments`
  ADD CONSTRAINT `fk_investments_investor` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`investor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_investments_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `investors`
--
ALTER TABLE `investors`
  ADD CONSTRAINT `fk_investors_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `fk_messages_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_messages_receiver` FOREIGN KEY (`receiver_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_messages_sender` FOREIGN KEY (`sender_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_projects_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_projects_entrepreneur` FOREIGN KEY (`entrepreneur_id`) REFERENCES `entrepreneurs` (`entrepreneur_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_files`
--
ALTER TABLE `project_files`
  ADD CONSTRAINT `fk_files_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_files_uploader` FOREIGN KEY (`uploaded_by`) REFERENCES `users` (`user_id`) ON UPDATE CASCADE;

--
-- Constraints for table `project_interests`
--
ALTER TABLE `project_interests`
  ADD CONSTRAINT `fk_interests_investor` FOREIGN KEY (`investor_id`) REFERENCES `investors` (`investor_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_interests_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_reviews`
--
ALTER TABLE `project_reviews`
  ADD CONSTRAINT `fk_reviews_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reviews_staff` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_views`
--
ALTER TABLE `project_views`
  ADD CONSTRAINT `fk_views_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_views_viewer` FOREIGN KEY (`viewer_investor_id`) REFERENCES `investors` (`investor_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `fk_staff_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `fk_transactions_investment` FOREIGN KEY (`investment_id`) REFERENCES `investments` (`investment_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_transactions_project` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_management`
--
ALTER TABLE `user_management`
  ADD CONSTRAINT `fk_um_admin` FOREIGN KEY (`admin_id`) REFERENCES `administrator` (`admin_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_um_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
