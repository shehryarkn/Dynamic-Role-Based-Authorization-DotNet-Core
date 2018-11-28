-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 28, 2018 at 09:46 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `role_based_authorization`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `roles_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `full_name`, `email`, `password`, `roles_id`) VALUES
(1, 'Shehryar Khan', 'shehryarkn@gmail.com', '12345', 1),
(2, 'Ahsan Saeed', 'ahsansaeed067@gmail.com', '12345', 2),
(3, 'Shayan tahir', 'shayan@codinginfinite.com', '12345', 6);

-- --------------------------------------------------------

--
-- Table structure for table `link_roles_menus`
--

CREATE TABLE `link_roles_menus` (
  `id` int(11) NOT NULL,
  `roles_id` int(11) NOT NULL,
  `menus_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `link_roles_menus`
--

INSERT INTO `link_roles_menus` (`id`, `roles_id`, `menus_id`) VALUES
(47, 2, 1),
(48, 2, 2),
(49, 2, 4),
(50, 2, 5),
(51, 2, 6),
(52, 2, 7),
(65, 1, 1),
(66, 1, 2),
(67, 1, 3),
(68, 1, 4),
(69, 1, 5),
(70, 1, 6),
(71, 1, 7),
(76, 6, 1),
(77, 6, 2),
(78, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `icon`, `url`, `parent_id`) VALUES
(1, 'Dashboard', 'fa fa-dashboard', '/', 0),
(2, 'Admins', 'fa fa-users', '#', 0),
(3, 'Create Admin', 'fa fa-plus', '/Admins/Create', 2),
(4, 'Manage Admins', 'fa fa-users', '/Admins/Index', 2),
(5, 'Roles', 'fa fa-lock', '#', 0),
(6, 'Create Role', 'fa fa-lock', '/Roles/Create', 5),
(7, 'Manage Roles', 'fa fa-lock', '/Roles/Index', 5);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `title`, `description`) VALUES
(1, 'Manager', 'Super Admin with all rights...'),
(2, 'Supervisor', 'Can View Dashboard, Admins & Roles'),
(6, 'Developer', 'Can View Dashboard &  Admins List');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_ibfk_1` (`roles_id`);

--
-- Indexes for table `link_roles_menus`
--
ALTER TABLE `link_roles_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menus_id` (`menus_id`),
  ADD KEY `roles_id` (`roles_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `link_roles_menus`
--
ALTER TABLE `link_roles_menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `link_roles_menus`
--
ALTER TABLE `link_roles_menus`
  ADD CONSTRAINT `link_roles_menus_ibfk_1` FOREIGN KEY (`menus_id`) REFERENCES `menus` (`id`),
  ADD CONSTRAINT `link_roles_menus_ibfk_2` FOREIGN KEY (`roles_id`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
