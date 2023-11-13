-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 04:05 PM
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
-- Database: `jewelry_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `colour_id` int(30) NOT NULL,
  `size_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `colour_id`, `size_id`, `qty`, `price`, `ip_address`, `date_created`) VALUES
(4, 2, 2, 1, 2, 1, 3500, '', '2020-11-12 17:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `date_created`) VALUES
(1, 'Rings', '<font color=\"#000000\">Wonderful hands full of&nbsp; elegance.</font>', '0000-00-00 00:00:00'),
(2, 'Necklace', '<font color=\"#000000\">Elegance and beauty combined for your own attributes.</font>', '0000-00-00 00:00:00'),
(4, 'Emmy picks', 'Peekaboo', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `colours`
--

CREATE TABLE `colours` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `color` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `colours`
--

INSERT INTO `colours` (`id`, `product_id`, `color`, `date_created`) VALUES
(1, 2, 'Silver', '2020-11-12 13:00:31'),
(2, 2, 'Gold', '2020-11-12 13:00:31'),
(3, 3, '', '2020-11-12 13:36:42'),
(4, 4, 'Silver', '2020-11-12 13:49:10'),
(5, 5, '', '2020-11-12 13:49:40'),
(6, 6, 'Red and Blue', '2023-11-09 16:33:19'),
(7, 6, 'White and Gold', '2023-11-09 16:33:19'),
(8, 7, 'Pink', '2023-11-09 16:52:15'),
(9, 7, 'Black', '2023-11-09 16:52:15'),
(10, 7, 'Pink and black', '2023-11-09 16:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `ref_id` varchar(200) NOT NULL,
  `user_id` int(30) NOT NULL,
  `delivery_address` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_id`, `user_id`, `delivery_address`, `status`, `date_created`) VALUES
(1, 'assferetdg', 2, 'Sample Address', 1, '2020-11-12 15:42:24'),
(2, 'xGglucIwb4tL7vWm', 2, 'Sample Address', 3, '2020-11-12 15:56:33'),
(3, 'h4bNdKOoXYeLwjAB', 3, 'House #3', 0, '2023-11-09 16:34:41'),
(4, 'Ekspe8Fmb2Go4RVP', 3, 'MMCM', 0, '2023-11-09 16:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `colour_id` int(30) NOT NULL,
  `size_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `colour_id`, `size_id`, `qty`, `price`, `date_created`) VALUES
(1, 1, 4, 4, 6, 2, 1500, '2020-11-12 15:42:24'),
(2, 1, 4, 4, 7, 2, 1500, '2020-11-12 15:42:24'),
(3, 2, 2, 1, 4, 2, 3500, '2020-11-12 15:56:33'),
(4, 3, 6, 7, 9, 2, 1000, '2023-11-09 16:34:41'),
(5, 4, 6, 6, 10, 3, 1000, '2023-11-09 16:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `item_code` varchar(200) NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `item_code`, `price`, `date_created`) VALUES
(2, 1, 'Beauty Ring', '																								&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;A beauty with perfection.&lt;/p&gt;																																				', 'JCSMmyV453K7xEg9', 3500, '2020-11-12 12:13:24'),
(3, 2, 'Chrome Hearts Necklace', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Chrome Hearts Design.&lt;/span&gt;', 'b9qSY10cfy7uPmI6', 3500, '2020-11-12 13:36:42'),
(4, 1, 'Chrome Hearts', '								&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;A chrome hearts design that is an eye catchy beauty.&lt;/span&gt;', 'NoHid3pArPCSqTEk', 1500, '2020-11-12 13:49:10'),
(5, 2, 'White Gold Necklace', '																&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px; text-align: justify;&quot;&gt;Beautiful piece of art.&lt;/span&gt;							', '5KygmkTuPLDaHRob', 3500, '2020-11-12 13:49:40'),
(6, 2, 'Simple Necklace', 'Simple necklace but beautiful.', 'T5eW239zgOrskPEC', 1000, '2023-11-09 16:33:19'),
(7, 4, 'Emmy  accessories', 'Elegance and beauty.', '92vTHetVFOig7JBo', 50, '2023-11-09 16:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` int(11) NOT NULL,
  `product_id` int(30) NOT NULL,
  `size` varchar(200) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `product_id`, `size`, `date_created`) VALUES
(2, 2, '5 (.62\"/1.57cm)', '2020-11-12 12:13:24'),
(3, 2, '6 (.65\"/1.65cm)', '2020-11-12 12:13:24'),
(4, 2, '7 (.98\"/1.73cm)', '2020-11-12 12:13:24'),
(5, 3, '', '2020-11-12 13:36:42'),
(6, 4, '5 (.62\"/1.57cm)', '2020-11-12 13:49:10'),
(7, 4, '7 (.98\"/1.73cm)', '2020-11-12 13:49:10'),
(8, 5, '', '2020-11-12 13:49:40'),
(9, 6, '7\"', '2023-11-09 16:33:19'),
(10, 6, '14\"', '2023-11-09 16:33:19'),
(11, 7, '8\"', '2023-11-09 16:52:15'),
(12, 7, '10\"', '2023-11-09 16:52:15'),
(13, 7, '12\"', '2023-11-09 16:52:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `firstname` varchar(200) NOT NULL,
  `lastname` varchar(200) NOT NULL,
  `middlename` varchar(200) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=Admin,2= users',
  `avatar` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `middlename`, `contact`, `address`, `email`, `password`, `type`, `avatar`, `date_created`) VALUES
(1, 'Admin', 'Admin', '', '+12354654787', 'Sample', 'admin@admin.com', '0192023a7bbd73250516f069df18b500', 1, '1699518000_logo.png', '2020-11-11 15:35:19'),
(2, 'Claire', 'Blake', '', '+12345687', 'Sample Address', 'cblake@sample.com', '9de07aee42012876a462e2dc739ffcc5', 2, '', '2020-11-12 14:45:00'),
(3, 'Joshua', 'Lodi', '', '0912345678', 'House #3', 'Joshua@sample.com', '4297f44b13955235245b2497399d7a93', 2, '', '2023-11-09 00:29:37'),
(5, 'LB', 'Cruz', '', '09456456456', 'MMCM', 'LB@sample.com', '4297f44b13955235245b2497399d7a93', 2, '', '2023-11-09 16:54:24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colours`
--
ALTER TABLE `colours`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `colours`
--
ALTER TABLE `colours`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
