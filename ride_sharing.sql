-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2021 at 01:26 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ride_sharing`
--

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `trip_id` int(11) NOT NULL,
  `waiting_charge` double NOT NULL,
  `trip_charge` double NOT NULL,
  `payment_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `payment_type` enum('bkash','cash on') NOT NULL DEFAULT 'cash on',
  `paid_to` char(11) NOT NULL DEFAULT 'cash on',
  `paid_from` char(11) NOT NULL DEFAULT 'cash on',
  `transaction_id` varchar(255) NOT NULL DEFAULT 'cash on'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`trip_id`, `waiting_charge`, `trip_charge`, `payment_date_time`, `payment_type`, `paid_to`, `paid_from`, `transaction_id`) VALUES
(3, 11.3, 75.3, '2021-05-28 11:02:30', 'cash on', 'cash on', 'cash on', 'cash on'),
(4, 21.55, 225, '2021-05-28 11:08:34', 'bkash', '01646731824', '01746741824', 'X1Y1Z2'),
(5, 20.25, 155.55, '2021-05-28 11:18:02', 'cash on', 'cash on', 'cash on', 'cash on'),
(6, 4.25, 45.55, '2021-05-28 11:18:02', 'cash on', 'cash on', 'cash on', 'cash on'),
(7, 3.25, 220.55, '2021-05-28 11:18:02', 'cash on', 'cash on', 'cash on', 'cash on');

-- --------------------------------------------------------

--
-- Table structure for table `report_service_provider`
--

CREATE TABLE `report_service_provider` (
  `serial_no` int(11) NOT NULL,
  `reporter_id` int(11) NOT NULL,
  `reported_id` varchar(255) NOT NULL,
  `reporting_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `problem_statement` text NOT NULL,
  `feedback` text NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_service_provider`
--

INSERT INTO `report_service_provider` (`serial_no`, `reporter_id`, `reported_id`, `reporting_date_time`, `problem_statement`, `feedback`) VALUES
(1, 1998040100, 'Dhaka Metro-H-353637', '2021-05-28 10:14:03', 'He insisted me to use wrong lane', 'We are investigating the issue'),
(2, 2038040100, 'Dhaka Metro-H-353637', '2021-05-28 10:14:03', 'He insisted me to use wrong lane', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `report_service_receiver`
--

CREATE TABLE `report_service_receiver` (
  `serial_no` int(11) NOT NULL,
  `reporter_id` varchar(255) NOT NULL,
  `reported_id` int(11) NOT NULL,
  `reporting_date_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `problem_statement` text NOT NULL,
  `feedback` text NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `report_service_receiver`
--

INSERT INTO `report_service_receiver` (`serial_no`, `reporter_id`, `reported_id`, `reporting_date_time`, `problem_statement`, `feedback`) VALUES
(1, 'Dhaka Metro-L-323781', 2008040100, '2021-05-28 10:19:12', 'Bad manner', 'pending'),
(2, 'Dhaka Metro-L-323781', 2008040100, '2021-05-28 10:19:12', 'Bad manner', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_address`
--

CREATE TABLE `service_provider_address` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `road_number` varchar(255) NOT NULL,
  `block` char(1) DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_provider_address`
--

INSERT INTO `service_provider_address` (`vehicle_registration_number`, `road_number`, `block`, `area`, `state`, `city`, `zip`) VALUES
('Dhaka Metro-H-353637', '25/12', 'C', 'Shekhertek', 'Mohammadpur', 'Dhaka', 1207),
('Dhaka Metro-L-323781', '13/4', 'F', 'Aziz Mahalla', 'Mohammadpur', 'Dhaka', 1207),
('Dhaka Metro-M-121212', '29/12', 'C', 'Tajmahal road', 'Mohammadpur', 'Dhaka', 1207),
('Jassore Metro-H-454545', 'D/45', 'D', 'rabbani mahalla', 'Kachpur', 'Jassore', 1110),
('Khulna Metro-L-101011', '11/A', 'G', 'Nazrul coloni', 'Shokhipur', 'Khulna', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_details`
--

CREATE TABLE `service_provider_details` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female','3rd gender') NOT NULL DEFAULT 'male',
  `birthdate` date NOT NULL,
  `email` varchar(255) DEFAULT 'NULL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_provider_details`
--

INSERT INTO `service_provider_details` (`vehicle_registration_number`, `first_name`, `last_name`, `gender`, `birthdate`, `email`) VALUES
('Dhaka Metro-H-353637', 'Gopal', 'Chandra', 'male', '1996-01-25', 'gopal@gmail'),
('Dhaka Metro-L-323781', 'Mutasim', 'Billah', 'male', '1998-04-01', 'mutasim@gmail'),
('Dhaka Metro-M-121212', 'Shivani', 'Chakma', '3rd gender', '1996-04-01', 'shivani@gmail'),
('Jassore Metro-H-454545', 'Arib', 'Aftab', 'male', '1999-05-16', 'arib@gmail'),
('Khulna Metro-L-101011', 'Samia', 'Ishrat', 'female', '1996-12-12', 'samia@gmail');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_registration`
--

CREATE TABLE `service_provider_registration` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `nid_number` int(11) NOT NULL,
  `driving_license_number` int(11) NOT NULL,
  `service_provider_type` enum('bike','car','ambulance') NOT NULL DEFAULT 'bike',
  `bkash_number` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_provider_registration`
--

INSERT INTO `service_provider_registration` (`vehicle_registration_number`, `nid_number`, `driving_license_number`, `service_provider_type`, `bkash_number`) VALUES
('Dhaka Metro-H-353637', 1888040100, 159753456, 'car', '01846731824'),
('Dhaka Metro-L-323781', 1998040100, 123456789, 'bike', '01646731824'),
('Dhaka Metro-M-121212', 1998040111, 987654321, 'car', '01712177490'),
('Jassore Metro-H-454545', 2008040100, 369258147, 'bike', '01346731824'),
('Khulna Metro-L-101011', 1898040100, 147258369, 'ambulance', '01346731824');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_user_password_details`
--

CREATE TABLE `service_provider_user_password_details` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_created_by` enum('admin','moderator','user') NOT NULL DEFAULT 'admin',
  `password_created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `password_edited_by` enum('admin','moderator','user') DEFAULT NULL,
  `password_edited_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_provider_user_password_details`
--

INSERT INTO `service_provider_user_password_details` (`vehicle_registration_number`, `userid`, `password_hash`, `password_created_by`, `password_created_on`, `password_edited_by`, `password_edited_on`) VALUES
('Dhaka Metro-H-353637', 'gopal147', 'c13d18da10b067760b2bf1d414ce209d', 'admin', '2021-05-28 09:11:00', NULL, '2021-05-28 09:11:00'),
('Dhaka Metro-L-323781', 'mutasim123', '4dfc747df7a346ccb013b39aa5d5ea0c', 'admin', '2021-05-28 09:06:07', NULL, '2021-05-28 09:06:07'),
('Dhaka Metro-M-121212', 'shivanI456', '551a4e563abb28b0163c1a7667cd2121', 'admin', '2021-05-28 09:11:00', NULL, '2021-05-28 09:11:00'),
('Jassore Metro-H-454545', 'arib024', '098bd95449c1ae36687c5619790e4e8d', 'admin', '2021-05-28 09:11:00', NULL, '2021-05-28 09:11:00'),
('Khulna Metro-L-101011', 'samia786', '451f0c5764d529ebdb7c9e488f86c682', 'admin', '2021-05-28 09:11:00', NULL, '2021-05-28 09:11:00');

-- --------------------------------------------------------

--
-- Table structure for table `service_receiver_address`
--

CREATE TABLE `service_receiver_address` (
  `nid_number` int(11) NOT NULL,
  `road_number` varchar(255) NOT NULL,
  `block` char(1) DEFAULT NULL,
  `area` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_receiver_address`
--

INSERT INTO `service_receiver_address` (`nid_number`, `road_number`, `block`, `area`, `state`, `city`, `zip`) VALUES
(1800804015, '13/4', 'F', 'Aziz Mahalla', 'Mohammadpur', 'Dhaka', 1207),
(1910804415, '13/12', 'F', 'Aziz Mahalla', 'Mohammadpur', 'Dhaka', 1207),
(1998040100, '13/4', 'F', 'Aziz Mahalla', 'Mohammadpur', 'Dhaka', 1207),
(2008040100, 'D/45', 'D', 'rabbani mahalla', 'Kachpur', 'Jassore', 1110),
(2038040100, 'A/1', 'D', 'bhobani para', 'Rampura', 'Gopalganj', 1454);

-- --------------------------------------------------------

--
-- Table structure for table `service_receiver_registration`
--

CREATE TABLE `service_receiver_registration` (
  `nid_number` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` enum('male','female','3rd gender') DEFAULT 'male',
  `birthdate` date NOT NULL,
  `email` varchar(255) DEFAULT 'NULL',
  `bkash_number` char(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_receiver_registration`
--

INSERT INTO `service_receiver_registration` (`nid_number`, `first_name`, `last_name`, `gender`, `birthdate`, `email`, `bkash_number`) VALUES
(1800804015, 'Mukesh', 'Ambani', 'male', '1975-05-16', 'mukesh@gmail', '01346871824'),
(1910804415, 'Begum', 'Rokeya', 'female', '1975-04-16', 'rokeya@gmail', '01346731834'),
(1998040100, 'Mutasim', 'Billah', 'male', '1998-04-01', 'mutasim@gmail', '01646731824'),
(2008040100, 'Arib', 'Aftab', 'male', '1999-05-16', 'arib@gmail', '01346731824'),
(2038040100, 'Rakib', 'Hossain', 'male', '1992-04-01', 'rakib@gmail', '01746741824');

-- --------------------------------------------------------

--
-- Table structure for table `service_receiver_user_password_details`
--

CREATE TABLE `service_receiver_user_password_details` (
  `nid_number` int(11) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_created_by` enum('admin','moderator','user') NOT NULL DEFAULT 'admin',
  `password_created_on` timestamp NOT NULL DEFAULT current_timestamp(),
  `password_edited_by` enum('admin','moderator','user') DEFAULT NULL,
  `password_edited_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_receiver_user_password_details`
--

INSERT INTO `service_receiver_user_password_details` (`nid_number`, `user_id`, `password_hash`, `password_created_by`, `password_created_on`, `password_edited_by`, `password_edited_on`) VALUES
(1800804015, 'mukesh014', '87cebc7e5563afd88da39e88662902ad', 'admin', '2021-05-28 09:57:46', NULL, '2021-05-28 09:57:46'),
(1910804415, 'rokeYa586', '64fe3fc112ed4696fd5aea72a20538c2', 'admin', '2021-05-28 09:57:46', NULL, '2021-05-28 09:57:46'),
(1998040100, 'mutasim024', 'b2ccd57b08706fcd124518ef1fba7992', 'admin', '2021-05-28 09:55:00', NULL, '2021-05-28 09:55:00'),
(2008040100, 'arib864', '64fe3fc112ed4696fd5aea72a20538c2', 'admin', '2021-05-28 09:57:46', NULL, '2021-05-28 09:57:46'),
(2038040100, 'rakib402', '1e80f4eb5483789b8936f46eb16bba2d', 'admin', '2021-05-28 09:57:46', NULL, '2021-05-28 09:57:46');

-- --------------------------------------------------------

--
-- Table structure for table `trip_basic`
--

CREATE TABLE `trip_basic` (
  `trip_id` int(11) NOT NULL,
  `service_provider_vehicle_registration_number` varchar(255) NOT NULL,
  `service_receiver_nid_number` int(11) NOT NULL,
  `trip_date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_basic`
--

INSERT INTO `trip_basic` (`trip_id`, `service_provider_vehicle_registration_number`, `service_receiver_nid_number`, `trip_date`) VALUES
(3, 'Dhaka Metro-L-323781', 2008040100, '2021-05-28'),
(4, 'Dhaka Metro-L-323781', 2038040100, '2021-05-28'),
(5, 'Jassore Metro-H-454545', 1998040100, '2021-05-28'),
(6, 'Dhaka Metro-L-323781', 2038040100, '2021-05-28'),
(7, 'Dhaka Metro-H-353637', 1998040100, '2021-05-28');

-- --------------------------------------------------------

--
-- Table structure for table `trip_destination`
--

CREATE TABLE `trip_destination` (
  `trip_id` int(11) NOT NULL,
  `destination_road_number` varchar(255) NOT NULL,
  `destination_area` varchar(255) NOT NULL,
  `destination_state` varchar(255) NOT NULL,
  `destination_city` varchar(255) NOT NULL,
  `destination_zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_destination`
--

INSERT INTO `trip_destination` (`trip_id`, `destination_road_number`, `destination_area`, `destination_state`, `destination_city`, `destination_zip`) VALUES
(3, '29/12', 'tajmahal road', 'mohammadpur', 'dhaka', 1207),
(4, '13/4', 'aziz mahallah', 'mohammadpur', 'dhaka', 1207),
(5, '13/B', 'shongkor', 'dhanmondi', 'dhaka', 1213),
(6, '27/A', 'aziz mahallah', 'mohammadpur', 'dhaka', 1207),
(7, '27/A', 'tajmahal road', 'mohammadpur', 'dhaka', 1207);

-- --------------------------------------------------------

--
-- Table structure for table `trip_pickup_location`
--

CREATE TABLE `trip_pickup_location` (
  `trip_id` int(11) NOT NULL,
  `pickup_road_number` varchar(255) NOT NULL,
  `pickup_area` varchar(255) NOT NULL,
  `pickup_state` varchar(255) NOT NULL,
  `pickup_city` varchar(255) NOT NULL,
  `pick_up_zip` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_pickup_location`
--

INSERT INTO `trip_pickup_location` (`trip_id`, `pickup_road_number`, `pickup_area`, `pickup_state`, `pickup_city`, `pick_up_zip`) VALUES
(3, '13/4', 'aziz mahallah', 'mohammadpur', 'dhaka', 1207),
(4, '29/12', 'tajmahal road', 'mohammadpur', 'dhaka', 1207),
(5, '13/B', 'aziz mahallah', 'mohammadpur', 'dhaka', 1207),
(6, '27/A', 'shongkor', 'dhanmondi', 'dhaka', 1213),
(7, '27/A', 'shongkor', 'dhanmondi', 'dhaka', 1213);

-- --------------------------------------------------------

--
-- Table structure for table `trip_timing`
--

CREATE TABLE `trip_timing` (
  `trip_id` int(11) NOT NULL,
  `service_receiver_request_sent_time` time NOT NULL,
  `service_provider_request_accept_time` time NOT NULL,
  `service_provider_reach_time_to_service_receiver` time NOT NULL,
  `trip_start_time` time NOT NULL,
  `trip_end_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trip_timing`
--

INSERT INTO `trip_timing` (`trip_id`, `service_receiver_request_sent_time`, `service_provider_request_accept_time`, `service_provider_reach_time_to_service_receiver`, `trip_start_time`, `trip_end_time`) VALUES
(3, '10:10:15', '10:10:25', '10:15:00', '10:16:11', '11:30:45'),
(4, '08:30:15', '08:30:35', '08:32:00', '08:33:11', '10:17:45'),
(5, '10:10:15', '10:10:25', '10:15:00', '10:16:11', '11:30:45'),
(6, '20:10:15', '20:10:25', '20:15:00', '20:16:11', '21:30:45'),
(7, '08:30:15', '08:30:35', '08:32:00', '08:33:11', '10:17:45');

-- --------------------------------------------------------

--
-- Table structure for table `user_rating_based_on_trip`
--

CREATE TABLE `user_rating_based_on_trip` (
  `trip_id` int(11) NOT NULL,
  `service_provider_rating` int(11) DEFAULT NULL,
  `service_receiver_rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_rating_based_on_trip`
--

INSERT INTO `user_rating_based_on_trip` (`trip_id`, `service_provider_rating`, `service_receiver_rating`) VALUES
(3, NULL, NULL),
(4, 80, 90),
(5, 70, 70),
(6, 100, 100),
(7, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details_basic`
--

CREATE TABLE `vehicle_details_basic` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `registration_branch` varchar(255) NOT NULL DEFAULT 'BRTA, Mirpur-14',
  `vehicle_type` enum('bike','car','ambulance') NOT NULL DEFAULT 'bike'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_details_basic`
--

INSERT INTO `vehicle_details_basic` (`vehicle_registration_number`, `registration_branch`, `vehicle_type`) VALUES
('Dhaka Metro-H-353637', 'Jassore BRTA', 'car'),
('Dhaka Metro-L-323781', 'Mirpur BRTA', 'bike'),
('Dhaka Metro-M-121212', 'Joarshahara BRTA', 'car'),
('Jassore Metro-H-454545', 'Jassore BRTA', 'bike'),
('Khulna Metro-L-101011', 'Khulna BRTA', 'ambulance');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_details_extension`
--

CREATE TABLE `vehicle_details_extension` (
  `vehicle_registration_number` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_details_extension`
--

INSERT INTO `vehicle_details_extension` (`vehicle_registration_number`, `brand`, `model`, `color`) VALUES
('Dhaka Metro-H-353637', 'Noah', '2011', 'White'),
('Dhaka Metro-L-323781', 'Hero', '2016', 'Red'),
('Dhaka Metro-M-121212', 'Allion', '2012', 'Brown'),
('Jassore Metro-H-454545', 'TVS', '2008', 'Blue'),
('Khulna Metro-L-101011', 'Toyota', '2019', 'White');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `report_service_provider`
--
ALTER TABLE `report_service_provider`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `reporter_id` (`reporter_id`),
  ADD KEY `reported_id` (`reported_id`);

--
-- Indexes for table `report_service_receiver`
--
ALTER TABLE `report_service_receiver`
  ADD PRIMARY KEY (`serial_no`),
  ADD KEY `reporter_id` (`reporter_id`),
  ADD KEY `reported_id` (`reported_id`);

--
-- Indexes for table `service_provider_address`
--
ALTER TABLE `service_provider_address`
  ADD PRIMARY KEY (`vehicle_registration_number`);

--
-- Indexes for table `service_provider_details`
--
ALTER TABLE `service_provider_details`
  ADD PRIMARY KEY (`vehicle_registration_number`);

--
-- Indexes for table `service_provider_registration`
--
ALTER TABLE `service_provider_registration`
  ADD PRIMARY KEY (`vehicle_registration_number`),
  ADD UNIQUE KEY `nid_number` (`nid_number`),
  ADD UNIQUE KEY `driving_license_number` (`driving_license_number`);

--
-- Indexes for table `service_provider_user_password_details`
--
ALTER TABLE `service_provider_user_password_details`
  ADD PRIMARY KEY (`vehicle_registration_number`),
  ADD UNIQUE KEY `userid` (`userid`);

--
-- Indexes for table `service_receiver_address`
--
ALTER TABLE `service_receiver_address`
  ADD PRIMARY KEY (`nid_number`);

--
-- Indexes for table `service_receiver_registration`
--
ALTER TABLE `service_receiver_registration`
  ADD PRIMARY KEY (`nid_number`);

--
-- Indexes for table `service_receiver_user_password_details`
--
ALTER TABLE `service_receiver_user_password_details`
  ADD PRIMARY KEY (`nid_number`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `trip_basic`
--
ALTER TABLE `trip_basic`
  ADD PRIMARY KEY (`trip_id`),
  ADD KEY `service_provider_vehicle_registration_number` (`service_provider_vehicle_registration_number`),
  ADD KEY `service_receiver_nid_number` (`service_receiver_nid_number`);

--
-- Indexes for table `trip_destination`
--
ALTER TABLE `trip_destination`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `trip_pickup_location`
--
ALTER TABLE `trip_pickup_location`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `trip_timing`
--
ALTER TABLE `trip_timing`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `user_rating_based_on_trip`
--
ALTER TABLE `user_rating_based_on_trip`
  ADD PRIMARY KEY (`trip_id`);

--
-- Indexes for table `vehicle_details_basic`
--
ALTER TABLE `vehicle_details_basic`
  ADD PRIMARY KEY (`vehicle_registration_number`);

--
-- Indexes for table `vehicle_details_extension`
--
ALTER TABLE `vehicle_details_extension`
  ADD PRIMARY KEY (`vehicle_registration_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `report_service_provider`
--
ALTER TABLE `report_service_provider`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_service_receiver`
--
ALTER TABLE `report_service_receiver`
  MODIFY `serial_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `trip_basic`
--
ALTER TABLE `trip_basic`
  MODIFY `trip_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_basic` (`trip_id`);

--
-- Constraints for table `report_service_provider`
--
ALTER TABLE `report_service_provider`
  ADD CONSTRAINT `report_service_provider_ibfk_1` FOREIGN KEY (`reporter_id`) REFERENCES `service_receiver_registration` (`nid_number`),
  ADD CONSTRAINT `report_service_provider_ibfk_2` FOREIGN KEY (`reported_id`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);

--
-- Constraints for table `report_service_receiver`
--
ALTER TABLE `report_service_receiver`
  ADD CONSTRAINT `report_service_receiver_ibfk_1` FOREIGN KEY (`reporter_id`) REFERENCES `service_provider_registration` (`vehicle_registration_number`),
  ADD CONSTRAINT `report_service_receiver_ibfk_2` FOREIGN KEY (`reported_id`) REFERENCES `service_receiver_registration` (`nid_number`);

--
-- Constraints for table `service_provider_address`
--
ALTER TABLE `service_provider_address`
  ADD CONSTRAINT `service_provider_address_ibfk_1` FOREIGN KEY (`vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);

--
-- Constraints for table `service_provider_details`
--
ALTER TABLE `service_provider_details`
  ADD CONSTRAINT `service_provider_details_ibfk_1` FOREIGN KEY (`vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);

--
-- Constraints for table `service_provider_user_password_details`
--
ALTER TABLE `service_provider_user_password_details`
  ADD CONSTRAINT `service_provider_user_password_details_ibfk_1` FOREIGN KEY (`vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);

--
-- Constraints for table `service_receiver_address`
--
ALTER TABLE `service_receiver_address`
  ADD CONSTRAINT `service_receiver_address_ibfk_1` FOREIGN KEY (`nid_number`) REFERENCES `service_receiver_registration` (`nid_number`);

--
-- Constraints for table `service_receiver_user_password_details`
--
ALTER TABLE `service_receiver_user_password_details`
  ADD CONSTRAINT `service_receiver_user_password_details_ibfk_1` FOREIGN KEY (`nid_number`) REFERENCES `service_receiver_registration` (`nid_number`);

--
-- Constraints for table `trip_basic`
--
ALTER TABLE `trip_basic`
  ADD CONSTRAINT `trip_basic_ibfk_1` FOREIGN KEY (`service_provider_vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`),
  ADD CONSTRAINT `trip_basic_ibfk_2` FOREIGN KEY (`service_receiver_nid_number`) REFERENCES `service_receiver_registration` (`nid_number`);

--
-- Constraints for table `trip_destination`
--
ALTER TABLE `trip_destination`
  ADD CONSTRAINT `trip_destination_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_basic` (`trip_id`);

--
-- Constraints for table `trip_pickup_location`
--
ALTER TABLE `trip_pickup_location`
  ADD CONSTRAINT `trip_pickup_location_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_basic` (`trip_id`);

--
-- Constraints for table `trip_timing`
--
ALTER TABLE `trip_timing`
  ADD CONSTRAINT `trip_timing_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_basic` (`trip_id`);

--
-- Constraints for table `user_rating_based_on_trip`
--
ALTER TABLE `user_rating_based_on_trip`
  ADD CONSTRAINT `user_rating_based_on_trip_ibfk_1` FOREIGN KEY (`trip_id`) REFERENCES `trip_basic` (`trip_id`);

--
-- Constraints for table `vehicle_details_basic`
--
ALTER TABLE `vehicle_details_basic`
  ADD CONSTRAINT `vehicle_details_basic_ibfk_1` FOREIGN KEY (`vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);

--
-- Constraints for table `vehicle_details_extension`
--
ALTER TABLE `vehicle_details_extension`
  ADD CONSTRAINT `vehicle_details_extension_ibfk_1` FOREIGN KEY (`vehicle_registration_number`) REFERENCES `service_provider_registration` (`vehicle_registration_number`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
