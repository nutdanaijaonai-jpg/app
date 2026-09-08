-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 08, 2026 at 02:07 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clothing_shop`
--
CREATE DATABASE IF NOT EXISTS `clothing_shop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `clothing_shop`;

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `username`, `password`, `created_at`) VALUES
(1, 'admin', '$2y$10$NODnmJo.xQYGqTgqkMG1UOKKZrcO84JPmNCblt.r3.K34LLO4z8Yi', '2026-08-17 18:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'เสื้อยืด'),
(2, 'กางเกง'),
(3, 'เดรส'),
(4, 'แจ็คเก็ต');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','shipped','completed','cancelled') COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `shipping_address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `size` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `stock`, `size`, `color`, `image_url`, `created_at`) VALUES
(1, 1, 'เสื้อยืดสีขาว Basic', 'เสื้อยืดคอกลม ผ้าคอตตอน 100%', '199.00', 50, 'S,M,L,XL', 'ขาว', 'https://via.placeholder.com/300x300?text=White+Tshirt', '2026-08-17 18:30:10'),
(2, 2, 'กางเกงยีนส์ขากระบอก', 'กางเกงยีนส์ทรงขากระบอก ใส่สบาย', '590.00', 30, '28,30,32,34', 'น้ำเงิน', 'https://via.placeholder.com/300x300?text=Jeans', '2026-08-17 18:30:10'),
(3, 3, 'เดรสลายดอกไม้', 'เดรสแขนกุด ลายดอกไม้ เหมาะกับหน้าร้อน', '450.00', 20, 'S,M,L', 'หลากสี', 'https://via.placeholder.com/300x300?text=Dress', '2026-08-17 18:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `address`, `created_at`) VALUES
(1, 'สมชาย ใจดี', 'user@example.com', '$2y$10$wE9L0C01M41vA.mK/S0g3uJ1E6qHn.N9uI8d9vG4q3e21e0xYyZ.2', '0812345678', '123/45 กรุงเทพฯ', '2026-08-17 18:30:10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
--
-- Database: `lane3`
--
CREATE DATABASE IF NOT EXISTS `lane3` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `lane3`;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `customer_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `shipping` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_method` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('pending','paid','shipped','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `customer_name`, `phone`, `address`, `subtotal`, `shipping`, `total`, `payment_method`, `status`, `created_at`) VALUES
('ORDTK7WPDB01', 1, 'as', 'as', 'as', '2790.00', '0.00', '2790.00', 'promptpay', 'paid', '2026-08-23 17:20:01'),
('ORDTK7WYZB33', 1, 'aa', 'aa', 'aa', '2790.00', '0.00', '2790.00', 'promptpay', 'paid', '2026-08-23 17:25:47'),
('ORDTKW8BK8F5', 1, 'as', 'as', 'as', '2790.00', '0.00', '2790.00', 'cod', 'shipped', '2026-09-05 20:33:20'),
('ORDTKW8CIF8A', 1, 'd', 'd', 'd', '2790.00', '0.00', '2790.00', 'transfer', 'paid', '2026-09-05 20:33:54'),
('ORDTKW9VJ6CE', 1, 'as', '4', 'as', '1890.00', '0.00', '1890.00', 'transfer', 'paid', '2026-09-05 21:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `qty` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `name`, `brand`, `price`, `qty`) VALUES
(1, 'ORDTK7WPDB01', 24, 'Adidas Adicolor Hoodie', 'adidas', '2790.00', 1),
(2, 'ORDTK7WYZB33', 24, 'Adidas Adicolor Hoodie', 'adidas', '2790.00', 1),
(3, 'ORDTKW8BK8F5', 24, 'Adidas Adicolor Hoodie', 'adidas', '2790.00', 1),
(4, 'ORDTKW8CIF8A', 24, 'Adidas Adicolor Hoodie', 'adidas', '2790.00', 1),
(5, 'ORDTKW9VJ6CE', 23, 'Nike Club Fleece Joggers', 'nike', '1890.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` enum('nike','adidas') COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int NOT NULL DEFAULT '0',
  `image_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `category`, `price`, `stock`, `image_url`, `description`, `created_at`) VALUES
(3, 'Nike Sportswear Shorts', 'nike', 'กางเกง', '990.00', 30, 'https://i.ebayimg.com/images/g/VLEAAOSw2zRkDnxA/s-l1600.webp', 'กางเกงขาสั้นทรงคลาสสิก ผ้าถักนุ่ม ใส่ได้ทั้งออกกำลังกายและลำลอง', '2026-08-18 08:39:00'),
(5, 'Nike Everyday Crew Socks (3คู่)', 'nike', 'ถุงเท้า/แอคเซสซอรี่', '490.00', 50, 'https://i.ebayimg.com/thumbs/images/g/FcEAAOSw5BNlstET/s-l500.jpg', 'ถุงเท้ากีฬาคุณภาพสูง เนื้อผ้าหนานุ่ม เซ็ต 3 คู่', '2026-08-18 08:39:00'),
(6, 'Adidas Essentials 3-Stripes Tee', 'adidas', 'เสื้อยืด', '1190.00', 20, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/86390f8e4a0d482897ffaf000092c1d6_9366/Train_Essentials_3-Stripes_Training_Tee_Black_IB8150_01_laydown.jpg', 'เสื้อยืดลาย 3 แถบสัญลักษณ์ ผ้าคอตตอนใส่สบาย', '2026-08-18 08:39:00'),
(7, 'Adidas Tiro Track Jacket', 'adidas', 'เสื้อฮู้ด/แจ็คเก็ต', '2490.00', 15, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/586616f5d3224f3dbcac00433722d4b7_9366/Adizero_Essentials_Running_Jacket_Black_IT7585_HM1.jpg', 'แจ็คเก็ตแทร็คสูทคลาสสิก ซิปเต็มตัว ใส่ซ้อนได้ทุกฤดู', '2026-08-18 08:39:00'),
(8, 'Adidas Own The Run Tights', 'adidas', 'กางเกง', '1590.00', 18, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/04619dfaf2c44413a59eb65341c0427c_9366/adi365_Running_Essentials_Tights_Black_JY5495_21_model.jpg', 'เลกกิ้งวิ่งกระชับกล้ามเนื้อ ผ้ายืดหยุ่นสูง แห้งไว', '2026-08-18 08:39:00'),
(9, 'Adidas Firebird Track Pants', 'adidas', 'กางเกง', '2190.00', 10, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/1651f914a4f0430490ed636fb21d1cf6_9366/Firebird_Track_Pants_Black_KD8315_21_model.jpg', 'กางเกงแทร็คแบบซิปข้าง ลายคลาสสิกยุค 90s', '2026-08-18 08:39:00'),
(10, 'Adidas Crew Socks (3คู่)', 'adidas', 'ถุงเท้า/แอคเซสซอรี่', '450.00', 0, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/28f94ed29bee428695c887366a74c0af_9366/Unisex_Linear_2-Pack_Crew_Black_KD8392_01_01_00_standard.jpg', 'ถุงเท้าลาย 3 แถบ เนื้อนุ่ม ระบายอากาศดี', '2026-08-18 08:39:00'),
(11, 'Nike Club Fleece Joggers', 'nike', 'กางเกง', '1890.00', 16, 'https://static.nike.com/a/images/t_web_pw_592_v2/f_auto/2fc93d19-819c-4f2b-95a0-10b706a12b53/G+NSW+CLUB+FLC+LOOSE+PANT+LBR.png', 'กางเกงจ๊อกเกอร์ผ้าฟลีซนุ่ม ขอบขาปลายรัด', '2026-08-18 08:39:00'),
(12, 'Adidas Adicolor Hoodie', 'adidas', 'เสื้อฮู้ด/แจ็คเก็ต', '2790.00', 9, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/bd5d28445013439d83769182956b5002_9366/adidas_Adicolor_Loose_2000s_Cali_Tee_Brown_JX1516_21_model.jpg', 'ฮู้ดผ้าหนานุ่ม ทรง oversized ลาย Trefoil', '2026-08-18 08:39:00'),
(13, 'Nike Dri-FIT Running Tee', 'nike', 'เสื้อยืด', '1290.00', 24, 'https://www.jdsports.co.th/cdn/shop/files/jd_IF2083-010_a.jpg?v=1777212393&width=1007', 'เสื้อวิ่งผ้า Dri-FIT ระบายเหงื่อไว น้ำหนักเบา ใส่สบายทุกสภาพอากาศ', '2026-08-23 16:03:09'),
(14, 'Nike Tech Fleece Hoodie', 'nike', 'เสื้อฮู้ด/แจ็คเก็ต', '2990.00', 12, 'https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto/dbcb43d1-d508-4275-b239-f988667d5001/AS+M+NK+TCH+FLC+FZ+WR+HOODIE.png', 'ฮู้ดผ้า Tech Fleece ให้ความอุ่นโดยไม่หนัก ดีไซน์เพรียวบาง', '2026-08-23 16:03:09'),
(16, 'Nike Windrunner Jacket', 'nike', 'เสื้อฮู้ด/แจ็คเก็ต', '3490.00', 8, 'https://static.nike.com/a/images/t_web_pdp_535_v2/f_auto,u_9ddf04c7-2a9a-4d76-add1-d15af8f0263d,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/743c31f2-94fa-4885-b386-30953c1c4943/AS+M+NK+DF+TCH+WVN+WR+FZ+JKT.png', 'แจ็คเก็ตกันลมลายไอคอนิก ระบายอากาศดี พับเก็บง่าย', '2026-08-23 16:03:09'),
(17, 'Nike Everyday Crew Socks (3คู่)', 'nike', 'ถุงเท้า/แอคเซสซอรี่', '490.00', 50, 'https://static.nike.com/a/images/t_web_pw_592_v2/f_auto/u_9ddf04c7-2a9a-4d76-add1-d15af8f0263d,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/4256bf42-ee37-4c45-9c5d-a2caafd5ace3/Y+NK+EVERYDY+CUSH+CREW+6PR+108.png', 'ถุงเท้ากีฬาคุณภาพสูง เนื้อผ้าหนานุ่ม เซ็ต 3 คู่', '2026-08-23 16:03:09'),
(18, 'Adidas Essentials 3-Stripes Tee', 'adidas', 'เสื้อยืด', '1190.00', 20, 'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/91f6445308484f688848aef900b38b11_9366/Tiro_23_League_Training_Jacket_Black_HS7231_01_laydown.jpg', 'เสื้อยืดลาย 3 แถบสัญลักษณ์ ผ้าคอตตอนใส่สบาย', '2026-08-23 16:03:09'),
(19, 'Adidas Tiro Track Jacket', 'adidas', 'เสื้อฮู้ด/แจ็คเก็ต', '2490.00', 15, '', 'แจ็คเก็ตแทร็คสูทคลาสสิก ซิปเต็มตัว ใส่ซ้อนได้ทุกฤดู', '2026-08-23 16:03:09'),
(20, 'Adidas Own The Run Tights', 'adidas', 'กางเกง', '1590.00', 18, 'https://assets.adidas.com/images/w_766,h_766,f_auto,q_auto,fl_lossy,c_fill,g_auto/650c941a756d4923b0f42b9c549ed7d4_9366/Own_the_Run_7-8_Leggings_Black_IS9907_01_laydown.jpg', 'เลกกิ้งวิ่งกระชับกล้ามเนื้อ ผ้ายืดหยุ่นสูง แห้งไว', '2026-08-23 16:03:09'),
(21, 'Adidas Firebird Track Pants', 'adidas', 'กางเกง', '2190.00', 10, 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/31f4360362154baa8b3a89773b67aea7_9366/ADIDAS_DISNEY_FIREBIRD_TRACK_PANTS_Black_KE2741_01_laydown.jpg', 'กางเกงแทร็คแบบซิปข้าง ลายคลาสสิกยุค 90s', '2026-08-23 16:03:09'),
(22, 'Adidas Crew Socks (3คู่)', 'adidas', 'ถุงเท้า/แอคเซสซอรี่', '450.00', 0, 'https://www.supersports.co.th/cdn/shop/files/AD001AC251DDTH-0.jpg?v=1734369544&width=750', 'ถุงเท้าลาย 3 แถบ เนื้อนุ่ม ระบายอากาศดี', '2026-08-23 16:03:09'),
(23, 'Nike Club Fleece Joggers', 'nike', 'กางเกง', '1890.00', 15, 'https://i.ebayimg.com/images/g/1y8AAeSwSFFqWIns/s-l1600.webp', 'กางเกงจ๊อกเกอร์ผ้าฟลีซนุ่ม ขอบขาปลายรัด', '2026-08-23 16:03:09'),
(24, 'Adidas Adicolor Hoodie', 'adidas', 'เสื้อฮู้ด/แจ็คเก็ต', '2790.00', 5, 'https://assets.adidas.com/images/w_500,f_auto,q_auto/fc0b5ffee6d34e67a073aefc01259b3c_9366/Adicolor_Hoodie_Blue_IC3144_01_laydown.jpg', 'ฮู้ดผ้าหนานุ่ม ทรง oversized ลาย Trefoil', '2026-08-23 16:03:09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(160) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('customer','admin') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'customer',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password_hash`, `role`, `created_at`) VALUES
(1, 'Store Admin', 'admin@lane3.demo', 'admin', '$2y$10$A/rlrB4c.bGpiHBAnmOpvus6BqTlMnSLcDCrleylu7lurDhqSWXjC', 'admin', '2026-08-18 08:39:00'),
(4, 'ณัฐดนัย แย้มทับ', 'nai@gmail.com', 'nai', '$2y$10$DeDDzmP9vtfx59hM9uL0t.CqPTtFPPw2rev/WnTE.pRG/TJu5BJWS', 'customer', '2026-08-23 16:04:19'),
(5, 'na', 'na@na', 'na', '$2y$10$.QiVJSLJiVWYiNcoEVKP5O.Not1GbmVdeV9XyP35vjkcb6wOQ1i4C', 'customer', '2026-08-23 16:59:33'),
(6, 'ณัฐดนัย แย้มทับ', 'nai@gmail.com', 'nai14', '$2y$10$9CVSPl11XKzdl./iqWf3OeaUDrkXL65/NxWfDxX0aPo1iQWVpvak.', 'customer', '2026-09-05 21:08:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
