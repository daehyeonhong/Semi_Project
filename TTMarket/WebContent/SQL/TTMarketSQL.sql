CREATE TABLE IF NOT EXISTS `TTCategory` (
  `seq` INT(11) NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(20) NOT NULL,
  `description` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`seq`))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS `TTDelivery` (
  `seq` INT(11) NOT NULL AUTO_INCREMENT,
  `sessionId` VARCHAR(50) NULL DEFAULT NULL,
  `name` VARCHAR(20) NULL DEFAULT NULL,
  `deliveryDate` VARCHAR(20) NULL DEFAULT NULL,
  `nation` VARCHAR(20) NULL DEFAULT NULL,
  `zipCode` VARCHAR(10) NULL DEFAULT NULL,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  PRIMARY KEY (`seq`))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS `TTMember` (
  `id` VARCHAR(10) NOT NULL,
  `password` VARCHAR(10) NOT NULL,
  `name` VARCHAR(10) NOT NULL,
  `gender` VARCHAR(4) NULL DEFAULT NULL,
  `birth` VARCHAR(10) NULL DEFAULT NULL,
  `mail` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  `postcode` VARCHAR(5) NULL DEFAULT NULL,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  `detailAddress` VARCHAR(100) NULL DEFAULT NULL,
  `extraAddress` VARCHAR(50) NULL DEFAULT NULL,
  `regist_day` VARCHAR(50) NULL DEFAULT NULL,
  `grade` VARCHAR(10) NOT NULL DEFAULT '새싹',
  PRIMARY KEY (`id`))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS `TTProduct` (
  `p_id` VARCHAR(10) NOT NULL,
  `p_name` VARCHAR(20) NULL DEFAULT NULL,
  `p_unitPrice` INT(11) NULL DEFAULT NULL,
  `p_description` TEXT NULL DEFAULT NULL,
  `p_category` VARCHAR(20) NULL DEFAULT NULL,
  `p_manufacturer` VARCHAR(20) NULL DEFAULT NULL,
  `p_unitsinstock` MEDIUMTEXT NULL DEFAULT NULL,
  `p_condition` VARCHAR(20) NULL DEFAULT NULL,
  `p_fileName` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS `TTSale` (
  `seq` INT(11) NOT NULL AUTO_INCREMENT,
  `saledate` VARCHAR(20) NULL DEFAULT NULL,
  `sessionId` VARCHAR(50) NULL DEFAULT NULL,
  `productId` VARCHAR(20) NULL DEFAULT NULL,
  `unitprice` INT(11) NULL DEFAULT NULL,
  `saleqty` INT(11) NULL DEFAULT NULL,
  `deliveryseq` INT(11) NOT NULL,
  `status` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`seq`))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS `TTStatus` (
  `statusNumber` INT(11) NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`statusNumber`))
DEFAULT CHARACTER SET = UTF8;