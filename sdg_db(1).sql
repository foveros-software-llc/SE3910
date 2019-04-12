-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2019 at 02:44 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdg_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointmentid` int(11) NOT NULL,
  `AppointmentDate` date NOT NULL,
  `AppointmentStartTime` time NOT NULL,
  `AppointmentEndTime` time NOT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `BankLocationId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointmentid`, `AppointmentDate`, `AppointmentStartTime`, `AppointmentEndTime`, `CustomerId`, `BankLocationId`) VALUES
(1, '2019-04-01', '10:30:00', '11:00:00', 2, 1),
(3, '2019-04-03', '12:00:00', '13:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `appointmentservices`
--

CREATE TABLE `appointmentservices` (
  `AppointmentServiceId` int(11) NOT NULL,
  `appointmentid` int(11) DEFAULT NULL,
  `BankLocationServiceId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `appointmentservices`
--

INSERT INTO `appointmentservices` (`AppointmentServiceId`, `appointmentid`, `BankLocationServiceId`, `ServiceId`) VALUES
(1, 1, 1, 2),
(2, 3, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `banklocations`
--

CREATE TABLE `banklocations` (
  `BankLocationId` int(11) NOT NULL,
  `BankStreet` varchar(50) NOT NULL,
  `BankCity` varchar(50) NOT NULL,
  `BankState` varchar(50) NOT NULL,
  `BankZipCode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banklocations`
--

INSERT INTO `banklocations` (`BankLocationId`, `BankStreet`, `BankCity`, `BankState`, `BankZipCode`) VALUES
(1, '123 street', 'Kansas City', 'Missouri', '64063');

-- --------------------------------------------------------

--
-- Table structure for table `banklocationservices`
--

CREATE TABLE `banklocationservices` (
  `BankLocationServiceId` int(11) NOT NULL,
  `BankLocationId` int(11) DEFAULT NULL,
  `ServiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `banklocationservices`
--

INSERT INTO `banklocationservices` (`BankLocationServiceId`, `BankLocationId`, `ServiceId`) VALUES
(1, 1, 1),
(2, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customerappointments`
--

CREATE TABLE `customerappointments` (
  `CustomerAppointmentId` int(11) NOT NULL,
  `CustomerAppointmentStatus` int(11) NOT NULL COMMENT '0=not completed, 1=completed, 2=canceled',
  `appointmentid` int(11) DEFAULT NULL,
  `AppointmentServiceId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerappointments`
--

INSERT INTO `customerappointments` (`CustomerAppointmentId`, `CustomerAppointmentStatus`, `appointmentid`, `AppointmentServiceId`) VALUES
(1, 1, 1, 1),
(2, 2, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CustomerId` int(11) NOT NULL,
  `CustomerFirstName` varchar(50) NOT NULL,
  `CustomerLastName` varchar(50) NOT NULL,
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerPhoneNumber` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CustomerId`, `CustomerFirstName`, `CustomerLastName`, `CustomerEmail`, `CustomerPhoneNumber`) VALUES
(1, 'bob', 'smith', 'bob.smith@gmail.com', '123'),
(2, 'bob2', 'smith2', 'bob2.smith2@gmail.com', '456');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ServiceId` int(11) NOT NULL,
  `ServiceDescription` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ServiceId`, `ServiceDescription`) VALUES
(1, 'Loans'),
(2, 'Credit Card'),
(3, 'Debit Card');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointmentid`),
  ADD KEY `fk_cid` (`CustomerId`),
  ADD KEY `fk_lid` (`BankLocationId`);

--
-- Indexes for table `appointmentservices`
--
ALTER TABLE `appointmentservices`
  ADD PRIMARY KEY (`AppointmentServiceId`),
  ADD KEY `fk_aid` (`appointmentid`),
  ADD KEY `fk_bls` (`BankLocationServiceId`),
  ADD KEY `fk_sd` (`ServiceId`);

--
-- Indexes for table `banklocations`
--
ALTER TABLE `banklocations`
  ADD PRIMARY KEY (`BankLocationId`);

--
-- Indexes for table `banklocationservices`
--
ALTER TABLE `banklocationservices`
  ADD PRIMARY KEY (`BankLocationServiceId`),
  ADD KEY `fk_sli` (`BankLocationId`),
  ADD KEY `fk_s` (`ServiceId`);

--
-- Indexes for table `customerappointments`
--
ALTER TABLE `customerappointments`
  ADD PRIMARY KEY (`CustomerAppointmentId`),
  ADD KEY `fk_app` (`appointmentid`),
  ADD KEY `fk_aps` (`AppointmentServiceId`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CustomerId`),
  ADD UNIQUE KEY `CustomerEmail` (`CustomerEmail`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointmentid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `appointmentservices`
--
ALTER TABLE `appointmentservices`
  MODIFY `AppointmentServiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `banklocations`
--
ALTER TABLE `banklocations`
  MODIFY `BankLocationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banklocationservices`
--
ALTER TABLE `banklocationservices`
  MODIFY `BankLocationServiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customerappointments`
--
ALTER TABLE `customerappointments`
  MODIFY `CustomerAppointmentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ServiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `fk_cid` FOREIGN KEY (`CustomerId`) REFERENCES `customers` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_lid` FOREIGN KEY (`BankLocationId`) REFERENCES `banklocations` (`BankLocationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `appointmentservices`
--
ALTER TABLE `appointmentservices`
  ADD CONSTRAINT `fk_aid` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bls` FOREIGN KEY (`BankLocationServiceId`) REFERENCES `banklocationservices` (`BankLocationServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sd` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `banklocationservices`
--
ALTER TABLE `banklocationservices`
  ADD CONSTRAINT `fk_s` FOREIGN KEY (`ServiceId`) REFERENCES `services` (`ServiceId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_sli` FOREIGN KEY (`BankLocationId`) REFERENCES `banklocations` (`BankLocationId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customerappointments`
--
ALTER TABLE `customerappointments`
  ADD CONSTRAINT `fk_app` FOREIGN KEY (`appointmentid`) REFERENCES `appointments` (`appointmentid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aps` FOREIGN KEY (`AppointmentServiceId`) REFERENCES `appointmentservices` (`AppointmentServiceId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
