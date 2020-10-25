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
-- Database: `cabygirl_ikbal_maulana`
--

-- --------------------------------------------------------

--
-- Table structure for table `departement_salary`
--

CREATE TABLE `departement_salary` (
  `departementSalaryId` varchar(100) NOT NULL,
  `departementId` varchar(100) NOT NULL,
  `departementSalaryValue` double NOT NULL,
  `departementSalaryStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `deptartement`
--

CREATE TABLE `deptartement` (
  `departementId` varchar(100) NOT NULL,
  `departementName` varchar(100) NOT NULL,
  `departementDescription` text NOT NULL,
  `departementStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discountId` varchar(100) NOT NULL,
  `discountName` varchar(100) NOT NULL,
  `discountStart` date NOT NULL,
  `discountEnd` date NOT NULL,
  `discountDescription` text NOT NULL,
  `discountValue` double NOT NULL,
  `discountType` enum('percentage','fixed') NOT NULL,
  `discountMaxValue` double NOT NULL,
  `discountMinPayment` double NOT NULL,
  `discountLimit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employeeId` varchar(100) NOT NULL,
  `employeeDepartementId` varchar(100) NOT NULL,
  `employeeStatus` int(11) NOT NULL,
  `employeeType` enum('fixed','contract') NOT NULL,
  `employeeName` varchar(100) NOT NULL,
  `employeeCode` varchar(100) NOT NULL,
  `employeeContact` varchar(100) NOT NULL,
  `employeeDOB` date NOT NULL,
  `employeeAddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee_salary`
--

CREATE TABLE `employee_salary` (
  `employeeSalaryId` varchar(100) NOT NULL,
  `employeeSalaryMonth` date NOT NULL,
  `employeeSalaryStatus` int(11) NOT NULL,
  `salaryId` varchar(100) NOT NULL,
  `salaryValue` double NOT NULL,
  `employeeId` varchar(100) NOT NULL,
  `employeeSalaryDepartementId` varchar(100) NOT NULL,
  `employeeSalaryDepartementValue` double NOT NULL,
  `employeeSalarySalesTotal` int(11) NOT NULL,
  `employeeSalarySalesValue` double NOT NULL,
  `employeeSalarySalesId` varchar(100) NOT NULL,
  `employeeSalaryTransportationId` varchar(100) NOT NULL,
  `employeeSalaryTransportationValue` double NOT NULL,
  `employeeSalaryTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `module`
--

CREATE TABLE `module` (
  `moduleId` varchar(100) NOT NULL,
  `moduleName` varchar(100) NOT NULL,
  `moduleStatus` int(11) NOT NULL,
  `moduleIcon` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `opname_stock`
--

CREATE TABLE `opname_stock` (
  `opnameId` varchar(100) NOT NULL,
  `opnameType` enum('broke','expire','lost','reject','sold') NOT NULL,
  `opnameStatus` int(11) NOT NULL,
  `opnamePreviousStock` int(11) NOT NULL,
  `opnameStock` int(11) NOT NULL,
  `opnameValue` int(11) NOT NULL,
  `productStockId` varchar(100) NOT NULL,
  `opnameDescription` text NOT NULL,
  `opnameDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `productId` varchar(100) NOT NULL,
  `productCategoryId` varchar(100) NOT NULL,
  `productName` varchar(100) NOT NULL,
  `productSlug` text NOT NULL,
  `productStatus` int(11) NOT NULL,
  `productDescription` text NOT NULL,
  `productImage` text NOT NULL,
  `productCode` varchar(100) NOT NULL,
  `productHpp` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `productCategoryId` varchar(100) NOT NULL,
  `productCategoryName` varchar(100) NOT NULL,
  `productCategoryDescription` text NOT NULL,
  `productCategoryStatus` int(11) NOT NULL,
  `productCategorySlug` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_discount`
--

CREATE TABLE `product_discount` (
  `productDiscountId` varchar(100) NOT NULL,
  `discountId` varchar(100) NOT NULL,
  `productStockId` varchar(100) NOT NULL,
  `productSKU` varchar(100) NOT NULL,
  `productDiscountLimit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_price`
--

CREATE TABLE `product_price` (
  `productPriceId` varchar(100) NOT NULL,
  `productStockId` varchar(100) NOT NULL,
  `ProductSKU` varchar(100) NOT NULL,
  `productPrice` double NOT NULL,
  `productPriceStatus` int(11) NOT NULL,
  `productPriceName` varchar(100) NOT NULL,
  `productPriceDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_stock`
--

CREATE TABLE `product_stock` (
  `productStockId` varchar(100) NOT NULL,
  `productId` varchar(100) NOT NULL,
  `productVariantId` varchar(100) NOT NULL,
  `productSKU` text NOT NULL,
  `productVariantValue` varchar(100) NOT NULL,
  `productFinalStock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `productVariantId` varchar(100) NOT NULL,
  `productVariantName` varchar(100) NOT NULL,
  `productVariantStatus` int(11) NOT NULL,
  `productVariantDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `salary`
--

CREATE TABLE `salary` (
  `salaryId` varchar(100) NOT NULL,
  `salaryName` varchar(100) NOT NULL,
  `salaryDescription` text NOT NULL,
  `salaryStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `salesId` varchar(100) NOT NULL,
  `salesDate` date NOT NULL,
  `salesStatus` int(11) NOT NULL,
  `employeeId` varchar(100) NOT NULL,
  `buyerName` varchar(100) NOT NULL,
  `buyerContact` varchar(100) NOT NULL,
  `buyerAddress` text NOT NULL,
  `salesTotal` double NOT NULL,
  `salesPaid` double NOT NULL,
  `salesChange` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `salesDetailId` varchar(100) NOT NULL,
  `salesId` varchar(100) NOT NULL,
  `productStockId` varchar(100) NOT NULL,
  `productSKU` varchar(100) NOT NULL,
  `salesQuantity` int(11) NOT NULL,
  `productPrice` double NOT NULL,
  `productDiscCode` varchar(100) NOT NULL,
  `productDiscValue` double NOT NULL,
  `subTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sales_salary`
--

CREATE TABLE `sales_salary` (
  `salesSalaryId` varchar(100) NOT NULL,
  `salesSalaryName` varchar(100) NOT NULL,
  `salesSalaryValue` double NOT NULL,
  `salesSalaryStatus` int(11) NOT NULL,
  `salesSalaryDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transportation_salary`
--

CREATE TABLE `transportation_salary` (
  `transportationSalaryId` varchar(100) NOT NULL,
  `transportationSalaryName` varchar(100) NOT NULL,
  `transportationSalaryValue` double NOT NULL,
  `transportationSalaryStatus` int(11) NOT NULL,
  `transportationSalaryDescription` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userId` varchar(100) NOT NULL,
  `userTypeId` varchar(100) NOT NULL,
  `empoyeeId` varchar(100) CHARACTER SET latin1 NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL,
  `status` int(11) NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_module`
--

CREATE TABLE `user_module` (
  `userModuleId` varchar(100) NOT NULL,
  `userTypeId` varchar(100) NOT NULL,
  `moduleId` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `userTypeId` varchar(100) NOT NULL,
  `userTypeName` varchar(100) NOT NULL,
  `userTypeStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departement_salary`
--
ALTER TABLE `departement_salary`
  ADD PRIMARY KEY (`departementSalaryId`),
  ADD KEY `departementId` (`departementId`);

--
-- Indexes for table `deptartement`
--
ALTER TABLE `deptartement`
  ADD PRIMARY KEY (`departementId`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discountId`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employeeId`),
  ADD KEY `employeeDepartementId` (`employeeDepartementId`);

--
-- Indexes for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD PRIMARY KEY (`employeeSalaryId`),
  ADD KEY `employeeId` (`employeeId`),
  ADD KEY `employeeSalaryDepartementId` (`employeeSalaryDepartementId`),
  ADD KEY `employeeSalarySalesId` (`employeeSalarySalesId`),
  ADD KEY `employeeSalaryTransportationId` (`employeeSalaryTransportationId`),
  ADD KEY `salaryId` (`salaryId`);

--
-- Indexes for table `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`moduleId`);

--
-- Indexes for table `opname_stock`
--
ALTER TABLE `opname_stock`
  ADD PRIMARY KEY (`opnameId`),
  ADD KEY `productStockId` (`productStockId`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `productCategoryId` (`productCategoryId`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`productCategoryId`);

--
-- Indexes for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD PRIMARY KEY (`productDiscountId`),
  ADD KEY `discountId` (`discountId`),
  ADD KEY `productStockId` (`productStockId`),
  ADD KEY `productSKU` (`productSKU`);

--
-- Indexes for table `product_price`
--
ALTER TABLE `product_price`
  ADD PRIMARY KEY (`productPriceId`),
  ADD KEY `productStockId` (`productStockId`);

--
-- Indexes for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD PRIMARY KEY (`productStockId`),
  ADD KEY `productId` (`productId`),
  ADD KEY `productVariantId` (`productVariantId`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`productVariantId`);

--
-- Indexes for table `salary`
--
ALTER TABLE `salary`
  ADD PRIMARY KEY (`salaryId`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`salesId`),
  ADD KEY `employeeId` (`employeeId`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`salesDetailId`),
  ADD KEY `salesId` (`salesId`),
  ADD KEY `productStockId` (`productStockId`);

--
-- Indexes for table `sales_salary`
--
ALTER TABLE `sales_salary`
  ADD PRIMARY KEY (`salesSalaryId`);

--
-- Indexes for table `transportation_salary`
--
ALTER TABLE `transportation_salary`
  ADD PRIMARY KEY (`transportationSalaryId`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `user_type` (`userTypeId`),
  ADD KEY `empoyeeId_2` (`empoyeeId`);

--
-- Indexes for table `user_module`
--
ALTER TABLE `user_module`
  ADD PRIMARY KEY (`userModuleId`),
  ADD KEY `userTypeId` (`userTypeId`),
  ADD KEY `moduleId` (`moduleId`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `departement_salary`
--
ALTER TABLE `departement_salary`
  ADD CONSTRAINT `departement_salary_ibfk_1` FOREIGN KEY (`departementId`) REFERENCES `deptartement` (`departementId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `employee_salary`
--
ALTER TABLE `employee_salary`
  ADD CONSTRAINT `employee_salary_ibfk_1` FOREIGN KEY (`employeeSalaryTransportationId`) REFERENCES `transportation_salary` (`transportationSalaryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_salary_ibfk_2` FOREIGN KEY (`employeeSalarySalesId`) REFERENCES `sales_salary` (`salesSalaryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_salary_ibfk_3` FOREIGN KEY (`employeeId`) REFERENCES `employee` (`employeeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_salary_ibfk_4` FOREIGN KEY (`employeeSalaryDepartementId`) REFERENCES `departement_salary` (`departementSalaryId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employee_salary_ibfk_5` FOREIGN KEY (`salaryId`) REFERENCES `salary` (`salaryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `opname_stock`
--
ALTER TABLE `opname_stock`
  ADD CONSTRAINT `opname_stock_ibfk_1` FOREIGN KEY (`productStockId`) REFERENCES `product_stock` (`productStockId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`productCategoryId`) REFERENCES `product_category` (`productCategoryId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_discount`
--
ALTER TABLE `product_discount`
  ADD CONSTRAINT `product_discount_ibfk_1` FOREIGN KEY (`productStockId`) REFERENCES `product_stock` (`productStockId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_discount_ibfk_2` FOREIGN KEY (`discountId`) REFERENCES `discount` (`discountId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_price`
--
ALTER TABLE `product_price`
  ADD CONSTRAINT `product_price_ibfk_1` FOREIGN KEY (`productStockId`) REFERENCES `product_stock` (`productStockId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_stock`
--
ALTER TABLE `product_stock`
  ADD CONSTRAINT `product_stock_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_stock_ibfk_2` FOREIGN KEY (`productVariantId`) REFERENCES `product_variant` (`productVariantId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD CONSTRAINT `sales_detail_ibfk_1` FOREIGN KEY (`salesId`) REFERENCES `sales` (`salesId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_detail_ibfk_2` FOREIGN KEY (`productStockId`) REFERENCES `product_stock` (`productStockId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userTypeId`) REFERENCES `user_type` (`userTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`empoyeeId`) REFERENCES `employee` (`employeeId`);

--
-- Constraints for table `user_module`
--
ALTER TABLE `user_module`
  ADD CONSTRAINT `user_module_ibfk_1` FOREIGN KEY (`userTypeId`) REFERENCES `user_type` (`userTypeId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_module_ibfk_2` FOREIGN KEY (`moduleId`) REFERENCES `module` (`moduleId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
