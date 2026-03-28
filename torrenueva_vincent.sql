-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2026 at 02:49 AM
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
-- Database: `torrenueva_vincent`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(100) DEFAULT NULL,
  `appointment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`appointment_id`, `patient_id`, `doctor_name`, `appointment_date`, `status`) VALUES
(201, 101, 'Dr. Garcia', '2025-03-10', 'Completed'),
(202, 102, 'Dr. Ramos', '2025-03-11', 'Scheduled'),
(203, 101, 'Dr. Cruz', '2025-03-15', 'Scheduled'),
(204, 103, 'Dr. Garcia', '2025-03-18', 'Cancelled'),
(205, 105, 'Dr. Ramos', '2025-03-20', 'Scheduled');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `membership_level` varchar(50) DEFAULT NULL,
  `join_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `city`, `membership_level`, `join_date`) VALUES
(1, 'Alice', 'Cebu', 'Gold', '2025-01-10'),
(2, 'Bob', 'Bohol', 'Silver', '2025-01-15'),
(3, 'Charlie', 'Cebu', 'Bronze', '2025-02-10'),
(4, 'Diana', 'Tagbilaran', 'Gold', '2025-02-12'),
(5, 'Ethan', 'Bohol', 'Silver', '2025-03-01'),
(6, 'Fiona', 'Cebu', 'Gold', '2025-03-05'),
(7, 'George', 'Tagbilaran', 'Bronze', '2025-03-08'),
(8, 'Hannah', 'Cebu', 'Silver', '2025-04-01'),
(9, 'Ian', 'Bohol', 'Gold', '2025-04-10'),
(10, 'Julia', 'Cebu', 'Bronze', '2025-04-15');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`patient_id`, `patient_name`, `city`, `contact_number`) VALUES
(101, 'Maria Santos', 'Cebu', '09123456781'),
(102, 'Juan Dela Cruz', 'Bohol', '09123456782'),
(103, 'Ana Reyes', 'Cebu', '09123456783'),
(104, 'Mark Lopez', 'Dumaguete', '09123456784'),
(105, 'Carla Gomez', 'Bohol', '09123456785');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


SQL queries in Filtering activity

1. SELECT * 
FROM Customers 
WHERE city = 'Cebu';

2. SELECT * 
FROM Customers 
WHERE membership_level = 'Gold';

3. SELECT * 
FROM Customers 
WHERE customer_name LIKE 'A%' OR customer_name LIKE 'D%';

4. SELECT * 
FROM Customers 
WHERE city = 'Cebu' AND (membership_level = 'Silver' OR membership_level = 'Gold');
5. SELECT * 
FROM Customers
WHERE join_date BETWEEN '2025-02-01' AND '2025-03-31';

6. SELECT *
FROM Customers
WHERE (city = 'Bohol' OR city = 'Tagbilaran') HAVING membership_level = 'Bronze';

7. SELECT * 
FROM Customers 
WHERE customer_name LIKE '%a%';

8. SELECT * 
FROM Customers 
WHERE city = 'Cebu' AND membership_level = 'Gold' AND join_date < '2025-03-01';

9. SELECT * 
FROM Customers
WHERE (city = 'Bohol' OR city = 'Tagbilaran') AND join_date <= '2025-02-28' AND (membership_level = 'Silver' OR membership_level = 'Bronze');

10. SELECT * 
FROM Customers 
WHERE customer_id NOT IN (1, 4, 6) AND join_date > '2025-02-28';


SQL JOIN Operations Activity
1. SELECT p.patient_name, a.doctor_name FROM Appointments a INNER JOIN Patients p ON a.patient_id = p.patient_id;

2. SELECT p.patient_name, a.* FROM Patients p INNER JOIN Appointments a ON p.patient_id = a.patient_id WHERE p.city = 'Cebu';

3. SELECT p.patient_name, a.doctor_name FROM Patients p INNER JOIN Appointments a p ON p.patient_id = a	.patient_id WHERE a.doctor_name = 'Dr. Garcia';

4. SELECT p.patient_name, a.* FROM Patients p LEFT JOIN Appointments a ON p.patient_id = a.patient_id;

5. SELECT p.patient_name, a.* FROM Appointments a RIGHT JOIN Patients p ON a.patient_id = p.patient_id;

