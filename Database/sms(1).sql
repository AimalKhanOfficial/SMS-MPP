-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 12, 2018 at 07:44 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 7.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `CategoryID` int(11) NOT NULL,
  `Category` varchar(200) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`CategoryID`, `Category`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`) VALUES
(1, 'Cosmetics', 1, 'Aimal', '2018-03-07 00:00:00', 'Admin Name', '2018-03-11 21:23:20'),
(2, 'Dairy Product', 1, 'From Session', '2018-03-07 15:50:58', 'Admin Name', '2018-03-07 15:51:17'),
(4, 'Men''s Wear', 1, 'From Session', '2018-03-11 22:39:05', '', '2018-03-11 22:39:05'),
(5, 'Watches', 1, 'From Session', '2018-03-11 22:43:27', '', '2018-03-11 22:43:27'),
(6, 'Cell Phones', 1, 'From Session', '2018-03-11 22:45:54', '', '2018-03-11 22:45:54'),
(7, 'Laptops', 1, 'From Session', '2018-03-11 22:48:36', '', '2018-03-11 22:48:36');

-- --------------------------------------------------------

--
-- Table structure for table `customeroffersubscriptions`
--

CREATE TABLE `customeroffersubscriptions` (
  `SubscriptionID` int(11) NOT NULL,
  `User_ID` int(11) NOT NULL,
  `IsActive` int(11) NOT NULL,
  `CreatedBy` varchar(200) NOT NULL,
  `CreatedAt` datetime NOT NULL,
  `UpdatedBy` varchar(200) NOT NULL,
  `UpdatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customeroffersubscriptions`
--

INSERT INTO `customeroffersubscriptions` (`SubscriptionID`, `User_ID`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`) VALUES
(3, 2, 1, 'Khadija Raja', '2018-03-11 17:40:54', '', '2018-03-11 17:40:54'),
(5, 4, 1, 'Example User', '2018-03-11 21:28:49', '', '2018-03-11 21:28:49'),
(6, 5, 1, 'Baky J', '2018-03-11 21:41:52', '', '2018-03-11 21:41:52');

-- --------------------------------------------------------

--
-- Table structure for table `customerqueries`
--

CREATE TABLE `customerqueries` (
  `CQID` int(11) NOT NULL,
  `Query` text,
  `User_ID` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatdedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerqueries`
--

INSERT INTO `customerqueries` (`CQID`, `Query`, `User_ID`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatdedAt`) VALUES
(1, 'Hey this is just an example message ', 0, 0, 'From Session', '2018-03-07 11:34:43', '', '2018-03-07 11:34:43'),
(2, 'TEsting!', 0, 0, 'From Session', '2018-03-07 11:51:56', '', '2018-03-07 11:51:56'),
(3, '', 0, 0, 'From Session', '2018-03-11 21:30:52', '', '2018-03-11 21:30:52');

-- --------------------------------------------------------

--
-- Table structure for table `customerreviews`
--

CREATE TABLE `customerreviews` (
  `CRID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `Product_ID` int(11) DEFAULT NULL,
  `Comment` text,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customerreviews`
--

INSERT INTO `customerreviews` (`CRID`, `User_ID`, `Product_ID`, `Comment`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`) VALUES
(10, 1, 32, 'Its awesome, Guys, i recommed!!', 1, 'Aimal khan', '2018-03-11 22:52:21', '', '2018-03-11 22:52:21');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `OrderID` int(11) NOT NULL,
  `User_ID` int(11) DEFAULT NULL,
  `TotalPrice` double DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_products`
--

CREATE TABLE `order_products` (
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Quanitity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productimages`
--

CREATE TABLE `productimages` (
  `ImageID` int(11) NOT NULL,
  `URL` text,
  `Product_ID` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productimages`
--

INSERT INTO `productimages` (`ImageID`, `URL`, `Product_ID`, `IsActive`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`) VALUES
(26, 'img_96393_prod_58418.jpg', 27, 1, 'From Session', '2018-03-11 22:36:23', '', '2018-03-11 22:36:23'),
(27, 'img_16676_prod_44486.jpg', 27, 1, 'From Session', '2018-03-11 22:36:23', '', '2018-03-11 22:36:23'),
(28, 'img_88642_prod_50209.jpg', 28, 1, 'From Session', '2018-03-11 22:37:39', '', '2018-03-11 22:37:39'),
(29, 'img_23427_prod_48084.jpg', 28, 1, 'From Session', '2018-03-11 22:37:39', '', '2018-03-11 22:37:39'),
(30, 'img_18337_prod_11562.jpg', 29, 1, 'From Session', '2018-03-11 22:41:07', '', '2018-03-11 22:41:07'),
(31, 'img_25494_prod_44996.jpg', 30, 1, 'From Session', '2018-03-11 22:44:30', '', '2018-03-11 22:44:30'),
(32, 'img_32327_prod_1731.jpg', 30, 1, 'From Session', '2018-03-11 22:44:30', '', '2018-03-11 22:44:30'),
(33, 'img_89092_prod_46385.jpg', 31, 1, 'From Session', '2018-03-11 22:47:18', '', '2018-03-11 22:47:18'),
(34, 'img_12010_prod_10323.jpg', 31, 1, 'From Session', '2018-03-11 22:47:18', '', '2018-03-11 22:47:18'),
(37, 'img_68411_prod_81474.jpg', 33, 1, 'From Session', '2018-03-11 23:00:57', '', '2018-03-11 23:00:57'),
(38, 'img_12406_prod_95416.jpg', 33, 1, 'From Session', '2018-03-11 23:00:57', '', '2018-03-11 23:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `ProductID` int(11) NOT NULL,
  `Category_ID` int(11) DEFAULT NULL,
  `Name` varchar(200) DEFAULT NULL,
  `Description` text,
  `Price` double DEFAULT NULL,
  `QuantitiyAvailable` int(11) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatdeAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`ProductID`, `Category_ID`, `Name`, `Description`, `Price`, `QuantitiyAvailable`, `IsActive`, `CreatedAt`, `CreatedBy`, `UpdatedBy`, `UpdatdeAt`) VALUES
(27, 1, 'MATTE LIPSTICK', 'Load your lips with plush, pigment-rich color choosing from 12 brand new shades of Matte Lipstick—our shockingly smooth lip color that glides right on and stays in place with a silky matte finish that never feels dry. Now available in a range of fresh new hues, these playful pops of color are just what your spring wardrobe needs!', 6, 10, 1, '2018-03-11 22:36:23', 'Admin', '', '2018-03-11 22:36:23'),
(28, 2, 'Dairy Milk', 'Cadbury Dairy Milk is a brand of milk chocolate manufactured by Cadbury. It was introduced in the United Kingdom in 1905 and now consists of a number of products. Every product in the Dairy Milk line is made with exclusively milk chocolate. In 2014, Dairy Milk was ranked the best-selling chocolate bar in the UK.', 2, 10, 1, '2018-03-11 22:37:39', 'Admin', '', '2018-03-11 22:37:39'),
(29, 4, 'Brandit M65 Giant Mens Military Jacket', 'BRANDIT GIANT M65 JACKET MENS MILITARY PARKA US ARMY COAT WARM ZIP OUT LINER', 30, 10, 1, '2018-03-11 22:41:06', 'Admin', '', '2018-03-11 22:41:06'),
(30, 5, 'Cagarny 6820 Male Quartz', 'Double Movt Date Function Decorative Sub-dials Big Dial Leather Band', 12, 10, 1, '2018-03-11 22:44:30', 'Admin', '', '2018-03-11 22:44:30'),
(31, 6, 'iPhone x', 'iPhone X features a new all-screen design. Face ID, which makes your face your password. And the most powerful and smartest chip ever in a smartphone.', 900, 10, 1, '2018-03-11 22:47:18', 'Admin', '', '2018-03-11 22:47:18'),
(33, 7, 'Hp Core i5', 'HP 15.6 Touch-Screen Laptop - Intel Core i5 - 8GB Memory - 1TB Hard Drive Black 15-BS015DX', 570.29, 10, 1, '2018-03-11 23:00:57', 'Admin', '', '2018-03-11 23:00:57');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(200) DEFAULT NULL,
  `LastName` varchar(200) DEFAULT NULL,
  `UserType_ID` int(11) DEFAULT NULL,
  `EmailAddress` varchar(200) DEFAULT NULL,
  `Password` varchar(500) DEFAULT NULL,
  `ShippingAddress` text,
  `ContactNumber` varchar(100) DEFAULT NULL,
  `IsAccVerified` int(11) DEFAULT NULL,
  `VerificationCode` int(11) DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL,
  `UpdatedAt` datetime DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `UserType_ID`, `EmailAddress`, `Password`, `ShippingAddress`, `ContactNumber`, `IsAccVerified`, `VerificationCode`, `CreatedBy`, `CreatedAt`, `UpdatedBy`, `UpdatedAt`, `IsActive`) VALUES
(1, 'Aimal ', 'khan', 2, 'ai.khan@mum.edu', '123', 'USA', '03423170204', 1, 99392, 'Aimal  khan', '2018-03-09 01:34:56', 'Aimal  khan', '2018-03-11 23:04:54', 1),
(2, 'Yerbol', 'Raja', 2, 'aimalkhan26@yahoo.com', '456', 'USA', '03', 1, 43612, 'Khadija Raja', '2018-03-09 02:15:49', '', '2018-03-09 02:15:49', 1),
(3, 'Aimal ', 'Khan', 1, 'admin', 'admin', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Example', 'User', 2, 'aimalkhanofficial@gmail.com', '48384', 'USA', '123', 1, 31682, 'Example User', '2018-03-11 20:17:10', 'Admin Name', '2018-03-11 21:27:02', 1),
(5, 'Baky', 'J', 2, 'bahalekiitu@gmail.com', '123', 'USA', '123', 1, 38037, 'Baky J', '2018-03-11 21:39:56', 'Baky J', '2018-03-11 21:40:40', 1);

-- --------------------------------------------------------

--
-- Table structure for table `usertype`
--

CREATE TABLE `usertype` (
  `UserTypeID` int(11) NOT NULL,
  `UserType` varchar(200) DEFAULT NULL,
  `IsActive` int(11) DEFAULT NULL,
  `CreatedDateTime` datetime DEFAULT NULL,
  `UpdatedDateTime` date DEFAULT NULL,
  `CreatedBy` varchar(200) DEFAULT NULL,
  `UpdatedBy` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertype`
--

INSERT INTO `usertype` (`UserTypeID`, `UserType`, `IsActive`, `CreatedDateTime`, `UpdatedDateTime`, `CreatedBy`, `UpdatedBy`) VALUES
(1, 'Admin', 1, '2018-10-03 00:00:00', '2018-10-03', 'Aimal Khan', 'Aimal Khan'),
(2, 'Customer', 1, '2018-10-03 00:00:00', '2018-10-03', 'Aimal Khan', 'Aimal Khan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customeroffersubscriptions`
--
ALTER TABLE `customeroffersubscriptions`
  ADD PRIMARY KEY (`SubscriptionID`);

--
-- Indexes for table `customerqueries`
--
ALTER TABLE `customerqueries`
  ADD PRIMARY KEY (`CQID`);

--
-- Indexes for table `customerreviews`
--
ALTER TABLE `customerreviews`
  ADD PRIMARY KEY (`CRID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`Order_ID`,`Product_ID`);

--
-- Indexes for table `productimages`
--
ALTER TABLE `productimages`
  ADD PRIMARY KEY (`ImageID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ProductID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indexes for table `usertype`
--
ALTER TABLE `usertype`
  ADD PRIMARY KEY (`UserTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `customeroffersubscriptions`
--
ALTER TABLE `customeroffersubscriptions`
  MODIFY `SubscriptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `customerqueries`
--
ALTER TABLE `customerqueries`
  MODIFY `CQID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customerreviews`
--
ALTER TABLE `customerreviews`
  MODIFY `CRID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `productimages`
--
ALTER TABLE `productimages`
  MODIFY `ImageID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `usertype`
--
ALTER TABLE `usertype`
  MODIFY `UserTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
