-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Generation Time: Jun 28, 2024 at 03:08 PM
-- Server version: 8.0.37
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `local-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `phone_number`, `email`, `password`) VALUES
(1, 'NUR MARIANA', '0193769291', 'marianazainalabidin@gmail.com', 'Mariana1234');

-- --------------------------------------------------------

--
-- Table structure for table `assessments`
--

CREATE TABLE `assessments` (
  `id` int NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL,
  `image_filename` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `assessments`
--

INSERT INTO `assessments` (`id`, `description`, `image_filename`, `email`, `created_at`, `status`) VALUES
(1, 'Assessment 1', 'as1.jpeg', 'marianazainalabidin@gmail.com', '2024-06-04 19:14:03', NULL),
(2, 'Assessment 2', 'as2.jpeg', 'marianazainalabidin@gmail.com', '2024-06-04 19:31:27', NULL),
(3, 'Please finish this homework by 10/6/2024. Any late submission will result in failing the course unit.', 'homework3.jpeg', 'marianazainalabidin@gmail.com', '2024-06-04 21:05:20', NULL),
(4, 'Finish reading this cheatsheet by 20/6/2024. We will have a test soon.', 'cheatsheet.jpeg', 'marianazainalabidin@gmail.com', '2024-06-04 21:25:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `evaluations`
--

CREATE TABLE `evaluations` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `image_filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `evaluations`
--

INSERT INTO `evaluations` (`id`, `email`, `description`, `image_filename`, `status`) VALUES
(1, 'suki@gmail.com', '1/2 cawan / 100g gula kastor\r\n1/2 cawan / 100g gula perang\r\nboleh kurangkan gula jika suka kurang manis\r\n4 biji telur saiz B (kalau saiz A 3 biji)\r\n1/2 cawan / 125g mentega', 'kek.jpg', 1),
(10, 'suki@gmail.com', 'kek cream', 'download (1).jpeg', 1),
(11, 'sukieiera@gmail.com', 'yogurt', 'kek_pisang_yogurt_cheese_1561262042_0ae492d2_progressive.jpg', 1),
(12, 'suki@gmail.com', 'yogurt', 'kek-tapak-kuda.jpg', 1),
(13, 'sukieiera@gmail.com', 'YOGURT', 'KEK.jpg', 1),
(14, 'sukieiera@gmail.com', 'yogurt', 'kek coklat.jpeg', 1),
(15, 'sukieiera@gmail.com', 'telur 5 biji', 'photo.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `finished_assessments`
--

CREATE TABLE `finished_assessments` (
  `id` int NOT NULL,
  `assessment_id` int NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finished_assessments`
--

INSERT INTO `finished_assessments` (`id`, `assessment_id`, `status`, `email`, `image_path`) VALUES
(1, 1, 'Pending', 'faq@gmail.com', 'student-uploads/finish2.jpeg'),
(4, 2, 'Pending', 'suki@gmail.com', 'student-uploads/finished_assess.jpeg'),
(5, 3, 'Pending', 'alya@gmail.com', 'student-uploads/Screenshot 2024-06-02 183713.png'),
(8, 3, 'Pending', 'zaim@gmail.com', 'student-uploads/assf1.jpeg'),
(9, 4, 'Pending', 'zaim@gmail.com', 'student-uploads/assf4.jpeg'),
(10, 4, 'Pending', 'suki@gmail.com', 'student-uploads/sukiass2.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `PackageID` int NOT NULL,
  `PackageName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ItemName` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `fb_group_link` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`PackageID`, `PackageName`, `ItemName`, `Price`, `image_path`, `fb_group_link`) VALUES
(1, 'Kek Pisang Merelit', 'Kek Pisang Cheese, Kek Pisang Coklat, Kek Pisang Yogurt', 15.00, 'Images/Home Page (1).png', 'https://www.facebook.com/share/jnnkocvzowSeDbsM/'),
(2, 'Kek Bajet Part 1', 'Seksis Soft Cake,Marble Dolu-dolu', 15.00, 'Images/Home Page (2).png', 'https://www.facebook.com/share/jnnkocvzowSeDbsM/'),
(3, 'Kek Bajet Part 2', 'Kek Batik Indulgence,Kek Coklat Moist', 20.00, 'Images/Home Page (3).png', 'https://www.facebook.com/share/jnnkocvzowSeDbsM/'),
(37, 'Package Ramadhan', 'Kek pisang coklat', 24.00, 'Images/kek_pisang_coco.jpeg', 'https://www.facebook.com/share/jnnkocvzowSeDbsM/'),
(38, 'Package Father\'s Day', 'Kek Strawberi', 55.00, 'Images/strawberry.jpeg', 'https://www.facebook.com/share/jnnkocvzowSeDbsM/');

-- --------------------------------------------------------

--
-- Table structure for table `payment_details`
--

CREATE TABLE `payment_details` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `package` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `receipt_filename` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT '0',
  `discount` decimal(10,0) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_details`
--

INSERT INTO `payment_details` (`id`, `date`, `time`, `package`, `amount`, `receipt_filename`, `email`, `status`, `discount`) VALUES
(1, '2024-03-15', '17:20:00', 'Kek Pisang Merelit', 1.00, 'receipt1.jpeg', 'suki@gmail.com', 1, 0),
(2, '2024-03-15', '18:23:00', 'Kek Bajet Part 1', 2.00, 'hsbc1.jpeg', 'suki@gmail.com', 1, 0),
(20, '2024-04-18', '09:28:51', 'Kek Pisang Merelit', 15.00, 'LCM SUKI.pdf', 'suki@gmail.com', 1, 0),
(21, '2024-04-18', '09:30:46', 'Kek Bajet Part 1', 15.00, 'LCM SUKI.pdf', 'suki@gmail.com', 1, 0),
(22, '2024-05-13', '09:29:05', 'Kek Bajet Part 1', 15.00, 'resit.png', 'sukieiera@gmail.com', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE `ratings` (
  `id` int NOT NULL,
  `num_unique_ingredients` int DEFAULT NULL,
  `num_presentation` int DEFAULT NULL,
  `num_cleanliness` int DEFAULT NULL,
  `num_creativity` int DEFAULT NULL,
  `num_ambiance` int DEFAULT NULL,
  `progressPercentage` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`id`, `num_unique_ingredients`, `num_presentation`, `num_cleanliness`, `num_creativity`, `num_ambiance`, `progressPercentage`) VALUES
(1, 5, 4, 3, 4, 3, 76.00),
(2, 5, 4, 4, 3, 4, 80.00),
(4, 5, 4, 5, 4, 4, 88.00),
(5, 3, 5, 5, 3, 4, 80.00),
(6, 3, 5, 5, 5, 1, 76.00),
(8, 4, 3, 4, 5, 3, 76.00),
(9, 2, 5, 1, 4, 3, 60.00),
(10, 3, 4, 3, 2, 3, 60.00),
(11, 4, 3, 4, 3, 4, 72.00),
(12, 4, 3, 5, 3, 5, 80.00),
(13, 4, 3, 3, 2, 3, 60.00),
(14, 2, 3, 3, 4, 3, 60.00);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `email`, `password`, `name`, `phone_number`) VALUES
(1, 'suki@gmail.com', 'suki', 'Siti Nur Sukirah', '01113365969'),
(2, 'faq@gmail.com', 'faq', 'Fatin Faqihah', '019-3214563'),
(3, 'hkohbusiness2023@gmail.com', 'nuradriana', 'Nur Adriana', '013-3456231'),
(4, 'jannah@gmail.com', 'jannah', 'Nurin Jannah', '011-8899000'),
(5, 'alya@gmail.com', 'alyapw', 'Alya Batrisya', '018-7790881'),
(13, 'zaim@gmail.com', 'zaim123', 'zaim', '019-23456721'),
(15, 'sukieiera@gmail.com', 'suki123', 'sukirah', '0138534014');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assessments`
--
ALTER TABLE `assessments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `evaluations`
--
ALTER TABLE `evaluations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `finished_assessments`
--
ALTER TABLE `finished_assessments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `finished_assessments_ibfk_1` (`assessment_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`PackageID`),
  ADD UNIQUE KEY `PackageName` (`PackageName`);

--
-- Indexes for table `payment_details`
--
ALTER TABLE `payment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `package` (`package`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `assessments`
--
ALTER TABLE `assessments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `evaluations`
--
ALTER TABLE `evaluations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `finished_assessments`
--
ALTER TABLE `finished_assessments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `PackageID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `payment_details`
--
ALTER TABLE `payment_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `finished_assessments`
--
ALTER TABLE `finished_assessments`
  ADD CONSTRAINT `finished_assessments_ibfk_1` FOREIGN KEY (`assessment_id`) REFERENCES `assessments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
