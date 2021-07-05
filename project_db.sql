-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 05, 2021 at 11:29 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `access_logs`
--

CREATE TABLE `access_logs` (
  `access_ID` int(45) NOT NULL,
  `user_ID` int(11) NOT NULL,
  `date_time_in` date NOT NULL,
  `date_time_out` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contractor`
--

CREATE TABLE `contractor` (
  `contractor_ID` int(45) NOT NULL,
  `contractor_name` varchar(100) NOT NULL,
  `contractor_email` varchar(50) NOT NULL,
  `contractor_phone` int(45) NOT NULL,
  `contractor_address` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contractor`
--

INSERT INTO `contractor` (`contractor_ID`, `contractor_name`, `contractor_email`, `contractor_phone`, `contractor_address`) VALUES
(0, 'Saferoads Construction Co. Ltd.', 'Saferoads@gmail.com', 123456, 'Nairobi');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `department_ID` int(11) NOT NULL,
  `department_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`department_ID`, `department_name`) VALUES
(1, 'Commerce, Tourism and Co-operatives'),
(2, 'Devolution, Public Service and Administration'),
(3, 'Education, Youth and Social Services'),
(4, 'Environment Energy Water and sanitation'),
(5, 'Finance and Economic Planning'),
(7, 'Food, agriculture and Forestry'),
(8, 'Health Services'),
(9, 'Information Communication Technology & e- Government'),
(10, 'Lands ,Urban planning, Urban renewal, Housing and Projects Management'),
(11, 'Public Service Management'),
(12, 'Roads, Public Works and Transport'),
(13, 'Security and Compliance Sub Sector');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `published` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `title`, `slug`, `views`, `image`, `body`, `published`, `created_at`, `updated_at`) VALUES
(1, 1, 'Restoration of Traffic Flow for Motorists Plying the Narok - Mai Mahiu Route', '5-habits-that-can-improve-your-life', 0, 'banner.jpg', 'Read every day', 1, '2021-06-15 21:28:43', '2021-06-15 19:14:31'),
(2, 1, 'Second post on LifeBlog', 'second-post-on-lifeblog', 0, 'banner.jpg', 'This is the body of the second post on this site', 0, '2018-02-02 08:40:14', '2021-06-15 13:04:36');

-- --------------------------------------------------------

--
-- Table structure for table `post_topic`
--

CREATE TABLE `post_topic` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post_topic`
--

INSERT INTO `post_topic` (`id`, `post_id`, `topic_id`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `project_ID` int(45) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `project_location` varchar(45) NOT NULL,
  `project_sublocation` varchar(45) NOT NULL,
  `project_department` varchar(100) NOT NULL,
  `project_status` varchar(45) NOT NULL,
  `project_contractor` varchar(150) NOT NULL,
  `project_cost` int(45) NOT NULL,
  `financial_year` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`project_ID`, `project_name`, `project_location`, `project_sublocation`, `project_department`, `project_status`, `project_contractor`, `project_cost`, `financial_year`) VALUES
(1, 'PROJECT', 'Nairobi', 'Westlands', 'Commerce, Tourism and Co-operatives', '0', 'Saferoads Construction ', 1000000, '20/21'),
(2, 'Project 2', 'Nairobi', 'Westlands', 'Education, Youth and Social Services', '0', 'Saferoads Construction Co. Ltd.', 1000000, '20/21');

-- --------------------------------------------------------

--
-- Table structure for table `project_contractor`
--

CREATE TABLE `project_contractor` (
  `project_ID` int(11) DEFAULT NULL,
  `contractor_ID` int(11) DEFAULT NULL,
  `sublocation_ID` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL,
  `status_ID` int(11) NOT NULL,
  `project_name` varchar(45) DEFAULT NULL,
  `project_location` varchar(45) NOT NULL,
  `project_sublocation` varchar(45) NOT NULL,
  `project_department` varchar(100) NOT NULL,
  `project_status` varchar(45) NOT NULL,
  `project_contractor` varchar(150) NOT NULL,
  `project_cost` int(45) NOT NULL,
  `financial_year` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_ID` int(11) NOT NULL,
  `role_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_ID`, `role_name`) VALUES
(1, 'Admin'),
(2, 'Project Supervisor'),
(3, 'Contractor');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `status_ID` int(11) NOT NULL,
  `status_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`status_ID`, `status_name`) VALUES
(0, 'On-going'),
(2, 'Completed'),
(3, 'Delayed');

-- --------------------------------------------------------

--
-- Table structure for table `sublocations`
--

CREATE TABLE `sublocations` (
  `sublocation_ID` int(11) NOT NULL,
  `sublocation_name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sublocations`
--

INSERT INTO `sublocations` (`sublocation_ID`, `sublocation_name`) VALUES
(1, 'Westlands'),
(2, 'Dagoretti North'),
(4, 'Dagoretti South'),
(5, 'Langata'),
(6, 'Kibra'),
(7, 'Roysambu'),
(8, 'Kasarani'),
(9, 'Ruaraka'),
(10, 'Embakasi South'),
(11, 'Embakasi North'),
(12, 'Embakasi Central'),
(13, 'Embakasi East'),
(14, 'Embakasi West'),
(15, 'Makadara'),
(16, 'Kamukunji'),
(17, 'Starehe'),
(18, 'Mathare');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`) VALUES
(1, 'Latest', 'inspiration');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role_as` tinyint(4) NOT NULL DEFAULT 0,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_as`, `profile_picture`, `created_at`, `updated_at`) VALUES
(1, 'Noella', 'noella@gmail.com', '$2y$10$bjjqsQjRP8XXg5DPy4l/YeMf/kA79YS9zHURmRCIYKwUtMQaMXCtO', 1, NULL, '2021-06-17 12:37:37', '2021-04-13 13:28:46'),
(2, 'admin', 'admin@gmail.com', 'admin', 1, NULL, '2021-06-17 17:12:34', '2021-06-02 04:37:14'),
(1234, '1234', '1234@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, NULL, '2021-06-15 22:04:47', '2021-06-15 22:04:47'),
(1235, '234', '234@yahoo.com', '289dff07669d7a23de0ef88d2f7129e7', 0, NULL, '2021-06-17 14:21:34', '2021-06-17 14:21:34'),
(1236, 'Abdi', 'khhk@gfh.com', '311eba6dada049960e16974e652ef134', 0, NULL, '2021-07-02 01:36:05', '2021-07-02 01:36:05'),
(1237, 'Edward', 'edward@gmail.com', 'a53f3929621dba1306f8a61588f52f55', 0, NULL, '2021-07-02 07:20:14', '2021-07-02 07:20:14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_logs`
--
ALTER TABLE `access_logs`
  ADD PRIMARY KEY (`access_ID`),
  ADD KEY `user_ID` (`user_ID`);

--
-- Indexes for table `contractor`
--
ALTER TABLE `contractor`
  ADD PRIMARY KEY (`contractor_ID`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_ID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD UNIQUE KEY `post_id` (`post_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`project_ID`);

--
-- Indexes for table `project_contractor`
--
ALTER TABLE `project_contractor`
  ADD KEY `project_ID` (`project_ID`),
  ADD KEY `contractor_ID` (`contractor_ID`),
  ADD KEY `department_ID` (`department_ID`),
  ADD KEY `status_ID` (`status_ID`),
  ADD KEY `sublocation_ID` (`sublocation_ID`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_ID`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`status_ID`);

--
-- Indexes for table `sublocations`
--
ALTER TABLE `sublocations`
  ADD PRIMARY KEY (`sublocation_ID`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `department_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `status_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sublocations`
--
ALTER TABLE `sublocations`
  MODIFY `sublocation_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1238;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_logs`
--
ALTER TABLE `access_logs`
  ADD CONSTRAINT `access_logs_ibfk_1` FOREIGN KEY (`user_ID`) REFERENCES `users` (`id`);

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `post_topic`
--
ALTER TABLE `post_topic`
  ADD CONSTRAINT `post_topic_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `post_topic_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Constraints for table `project_contractor`
--
ALTER TABLE `project_contractor`
  ADD CONSTRAINT `project_contractor_ibfk_1` FOREIGN KEY (`project_ID`) REFERENCES `project` (`project_ID`),
  ADD CONSTRAINT `project_contractor_ibfk_2` FOREIGN KEY (`contractor_ID`) REFERENCES `contractor` (`contractor_ID`),
  ADD CONSTRAINT `project_contractor_ibfk_3` FOREIGN KEY (`department_ID`) REFERENCES `departments` (`department_ID`),
  ADD CONSTRAINT `project_contractor_ibfk_4` FOREIGN KEY (`status_ID`) REFERENCES `status` (`status_ID`),
  ADD CONSTRAINT `project_contractor_ibfk_5` FOREIGN KEY (`sublocation_ID`) REFERENCES `sublocations` (`sublocation_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
