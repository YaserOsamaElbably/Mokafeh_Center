-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 08:37 AM
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
-- Database: `mokafeh`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'employees'),
(2, 'rent'),
(3, 'landline_bill'),
(4, 'internet_bill'),
(5, 'mobile_bundle1'),
(6, 'mobile_bundle2'),
(7, 'water_bill'),
(8, 'electricity_bill'),
(9, 'spare_parts'),
(10, 'deans_aids'),
(11, 'purchase_devices'),
(12, 'prints'),
(13, 'Separates'),
(14, 'deans'),
(15, 'money_collections'),
(16, 'travel');

-- --------------------------------------------------------

--
-- Table structure for table `dimdate`
--

CREATE TABLE `dimdate` (
  `Date` date NOT NULL,
  `day` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `e_mail` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `birth_day` date DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `supervising_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `factsales`
--

CREATE TABLE `factsales` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL DEFAULT curdate(),
  `employee_id` int(11) NOT NULL,
  `type` enum('صادر','وارد') DEFAULT 'صادر',
  `category_id` int(11) NOT NULL,
  `value` float NOT NULL,
  `notes` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`notes`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dimdate`
--
ALTER TABLE `dimdate`
  ADD PRIMARY KEY (`Date`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `e_mail` (`e_mail`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD KEY `supervising_id` (`supervising_id`);

--
-- Indexes for table `factsales`
--
ALTER TABLE `factsales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `factsales`
--
ALTER TABLE `factsales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`supervising_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `factsales`
--
ALTER TABLE `factsales`
  ADD CONSTRAINT `factsales_ibfk_1` FOREIGN KEY (`date`) REFERENCES `dimdate` (`Date`),
  ADD CONSTRAINT `factsales_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`),
  ADD CONSTRAINT `factsales_ibfk_3` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
