-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 24, 2019 at 09:56 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detsdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `catID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `catname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblexpense`
--

CREATE TABLE `tblexpense` (
  `ID` int(10) NOT NULL,
  `UserId` int(10) NOT NULL,
  `ExpenseDate` date DEFAULT NULL,
  `ExpenseItem` varchar(200) DEFAULT NULL,
  `ExpenseCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ExpenseCategory` enum('FIXED','VARIABLE','OTHERS','HEALTH') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblexpense`
--

INSERT INTO `tblexpense` (`ID`, `UserId`, `ExpenseDate`, `ExpenseItem`, `ExpenseCost`, `NoteDate`, `ExpenseCategory`) VALUES
(1, 2, '2019-05-15', 'Milk', '63', NULL, 'FIXED'),
(2, 2, '2019-05-15', 'Vegitables', '520', '2019-05-15 10:06:19', 'FIXED'),
(3, 2, '2019-05-15', 'Household Items', '5200', '2019-05-15 10:07:08', 'FIXED'),
(4, 2, '2019-05-14', 'Milk', '83', '2019-05-15 10:07:27', 'FIXED'),
(5, 2, '2019-05-14', 'Bed Sheets', '1120', '2019-05-15 10:07:49', 'FIXED'),
(9, 2, '2019-05-08', 'Bed Sheets', '890', '2019-05-15 10:08:57', 'FIXED'),
(10, 2, '2018-12-19', 'Household Items', '1120', '2019-05-15 10:09:34', 'FIXED'),
(11, 2, '2018-12-19', 'Fruits', '560', '2019-05-15 10:09:52', 'FIXED'),
(13, 2, '2018-12-20', 'Tour of Manali', '30000', '2019-05-15 10:15:47', 'FIXED'),
(14, 2, '2019-05-14', 'Milk', '360', '2019-05-15 10:21:31', 'FIXED'),
(15, 3, '2019-05-15', 'Milk', '123', '2019-05-15 10:29:56', 'FIXED'),
(16, 3, '2019-05-15', 'Household Items', '360', '2019-05-15 10:30:06', 'FIXED'),
(17, 3, '2019-05-15', 'Bed Sheets', '3000', '2019-05-15 10:30:18', 'FIXED'),
(18, 3, '2019-05-07', 'Milk', '123', '2019-05-15 10:30:28', 'FIXED'),
(19, 3, '2019-05-14', 'Household Items', '3600', '2019-05-15 10:30:38', 'FIXED'),
(20, 2, '2019-05-14', 'Electric Board Extension', '300', '2019-05-15 15:11:33', 'FIXED'),
(21, 2, '2019-04-11', 'Milk', '123', '2019-05-15 17:50:24', 'FIXED'),
(22, 2, '2019-04-10', 'Household Items', '520', '2019-05-15 17:50:37', 'FIXED'),
(23, 2, '2019-05-16', 'Household Items', '360', '2019-05-16 07:29:54', 'FIXED'),
(30, 1, '2019-05-18', 'Milk + Bread', '80', '2019-05-18 05:22:01', 'FIXED'),
(31, 10, '2019-05-16', 'Computer Mouse', '500', '2019-05-18 05:35:45', 'FIXED'),
(32, 10, '2019-05-17', 'Milk+Bread', '80', '2019-05-18 05:36:06', 'FIXED'),
(44, 12, '2019-11-21', 'milk', '50', '2019-11-22 08:25:23', 'FIXED'),
(56, 13, '2015-05-05', 'Rent', '5000', '2019-11-24 20:41:26', 'FIXED'),
(57, 13, '2015-05-05', 'Medicine', '500', '2019-11-24 20:42:10', 'HEALTH');

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

CREATE TABLE `tbluser` (
  `ID` int(10) NOT NULL,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(11, 'Vikas Rathod', 'vikas.rv4299@gmail.com', 9426466606, '81dc9bdb52d04dc20036dbd8313ed055', '2019-09-17 19:17:25'),
(12, 'Vikas Rathod', 'rathod@gmail.com', 9426466606, '202cb962ac59075b964b07152d234b70', '2019-11-22 07:56:44'),
(13, 'Rushabh', 'rsr@gmail.com', 9638836571, '8adc3a0afef70976c6dcb54ad04652bb', '2019-11-23 18:40:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`catID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `tblexpense`
--
ALTER TABLE `tblexpense`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `catID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblexpense`
--
ALTER TABLE `tblexpense`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `tbluser` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
