-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 16, 2024 at 06:23 AM
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
-- Database: `sad_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `admin_ID` int(16) NOT NULL,
  `admin_FirstName` char(32) NOT NULL,
  `admin_LastName` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`admin_ID`, `admin_FirstName`, `admin_LastName`) VALUES
(1001, 'Mariano', 'Fernandez'),
(1002, 'Natalie', 'Fernandez'),
(2001, 'James', 'Tan'),
(2002, 'Ijed', 'Yanez');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_customer`
--

CREATE TABLE `tbl_customer` (
  `customer_ID` int(16) NOT NULL,
  `customer_FirstName` char(32) NOT NULL,
  `customer_LastName` char(32) DEFAULT NULL,
  `customer_ContactNum` varchar(12) DEFAULT 'blank',
  `customer_ActiveStatus` char(16) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_customer`
--

INSERT INTO `tbl_customer` (`customer_ID`, `customer_FirstName`, `customer_LastName`, `customer_ContactNum`, `customer_ActiveStatus`) VALUES
(3001, 'Sophia', 'Nguyen', '639700291121', 'active'),
(3002, 'Alexander', 'Martinez', '639207002113', 'active'),
(3003, 'Emily', 'Johnson', '639882117855', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `employee_ID` int(16) NOT NULL,
  `admin_ID` int(16) DEFAULT NULL,
  `employee_FirstName` char(32) NOT NULL,
  `employee_LastName` char(32) NOT NULL,
  `employee_ContactNum` varchar(12) NOT NULL DEFAULT '639162503855'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_employee`
--

INSERT INTO `tbl_employee` (`employee_ID`, `admin_ID`, `employee_FirstName`, `employee_LastName`, `employee_ContactNum`) VALUES
(1001, 1001, 'Mariano', 'Fernandez', '639162503855'),
(1002, 1002, 'Natalie', 'Fernandez', '639162503855'),
(1003, 2001, 'Ryan', 'Manuel', '639162503855'),
(1004, 2001, 'Kenneth', 'Ismael', '639162503855'),
(1005, 2001, 'Bianca', 'Fernandez', '639162503855'),
(1006, 2001, 'Romy', 'Masunag', '639162503855'),
(1007, 2001, 'Raymary', 'Magsayo', '639162503855'),
(1008, 2001, 'Helen', 'Mones', '639162503855'),
(1009, 2001, 'Romelyn', 'Daya', '639162503855'),
(1010, 2001, 'Cristina', 'Simeon', '639162503855'),
(2001, 2001, 'James', 'Tan', '639162503855'),
(2002, 2002, 'Ijed', 'Yanez', '639162503855');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE `tbl_item` (
  `product_ID` int(11) NOT NULL,
  `transaction_ID` int(16) NOT NULL,
  `product_Quantity` int(11) NOT NULL,
  `item_Price` double NOT NULL,
  `item_SubTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`product_ID`, `transaction_ID`, `product_Quantity`, `item_Price`, `item_SubTotal`) VALUES
(7013, 7013, 600, 15, 9000),
(7013, 7018, 12, 15, 180),
(7013, 7019, 1, 15, 15),
(7013, 7020, 1, 15, 15),
(7013, 7021, 1, 15, 15),
(7013, 7022, 1, 15, 15),
(7013, 7023, 2, 15, 30),
(7017, 7015, 10, 0.71, 7.1),
(7019, 7009, 10, 0.68, 6.800000000000001),
(7022, 7014, 12, 1.42, 17.04),
(7023, 7010, 10, 1.47, 14.7),
(7024, 7007, 20, 2.1, 42),
(7024, 7010, 10, 2.1, 21),
(7024, 7024, 5, 2.1, 10.5),
(7025, 7014, 14, 0.36, 5.04),
(7027, 7014, 12, 0.5, 6),
(7028, 7024, 12, 0.59, 7.08),
(7036, 7001, 50, 2.15, 107.5),
(7036, 7024, 12, 2.15, 25.799999999999997),
(7044, 7007, 30, 15, 450),
(7047, 7007, 12, 53, 636),
(7051, 7008, 10, 0.45, 4.5),
(7051, 7011, 20, 0.45, 9),
(7053, 7011, 50, 0.8, 40),
(7056, 7008, 29, 5.15, 149.35000000000002),
(7100, 7012, 40, 0.5, 20),
(7340, 7014, 60, 100.8, 6048);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE `tbl_login` (
  `login_ID` int(16) NOT NULL,
  `login_Username` char(32) NOT NULL,
  `login_Password` char(32) NOT NULL,
  `login_AccessLevel` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`login_ID`, `login_Username`, `login_Password`, `login_AccessLevel`) VALUES
(1001, 'mfernandez', 'password', 'owner'),
(1002, 'nfernandez', 'password', 'manager'),
(1003, 'rmanuel', 'password', 'salesperson'),
(1004, 'kismael', 'password', 'salesperson'),
(1005, 'bfernandez', 'password', 'cashier'),
(1006, 'rmasunag', 'password', 'laborer'),
(1007, 'rmagsayo', 'password', 'laborer'),
(1008, 'hmones', 'password', 'salesofficer'),
(1009, 'rdaya', 'password', 'salesofficer'),
(1010, 'csimeon', 'password', 'salesofficer'),
(2001, 'jtan', 'pass', 'admin'),
(2002, 'iyanez', 'password2', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product`
--

CREATE TABLE `tbl_product` (
  `product_ID` int(11) NOT NULL,
  `type_ID` int(11) NOT NULL,
  `size_ID` int(11) NOT NULL,
  `last_Supplied_BY` int(11) DEFAULT 201,
  `product_Name` varchar(255) NOT NULL,
  `product_Price` double NOT NULL,
  `product_StockLeft` int(32) DEFAULT 100,
  `product_LastStocked` datetime DEFAULT current_timestamp(),
  `product_SupplierStatus` char(32) DEFAULT 'none',
  `product_ActiveStatus` char(32) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_product`
--

INSERT INTO `tbl_product` (`product_ID`, `type_ID`, `size_ID`, `last_Supplied_BY`, `product_Name`, `product_Price`, `product_StockLeft`, `product_LastStocked`, `product_SupplierStatus`, `product_ActiveStatus`) VALUES
(7013, 11, 178, 201, 'Gypsum Wood 6 x 20', 15, 9034, '2024-06-03 19:55:39', 'none', 'active'),
(7014, 11, 179, 201, 'Gypsum Wood 6 x 25', 0.35, 0, '2024-06-11 13:55:34', 'pending', 'active'),
(7015, 11, 180, 201, 'Gypsum Wood 6 x 32', 0.42, 0, '2024-05-29 13:16:35', 'pending', 'active'),
(7016, 11, 181, 201, 'Gypsum Wood 6 x 38', 0.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7017, 11, 182, 201, 'Gypsum Wood 6 x 50', 0.71, 90, '2024-05-29 13:16:35', 'none', 'active'),
(7018, 11, 211, 201, 'Gypsum Wood 8 x 25', 0.58, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7019, 11, 212, 201, 'Gypsum Wood 8 x 32', 0.68, 89, '2024-05-29 13:16:35', 'none', 'active'),
(7020, 11, 213, 201, 'Gypsum Wood 8 x 38', 0.79, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7021, 11, 213, 201, 'Gypsum Wood 8 x 50', 1.26, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7022, 11, 214, 201, 'Gypsum Wood 8 x 65', 1.42, 88, '2024-05-29 13:16:35', 'none', 'active'),
(7023, 11, 215, 201, 'Gypsum Wood 8 x 75', 1.47, 90, '2024-05-29 13:16:35', 'none', 'active'),
(7024, 11, 209, 201, 'Gypsum Wood 8 x 100', 2.1, 65, '2024-05-29 13:16:35', 'none', 'active'),
(7025, 12, 178, 201, 'Gypsum Steel 6 x 20 mm', 0.36, 86, '2024-05-29 13:16:35', 'none', 'active'),
(7026, 12, 179, 201, 'Gypsum Steel 6 x 25 mm', 0.42, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7027, 12, 180, 201, 'Gypsum Steel 6 x 32 mm', 0.5, 88, '2024-06-14 15:46:39', 'none', 'active'),
(7028, 12, 181, 201, 'Gypsum Steel 6 x 38 mm', 0.59, 88, '2024-05-29 13:16:35', 'none', 'active'),
(7029, 12, 182, 201, 'Gypsum Steel 6 x 50 mm', 0.76, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7030, 12, 210, 201, 'Gypsum Steel 8 x 25 mm', 0.74, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7031, 12, 211, 201, 'Gypsum Steel 8 x 32 mm', 0.84, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7032, 12, 212, 201, 'Gypsum Steel 8 x 38 mm', 0.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7033, 12, 213, 201, 'Gypsum Steel 8 x 50 mm', 1.42, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7034, 12, 214, 201, 'Gypsum Steel 8 x 65 mm', 1.58, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7035, 12, 215, 201, 'Gypsum Steel 8 x 75 mm', 1.63, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7036, 12, 209, 201, 'Gypsum Steel 8 x 100 mm', 2.15, 38, '2024-05-29 13:16:35', 'none', 'active'),
(7037, 13, 42, 201, 'Expansion Shield 1/4 x 25 mm', 10, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7038, 13, 141, 201, 'Expansion Shield 5/16 x 30 mm', 12.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7039, 13, 118, 201, 'Expansion Shield 3/8 x 45 mm', 16, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7040, 13, 29, 201, 'Expansion Shield 1/2 x 50 mm', 24, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7041, 13, 174, 201, 'Expansion Shield 5/8 x 50 mm', 44.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7042, 13, 97, 201, 'Expansion Shield 3/4 x 50 mm', 72.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7043, 13, 51, 201, 'Expansion Shield 1/4 x 40 mm', 12.5, 90, '2024-05-29 13:16:35', 'none', 'active'),
(7044, 13, 145, 201, 'Expansion Shield 5/16 x 45 mm', 15, 50, '2024-05-29 13:16:35', 'none', 'active'),
(7045, 13, 123, 201, 'Expansion Shield 3/8 x 60 mm', 24, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7046, 13, 31, 201, 'Expansion Shield 1/2 x 75 mm', 33, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7047, 13, 176, 201, 'Expansion Shield 5/8 x 85 mm', 53, 85, '2024-05-29 13:16:35', 'none', 'active'),
(7048, 13, 99, 201, 'Expansion Shield 3/4 x 85 mm', 109, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7049, 14, 86, 201, 'BH Nut 3 mm', 0.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7050, 14, 124, 201, 'BH Nut 4 mm', 0.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7051, 14, 125, 201, 'BH Nut 5 mm', 0.45, 80, '2024-05-29 13:16:35', 'none', 'active'),
(7052, 14, 177, 201, 'BH Nut 6 mm', 0.5, 81, '2024-05-29 13:16:35', 'none', 'active'),
(7053, 14, 208, 201, 'BH Nut 8 mm', 0.8, 50, '2024-05-29 13:16:35', 'none', 'active'),
(7054, 14, 66, 201, 'BH Nut 10 mm', 1.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7055, 14, 67, 201, 'BH Nut 12 mm', 2.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7056, 14, 80, 201, 'BH Nut 14 mm', 5.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7057, 14, 81, 201, 'BH Nut 16 mm', 6.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7058, 16, 70, 201, 'Tek Screw Wood 12 x 20 mm', 1.12, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7059, 16, 71, 201, 'Tek Screw Wood 12 x 25 mm', 1.16, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7060, 16, 72, 201, 'Tek Screw Wood 12 x 35 mm', 1.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7061, 16, 75, 201, 'Tek Screw Wood 12 x 50 mm', 1.43, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7062, 16, 77, 201, 'Tek Screw Wood 12 x 65 mm', 1.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7063, 16, 78, 201, 'Tek Screw Wood 12 x 80 mm', 2.69, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7064, 16, 79, 201, 'Tek Screw Wood 12 x 90 mm', 5.38, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7065, 16, 68, 201, 'Tek Screw Wood 12 x 100 mm', 6.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7066, 16, 69, 201, 'Tek Screw Wood 12 x 125 mm', 8.29, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7067, 17, 70, 201, 'Tek Screw Metal 12 x 20 mm', 1.12, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7068, 17, 71, 201, 'Tek Screw Metal 12 x 25 mm', 1.16, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7069, 17, 73, 201, 'Tek Screw Metal 12 x 40 mm', 1.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7070, 17, 74, 201, 'Tek Screw Metal 12 x 45 mm', 1.34, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7071, 17, 75, 201, 'Tek Screw Metal 12 x 50 mm', 1.43, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7072, 17, 76, 201, 'Tek Screw Metal 12 x 55 mm', 1.52, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7073, 17, 77, 201, 'Tek Screw Metal 12 x 65 mm', 1.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7074, 17, 31, 201, 'Tek Screw Metal 12 x 75 mm', 2.69, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7075, 17, 79, 201, 'Tek Screw Metal 12 x 90 mm', 5.38, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7076, 17, 68, 201, 'Tek Screw Metal 12 x 100 mm', 6.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7077, 17, 69, 201, 'Tek Screw Metal 12 x 125 mm', 8.29, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7078, 17, 232, 201, 'Tek Screw Metal 12 x 150 mm', 19.04, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7079, 18, 86, 201, 'LW Nut 3 mm', 0.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7080, 18, 124, 201, 'LW Nut 4 mm', 0.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7081, 18, 125, 201, 'LW Nut 5 mm', 0.25, 60, '2024-05-29 13:16:35', 'none', 'active'),
(7082, 18, 177, 201, 'LW Nut 6 mm', 0.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7083, 18, 208, 201, 'LW Nut 8 mm', 0.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7084, 18, 66, 201, 'LW Nut 10 mm', 0.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7085, 18, 67, 201, 'LW Nut 12 mm', 1.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7086, 18, 80, 201, 'LW Nut 14 mm', 1.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7087, 18, 81, 201, 'LW Nut 16 mm', 2.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7088, 18, 82, 201, 'LW Nut 18 mm', 3.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7089, 18, 83, 201, 'LW Nut 20 mm', 3.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7090, 18, 84, 201, 'LW Nut 22 mm', 5.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7091, 18, 85, 201, 'LW Nut 24 mm', 7.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7092, 18, 32, 201, 'LW Nut 1/4 inch', 0.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7093, 18, 126, 201, 'LW Nut 5/16 inch', 0.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7094, 18, 100, 201, 'LW Nut 3/8 inch', 0.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7095, 18, 188, 201, 'LW Nut 7/16 inch', 0.71, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7096, 18, 233, 201, 'LW Nut 1/2 inch', 1.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7097, 18, 216, 201, 'LW Nut 9/16 inch', 1.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7098, 18, 159, 201, 'LW Nut 5/8 inch', 1.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7099, 18, 96, 201, 'LW Nut 3/4 inch', 3.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7100, 19, 177, 201, 'HT Nut 6 mm', 0.5, 60, '2024-05-29 13:16:35', 'none', 'active'),
(7101, 19, 208, 201, 'HT Nut 8 mm', 0.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7102, 19, 66, 201, 'HT Nut 10 mm', 1.95, 93, '2024-05-29 13:16:35', 'none', 'active'),
(7103, 19, 67, 201, 'HT Nut 12 mm', 2.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7104, 19, 80, 201, 'HT Nut 14 mm', 4.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7105, 19, 81, 201, 'HT Nut 16 mm', 5.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7106, 19, 82, 201, 'HT Nut 18 mm', 8.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7107, 19, 83, 201, 'HT Nut 20 mm', 10.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7108, 19, 84, 201, 'HT Nut 22 mm', 12.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7109, 19, 32, 201, 'HT Nut 1/4 inch', 0.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7110, 19, 126, 201, 'HT Nut 5/16 inch', 0.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7111, 19, 100, 201, 'HT Nut 3/8 inch', 1.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7112, 19, 18, 201, 'HT Nut 1/2 x 2 1/4 inch', 2.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7113, 19, 233, 201, 'HT Nut 1/2 inch', 3.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7114, 19, 216, 201, 'HT Nut 9/16 inch', 5.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7115, 19, 159, 201, 'HT Nut 5/8 inch', 5.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7116, 19, 96, 201, 'HT Nut 3/4 inch', 9.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7117, 19, 206, 201, 'HT Nut 7/8 inch', 16.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7118, 19, 11, 201, 'HT Nut 1 inch', 23.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7119, 20, 187, 201, 'Hardiflex Screw 7 x 3/4 inch', 0.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7120, 20, 185, 201, 'Hardiflex Screw 7 x 1/4 inch', 0.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7121, 20, 184, 201, 'Hardiflex Screw 7 x 1 1/4 inch', 0.74, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7122, 20, 183, 201, 'Hardiflex Screw 7 x 1 1/2 inch', 0.84, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7123, 20, 186, 201, 'Hardiflex Screw 7 x 2 inch', 1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7124, 21, 32, 201, 'Grip Anchor 1/4 inch', 6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7125, 21, 126, 201, 'Grip Anchor 5/16 inch', 7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7126, 21, 100, 201, 'Grip Anchor 3/8 inch', 8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7127, 21, 233, 201, 'Grip Anchor 1/2 inch', 15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7128, 21, 159, 201, 'Grip Anchor 5/8 inch', 39, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7129, 22, 59, 201, 'Blind Rivet 1/8 x 3/16 inch', 204, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7130, 22, 58, 201, 'Blind Rivet 1/8 x 1/4 inch', 216, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7131, 22, 62, 201, 'Blind Rivet 1/8 x 5/16 inch', 222, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7132, 22, 61, 201, 'Blind Rivet 1/8 x 3/8 inch', 228, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7133, 22, 64, 201, 'Blind Rivet 1/8 x 7/16 inch', 258, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7134, 22, 57, 201, 'Blind Rivet 1/8 x 1/2 inch', 263, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7135, 22, 65, 201, 'Blind Rivet 1/8 x 9/16 inch', 280, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7136, 22, 63, 201, 'Blind Rivet 1/8 x 5/8 inch', 306, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7137, 22, 60, 201, 'Blind Rivet 1/8 x 3/4 inch', 360, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7138, 22, 56, 201, 'Blind Rivet 1/8 x 1 inch', 538, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7139, 22, 152, 201, 'Blind Rivet 5/32 x 1/4 inch', 240, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7140, 22, 155, 201, 'Blind Rivet 5/32 x 5/16 inch', 257, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7141, 22, 154, 201, 'Blind Rivet 5/32 x 3/8 inch', 281, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7142, 22, 157, 201, 'Blind Rivet 5/32 x 7/16 inch', 293, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7143, 22, 151, 201, 'Blind Rivet 5/32 x 1/2 inch', 311, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7144, 22, 158, 201, 'Blind Rivet 5/32 x 9/16 inch', 329, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7145, 22, 156, 201, 'Blind Rivet 5/32 x 5/8 inch', 377, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7146, 22, 153, 201, 'Blind Rivet 5/32 x 3/4 inch', 209, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7147, 22, 150, 201, 'Blind Rivet 5/32 x 1 inch', 259, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7148, 22, 89, 201, 'Blind Rivet 3/16 x 1/4 inch', 180, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7149, 22, 92, 201, 'Blind Rivet 3/16 x 5/16 inch', 182, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7150, 22, 91, 201, 'Blind Rivet 3/16 x 3/8 inch', 186, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7151, 22, 94, 201, 'Blind Rivet 3/16 x 7/16 inch', 200, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7152, 22, 88, 201, 'Blind Rivet 3/16 x 1/2 inch', 210, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7153, 22, 95, 201, 'Blind Rivet 3/16 x 9/16 inch', 215, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7154, 22, 93, 201, 'Blind Rivet 3/16 x 5/8 inch', 240, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7155, 22, 90, 201, 'Blind Rivet 3/16 x 3/4 inch', 281, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7156, 22, 87, 201, 'Blind Rivet 3/16 x 1 inch', 360, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7157, 23, 32, 201, 'Dyna Bolt 1/4 inch', 8.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7158, 23, 126, 201, 'Dyna Bolt 5/16 inch', 10.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7159, 23, 100, 201, 'Dyna Bolt 3/8 inch', 14, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7160, 23, 233, 201, 'Dyna Bolt 1/2 inch', 27.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7161, 23, 171, 201, 'Dyna Bolt 5/8 x 4 inch', 61, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7162, 23, 173, 201, 'Dyna Bolt 5/8 x 5 inch', 73.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7163, 23, 98, 201, 'Dyna Bolt 3/4 x 6 inch', 136.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7164, 24, 32, 201, 'ORD Nut 1/4 inch', 0.36, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7165, 24, 126, 201, 'ORD Nut 5/16 inch', 0.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7166, 24, 100, 201, 'ORD Nut 3/8 inch', 0.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7167, 24, 188, 201, 'ORD Nut 7/16 inch', 1.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7168, 24, 233, 201, 'ORD Nut 1/2 inch', 2.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7169, 24, 216, 201, 'ORD Nut 9/16 inch', 3.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7170, 24, 159, 201, 'ORD Nut 5/8 inch', 3.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7171, 24, 96, 201, 'ORD Nut 3/4 inch', 6.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7172, 24, 206, 201, 'ORD Nut 7/8 inch', 16.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7173, 24, 11, 201, 'ORD Nut 1 inch', 23.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7174, 15, 37, 201, 'HT Standard 1/4 x 1/2 inch', 1.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7175, 15, 54, 201, 'HT Standard 1/4 x 5/8 inch', 1.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7176, 15, 47, 201, 'HT Standard 1/4 x 3/4 inch', 1.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7177, 15, 36, 201, 'HT Standard 1/4 x 1 inch', 1.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7178, 15, 34, 201, 'HT Standard 1/4 x 1 1/4 inch', 1.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7179, 15, 33, 201, 'HT Standard 1/4 x 1 1/2 inch', 2.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7180, 15, 234, 201, 'HT Standard 1/4 x 1 5/8 inch', 2.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7181, 15, 35, 201, 'HT Standard 1/4 x 1 3/4 inch', 2.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7182, 15, 41, 201, 'HT Standard 1/4 x 2 inch', 2.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7183, 15, 39, 201, 'HT Standard 1/4 x 2 1/4 inch', 3.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7184, 15, 38, 201, 'HT Standard 1/4 x 2 1/2 inch', 3.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7185, 15, 40, 201, 'HT Standard 1/4 x 2 3/4 inch', 3.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7186, 15, 46, 201, 'HT Standard 1/4 x 3 inch', 4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7187, 15, 44, 201, 'HT Standard 1/4 x 3 1/4 inch', 5.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7188, 15, 43, 201, 'HT Standard 1/4 x 3 1/2 inch', 5.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7189, 15, 45, 201, 'HT Standard 1/4 x 3 3/4 inch', 7.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7190, 15, 50, 201, 'HT Standard 1/4 x 4 inch', 8.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7191, 15, 48, 201, 'HT Standard 1/4 x 4 1/2 inch', 9.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7192, 15, 53, 201, 'HT Standard 1/4 x 5 inch', 11.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7193, 15, 52, 201, 'HT Standard 1/4 x 5 1/2 inch', 13.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7194, 15, 55, 201, 'HT Standard 1/4 x 6 inch', 15.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7195, 15, 131, 201, 'HT Standard 5/16 x 1/2 inch', 1.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7196, 15, 148, 201, 'HT Standard 5/16 x 5/8 inch', 2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7197, 15, 140, 201, 'HT Standard 5/16 x 3/4 inch', 2.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7198, 15, 130, 201, 'HT Standard 5/16 x 1 inch', 2.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7199, 15, 128, 201, 'HT Standard 5/16 x 1 1/4 inch', 2.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7200, 15, 127, 201, 'HT Standard 5/16 x 1 1/2 inch', 3.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7201, 15, 129, 201, 'HT Standard 5/16 x 1 3/4 inch', 4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7202, 15, 135, 201, 'HT Standard 5/16 x 2 inch', 4.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7203, 15, 133, 201, 'HT Standard 5/16 x 2 1/4 inch', 5.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7204, 15, 132, 201, 'HT Standard 5/16 x 2 1/2 inch', 5.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7205, 15, 134, 201, 'HT Standard 5/16 x 2 3/4 inch', 6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7206, 15, 139, 201, 'HT Standard 5/16 x 3 inch', 6.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7207, 15, 137, 201, 'HT Standard 5/16 x 3 1/4 inch', 8.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7208, 15, 136, 201, 'HT Standard 5/16 x 3 1/2 inch', 8.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7209, 15, 138, 201, 'HT Standard 5/16 x 3 3/4 inch', 11, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7210, 15, 144, 201, 'HT Standard 5/16 x 4 inch', 11.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7211, 15, 142, 201, 'HT Standard 5/16 x 4 1/2 inch', 14.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7212, 15, 147, 201, 'HT Standard 5/16 x 5 inch', 17.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7213, 15, 146, 201, 'HT Standard 5/16 x 5 1/2 inch', 19.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7214, 15, 149, 201, 'HT Standard 5/16 x 6 inch', 22.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7215, 15, 105, 201, 'HT Standard 3/8 x 1/2 inch', 2.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7216, 15, 121, 201, 'HT Standard 3/8 x 5/8 inch', 2.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7217, 15, 114, 201, 'HT Standard 3/8 x 3/4 inch', 2.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7218, 15, 104, 201, 'HT Standard 3/8 x 1 inch', 3.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7219, 15, 102, 201, 'HT Standard 3/8 x 1 1/4 inch', 4.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7220, 15, 101, 201, 'HT Standard 3/8 x 1 1/2 inch', 4.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7221, 15, 103, 201, 'HT Standard 3/8 x 1 3/4 inch', 5.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7222, 15, 109, 201, 'HT Standard 3/8 x 2 inch', 6.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7223, 15, 107, 201, 'HT Standard 3/8 x 2 1/4 inch', 7.24, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7224, 15, 106, 201, 'HT Standard 3/8 x 2 1/2 inch', 7.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7225, 15, 108, 201, 'HT Standard 3/8 x 2 3/4 inch', 8.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7226, 15, 113, 201, 'HT Standard 3/8 x 3 inch', 8.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7227, 15, 111, 201, 'HT Standard 3/8 x 3 1/4 inch', 10.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7228, 15, 110, 201, 'HT Standard 3/8 x 3 1/2 inch', 10.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7229, 15, 117, 201, 'HT Standard 3/8 x 4 inch', 11.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7230, 15, 115, 201, 'HT Standard 3/8 x 4 1/2 inch', 14.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7231, 15, 120, 201, 'HT Standard 3/8 x 5 inch', 14.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7232, 15, 119, 201, 'HT Standard 3/8 x 5 1/2 inch', 16.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7233, 15, 122, 201, 'HT Standard 3/8 x 6 inch', 17.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7234, 15, 235, 201, 'HT Standard 3/8 x 6 1/2 inch', 47.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7235, 15, 236, 201, 'HT Standard 3/8 x 7 inch', 49.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7236, 15, 237, 201, 'HT Standard 3/8 x 7 1/2 inch', 52.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7237, 15, 238, 201, 'HT Standard 3/8 x 8 inch', 55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7238, 15, 200, 201, 'HT Standard 7/16 x 3/4 inch', 5.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7239, 15, 192, 201, 'HT Standard 7/16 x 1 inch', 5.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7240, 15, 190, 201, 'HT Standard 7/16 x 1 1/4 inch', 6.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7241, 15, 189, 201, 'HT Standard 7/16 x 1 1/2 inch', 7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7242, 15, 191, 201, 'HT Standard 7/16 x 1 3/4 inch', 8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7243, 15, 196, 201, 'HT Standard 7/16 x 2 inch', 8.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7244, 15, 194, 201, 'HT Standard 7/16 x 2 1/4 inch', 10.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7245, 15, 193, 201, 'HT Standard 7/16 x 2 1/2 inch', 10.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7246, 15, 195, 201, 'HT Standard 7/16 x 2 3/4 inch', 12.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7247, 15, 199, 201, 'HT Standard 7/16 x 3 inch', 12.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7248, 15, 198, 201, 'HT Standard 7/16 x 3 1/4 inch', 17, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7249, 15, 197, 201, 'HT Standard 7/16 x 3 1/2 inch', 17, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7250, 15, 202, 201, 'HT Standard 7/16 x 4 inch', 18.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7251, 15, 201, 201, 'HT Standard 7/16 x 4 1/2 inch', 23.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7252, 15, 204, 201, 'HT Standard 7/16 x 5 inch', 25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7253, 15, 203, 201, 'HT Standard 7/16 x 5 1/2 inch', 29.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7254, 15, 205, 201, 'HT Standard 7/16 x 6 inch', 33.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7255, 15, 239, 201, 'HT Standard 7/16 x 6 1/2 inch', 48.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7256, 15, 240, 201, 'HT Standard 7/16 x 7 inch', 51.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7257, 15, 241, 201, 'HT Standard 7/16 x 7 1/2 inch', 53.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7258, 15, 242, 201, 'HT Standard 7/16 x 8 inch', 56.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7259, 15, 24, 201, 'HT Standard 1/2 x 3/4 inch', 6.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7260, 15, 16, 201, 'HT Standard 1/2 x 1 inch', 6.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7261, 15, 14, 201, 'HT Standard 1/2 x 1 1/4 inch', 7.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7262, 15, 13, 201, 'HT Standard 1/2 x 1 1/2 inch', 8.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7263, 15, 15, 201, 'HT Standard 1/2 x 1 3/4 inch', 10.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7264, 15, 20, 201, 'HT Standard 1/2 x 2 inch', 11.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7265, 15, 18, 201, 'HT Standard 1/2 x 2 1/4 inch', 12.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7266, 15, 17, 201, 'HT Standard 1/2 x 2 1/2 inch', 13.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7267, 15, 19, 201, 'HT Standard 1/2 x 2 3/4 inch', 15.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7268, 15, 23, 201, 'HT Standard 1/2 x 3 inch', 15.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7269, 15, 243, 201, 'HT Standard 1/2 x 3 1/4 inch', 18.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7270, 15, 21, 201, 'HT Standard 1/2 x 3 1/2 inch', 18.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7271, 15, 22, 201, 'HT Standard 1/2 x 3 3/4 inch', 20.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7272, 15, 26, 201, 'HT Standard 1/2 x 4 inch', 20.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7273, 15, 25, 201, 'HT Standard 1/2 x 4 1/2 inch', 28.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7274, 15, 28, 201, 'HT Standard 1/2 x 5 inch', 29.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7275, 15, 27, 201, 'HT Standard 1/2 x 5 1/2 inch', 33, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7276, 15, 30, 201, 'HT Standard 1/2 x 6 inch', 33.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7277, 15, 244, 201, 'HT Standard 1/2 x 6 1/2 inch', 50, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7278, 15, 245, 201, 'HT Standard 1/2 x 7 inch', 51.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7279, 15, 246, 201, 'HT Standard 1/2 x 7 1/2 inch', 53.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7280, 15, 247, 201, 'HT Standard 1/2 x 8 inch', 55.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7281, 15, 220, 201, 'HT Standard 9/16 x 1 inch', 11, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7282, 15, 218, 201, 'HT Standard 9/16 x 1 1/4 inch', 11.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7283, 15, 217, 201, 'HT Standard 9/16 x 1 1/2 inch', 12.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7284, 15, 219, 201, 'HT Standard 9/16 x 1 3/4 inch', 14.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7285, 15, 224, 201, 'HT Standard 9/16 x 2 inch', 15.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7286, 15, 222, 201, 'HT Standard 9/16 x 2 1/4 inch', 18.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7287, 15, 221, 201, 'HT Standard 9/16 x 2 1/2 inch', 18.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7288, 15, 223, 201, 'HT Standard 9/16 x 2 3/4 inch', 21.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7289, 15, 226, 201, 'HT Standard 9/16 x 3 inch', 22, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7290, 15, 248, 201, 'HT Standard 9/16 x 3 1/4 inch', 32.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7291, 15, 225, 201, 'HT Standard 9/16 x 3 1/2 inch', 32.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7292, 15, 249, 201, 'HT Standard 9/16 x 3 3/4 inch', 35.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7293, 15, 228, 201, 'HT Standard 9/16 x 4 inch', 37.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7294, 15, 227, 201, 'HT Standard 9/16 x 4 1/2 inch', 41.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7295, 15, 230, 201, 'HT Standard 9/16 x 5 inch', 45.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7296, 15, 229, 201, 'HT Standard 9/16 x 5 1/2 inch', 49.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7297, 15, 231, 201, 'HT Standard 9/16 x 6 inch', 52.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7298, 15, 250, 201, 'HT Standard 9/16 x 6 1/2 inch', 68.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7299, 15, 251, 201, 'HT Standard 9/16 x 7 inch', 70.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7300, 15, 252, 201, 'HT Standard 9/16 x 7 1/2 inch', 73.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7301, 15, 253, 201, 'HT Standard 9/16 x 8 inch', 77.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7302, 15, 163, 201, 'HT Standard 5/8 x 1 inch', 13.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7303, 15, 161, 201, 'HT Standard 5/8 x 1 1/4 inch', 13.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7304, 15, 160, 201, 'HT Standard 5/8 x 1 1/2 inch', 15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7305, 15, 162, 201, 'HT Standard 5/8 x 1 3/4 inch', 16.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7306, 15, 167, 201, 'HT Standard 5/8 x 2 inch', 18.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7307, 15, 165, 201, 'HT Standard 5/8 x 2 1/4 inch', 20.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7308, 15, 164, 201, 'HT Standard 5/8 x 2 1/2 inch', 21.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7309, 15, 166, 201, 'HT Standard 5/8 x 2 3/4 inch', 24.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7310, 15, 169, 201, 'HT Standard 5/8 x 3 inch', 25.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7311, 15, 254, 201, 'HT Standard 5/8 x 3 1/4 inch', 30.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7312, 15, 168, 201, 'HT Standard 5/8 x 3 1/2 inch', 31.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7313, 15, 255, 201, 'HT Standard 5/8 x 3 3/4 inch', 33.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7314, 15, 171, 201, 'HT Standard 5/8 x 4 inch', 36.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7315, 15, 170, 201, 'HT Standard 5/8 x 4 1/2 inch', 39.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7316, 15, 173, 201, 'HT Standard 5/8 x 5 inch', 42.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7317, 15, 172, 201, 'HT Standard 5/8 x 5 1/2 inch', 47.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7318, 15, 175, 201, 'HT Standard 5/8 x 6 inch', 48.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7319, 15, 256, 201, 'HT Standard 5/8 x 6 1/2 inch', 69.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7320, 15, 257, 201, 'HT Standard 5/8 x 7 inch', 72, 95, '2024-05-29 13:16:35', 'none', 'active'),
(7321, 15, 258, 201, 'HT Standard 5/8 x 7 1/2 inch', 75.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7322, 15, 259, 201, 'HT Standard 5/8 x 8 inch', 78.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7323, 15, 260, 201, 'HT Standard 3/4 x 1 inch', 24.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7324, 15, 261, 201, 'HT Standard 3/4 x 1 1/4 inch', 24.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7325, 15, 262, 201, 'HT Standard 3/4 x 1 1/2 inch', 25.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7326, 15, 263, 201, 'HT Standard 3/4 x 1 3/4 inch', 28.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7327, 15, 264, 201, 'HT Standard 3/4 x 2 inch', 29.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7328, 15, 265, 201, 'HT Standard 3/4 x 2 1/4 inch', 34.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7329, 15, 266, 201, 'HT Standard 3/4 x 2 1/2 inch', 34.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7330, 15, 267, 201, 'HT Standard 3/4 x 2 3/4 inch', 39, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7331, 15, 268, 201, 'HT Standard 3/4 x 3 inch', 39.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7332, 15, 269, 201, 'HT Standard 3/4 x 3 1/4 inch', 48.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7333, 15, 270, 201, 'HT Standard 3/4 x 3 1/2 inch', 48.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7334, 15, 271, 201, 'HT Standard 3/4 x 3 3/4 inch', 50.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7335, 15, 272, 201, 'HT Standard 3/4 x 4 inch', 50.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7336, 15, 273, 201, 'HT Standard 3/4 x 4 1/2 inch', 59.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7337, 15, 274, 201, 'HT Standard 3/4 x 5 inch', 64.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7338, 15, 275, 201, 'HT Standard 3/4 x 5 1/2 inch', 77, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7339, 15, 98, 201, 'HT Standard 3/4 x 6 inch', 77.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7340, 15, 276, 201, 'HT Standard 3/4 x 6 1/2 inch', 100.8, 40, '2024-05-29 13:16:35', 'none', 'active'),
(7341, 15, 277, 201, 'HT Standard 3/4 x 7 inch', 103.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7342, 15, 278, 201, 'HT Standard 3/4 x 7 1/2 inch', 112.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7343, 15, 279, 201, 'HT Standard 3/4 x 8 inch', 130.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7344, 15, 280, 201, 'HT Standard 7/8 x 1 1/2 inch', 42, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7345, 15, 281, 201, 'HT Standard 7/8 x 1 3/4 inch', 42.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7346, 15, 282, 201, 'HT Standard 7/8 x 2 inch', 42.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7347, 15, 283, 201, 'HT Standard 7/8 x 2 1/4 inch', 48.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7348, 15, 284, 201, 'HT Standard 7/8 x 2 1/2 inch', 48.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7349, 15, 285, 201, 'HT Standard 7/8 x 2 3/4 inch', 56, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7350, 15, 286, 201, 'HT Standard 7/8 x 3 inch', 56.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7351, 15, 287, 201, 'HT Standard 7/8 x 3 1/4 inch', 66, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7352, 15, 288, 201, 'HT Standard 7/8 x 3 1/2 inch', 66, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7353, 15, 289, 201, 'HT Standard 7/8 x 3 3/4 inch', 73.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7354, 15, 290, 201, 'HT Standard 7/8 x 4 inch', 73.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7355, 15, 291, 201, 'HT Standard 7/8 x 4 1/2 inch', 78.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7356, 15, 292, 201, 'HT Standard 7/8 x 5 inch', 85.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7357, 15, 293, 201, 'HT Standard 7/8 x 5 1/2 inch', 103.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7358, 15, 294, 201, 'HT Standard 7/8 x 6 inch', 105.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7359, 15, 295, 201, 'HT Standard 7/8 x 6 1/2 inch', 157, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7360, 15, 296, 201, 'HT Standard 7/8 x 7 inch', 170, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7361, 15, 297, 201, 'HT Standard 7/8 x 7 1/2 inch', 183, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7362, 15, 298, 201, 'HT Standard 7/8 x 8 inch', 196, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7363, 15, 299, 201, 'HT Standard 1 x 1 1/2 inch', 63, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7364, 15, 300, 201, 'HT Standard 1 x 2 inch', 65.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7365, 15, 301, 201, 'HT Standard 1 x 2 1/4 inch', 73, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7366, 15, 302, 201, 'HT Standard 1 x 2 1/2 inch', 74, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7367, 15, 303, 201, 'HT Standard 1 x 2 3/4 inch', 82.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7368, 15, 304, 201, 'HT Standard 1 x 3 inch', 84.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7369, 15, 305, 201, 'HT Standard 1 x 3 1/2 inch', 94, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7370, 15, 306, 201, 'HT Standard 1 x 4 inch', 102, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7371, 15, 307, 201, 'HT Standard 1 x 4 1/2 inch', 115, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7372, 15, 308, 201, 'HT Standard 1 x 5 inch', 125, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7373, 15, 309, 201, 'HT Standard 1 x 5 1/2 inch', 136, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7374, 15, 310, 201, 'HT Standard 1 x 6 inch', 146, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7375, 15, 311, 201, 'HT Standard 1 x 6 1/2 inch', 196, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7376, 15, 312, 201, 'HT Standard 1 x 7 inch', 236, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7377, 15, 313, 201, 'HT Standard 1 x 7 1/2 inch', 249, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7378, 15, 314, 201, 'HT Standard 1 x 8 inch', 262, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7379, 25, 163, 201, 'Hexagonal Capscrew 5/8 x 1 inch', 10.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7380, 25, 161, 201, 'Hexagonal Capscrew 5/8 x 1 1/4 inch', 12.8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7381, 25, 160, 201, 'Hexagonal Capscrew 5/8 x 1 1/2 inch', 12.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7382, 25, 162, 201, 'Hexagonal Capscrew 5/8 x 1 3/4 inch', 14.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7383, 25, 167, 201, 'Hexagonal Capscrew 5/8 x 2 inch', 15.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7384, 25, 165, 201, 'Hexagonal Capscrew 5/8 x 2 1/4 inch', 17.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7385, 25, 164, 201, 'Hexagonal Capscrew 5/8 x 2 1/2 inch', 18.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7386, 25, 166, 201, 'Hexagonal Capscrew 5/8 x 2 3/4 inch', 20.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7387, 25, 169, 201, 'Hexagonal Capscrew 5/8 x 3 inch', 21.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7388, 25, 168, 201, 'Hexagonal Capscrew 5/8 x 3 1/2 inch', 24.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7389, 25, 171, 201, 'Hexagonal Capscrew 5/8 x 4 inch', 27.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7390, 25, 170, 201, 'Hexagonal Capscrew 5/8 x 4 1/2 inch', 30.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7391, 25, 173, 201, 'Hexagonal Capscrew 5/8 x 5 inch', 33.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7392, 25, 172, 201, 'Hexagonal Capscrew 5/8 x 5 1/2 inch', 36.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7393, 25, 175, 201, 'Hexagonal Capscrew 5/8 x 6 inch', 40.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7394, 25, 220, 201, 'Hexagonal Capscrew 9/16 x 1 inch', 7.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7395, 25, 218, 201, 'Hexagonal Capscrew 9/16 x 1 1/4 inch', 8.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7396, 25, 217, 201, 'Hexagonal Capscrew 9/16 x 1 1/2 inch', 9.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7397, 25, 219, 201, 'Hexagonal Capscrew 9/16 x 1 3/4 inch', 11, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7398, 25, 224, 201, 'Hexagonal Capscrew 9/16 x 2 inch', 12.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7399, 25, 222, 201, 'Hexagonal Capscrew 9/16 x 2 1/4 inch', 13.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7400, 25, 221, 201, 'Hexagonal Capscrew 9/16 x 2 1/2 inch', 14.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7401, 25, 223, 201, 'Hexagonal Capscrew 9/16 x 2 3/4 inch', 15.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7402, 25, 226, 201, 'Hexagonal Capscrew 9/16 x 3 inch', 17, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7403, 25, 225, 201, 'Hexagonal Capscrew 9/16 x 3 1/2 inch', 19.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7404, 25, 228, 201, 'Hexagonal Capscrew 9/16 x 4 inch', 16.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7405, 25, 227, 201, 'Hexagonal Capscrew 9/16 x 4 1/2 inch', 24.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7406, 25, 230, 201, 'Hexagonal Capscrew 9/16 x 5 inch', 26.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7407, 25, 229, 201, 'Hexagonal Capscrew 9/16 x 5 1/2 inch', 29, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7408, 25, 231, 201, 'Hexagonal Capscrew 9/16 x 6 inch', 31.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7409, 25, 24, 201, 'Hexagonal Capscrew 1/2 x 3/4 inch', 5.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7410, 25, 16, 201, 'Hexagonal Capscrew 1/2 x 1 inch', 6.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7411, 25, 14, 201, 'Hexagonal Capscrew 1/2 x 1 1/4 inch', 7.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7412, 25, 13, 201, 'Hexagonal Capscrew 1/2 x 1 1/2 inch', 8, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7413, 25, 15, 201, 'Hexagonal Capscrew 1/2 x 1 3/4 inch', 8.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7414, 25, 20, 201, 'Hexagonal Capscrew 1/2 x 2 inch', 9.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7415, 25, 18, 201, 'Hexagonal Capscrew 1/2 x 2 1/4 inch', 10.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7416, 25, 17, 201, 'Hexagonal Capscrew 1/2 x 2 1/2 inch', 11.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7417, 25, 19, 201, 'Hexagonal Capscrew 1/2 x 2 3/4 inch', 12.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7418, 25, 23, 201, 'Hexagonal Capscrew 1/2 x 3 inch', 13.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7419, 25, 21, 201, 'Hexagonal Capscrew 1/2 x 3 1/2 inch', 15.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7420, 25, 26, 201, 'Hexagonal Capscrew 1/2 x 4 inch', 17.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7421, 25, 25, 201, 'Hexagonal Capscrew 1/2 x 4 1/2 inch', 19.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7422, 25, 28, 201, 'Hexagonal Capscrew 1/2 x 5 inch', 21.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7423, 25, 27, 201, 'Hexagonal Capscrew 1/2 x 5 1/2 inch', 23.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7424, 25, 30, 201, 'Hexagonal Capscrew 1/2 x 6 inch', 25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7425, 25, 200, 201, 'Hexagonal Capscrew 7/16 x 3/4 inch', 3.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7426, 25, 192, 201, 'Hexagonal Capscrew 7/16 x 1 inch', 4.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7427, 25, 190, 201, 'Hexagonal Capscrew 7/16 x 1 1/4 inch', 4.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7428, 25, 189, 201, 'Hexagonal Capscrew 7/16 x 1 1/2 inch', 5.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7429, 25, 191, 201, 'Hexagonal Capscrew 7/16 x 1 3/4 inch', 6.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7430, 25, 196, 201, 'Hexagonal Capscrew 7/16 x 2 inch', 6.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7431, 25, 194, 201, 'Hexagonal Capscrew 7/16 x 2 1/4 inch', 7.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7432, 25, 193, 201, 'Hexagonal Capscrew 7/16 x 2 1/2 inch', 8.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7433, 25, 195, 201, 'Hexagonal Capscrew 7/16 x 2 3/4 inch', 9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7434, 25, 199, 201, 'Hexagonal Capscrew 7/16 x 3 inch', 9.75, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7435, 25, 197, 201, 'Hexagonal Capscrew 7/16 x 3 1/2 inch', 11.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7436, 25, 202, 201, 'Hexagonal Capscrew 7/16 x 4 inch', 12.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7437, 25, 201, 201, 'Hexagonal Capscrew 7/16 x 4 1/2 inch', 14.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7438, 25, 204, 201, 'Hexagonal Capscrew 7/16 x 5 inch', 15.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7439, 25, 203, 201, 'Hexagonal Capscrew 7/16 x 5 1/2 inch', 17, 90, '2024-05-29 13:16:35', 'none', 'active'),
(7440, 25, 205, 201, 'Hexagonal Capscrew 7/16 x 6 inch', 18.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7441, 25, 105, 201, 'Hexagonal Capscrew 3/8 x 1/2 inch', 2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7442, 25, 315, 201, 'Hexagonal Capscrew 3/8 x 5/8 inch', 2.25, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7443, 25, 114, 201, 'Hexagonal Capscrew 3/8 x 3/4 inch', 2.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7444, 25, 104, 201, 'Hexagonal Capscrew 3/8 x 1 inch', 2.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7445, 25, 102, 201, 'Hexagonal Capscrew 3/8 x 1 1/4 inch', 3.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7446, 25, 101, 201, 'Hexagonal Capscrew 3/8 x 1 1/2 inch', 3.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7447, 25, 103, 201, 'Hexagonal Capscrew 3/8 x 1 3/4 inch', 4.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7448, 25, 109, 201, 'Hexagonal Capscrew 3/8 x 2 inch', 4.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7449, 25, 107, 201, 'Hexagonal Capscrew 3/8 x 2 1/4 inch', 5.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7450, 25, 106, 201, 'Hexagonal Capscrew 3/8 x 2 1/2 inch', 6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7451, 25, 108, 201, 'Hexagonal Capscrew 3/8 x 2 3/4 inch', 6.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7452, 25, 113, 201, 'Hexagonal Capscrew 3/8 x 3 inch', 7.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7453, 25, 110, 201, 'Hexagonal Capscrew 3/8 x 3 1/2 inch', 8.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7454, 25, 117, 201, 'Hexagonal Capscrew 3/8 x 4 inch', 9.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7455, 25, 115, 201, 'Hexagonal Capscrew 3/8 x 4 1/2 inch', 10.3, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7456, 25, 120, 201, 'Hexagonal Capscrew 3/8 x 5 inch', 11.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7457, 25, 119, 201, 'Hexagonal Capscrew 3/8 x 5 1/2 inch', 12.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7458, 25, 122, 201, 'Hexagonal Capscrew 3/8 x 6 inch', 13.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7459, 25, 131, 201, 'Hexagonal Capscrew 5/16 x 1/2 inch', 1.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7460, 25, 316, 201, 'Hexagonal Capscrew 5/16 x 5/8 inch', 1.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7461, 25, 140, 201, 'Hexagonal Capscrew 5/16 x 3/4 inch', 1.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7462, 25, 130, 201, 'Hexagonal Capscrew 5/16 x 1 inch', 1.95, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7463, 25, 128, 201, 'Hexagonal Capscrew 5/16 x 1 1/4 inch', 2.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7464, 25, 127, 201, 'Hexagonal Capscrew 5/16 x 1 1/2 inch', 2.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7465, 25, 129, 201, 'Hexagonal Capscrew 5/16 x 1 3/4 inch', 3.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7466, 25, 135, 201, 'Hexagonal Capscrew 5/16 x 2 inch', 3.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7467, 25, 133, 201, 'Hexagonal Capscrew 5/16 x 2 1/4 inch', 3.5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7468, 25, 132, 201, 'Hexagonal Capscrew 5/16 x 2 1/2 inch', 4.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7469, 25, 134, 201, 'Hexagonal Capscrew 5/16 x 2 3/4 inch', 4.55, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7470, 25, 139, 201, 'Hexagonal Capscrew 5/16 x 3 inch', 4.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7471, 25, 136, 201, 'Hexagonal Capscrew 5/16 x 3 1/2 inch', 5.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7472, 25, 144, 201, 'Hexagonal Capscrew 5/16 x 4 inch', 6.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7473, 25, 142, 201, 'Hexagonal Capscrew 5/16 x 4 1/2 inch', 7.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7474, 25, 147, 201, 'Hexagonal Capscrew 5/16 x 5 inch', 7.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7475, 25, 146, 201, 'Hexagonal Capscrew 5/16 x 5 1/2 inch', 8.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7476, 25, 149, 201, 'Hexagonal Capscrew 5/16 x 6 inch', 9.35, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7477, 25, 37, 201, 'Hexagonal Capscrew 1/4 x 1/2 inch', 0.82, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7478, 25, 317, 201, 'Hexagonal Capscrew 1/4 x 5/8 inch', 0.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7479, 25, 47, 201, 'Hexagonal Capscrew 1/4 x 3/4 inch', 1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7480, 25, 36, 201, 'Hexagonal Capscrew 1/4 x 1 inch', 1.2, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7481, 25, 34, 201, 'Hexagonal Capscrew 1/4 x 1 1/4 inch', 1.45, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7482, 25, 33, 201, 'Hexagonal Capscrew 1/4 x 1 1/2 inch', 1.7, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7483, 25, 35, 201, 'Hexagonal Capscrew 1/4 x 1 3/4 inch', 1.9, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7484, 25, 41, 201, 'Hexagonal Capscrew 1/4 x 2 inch', 2.15, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7485, 25, 39, 201, 'Hexagonal Capscrew 1/4 x 2 1/4 inch', 2.4, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7486, 25, 38, 201, 'Hexagonal Capscrew 1/4 x 2 1/2 inch', 2.65, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7487, 25, 40, 201, 'Hexagonal Capscrew 1/4 x 2 3/4 inch', 2.85, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7488, 25, 46, 201, 'Hexagonal Capscrew 1/4 x 3 inch', 3.1, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7489, 25, 43, 201, 'Hexagonal Capscrew 1/4 x 3 1/2 inch', 3.6, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7490, 25, 50, 201, 'Hexagonal Capscrew 1/4 x 4 inch', 4.05, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7491, 25, 48, 201, 'Hexagonal Capscrew 1/4 x 4 1/2 inch', 4.5, 50, '2024-05-29 13:16:35', 'none', 'active'),
(7492, 25, 53, 201, 'Hexagonal Capscrew 1/4 x 5 inch', 5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7493, 25, 52, 201, 'Hexagonal Capscrew 1/4 x 5 1/2 inch', 5, 100, '2024-05-29 13:16:35', 'none', 'active'),
(7494, 25, 55, 201, 'Hexagonal Capscrew 1/4 x 6 inch', 5.95, 100, '2024-05-29 13:16:35', 'none', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_size`
--

CREATE TABLE `tbl_size` (
  `size_ID` int(11) NOT NULL,
  `size_length` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_size`
--

INSERT INTO `tbl_size` (`size_ID`, `size_length`) VALUES
(11, '1 inch'),
(12, '1 x 8 inch'),
(13, '1/2 x 1 1/2 inch'),
(14, '1/2 x 1 1/4 inch'),
(15, '1/2 x 1 3/4 inch'),
(16, '1/2 x 1 inch'),
(17, '1/2 x 2 1/2 inch'),
(18, '1/2 x 2 1/4 inch'),
(19, '1/2 x 2 3/4 inch'),
(20, '1/2 x 2 inch'),
(21, '1/2 x 3 1/2 inch'),
(22, '1/2 x 3 3/4 inch'),
(23, '1/2 x 3 inch'),
(24, '1/2 x 3/4 inch'),
(25, '1/2 x 4 1/2 inch'),
(26, '1/2 x 4 inch'),
(27, '1/2 x 5 1/2 inch'),
(28, '1/2 x 5 inch'),
(29, '1/2 x 50 mm'),
(30, '1/2 x 6 inch'),
(31, '12 x 75 mm'),
(32, '1/4 inch'),
(33, '1/4 x 1 1/2 inch'),
(34, '1/4 x 1 1/4 inch'),
(35, '1/4 x 1 3/4 inch'),
(36, '1/4 x 1 inch'),
(37, '1/4 x 1/2 inch'),
(38, '1/4 x 2 1/2 inch'),
(39, '1/4 x 2 1/4 inch'),
(40, '1/4 x 2 3/4 inch'),
(41, '1/4 x 2 inch'),
(42, '1/4 x 25 mm'),
(43, '1/4 x 3 1/2 inch'),
(44, '1/4 x 3 1/4 inch'),
(45, '1/4 x 3 3/4 inch'),
(46, '1/4 x 3 inch'),
(47, '1/4 x 3/4 inch'),
(48, '1/4 x 4 1/2 inch'),
(49, '1/4 x 4 1/4 inch'),
(50, '1/4 x 4 inch'),
(51, '1/4 x 40 mm'),
(52, '1/4 x 5 1/2 inch'),
(53, '1/4 x 5 inch'),
(54, '1/4 x 5/8 inch'),
(55, '1/4 x 6 inch'),
(56, '1/8 x 1 inch'),
(57, '1/8 x 1/2 inch'),
(58, '1/8 x 1/4 inch'),
(59, '1/8 x 3/16 inch'),
(60, '1/8 x 3/4 inch'),
(61, '1/8 x 3/8 inch'),
(62, '1/8 x 5/16 inch'),
(63, '1/8 x 5/8 inch'),
(64, '1/8 x 7/16 inch'),
(65, '1/8 x 9/16 inch'),
(66, '10 mm'),
(67, '12 mm'),
(68, '12 x 100 mm'),
(69, '12 x 125 mm'),
(70, '12 x 20 mm'),
(71, '12 x 25 mm'),
(72, '12 x 35 mm'),
(73, '12 x 40 mm'),
(74, '12 x 45 mm'),
(75, '12 x 50 mm'),
(76, '12 x 55 mm'),
(77, '12 x 65 mm'),
(78, '12 x 80 mm'),
(79, '12 x 90 mm'),
(80, '14 mm'),
(81, '16 mm'),
(82, '18 mm'),
(83, '20 mm'),
(84, '22 mm'),
(85, '24 mm'),
(86, '3 mm'),
(87, '3/16 x 1 inch'),
(88, '3/16 x 1/2 inch'),
(89, '3/16 x 1/4 inch'),
(90, '3/16 x 3/4 inch'),
(91, '3/16 x 3/8 inch'),
(92, '3/16 x 5/16 inch'),
(93, '3/16 x 5/8 inch'),
(94, '3/16 x 7/16 inch'),
(95, '3/16 x 9/16 inch'),
(96, '3/4 inch'),
(97, '3/4 x 50 mm'),
(98, '3/4 x 6 inch'),
(99, '3/4 x 85 mm'),
(100, '3/8 inch'),
(101, '3/8 x 1 1/2 inch'),
(102, '3/8 x 1 1/4 inch'),
(103, '3/8 x 1 3/4 inch'),
(104, '3/8 x 1 inch'),
(105, '3/8 x 1/2 inch'),
(106, '3/8 x 2 1/2 inch'),
(107, '3/8 x 2 1/4 inch'),
(108, '3/8 x 2 3/4 inch'),
(109, '3/8 x 2 inch'),
(110, '3/8 x 3 1/2 inch'),
(111, '3/8 x 3 1/4 inch'),
(112, '3/8 x 3 3/4 inch'),
(113, '3/8 x 3 inch'),
(114, '3/8 x 3/4 inch'),
(115, '3/8 x 4 1/2 inch'),
(116, '3/8 x 4 1/4 inch'),
(117, '3/8 x 4 inch'),
(118, '3/8 x 45 mm'),
(119, '3/8 x 5 1/2 inch'),
(120, '3/8 x 5 inch'),
(121, '3/8 x 5/8 inch'),
(122, '3/8 x 6 inch'),
(123, '3/8 x 60 mm'),
(124, '4 mm'),
(125, '5 mm'),
(126, '5/16 inch'),
(127, '5/16 x 1 1/2 inch'),
(128, '5/16 x 1 1/4 inch'),
(129, '5/16 x 1 3/4 inch'),
(130, '5/16 x 1 inch'),
(131, '5/16 x 1/2 inch'),
(132, '5/16 x 2 1/2 inch'),
(133, '5/16 x 2 1/4 inch'),
(134, '5/16 x 2 3/4 inch'),
(135, '5/16 x 2 inch'),
(136, '5/16 x 3 1/2 inch'),
(137, '5/16 x 3 1/4 inch'),
(138, '5/16 x 3 3/4 inch'),
(139, '5/16 x 3 inch'),
(140, '5/16 x 3/4 inch'),
(141, '5/16 x 30 mm'),
(142, '5/16 x 4 1/2 inch'),
(143, '5/16 x 4 1/4 inch'),
(144, '5/16 x 4 inch'),
(145, '5/16 x 45 mm'),
(146, '5/16 x 5 1/2 inch'),
(147, '5/16 x 5 inch'),
(148, '5/16 x 5/8 inch'),
(149, '5/16 x 6 inch'),
(150, '5/32 x 1 inch'),
(151, '5/32 x 1/2 inch'),
(152, '5/32 x 1/4 inch'),
(153, '5/32 x 3/4 inch'),
(154, '5/32 x 3/8 inch'),
(155, '5/32 x 5/16 inch'),
(156, '5/32 x 5/8 inch'),
(157, '5/32 x 7/16 inch'),
(158, '5/32 x 9/16 inch'),
(159, '5/8 inch'),
(160, '5/8 x 1 1/2 inch'),
(161, '5/8 x 1 1/4 inch'),
(162, '5/8 x 1 3/4 inch'),
(163, '5/8 x 1 inch'),
(164, '5/8 x 2 1/2 inch'),
(165, '5/8 x 2 1/4 inch'),
(166, '5/8 x 2 3/4 inch'),
(167, '5/8 x 2 inch'),
(168, '5/8 x 3 1/2 inch'),
(169, '5/8 x 3 inch'),
(170, '5/8 x 4 1/2 inch'),
(171, '5/8 x 4 inch'),
(172, '5/8 x 5 1/2 inch'),
(173, '5/8 x 5 inch'),
(174, '5/8 x 50 mm'),
(175, '5/8 x 6 inch'),
(176, '5/8 x 85 mm'),
(177, '6 mm'),
(178, '6 x 20 mm'),
(179, '6 x 25 mm'),
(180, '6 x 32 mm'),
(181, '6 x 38 mm'),
(182, '6 x 50 mm'),
(183, '7 x 1 1/2 inch'),
(184, '7 x 1 1/4 inch'),
(185, '7 x 1/4 inch'),
(186, '7 x 2 inch'),
(187, '7 x 3/4 inch'),
(188, '7/16 inch'),
(189, '7/16 x 1 1/2 inch'),
(190, '7/16 x 1 1/4 inch'),
(191, '7/16 x 1 3/4 inch'),
(192, '7/16 x 1 inch'),
(193, '7/16 x 2 1/2 inch'),
(194, '7/16 x 2 1/4 inch'),
(195, '7/16 x 2 3/4 inch'),
(196, '7/16 x 2 inch'),
(197, '7/16 x 3 1/2 inch'),
(198, '7/16 x 3 1/4 inch'),
(199, '7/16 x 3 inch'),
(200, '7/16 x 3/4 inch'),
(201, '7/16 x 4 1/2 inch'),
(202, '7/16 x 4 inch'),
(203, '7/16 x 5 1/2 inch'),
(204, '7/16 x 5 inch'),
(205, '7/16 x 6 inch'),
(206, '7/8 inch'),
(207, '7/8 x 8 inch'),
(208, '8 mm'),
(209, '8 x 100 mm'),
(210, '8 x 25 mm'),
(211, '8 x 32 mm'),
(212, '8 x 38 mm'),
(213, '8 x 50 mm'),
(214, '8 x 65 mm'),
(215, '8 x 75 mm'),
(216, '9/16 inch'),
(217, '9/16 x 1 1/2 inch'),
(218, '9/16 x 1 1/4 inch'),
(219, '9/16 x 1 3/4 inch'),
(220, '9/16 x 1 inch'),
(221, '9/16 x 2 1/2 inch'),
(222, '9/16 x 2 1/4 inch'),
(223, '9/16 x 2 3/4 inch'),
(224, '9/16 x 2 inch'),
(225, '9/16 x 3 1/2 inch'),
(226, '9/16 x 3 inch'),
(227, '9/16 x 4 1/2 inch'),
(228, '9/16 x 4 inch'),
(229, '9/16 x 5 1/2 inch'),
(230, '9/16 x 5 inch'),
(231, '9/16 x 6 inch'),
(232, '12 x 150 mm'),
(233, '1/2 inch'),
(234, '1/4 x 1 5/8 inch'),
(235, '3/8 x 6 1/2 inch'),
(236, '3/8 x 7 inch'),
(237, '3/8 x 7 1/2 inch'),
(238, '3/8 x 8 inch'),
(239, '7/16 x 6 1/2 inch'),
(240, '7/16 x 7 inch'),
(241, '7/16 x 7 1/2 inch'),
(242, '7/16 x 8 inch'),
(243, '1/2 x 3 1/4 inch'),
(244, '1/2 x 6 1/2 inch'),
(245, '1/2 x 7 inch'),
(246, '1/2 x 7 1/2 inch'),
(247, '1/2 x 8 inch'),
(248, '9/16 x 3 1/4 inch'),
(249, '9/16 x 3 3/4 inch'),
(250, '9/16 x 6 1/2 inch'),
(251, '9/16 x 7 inch'),
(252, '9/16 x 7 1/2 inch'),
(253, '9/16 x 8 inch'),
(254, '5/8 x 3 1/4 inch'),
(255, '5/8 x 3 3/4 inch'),
(256, '5/8 x 6 1/2 inch'),
(257, '5/8 x 7 inch'),
(258, '5/8 x 7 1/2 inch'),
(259, '5/8 x 8 inch'),
(260, '3/4 x 1 inch'),
(261, '3/4 x 1 1/4 inch'),
(262, '3/4 x 1 1/2 inch'),
(263, '3/4 x 1 3/4 inch'),
(264, '3/4 x 2 inch'),
(265, '3/4 x 2 1/4 inch'),
(266, '3/4 x 2 1/2 inch'),
(267, '3/4 x 2 3/4 inch'),
(268, '3/4 x 3 inch'),
(269, '3/4 x 3 1/4 inch'),
(270, '3/4 x 3 1/2 inch'),
(271, '3/4 x 3 3/4 inch'),
(272, '3/4 x 4 inch'),
(273, '3/4 x 4 1/2 inch'),
(274, '3/4 x 5 inch'),
(275, '3/4 x 5 1/2 inch'),
(276, '3/4 x 6 1/2 inch'),
(277, '3/4 x 7 inch'),
(278, '3/4 x 7 1/2 inch'),
(279, '3/4 x 8 inch'),
(280, '7/8 x 1 1/2 inch'),
(281, '7/8 x 1 3/4 inch'),
(282, '7/8 x 2 inch'),
(283, '7/8 x 2 1/4 inch'),
(284, '7/8 x 2 1/2 inch'),
(285, '7/8 x 2 3/4 inch'),
(286, '7/8 x 3 inch'),
(287, '7/8 x 3 1/4 inch'),
(288, '7/8 x 3 1/2 inch'),
(289, '7/8 x 3 3/4 inch'),
(290, '7/8 x 4 inch'),
(291, '7/8 x 4 1/2 inch'),
(292, '7/8 x 5 inch'),
(293, '7/8 x 5 1/2 inch'),
(294, '7/8 x 6 inch'),
(295, '7/8 x 6 1/2 inch'),
(296, '7/8 x 7 inch'),
(297, '7/8 x 7 1/2 inch'),
(298, '7/8 x 8 inch'),
(299, '1 x 1 1/2 inch'),
(300, '1 x 2 inch'),
(301, '1 x 2 1/4 inch'),
(302, '1 x 2 1/2 inch'),
(303, '1 x 2 3/4 inch'),
(304, '1 x 3 inch'),
(305, '1 x 3 1/2 inch'),
(306, '1 x 4 inch'),
(307, '1 x 4 1/2 inch'),
(308, '1 x 5 inch'),
(309, '1 x 5 1/2 inch'),
(310, '1 x 6 inch'),
(311, '1 x 6 1/2 inch'),
(312, '1 x 7 inch'),
(313, '1 x 7 1/2 inch'),
(314, '1 x 8 inch'),
(315, '3/8 x 5/8 inch'),
(316, '5/16 x 5/8 inch'),
(317, '1/4 x 5/8 inch');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supplier`
--

CREATE TABLE `tbl_supplier` (
  `supplier_ID` int(12) NOT NULL,
  `supplier_Name` char(32) NOT NULL,
  `supplier_Address` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supplier`
--

INSERT INTO `tbl_supplier` (`supplier_ID`, `supplier_Name`, `supplier_Address`) VALUES
(201, 'Supplier One', 'Manila');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_transaction`
--

CREATE TABLE `tbl_transaction` (
  `transaction_ID` int(16) NOT NULL,
  `employee_ID` int(16) NOT NULL,
  `customer_ID` int(16) DEFAULT NULL,
  `transaction_Date` datetime NOT NULL,
  `transaction_TotalPrice` double NOT NULL,
  `transaction_TotalPaid` double NOT NULL,
  `transaction_OrderStatus` char(32) DEFAULT 'processing',
  `transaction_ActiveStatus` char(32) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_transaction`
--

INSERT INTO `tbl_transaction` (`transaction_ID`, `employee_ID`, `customer_ID`, `transaction_Date`, `transaction_TotalPrice`, `transaction_TotalPaid`, `transaction_OrderStatus`, `transaction_ActiveStatus`) VALUES
(7001, 2001, NULL, '2024-06-16 10:07:49', 0, 1, 'paid', 'inactive'),
(7002, 2001, NULL, '2024-06-16 10:11:58', 0, 0, 'pending', 'inactive'),
(7003, 2001, NULL, '2024-06-16 10:16:21', 0, 0, 'pending', 'inactive'),
(7004, 2001, NULL, '2024-06-16 10:28:03', 0, 0, 'pending', 'inactive'),
(7005, 2001, NULL, '2024-06-16 10:41:51', 0, 0, 'pending', 'inactive'),
(7006, 2001, NULL, '2024-06-16 10:43:40', 0, 0, 'pending', 'inactive'),
(7007, 2001, NULL, '2024-06-16 10:44:44', 1128, 1200, 'paid', 'active'),
(7008, 2001, NULL, '2024-06-16 10:45:48', 0, 0, 'pending', 'inactive'),
(7009, 2001, NULL, '2024-06-16 11:05:41', 0, 0, 'pending', 'inactive'),
(7010, 2001, 3001, '2024-06-16 11:52:44', 35.7, 10, 'pending', 'active'),
(7011, 2001, NULL, '2024-06-16 11:54:19', 49, 50, 'paid', 'active'),
(7012, 2001, NULL, '2024-06-16 11:54:37', 20, 100, 'paid', 'active'),
(7013, 2001, NULL, '2024-06-16 11:54:51', 9000, 10000, 'paid', 'active'),
(7014, 2001, NULL, '2024-06-16 11:56:31', 6076.08, 7000, 'paid', 'active'),
(7015, 2001, 3002, '2024-06-16 11:59:30', 7.1, 5, 'pending', 'active'),
(7016, 2001, NULL, '2024-06-16 12:01:32', 0, 0, 'processing', 'inactive'),
(7017, 2001, NULL, '2024-06-16 12:01:39', 0, 0, 'processing', 'inactive'),
(7018, 2001, NULL, '2024-06-16 12:02:05', 180, 200, 'paid', 'active'),
(7019, 2001, NULL, '2024-06-16 12:04:43', 0, 0, 'processing', 'active'),
(7020, 2001, NULL, '2024-06-16 12:07:25', 0, 0, 'processing', 'active'),
(7021, 2001, NULL, '2024-06-16 12:09:28', 30, 0, 'processing', 'active'),
(7022, 2001, NULL, '2024-06-16 12:11:01', 15, 0, 'processing', 'active'),
(7023, 2001, NULL, '2024-06-16 12:13:15', 0, 0, 'processing', 'inactive'),
(7024, 2001, 3003, '2024-06-16 12:17:27', 43.379999999999995, 20, 'pending', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_type`
--

CREATE TABLE `tbl_type` (
  `type_ID` int(11) NOT NULL,
  `type_Name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_type`
--

INSERT INTO `tbl_type` (`type_ID`, `type_Name`) VALUES
(11, 'Gypsum Wood'),
(12, 'Gypsum Steel'),
(13, 'Expansion Shield'),
(14, 'BH Nut'),
(15, 'HT Standard'),
(16, 'Tek Screw Wood'),
(17, 'Tek Screw Metal'),
(18, 'LW Nut'),
(19, 'HT Nut'),
(20, 'Hardiflex Screw'),
(21, 'Grip Anchor'),
(22, 'Blind Rivet'),
(23, 'Dyna Bolt'),
(24, 'ORD Nut'),
(25, 'Hexagonal Capscrew');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`admin_ID`);

--
-- Indexes for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`employee_ID`),
  ADD KEY `fk_employee_admin` (`admin_ID`);

--
-- Indexes for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD PRIMARY KEY (`product_ID`,`transaction_ID`),
  ADD KEY `fk_item_transaction` (`transaction_ID`);

--
-- Indexes for table `tbl_login`
--
ALTER TABLE `tbl_login`
  ADD PRIMARY KEY (`login_ID`);

--
-- Indexes for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD PRIMARY KEY (`product_ID`),
  ADD KEY `Product_ID` (`type_ID`),
  ADD KEY `Size_ID` (`size_ID`),
  ADD KEY `fk_last_supplied` (`last_Supplied_BY`);

--
-- Indexes for table `tbl_size`
--
ALTER TABLE `tbl_size`
  ADD PRIMARY KEY (`size_ID`);

--
-- Indexes for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  ADD PRIMARY KEY (`supplier_ID`);

--
-- Indexes for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD PRIMARY KEY (`transaction_ID`),
  ADD KEY `fk_transaction_employee` (`employee_ID`),
  ADD KEY `fk_transaction_customer` (`customer_ID`);

--
-- Indexes for table `tbl_type`
--
ALTER TABLE `tbl_type`
  ADD PRIMARY KEY (`type_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  MODIFY `admin_ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2003;

--
-- AUTO_INCREMENT for table `tbl_customer`
--
ALTER TABLE `tbl_customer`
  MODIFY `customer_ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3004;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `employee_ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2007;

--
-- AUTO_INCREMENT for table `tbl_login`
--
ALTER TABLE `tbl_login`
  MODIFY `login_ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2003;

--
-- AUTO_INCREMENT for table `tbl_product`
--
ALTER TABLE `tbl_product`
  MODIFY `product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7500;

--
-- AUTO_INCREMENT for table `tbl_size`
--
ALTER TABLE `tbl_size`
  MODIFY `size_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `tbl_supplier`
--
ALTER TABLE `tbl_supplier`
  MODIFY `supplier_ID` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=203;

--
-- AUTO_INCREMENT for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  MODIFY `transaction_ID` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7025;

--
-- AUTO_INCREMENT for table `tbl_type`
--
ALTER TABLE `tbl_type`
  MODIFY `type_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD CONSTRAINT `tbl_admin_ibfk_1` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_login` (`login_ID`);

--
-- Constraints for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD CONSTRAINT `fk_employee_admin` FOREIGN KEY (`admin_ID`) REFERENCES `tbl_admin` (`admin_ID`),
  ADD CONSTRAINT `fk_employee_login` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_login` (`login_ID`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_item`
--
ALTER TABLE `tbl_item`
  ADD CONSTRAINT `fk_item_product` FOREIGN KEY (`product_ID`) REFERENCES `tbl_product` (`product_ID`),
  ADD CONSTRAINT `fk_item_transaction` FOREIGN KEY (`transaction_ID`) REFERENCES `tbl_transaction` (`transaction_ID`);

--
-- Constraints for table `tbl_product`
--
ALTER TABLE `tbl_product`
  ADD CONSTRAINT `fk_last_supplied` FOREIGN KEY (`last_Supplied_BY`) REFERENCES `tbl_supplier` (`supplier_ID`),
  ADD CONSTRAINT `tbl_product_ibfk_1` FOREIGN KEY (`type_ID`) REFERENCES `tbl_type` (`type_ID`),
  ADD CONSTRAINT `tbl_product_ibfk_2` FOREIGN KEY (`size_ID`) REFERENCES `tbl_size` (`size_ID`);

--
-- Constraints for table `tbl_transaction`
--
ALTER TABLE `tbl_transaction`
  ADD CONSTRAINT `fk_transaction_customer` FOREIGN KEY (`customer_ID`) REFERENCES `tbl_customer` (`customer_ID`),
  ADD CONSTRAINT `fk_transaction_employee` FOREIGN KEY (`employee_ID`) REFERENCES `tbl_employee` (`employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
