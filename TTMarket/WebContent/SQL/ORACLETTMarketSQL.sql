CREATE TABLE IF NOT EXISTS category (
  seq NUMBER(11) NOT NULL AUTO_INCREMENT,
  categoryName VARCHAR2(20) NOT NULL,
  description VARCHAR2(30) NULL DEFAULT NULL,
  PRIMARY KEY (seq))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS delivery (
  seq NUMBER(11) NOT NULL AUTO_INCREMENT,
  sessionId VARCHAR2(50) NULL DEFAULT NULL,
  name VARCHAR2(20) NULL DEFAULT NULL,
  deliveryDate VARCHAR2(20) NULL DEFAULT NULL,
  nation VARCHAR2(20) NULL DEFAULT NULL,
  zipCode VARCHAR2(10) NULL DEFAULT NULL,
  address VARCHAR2(200) NULL DEFAULT NULL,
  PRIMARY KEY (seq))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS member (
  id VARCHAR2(10) NOT NULL,
  password VARCHAR2(10) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(4) NULL DEFAULT NULL,
  birth VARCHAR2(10) NULL DEFAULT NULL,
  mail VARCHAR2(30) NULL DEFAULT NULL,
  phone VARCHAR2(20) NULL DEFAULT NULL,
  postcode VARCHAR2(5) NULL DEFAULT NULL,
  address VARCHAR2(200) NULL DEFAULT NULL,
  detailAddress VARCHAR2(100) NULL DEFAULT NULL,
  extraAddress VARCHAR2(50) NULL DEFAULT NULL,
  regist_day VARCHAR2(50) NULL DEFAULT NULL,
  grade VARCHAR2(10) NOT NULL DEFAULT '새싹',
  PRIMARY KEY (id))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS product (
  p_id VARCHAR2(10) NOT NULL,
  p_name VARCHAR2(20) NULL DEFAULT NULL,
  p_unitPrice NUMBER(11) NULL DEFAULT NULL,
  p_description TEXT NULL DEFAULT NULL,
  p_category VARCHAR2(20) NULL DEFAULT NULL,
  p_manufacturer VARCHAR2(20) NULL DEFAULT NULL,
  p_unitsinstock NUMBER(11) NULL DEFAULT NULL,
  p_condition VARCHAR2(20) NULL DEFAULT NULL,
  p_fileName VARCHAR2(20) NULL DEFAULT NULL,
  PRIMARY KEY (p_id))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS sale (
  seq NUMBER(11) NOT NULL AUTO_INCREMENT,
  saledate VARCHAR2(20) NULL DEFAULT NULL,
  sessionId VARCHAR2(50) NULL DEFAULT NULL,
  productId VARCHAR2(20) NULL DEFAULT NULL,
  unitprice NUMBER(11) NULL DEFAULT NULL,
  saleqty NUMBER(11) NULL DEFAULT NULL,
  deliveryseq NUMBER(11) NOT NULL,
  status NUMBER(11) NULL DEFAULT NULL,
  PRIMARY KEY (seq))
DEFAULT CHARACTER SET = UTF8;

CREATE TABLE IF NOT EXISTS status (
  statusNumber NUMBER(11) NOT NULL AUTO_INCREMENT,
  status VARCHAR2(20) NOT NULL,
  PRIMARY KEY (statusNumber))
DEFAULT CHARACTER SET = UTF8;