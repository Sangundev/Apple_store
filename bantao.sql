-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2024 at 06:52 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bantao`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_role`
--

CREATE TABLE `account_role` (
  `account_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `account_role`
--

INSERT INTO `account_role` (`account_id`, `role_id`) VALUES
(1, 2),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `accout`
--

CREATE TABLE `accout` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(500) NOT NULL,
  `name` varchar(200) NOT NULL,
  `role_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accout`
--

INSERT INTO `accout` (`id`, `email`, `password`, `name`, `role_id`) VALUES
(1, 'trung@gmail.com', '$2y$12$5BR7xZUChHdl5bO.s9Z2Be50kNWQdsSpUL887rF58vzT85epMOVHu', 'TanTrung', NULL),
(3, 'trungtan25112k2@gmail.com', '$2y$12$C1HkpSeExSNywqgjRCvlauqs7nlFKiQ2FEtY8ueKg0dABf6k.CBMm', 'Nguyễn Tấn Trung', 1),
(4, 'trung@ams.com', '$2y$12$eheHznqhVOAAspixvts8Ru/UbKcx2zLO.69znYDc7RjAZTPUAFdRG', 'Trung Nguyễn', NULL),
(5, 'trungtannguyen44@gmail.com', '$2y$12$EaK6raHYPueBgtOwB6NJdOyai18iE20eKvWquZYel9/G7ZsVw7jym', 'Nguyen Tan Trung', 1),
(6, 'nguyenngocsang1682@gmail.com', '$2y$12$W82Pb0BWWlovWhOURSEUB.ho.JCUeG5GZrUD.GKctu6sTNKreBd5q', 'BeQuynh', 2),
(7, 'soan01965@gmail.com', '$2y$12$G/yzvX3kgUqi8gyFxGdvkemL9wHjfG7EVSddK4iZX9wl4LS2L.0ba', 'BeQuynh', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Id` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `AccountId` int(11) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Total` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Date`, `AccountId`, `Address`, `Phone`, `Total`) VALUES
(21, '2024-04-04', 3, 'tp hcm', '08976857645', 50000.00),
(22, '2024-04-04', 3, 'tp hcm', '8976857645', 50000.00),
(23, '2024-04-04', 3, 'tp hcm', '8976857645', 102000.00),
(24, '2024-04-04', 4, 'tp hcm', '8976857645', 50000.00),
(25, '2024-04-04', 3, 'tp hcm', '8976857645', 1000.00),
(26, '2024-04-11', 6, 'Tăng nhơn phú A, Thủ đức , tp.hcm', '0374059466', 51000.00),
(27, '2024-04-12', 6, 'Tăng nhơn phú A, Thủ đức , tp.hcm', '0374059466', 53000.00),
(28, '2024-04-12', 6, 'Tăng nhơn phú A, Thủ đức , tp.hcm', '0374059466', 51000.00),
(29, '2024-04-18', 6, 'Tăng nhơn phú A, Thủ đức , tp.hcm', '0374059466', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `Id` int(11) NOT NULL,
  `OrderId` int(11) DEFAULT NULL,
  `ProductId` int(11) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`Id`, `OrderId`, `ProductId`, `Amount`) VALUES
(27, 22, 1, 1),
(28, 23, 1, 2),
(29, 23, 2, 2),
(30, 24, 1, 1),
(31, 25, 2, 1),
(32, 26, 2, 1),
(33, 26, 1, 1),
(34, 27, 1, 1),
(35, 27, 2, 3),
(36, 28, 2, 1),
(37, 28, 1, 1),
(38, 29, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(300) NOT NULL,
  `price` double DEFAULT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`) VALUES
(1, 'Trung', 'Nam', 50000, 'app/image/Nu.png'),
(2, 'DatDepChai', 'danh cau long gioi ', 1000, 'app/image/kazuha.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'admin'),
(2, 'user'),
(3, 'mod');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_role`
--
ALTER TABLE `account_role`
  ADD PRIMARY KEY (`account_id`,`role_id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `accout`
--
ALTER TABLE `accout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_role_id` (`role_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `AccountId` (`AccountId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `OrderId` (`OrderId`),
  ADD KEY `ProductId` (`ProductId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accout`
--
ALTER TABLE `accout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_role`
--
ALTER TABLE `account_role`
  ADD CONSTRAINT `account_role_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accout` (`id`),
  ADD CONSTRAINT `account_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `accout`
--
ALTER TABLE `accout`
  ADD CONSTRAINT `FK_role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `accout_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`AccountId`) REFERENCES `accout` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`OrderId`) REFERENCES `orders` (`Id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`ProductId`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
