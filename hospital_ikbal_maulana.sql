-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2020 at 06:55 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_ikbal_maulana`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctorId` int(11) NOT NULL,
  `doctorName` varchar(50) NOT NULL,
  `doctorAdress` varchar(255) NOT NULL,
  `doctorPhone` varchar(20) NOT NULL,
  `doctorSpecialization` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `drug`
--

CREATE TABLE `drug` (
  `drugId` int(11) NOT NULL,
  `drugName` varchar(50) NOT NULL,
  `drugAffect` text NOT NULL,
  `drugBenefits` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `follow_up_visit`
--

CREATE TABLE `follow_up_visit` (
  `followUpVisitId` int(11) NOT NULL,
  `officeVisitId` int(11) NOT NULL,
  `diagnoseStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `hospitalId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hospital_affiliation`
--

CREATE TABLE `hospital_affiliation` (
  `hospitalAffiliationId` int(11) NOT NULL,
  `date_of_affiliation` date NOT NULL,
  `hospitalId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `initial_visit`
--

CREATE TABLE `initial_visit` (
  `initialVisitId` int(11) NOT NULL,
  `officeVisitId` int(11) NOT NULL,
  `initial_diagnosis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insuranceId` int(11) NOT NULL,
  `insurance_company` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `non_refillable`
--

CREATE TABLE `non_refillable` (
  `nonRefillableId` int(11) NOT NULL,
  `rxId` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `office_visit`
--

CREATE TABLE `office_visit` (
  `officeVisitId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `dateOfVIsit` date NOT NULL,
  `symptoms` varchar(255) NOT NULL,
  `visitType` enum('initial visit','follow up visit','routine visit','other') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL,
  `patientName` varchar(50) NOT NULL,
  `patientAddress` varchar(255) NOT NULL,
  `pattientContact` varchar(20) NOT NULL,
  `patientEmail` varchar(50) NOT NULL,
  `insuranceId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `rxId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `drugId` int(11) NOT NULL,
  `datePrescribed` date NOT NULL,
  `dosage` varchar(255) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `refillable` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription`
--
-- --------------------------------------------------------

--
-- Table structure for table `primary_doctor_history`
--

CREATE TABLE `primary_doctor_history` (
  `primaryDoctorHistoryId` int(11) NOT NULL,
  `patientId` int(11) NOT NULL,
  `doctorId` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `reasonLeave` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `refillable`
--

CREATE TABLE `refillable` (
  `refillableID` int(11) NOT NULL,
  `rxId` int(11) NOT NULL,
  `num_of_refills` int(11) NOT NULL,
  `comments` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Table structure for table `routine_visit`
--

CREATE TABLE `routine_visit` (
  `routineVisitId` int(11) NOT NULL,
  `officeVisitId` int(11) NOT NULL,
  `blood_pressure` varchar(20) NOT NULL,
  `height` int(11) NOT NULL,
  `weight` decimal(5,2) NOT NULL,
  `diagnosis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctorId`);

--
-- Indexes for table `drug`
--
ALTER TABLE `drug`
  ADD PRIMARY KEY (`drugId`);

--
-- Indexes for table `follow_up_visit`
--
ALTER TABLE `follow_up_visit`
  ADD PRIMARY KEY (`followUpVisitId`),
  ADD KEY `officeVisitId_fuv_fk` (`officeVisitId`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`hospitalId`);

--
-- Indexes for table `hospital_affiliation`
--
ALTER TABLE `hospital_affiliation`
  ADD PRIMARY KEY (`hospitalAffiliationId`),
  ADD KEY `hospitalId_ha_fk` (`hospitalId`),
  ADD KEY `doctorId_ha_fk` (`doctorId`);

--
-- Indexes for table `initial_visit`
--
ALTER TABLE `initial_visit`
  ADD PRIMARY KEY (`initialVisitId`),
  ADD KEY `officeVisitId_iv_fk` (`officeVisitId`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insuranceId`);

--
-- Indexes for table `non_refillable`
--
ALTER TABLE `non_refillable`
  ADD PRIMARY KEY (`nonRefillableId`),
  ADD KEY `rxId_non_refillable_fk` (`rxId`);

--
-- Indexes for table `office_visit`
--
ALTER TABLE `office_visit`
  ADD PRIMARY KEY (`officeVisitId`),
  ADD KEY `doctorId_ov_fk` (`doctorId`),
  ADD KEY `patientId_ov_fk` (`patientId`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patientId`),
  ADD KEY `doctorId_patient_fk` (`doctorId`),
  ADD KEY `insuranceId_patient_fk` (`insuranceId`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`rxId`),
  ADD KEY `drugId_prescription_fk` (`drugId`),
  ADD KEY `doctorId_prescription_fk` (`doctorId`),
  ADD KEY `patientId_prescription_fk` (`patientId`);

--
-- Indexes for table `primary_doctor_history`
--
ALTER TABLE `primary_doctor_history`
  ADD PRIMARY KEY (`primaryDoctorHistoryId`),
  ADD KEY `doctorId_pdh_fk` (`doctorId`),
  ADD KEY `patientId_pdh_fk` (`patientId`);

--
-- Indexes for table `refillable`
--
ALTER TABLE `refillable`
  ADD PRIMARY KEY (`refillableID`),
  ADD KEY `rxId_refillable_fk` (`rxId`);

--
-- Indexes for table `routine_visit`
--
ALTER TABLE `routine_visit`
  ADD PRIMARY KEY (`routineVisitId`),
  ADD KEY `officeVisitId_rv_fk` (`officeVisitId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `drug`
--
ALTER TABLE `drug`
  MODIFY `drugId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `follow_up_visit`
--
ALTER TABLE `follow_up_visit`
  MODIFY `followUpVisitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `hospitalId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hospital_affiliation`
--
ALTER TABLE `hospital_affiliation`
  MODIFY `hospitalAffiliationId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `initial_visit`
--
ALTER TABLE `initial_visit`
  MODIFY `initialVisitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `insuranceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `non_refillable`
--
ALTER TABLE `non_refillable`
  MODIFY `nonRefillableId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `office_visit`
--
ALTER TABLE `office_visit`
  MODIFY `officeVisitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patientId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `rxId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `primary_doctor_history`
--
ALTER TABLE `primary_doctor_history`
  MODIFY `primaryDoctorHistoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `refillable`
--
ALTER TABLE `refillable`
  MODIFY `refillableId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `routine_visit`
--
ALTER TABLE `routine_visit`
  MODIFY `routineVisitId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `follow_up_visit`
--
ALTER TABLE `follow_up_visit`
  ADD CONSTRAINT `officeVisitId_fuv_fk` FOREIGN KEY (`officeVisitId`) REFERENCES `office_visit` (`officeVisitId`);

--
-- Constraints for table `hospital_affiliation`
--
ALTER TABLE `hospital_affiliation`
  ADD CONSTRAINT `doctorId_ha_fk` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `hospitalId_ha_fk` FOREIGN KEY (`hospitalId`) REFERENCES `hospital` (`hospitalId`);

--
-- Constraints for table `initial_visit`
--
ALTER TABLE `initial_visit`
  ADD CONSTRAINT `officeVisitId_iv_fk` FOREIGN KEY (`officeVisitId`) REFERENCES `office_visit` (`officeVisitId`);

--
-- Constraints for table `non_refillable`
--
ALTER TABLE `non_refillable`
  ADD CONSTRAINT `rxId_non_refillable_fk` FOREIGN KEY (`rxId`) REFERENCES `prescription` (`rxId`);

--
-- Constraints for table `office_visit`
--
ALTER TABLE `office_visit`
  ADD CONSTRAINT `doctorId_ov_fk` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `patientId_ov_fk` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);

--
-- Constraints for table `patient`
--
ALTER TABLE `patient`
  ADD CONSTRAINT `doctorId_patient_fk` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `insuranceId_patient_fk` FOREIGN KEY (`insuranceId`) REFERENCES `insurance` (`insuranceId`);

--
-- Constraints for table `prescription`
--
ALTER TABLE `prescription`
  ADD CONSTRAINT `doctorId_prescription_fk` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `drugId_prescription_fk` FOREIGN KEY (`drugId`) REFERENCES `drug` (`drugId`),
  ADD CONSTRAINT `patientId_prescription_fk` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);

--
-- Constraints for table `primary_doctor_history`
--
ALTER TABLE `primary_doctor_history`
  ADD CONSTRAINT `doctorId_pdh_fk` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`),
  ADD CONSTRAINT `patientId_pdh_fk` FOREIGN KEY (`patientId`) REFERENCES `patient` (`patientId`);

--
-- Constraints for table `refillable`
--
ALTER TABLE `refillable`
  ADD CONSTRAINT `rxId_refillable_fk` FOREIGN KEY (`rxId`) REFERENCES `prescription` (`rxId`);

--
-- Constraints for table `routine_visit`
--
ALTER TABLE `routine_visit`
  ADD CONSTRAINT `officeVisitId_rv_fk` FOREIGN KEY (`officeVisitId`) REFERENCES `office_visit` (`officeVisitId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
