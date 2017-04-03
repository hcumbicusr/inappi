/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : inapp

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-04-02 19:45:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(350) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_type_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clients_code_unique` (`code`),
  KEY `clients_client_type_id_foreign` (`client_type_id`),
  CONSTRAINT `clients_client_type_id_foreign` FOREIGN KEY (`client_type_id`) REFERENCES `client_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES ('1', 'HARUM DOLORES680966', 'Vivienne Hoppe', '50586 Turcotte Hill Suite 570', '+0935757178561', 'kdoyle@example.com', '3', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('2', 'QUOS ANIMI901561', 'Greyson Russel', '49840 Funk Mount', '+5088269467126', 'agustin58@example.net', '2', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('3', 'ISTE VOLUPTATIBUS606909', 'Shawn Jones', '51211 Destin Estates', '+7910837895388', 'warren.purdy@example.com', '3', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('4', 'MINUS LABORUM686551', 'Elna Rath', '3219 Lucy Tunnel', '+6989018853834', 'leuschke.haley@example.org', '1', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('5', 'DELENITI ASSUMENDA286975', 'Kaylie Auer', '5494 Bernhard Run', '+1791445935232', 'brooks51@example.org', '2', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('6', 'EXERCITATIONEM ODIT194815', 'Ms. Annabel Kling I', '9011 Elda Circles Suite 900', '+2313603685852', 'minerva09@example.net', '2', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('7', 'VOLUPTATEM INVENTORE245909', 'Mr. Matt Kemmer', '795 Bethany Stravenue', '+9200041343102', 'ernestine.williamson@example.org', '2', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('8', 'MAXIME AUT704514', 'Hailey Haley', '415 Edythe Lodge Apt. 093', '+2043205380564', 'andres.okeefe@example.net', '3', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('9', 'QUIS QUO242904', 'Gerda Stokes', '2144 Jared Unions Suite 044', '+5570165899629', 'lucie56@example.net', '3', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `clients` VALUES ('10', 'REPELLAT SIT905406', 'Ms. Mariane O\'Reilly', '9828 Lind Square Suite 302', '+6056204533685', 'ledner.arnaldo@example.com', '1', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');

-- ----------------------------
-- Table structure for client_type
-- ----------------------------
DROP TABLE IF EXISTS `client_type`;
CREATE TABLE `client_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_type_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of client_type
-- ----------------------------
INSERT INTO `client_type` VALUES ('1', 'saepe660', 'Adipisci minus numquam soluta molestiae quam iusto omnis. Quidem id nisi rerum est. Magni reprehenderit vero consectetur aspernatur saepe autem.', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `client_type` VALUES ('2', 'vero333', 'Consequatur id exercitationem non. Vero rerum voluptatem provident sed et cum sint. Repellendus neque ut nostrum.', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `client_type` VALUES ('3', 'ex606', 'Quae vero eveniet in. Velit nesciunt numquam laudantium cum nisi dolores ut. Repellendus harum voluptatem unde repudiandae. Vero quam iusto ex quod veritatis beatae laudantium.', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO `country` VALUES ('1', 'debitis484840727', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `country_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `department_name_unique` (`name`),
  KEY `department_country_id_foreign` (`country_id`),
  CONSTRAINT `department_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'sit dolorum impedit734', '1', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `department` VALUES ('2', 'nihil velit nisi336', '1', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `department` VALUES ('3', 'expedita sequi cum643', '1', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');
INSERT INTO `department` VALUES ('4', 'et non omnis842', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('5', 'voluptatem deserunt dolorum376', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('6', 'repudiandae ipsum est162', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('7', 'id doloremque quis55', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('8', 'omnis qui non224', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('9', 'sit fugit minima926', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('10', 'fuga illo et251', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('11', 'asperiores modi dolore332', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('12', 'possimus est molestiae665', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('13', 'magnam ab natus102', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('14', 'eum in fugit251', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('15', 'iste ratione ea818', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('16', 'et animi consequatur266', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('17', 'velit et optio73', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('18', 'dolorem autem veniam753', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('19', 'et ullam tempora431', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('20', 'dolor occaecati et84', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('21', 'voluptate deleniti consequatur859', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('22', 'consectetur fugiat vero713', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('23', 'necessitatibus quasi vel855', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `department` VALUES ('24', 'exercitationem quia cum566', '1', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');

-- ----------------------------
-- Table structure for district
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `province_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `district_name_unique` (`name`),
  KEY `district_province_id_foreign` (`province_id`),
  CONSTRAINT `district_province_id_foreign` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=501 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', 'nesciunt qui nemo508', '134', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `district` VALUES ('2', 'distinctio et rem784', '187', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `district` VALUES ('3', 'omnis est laudantium720', '103', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('4', 'harum ullam vel776', '33', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('5', 'consequatur aperiam autem545', '10', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('6', 'veniam optio voluptas354', '74', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('7', 'sapiente natus ut945', '207', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('8', 'tempora maxime voluptas211', '125', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('9', 'ut non quam562', '97', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('10', 'animi voluptatibus inventore659', '206', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('11', 'non sed incidunt239', '246', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('12', 'est deserunt odit193', '118', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('13', 'quo expedita laudantium901', '25', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('14', 'harum voluptatum adipisci738', '43', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('15', 'nemo ex autem660', '225', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('16', 'quia architecto voluptatum420', '214', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('17', 'voluptatem ullam sint822', '213', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('18', 'iste eos voluptatum654', '137', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('19', 'eum quia consectetur218', '51', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('20', 'sint dolorem sit607', '221', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('21', 'id rem sit170', '184', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('22', 'dolor fugiat exercitationem257', '90', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('23', 'est sit et450', '18', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('24', 'vitae et voluptates448', '74', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('25', 'et consequatur in333', '181', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('26', 'numquam occaecati perferendis538', '250', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('27', 'aut ipsum sunt783', '248', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('28', 'sit voluptatem labore327', '68', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('29', 'inventore dicta cupiditate7', '216', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('30', 'voluptas sapiente dolore347', '184', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('31', 'rerum quo aut596', '43', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('32', 'veritatis voluptatem magnam338', '207', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('33', 'maiores suscipit atque546', '181', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('34', 'asperiores provident ratione85', '158', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('35', 'et omnis architecto660', '128', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('36', 'autem autem eaque513', '217', '1', '2016-12-28 07:01:32', '2016-12-28 07:01:32');
INSERT INTO `district` VALUES ('37', 'sequi repudiandae doloremque305', '18', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('38', 'non porro laudantium882', '108', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('39', 'quas velit porro906', '34', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('40', 'impedit eum deleniti633', '184', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('41', 'quasi at vel529', '170', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('42', 'inventore est voluptas174', '82', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('43', 'aut velit temporibus653', '138', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('44', 'rerum distinctio quo712', '12', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('45', 'explicabo rem dolorum72', '126', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('46', 'tempore architecto ratione573', '75', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('47', 'illo laboriosam vero277', '191', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('48', 'rerum laboriosam sint476', '186', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('49', 'est eligendi quasi10', '35', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('50', 'eius non voluptate501', '165', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('51', 'non incidunt dolores125', '159', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('52', 'mollitia non natus700', '85', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('53', 'quidem voluptas cumque694', '196', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('54', 'numquam aut similique189', '217', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('55', 'unde nisi non607', '117', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('56', 'sunt sit in856', '116', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('57', 'sed eveniet consequatur335', '187', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('58', 'exercitationem iure autem579', '92', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('59', 'nostrum eveniet nobis10', '6', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('60', 'in et cum152', '201', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('61', 'cumque sit mollitia427', '137', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('62', 'expedita sunt in774', '34', '1', '2016-12-28 07:01:33', '2016-12-28 07:01:33');
INSERT INTO `district` VALUES ('63', 'enim maiores expedita450', '249', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('64', 'doloremque quis ut639', '153', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('65', 'provident assumenda esse478', '239', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('66', 'corporis illum occaecati355', '169', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('67', 'ut eligendi maiores634', '198', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('68', 'commodi perspiciatis dignissimos354', '35', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('69', 'minima qui placeat720', '115', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('70', 'velit vel incidunt198', '238', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('71', 'eos vel tempora682', '1', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('72', 'eos tempore facilis597', '223', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('73', 'reiciendis ut tempora240', '40', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('74', 'voluptates consequatur nobis901', '215', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('75', 'officia deleniti qui352', '155', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('76', 'nam voluptatem culpa356', '175', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('77', 'sequi occaecati et760', '91', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('78', 'molestiae animi qui954', '150', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('79', 'sit consequatur recusandae101', '19', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('80', 'ea consequuntur blanditiis843', '55', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('81', 'voluptas consequatur est476', '219', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('82', 'corporis sint sint157', '10', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('83', 'consequatur blanditiis a701', '157', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('84', 'incidunt autem sit936', '74', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('85', 'a pariatur quia674', '12', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('86', 'qui est a847', '13', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('87', 'magni animi voluptatibus310', '146', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('88', 'quia ad ullam561', '162', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('89', 'nostrum laboriosam delectus981', '114', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('90', 'amet aliquam ab672', '180', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('91', 'deserunt dolor ut26', '188', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('92', 'blanditiis provident qui369', '72', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('93', 'quaerat velit nobis331', '222', '1', '2016-12-28 07:01:34', '2016-12-28 07:01:34');
INSERT INTO `district` VALUES ('94', 'reiciendis minus velit372', '237', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('95', 'vel soluta repellat296', '129', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('96', 'nemo voluptas aut724', '56', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('97', 'dolores repellat quae767', '152', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('98', 'quia consequatur voluptatem651', '72', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('99', 'accusamus est delectus880', '3', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('100', 'iste aliquam incidunt421', '28', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('101', 'cum qui cupiditate944', '150', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('102', 'vel perspiciatis rem410', '87', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('103', 'aliquid hic dolor372', '158', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('104', 'facere architecto ullam966', '43', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('105', 'est pariatur qui768', '66', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('106', 'at non magnam4', '98', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('107', 'voluptas neque consectetur29', '130', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('108', 'optio perspiciatis sed489', '131', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('109', 'ipsum perspiciatis qui245', '41', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('110', 'est sed aut926', '6', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('111', 'et eveniet omnis369', '194', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('112', 'fuga atque dicta424', '242', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('113', 'impedit consequatur ex240', '233', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('114', 'eos enim molestiae830', '245', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('115', 'voluptatem eos odio688', '3', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('116', 'quia tempore sit712', '231', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('117', 'possimus beatae at776', '130', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('118', 'consequatur dolores reprehenderit356', '154', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('119', 'nihil recusandae quo41', '242', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('120', 'aut error temporibus972', '175', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('121', 'eum qui nesciunt251', '193', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('122', 'et quidem hic18', '57', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('123', 'consectetur soluta sint329', '149', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('124', 'ipsum sapiente vero958', '49', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('125', 'autem magni et792', '202', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('126', 'odit vero quasi894', '156', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('127', 'ducimus qui et847', '71', '1', '2016-12-28 07:01:35', '2016-12-28 07:01:35');
INSERT INTO `district` VALUES ('128', 'accusantium dolorem pariatur813', '150', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('129', 'sit consequatur ipsa58', '74', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('130', 'rerum ut eveniet483', '24', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('131', 'earum quisquam et705', '67', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('132', 'dolor repellendus non953', '55', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('133', 'commodi doloremque mollitia452', '6', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('134', 'mollitia consequuntur facilis46', '60', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('135', 'ipsam quod debitis615', '245', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('136', 'ad minus harum520', '145', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('137', 'consequatur cupiditate repudiandae263', '152', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('138', 'itaque alias est312', '89', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('139', 'voluptatem natus aut25', '209', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('140', 'tenetur mollitia qui926', '126', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('141', 'facere doloremque ullam118', '30', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('142', 'sapiente quo autem8', '236', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('143', 'soluta doloremque est275', '91', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('144', 'deleniti aperiam officia411', '216', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('145', 'eaque eveniet rerum753', '208', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('146', 'facilis velit rerum152', '85', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('147', 'assumenda voluptas eum197', '178', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('148', 'accusantium non et665', '188', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('149', 'omnis vitae impedit549', '147', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('150', 'commodi ut officiis257', '180', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('151', 'cupiditate a deserunt618', '28', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('152', 'voluptatem et sit816', '8', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('153', 'quis aliquid neque544', '55', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('154', 'vel maxime ut519', '139', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('155', 'ut delectus ea861', '121', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('156', 'in adipisci nihil107', '167', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('157', 'quis distinctio recusandae63', '110', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('158', 'consequatur eos esse595', '184', '1', '2016-12-28 07:01:36', '2016-12-28 07:01:36');
INSERT INTO `district` VALUES ('159', 'ratione assumenda voluptatem434', '85', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('160', 'omnis odit qui322', '169', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('161', 'qui sit eligendi834', '223', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('162', 'eaque voluptas sunt954', '161', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('163', 'id omnis voluptatum124', '127', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('164', 'voluptatem eos voluptatum337', '72', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('165', 'deleniti deleniti consequatur471', '12', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('166', 'possimus esse reiciendis466', '107', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('167', 'cum repellat non667', '129', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('168', 'optio nisi temporibus667', '155', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('169', 'voluptatem iure nam772', '105', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('170', 'necessitatibus in eius580', '100', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('171', 'nihil recusandae neque538', '8', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('172', 'et quam voluptatem236', '36', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('173', 'deserunt excepturi veritatis54', '238', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('174', 'et non ipsum900', '91', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('175', 'est est impedit284', '174', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('176', 'error reprehenderit aliquid772', '71', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('177', 'quia quam ea480', '143', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('178', 'distinctio qui aut59', '41', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('179', 'impedit id qui612', '102', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('180', 'quas quisquam nostrum902', '98', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('181', 'impedit magni non174', '161', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('182', 'hic repudiandae dicta13', '135', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('183', 'omnis asperiores iste857', '115', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('184', 'quasi sapiente et366', '54', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('185', 'ut similique velit80', '32', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('186', 'iure dolores voluptas664', '82', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('187', 'sit omnis dolores596', '218', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('188', 'nihil sapiente aliquid36', '196', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('189', 'quam et est138', '207', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('190', 'ut perspiciatis doloribus22', '43', '1', '2016-12-28 07:01:37', '2016-12-28 07:01:37');
INSERT INTO `district` VALUES ('191', 'iusto aut iste540', '184', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('192', 'soluta et odio663', '129', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('193', 'quas sed magni691', '135', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('194', 'ut hic sit557', '102', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('195', 'dolorem ea magni374', '171', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('196', 'autem aliquid nihil669', '189', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('197', 'laborum atque quas229', '22', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('198', 'aut aspernatur voluptates160', '69', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('199', 'quisquam consequatur labore375', '25', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('200', 'debitis nihil voluptate195', '191', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('201', 'quas ex soluta239', '206', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('202', 'et ducimus qui178', '200', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('203', 'distinctio maxime id583', '228', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('204', 'dolor explicabo quis297', '85', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('205', 'odio ut ut193', '67', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('206', 'exercitationem aut voluptas426', '205', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('207', 'porro dolore veritatis769', '37', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('208', 'rerum animi ut559', '78', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('209', 'aspernatur rerum et851', '34', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('210', 'asperiores accusantium ad135', '212', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('211', 'beatae magnam ea858', '87', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('212', 'reiciendis libero veniam907', '128', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('213', 'illo et minima969', '185', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('214', 'qui assumenda nobis704', '136', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('215', 'distinctio commodi ipsam462', '130', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('216', 'est iure labore899', '137', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('217', 'iure quasi eum189', '107', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('218', 'dignissimos provident omnis848', '14', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('219', 'dolore ea vitae214', '140', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('220', 'voluptas sit explicabo153', '85', '1', '2016-12-28 07:01:38', '2016-12-28 07:01:38');
INSERT INTO `district` VALUES ('221', 'at doloribus ab208', '23', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('222', 'omnis perspiciatis ex333', '88', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('223', 'velit soluta odio378', '181', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('224', 'odio placeat ipsam534', '146', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('225', 'unde explicabo animi713', '172', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('226', 'ut eveniet eveniet936', '176', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('227', 'amet nisi voluptate497', '112', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('228', 'quo magnam nostrum813', '169', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('229', 'odit culpa assumenda523', '54', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('230', 'maiores est voluptatem864', '182', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('231', 'nihil eveniet voluptate167', '76', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('232', 'animi rerum et206', '119', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('233', 'ipsam delectus repudiandae206', '107', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('234', 'et ea maiores706', '46', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('235', 'quia quia voluptatibus693', '245', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('236', 'et aut voluptates784', '158', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('237', 'provident ut dolores719', '247', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('238', 'non optio aliquid491', '154', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('239', 'quaerat saepe sunt307', '200', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('240', 'porro dolorum voluptatem483', '117', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('241', 'rerum harum aut488', '149', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('242', 'aspernatur dolores sit789', '87', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('243', 'placeat ut consequatur710', '24', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('244', 'rerum veritatis aut40', '116', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('245', 'at modi dolor441', '161', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('246', 'ut sunt ullam6', '129', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('247', 'sed quasi eum179', '206', '1', '2016-12-28 07:01:39', '2016-12-28 07:01:39');
INSERT INTO `district` VALUES ('248', 'aut aut dolor84', '16', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('249', 'at ut nulla767', '142', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('250', 'consequatur quia sapiente469', '16', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('251', 'minima atque numquam573', '192', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('252', 'ab esse voluptatem612', '91', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('253', 'laboriosam et laboriosam89', '119', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('254', 'architecto vel quis857', '21', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('255', 'laudantium velit sit30', '4', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('256', 'ut expedita vero20', '93', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('257', 'libero laudantium provident318', '87', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('258', 'assumenda quas laborum73', '34', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('259', 'consectetur aperiam dignissimos736', '86', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('260', 'voluptas tempora et814', '187', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('261', 'nobis non explicabo110', '4', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('262', 'illo ut nostrum303', '148', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('263', 'nostrum id ut712', '223', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('264', 'omnis enim quam375', '224', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('265', 'qui dolorum officia235', '154', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('266', 'id sed officia983', '77', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('267', 'odio quae eveniet659', '97', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('268', 'quam ipsa consequatur152', '179', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('269', 'eius debitis itaque346', '42', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('270', 'est quia libero760', '9', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('271', 'voluptate praesentium illum484', '126', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('272', 'et aliquid tempora621', '14', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('273', 'impedit architecto ex826', '67', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('274', 'sed consectetur aut295', '193', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('275', 'rem quos quia180', '26', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('276', 'et aut aut817', '118', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('277', 'assumenda officia occaecati35', '17', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('278', 'sit sed inventore136', '27', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('279', 'ut sunt repellat104', '31', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('280', 'voluptatum ab eveniet658', '74', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('281', 'velit laborum nobis111', '192', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('282', 'voluptas dolorem et694', '83', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('283', 'rerum ut voluptates236', '215', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('284', 'exercitationem illo quos874', '67', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('285', 'voluptates odio alias44', '29', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('286', 'labore voluptatibus perferendis256', '3', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('287', 'quia similique in909', '31', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('288', 'et quas dolore565', '221', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('289', 'incidunt dolores hic864', '197', '1', '2016-12-28 07:01:40', '2016-12-28 07:01:40');
INSERT INTO `district` VALUES ('290', 'sunt enim rerum772', '145', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('291', 'itaque et facilis365', '241', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('292', 'temporibus repellendus in462', '81', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('293', 'dignissimos magnam beatae678', '8', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('294', 'adipisci neque id543', '227', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('295', 'quis recusandae ea559', '97', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('296', 'ullam doloribus deleniti610', '194', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('297', 'veniam voluptatum excepturi586', '93', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('298', 'recusandae dignissimos accusantium926', '60', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('299', 'non quidem ut300', '209', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('300', 'autem alias vero300', '84', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('301', 'aut unde ut864', '53', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('302', 'saepe non ea475', '97', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('303', 'ullam officiis eum849', '214', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('304', 'impedit id doloribus812', '248', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('305', 'debitis voluptas ea1000', '31', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('306', 'itaque in non39', '119', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('307', 'voluptatem ea voluptatum168', '127', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('308', 'in consequuntur sunt290', '76', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('309', 'odio rem voluptas20', '114', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('310', 'quas est et915', '64', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('311', 'odit natus et116', '98', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('312', 'est itaque enim527', '66', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('313', 'ut ut fugit347', '123', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('314', 'quo quod quaerat84', '124', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('315', 'voluptatem recusandae amet332', '31', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('316', 'numquam est tempore798', '66', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('317', 'enim exercitationem dolor391', '55', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('318', 'aut asperiores sequi405', '100', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('319', 'quis sunt iusto366', '55', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('320', 'quibusdam odio voluptas769', '196', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('321', 'modi vel maiores0', '31', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('322', 'placeat ex alias795', '21', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('323', 'sint aut voluptate796', '191', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('324', 'aspernatur et nemo61', '227', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('325', 'expedita sunt molestiae41', '60', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('326', 'velit sit voluptas996', '170', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('327', 'iusto voluptatem repellat506', '90', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('328', 'reiciendis dolore consequuntur335', '246', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('329', 'odit eius veritatis895', '47', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('330', 'sed assumenda dolorum794', '38', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('331', 'aperiam non ab504', '179', '1', '2016-12-28 07:01:41', '2016-12-28 07:01:41');
INSERT INTO `district` VALUES ('332', 'saepe consequatur fugit915', '237', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('333', 'est nisi mollitia946', '165', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('334', 'nobis voluptatem voluptatum175', '2', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('335', 'necessitatibus nam labore581', '170', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('336', 'deserunt ipsum ipsum572', '1', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('337', 'sequi repellendus ipsa722', '74', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('338', 'non qui dolores949', '167', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('339', 'nisi quo dicta9', '130', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('340', 'mollitia temporibus illum516', '175', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('341', 'omnis qui hic621', '132', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('342', 'qui sunt beatae147', '42', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('343', 'cum ad est863', '31', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('344', 'occaecati aut consequatur213', '199', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('345', 'adipisci in nesciunt917', '109', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('346', 'ab quis consequuntur438', '152', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('347', 'dolores quisquam molestias667', '74', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('348', 'corrupti asperiores incidunt901', '188', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('349', 'labore rerum voluptatem237', '16', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('350', 'modi expedita id8', '2', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('351', 'distinctio explicabo aliquam372', '207', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('352', 'nemo est dolorum844', '180', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('353', 'ea in omnis453', '29', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('354', 'ipsam amet sunt447', '34', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('355', 'deleniti et sit461', '248', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('356', 'qui aliquid ad906', '130', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('357', 'quia rerum quis388', '56', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('358', 'ea quo porro388', '217', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('359', 'qui consequatur eaque334', '87', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('360', 'non ducimus id977', '9', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('361', 'nisi voluptate nesciunt106', '12', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('362', 'dolorem voluptas sit867', '99', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('363', 'sunt laboriosam soluta814', '158', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('364', 'harum voluptas assumenda960', '6', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('365', 'aut qui animi903', '182', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('366', 'inventore dicta tenetur128', '116', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('367', 'reiciendis esse sed354', '196', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('368', 'adipisci vel quas35', '118', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('369', 'eos impedit maxime328', '86', '1', '2016-12-28 07:01:42', '2016-12-28 07:01:42');
INSERT INTO `district` VALUES ('370', 'pariatur pariatur molestiae614', '61', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('371', 'repellendus quia voluptas157', '205', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('372', 'sit omnis nobis790', '133', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('373', 'ipsum dolorem ipsa145', '50', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('374', 'autem velit totam438', '177', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('375', 'ea culpa qui327', '151', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('376', 'consequatur laudantium ut791', '137', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('377', 'velit voluptatem quia241', '34', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('378', 'similique beatae voluptate15', '22', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('379', 'tempora cumque consequatur538', '210', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('380', 'sed eveniet a135', '86', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('381', 'iure qui unde671', '214', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('382', 'et et iusto491', '25', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('383', 'facere non impedit493', '246', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('384', 'doloremque neque ut520', '38', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('385', 'harum quisquam consectetur532', '169', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('386', 'labore et modi890', '144', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('387', 'voluptatem sint sint126', '9', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('388', 'non exercitationem quas924', '31', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('389', 'perspiciatis suscipit accusamus960', '225', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('390', 'non sapiente ut14', '208', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('391', 'veniam ipsa consequatur788', '42', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('392', 'ut est aut521', '105', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('393', 'cum ipsa nobis781', '222', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('394', 'ipsum aut ut900', '52', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('395', 'distinctio dolorum omnis422', '236', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('396', 'quos eius ut330', '106', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('397', 'consequatur atque ut276', '201', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('398', 'quae est nemo543', '82', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('399', 'dicta nihil non861', '194', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('400', 'rerum mollitia necessitatibus340', '103', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('401', 'fugiat est exercitationem668', '5', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('402', 'sed quam facere736', '218', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('403', 'omnis officia ipsa452', '185', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('404', 'dolores suscipit id561', '56', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('405', 'debitis omnis dicta647', '123', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('406', 'quos voluptatum non659', '80', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('407', 'velit eligendi veniam621', '177', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('408', 'quaerat sunt suscipit528', '78', '1', '2016-12-28 07:01:43', '2016-12-28 07:01:43');
INSERT INTO `district` VALUES ('409', 'eveniet corrupti sed27', '112', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('410', 'illum saepe voluptatum434', '54', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('411', 'delectus id quaerat310', '62', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('412', 'molestiae ut similique133', '37', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('413', 'quos animi totam8', '2', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('414', 'amet qui esse341', '154', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('415', 'quo neque ut621', '226', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('416', 'nihil quam cupiditate704', '216', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('417', 'fugit ratione minima917', '211', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('418', 'est harum excepturi588', '102', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('419', 'cumque odit dolor161', '154', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('420', 'impedit velit ab908', '40', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('421', 'optio et necessitatibus839', '87', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('422', 'dicta quo perferendis347', '170', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('423', 'alias quis soluta225', '173', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('424', 'ut cupiditate libero555', '27', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('425', 'libero non et409', '41', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('426', 'qui nostrum corporis572', '56', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('427', 'ex ipsum saepe809', '52', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('428', 'tenetur fugit ipsa784', '37', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('429', 'ea dolores provident475', '28', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('430', 'fugiat occaecati autem83', '103', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('431', 'et natus et90', '15', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('432', 'labore iure rerum198', '111', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('433', 'itaque voluptatum quibusdam992', '192', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('434', 'quas quos enim247', '211', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('435', 'minima molestiae porro241', '161', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('436', 'eaque in voluptas696', '195', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('437', 'molestiae nisi consequatur983', '114', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('438', 'quisquam nihil quia404', '209', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('439', 'ut quidem quod599', '26', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('440', 'et sunt quis904', '85', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('441', 'ipsum modi odit182', '59', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('442', 'reiciendis et explicabo265', '143', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('443', 'voluptatum dicta nihil816', '172', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('444', 'necessitatibus ea eos203', '54', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('445', 'vel nulla commodi716', '225', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('446', 'voluptate consequatur nulla264', '198', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('447', 'officiis illo corporis103', '160', '1', '2016-12-28 07:01:44', '2016-12-28 07:01:44');
INSERT INTO `district` VALUES ('448', 'pariatur quidem a789', '103', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('449', 'quia atque debitis619', '161', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('450', 'architecto earum maiores717', '125', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('451', 'aut quo voluptatem480', '232', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('452', 'libero dignissimos placeat103', '101', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('453', 'quia veniam officia37', '60', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('454', 'aut recusandae eligendi145', '106', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('455', 'ut commodi qui175', '107', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('456', 'voluptatum sed eum863', '151', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('457', 'laboriosam cupiditate vel506', '94', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('458', 'est ducimus eveniet705', '114', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('459', 'veniam inventore voluptas115', '84', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('460', 'hic est aut277', '185', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('461', 'dicta illum voluptas324', '186', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('462', 'non totam eligendi892', '125', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('463', 'ut at alias688', '184', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('464', 'eius nemo recusandae480', '80', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('465', 'quia ut rem582', '70', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('466', 'et facere architecto524', '37', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('467', 'qui minus corporis889', '211', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('468', 'id velit molestiae711', '161', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('469', 'explicabo vero est990', '205', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('470', 'pariatur aut quia658', '232', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('471', 'nam mollitia accusamus307', '62', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('472', 'ea reiciendis libero469', '206', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('473', 'dolor aut aperiam471', '187', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('474', 'delectus reprehenderit vero57', '158', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('475', 'vero sapiente commodi254', '191', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('476', 'voluptatibus rerum aut100', '70', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('477', 'pariatur et hic294', '130', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('478', 'rerum in eos289', '60', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('479', 'sunt accusantium est455', '202', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('480', 'quia explicabo odit609', '35', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('481', 'nihil ut accusantium271', '124', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('482', 'nostrum consequatur ipsa121', '248', '1', '2016-12-28 07:01:45', '2016-12-28 07:01:45');
INSERT INTO `district` VALUES ('483', 'sequi nisi atque277', '60', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('484', 'fugit perferendis doloremque649', '184', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('485', 'rerum assumenda unde628', '137', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('486', 'exercitationem ducimus animi504', '204', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('487', 'maiores nihil quasi826', '159', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('488', 'in eum sit931', '26', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('489', 'non rem suscipit983', '67', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('490', 'voluptatum ex quo46', '23', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('491', 'molestiae facilis natus818', '216', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('492', 'repellendus qui quis934', '44', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('493', 'non voluptatem exercitationem422', '185', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('494', 'minima fuga numquam210', '166', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('495', 'neque explicabo et838', '156', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('496', 'itaque natus occaecati750', '209', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('497', 'quam id voluptatem868', '221', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('498', 'quis quis ipsum813', '78', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('499', 'numquam minus earum101', '140', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');
INSERT INTO `district` VALUES ('500', 'nemo doloribus expedita893', '189', '1', '2016-12-28 07:01:46', '2016-12-28 07:01:46');

-- ----------------------------
-- Table structure for locals
-- ----------------------------
DROP TABLE IF EXISTS `locals`;
CREATE TABLE `locals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `business_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `dirname` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `headquarters` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `manager` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `web` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `longitude` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url_photo` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_type_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `deleted` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locals_ruc_unique` (`ruc`),
  UNIQUE KEY `code` (`code`),
  KEY `locals_local_type_id_foreign` (`local_type_id`),
  KEY `locals_district_id_foreign` (`district_id`),
  KEY `locals_client_id_foreign` (`client_id`),
  CONSTRAINT `locals_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `locals_district_id_foreign` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`),
  CONSTRAINT `locals_local_type_id_foreign` FOREIGN KEY (`local_type_id`) REFERENCES `local_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of locals
-- ----------------------------
INSERT INTO `locals` VALUES ('1', 'LOC1', 'title 1', 'business_name 1', '20101010101', 'LOC1_20101010101', 'headquarters 1', 'manager 1', 'address 1', '909090901', 'email 1', 'web 1', 'latitude 1', 'longitude 1', 'url_photo 1', '1', '1', '1', '0', '1', '2017-04-02 11:44:51', null);
INSERT INTO `locals` VALUES ('2', 'LOC2', 'title 2', 'business_name 2', '20101010102', 'LOC2_20101010102', 'headquarters 2', 'manager 2', 'address 2', '909090902', 'email 2', 'web 2', 'latitude 2', 'longitude 2', 'url_photo 2', '2', '2', '2', '0', '1', '2017-04-02 11:45:31', null);
INSERT INTO `locals` VALUES ('3', 'LOC3', 'title 3', 'business_name 3', '20101010103', 'LOC3_20101010103', 'headquarters 3', 'manager 3', 'address 3', '909090903', 'email 3', 'web 3', 'latitude 3', 'longitude 3', 'url_photo 3', '3', '3', '3', '0', '1', '2017-04-02 11:45:36', null);
INSERT INTO `locals` VALUES ('4', 'LOC4', 'title 4', 'business_name 4', '20101010104', 'LOC4_20101010104', 'headquarters 4', 'manager 4', 'address 4', '909090904', 'email 4', 'web 4', 'latitude 4', 'longitude 4', 'url_photo 4', '4', '4', '4', '0', '1', '2017-04-02 11:45:43', null);
INSERT INTO `locals` VALUES ('5', 'LOC5', 'title 5', 'business_name 5', '20101010105', 'LOC5_20101010105', 'headquarters 5', 'manager 5', 'address 5', '909090905', 'email 5', 'web 5', 'latitude 5', 'longitude 5', 'url_photo 5', '5', '5', '5', '0', '1', '2017-04-02 11:45:49', null);
INSERT INTO `locals` VALUES ('9', 'LOC6', 'title 6', 'business_name 6', '20101010106', 'LOC6_20101010106', 'headquarters 6', 'manager 6', 'address 6', '909090906', 'email 6', 'web 6', 'latitude 6', 'longitude 6', 'url_photo 6', '1', '4', '2', '0', '1', '2017-04-02 11:51:00', null);
INSERT INTO `locals` VALUES ('10', 'LOC7', 'title 7', 'business_name 7', '20101010107', 'LOC7_20101010107', 'headquarters 7', 'manager 7', 'address 7', '909090907', 'email 7', 'web 7', 'latitude 7', 'longitude 7', 'url_photo 7', '1', '4', '2', '0', '1', '2017-04-02 12:39:22', null);

-- ----------------------------
-- Table structure for local_rating
-- ----------------------------
DROP TABLE IF EXISTS `local_rating`;
CREATE TABLE `local_rating` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `local_id` int(11) NOT NULL,
  `user_app_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `url_image_1` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_image_2` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_image_3` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `like` int(11) NOT NULL DEFAULT '0',
  `dont_like` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of local_rating
-- ----------------------------

-- ----------------------------
-- Table structure for local_type
-- ----------------------------
DROP TABLE IF EXISTS `local_type`;
CREATE TABLE `local_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `local_type_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of local_type
-- ----------------------------
INSERT INTO `local_type` VALUES ('1', 'qui635', 'Impedit illum qui fuga dicta. Suscipit deleniti consequatur dignissimos tenetur et facere velit. Id sit magni ipsum iste provident sit voluptas. Quod quisquam enim et ea minima sit asperiores.', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `local_type` VALUES ('2', 'est107', 'Et molestiae tenetur voluptas ut ad. Exercitationem sunt hic id est nostrum quo. Aspernatur qui possimus quisquam illum dignissimos quo laboriosam.', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `local_type` VALUES ('3', 'eaque929', 'Rem dolores hic magni beatae suscipit. Iusto error maxime exercitationem magnam et cumque consequatur odio. Sequi delectus nihil minima.', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `local_type` VALUES ('4', 'aliquam229', 'Error quia molestiae amet sunt ut ea nesciunt ea. Non natus id ea non iusto impedit. Fugiat odio et exercitationem harum. Explicabo temporibus culpa porro ut.', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `local_type` VALUES ('5', 'quis639', 'Ipsum iusto odit suscipit qui sunt. Et doloribus nulla voluptatem impedit pariatur provident. Voluptates animi quis optio est. Ipsam reprehenderit nobis sit nisi.', '1', '2016-12-28 07:01:21', '2016-12-28 07:01:21');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_user_app_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_215507_create_local_type_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_232149_create_client_type_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_232243_create_clients_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_234223_create_country_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_234247_create_department_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_234304_create_province_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_234412_create_district_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_15_235539_create_locals_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_16_000936_create_maps_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_28_035031_create_permissions_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_28_050353_create_super_user_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_28_050600_create_staff_type_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_28_050738_create_staff_table', '1');
INSERT INTO `migrations` VALUES ('2016_12_28_053548_create_users_table', '1');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_code_unique` (`code`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'EA708', 'quis560', 'Incidunt ab accusamus ullam unde perspiciatis minima. Et repellat officiis rerum accusantium molestiae eligendi ducimus.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('2', 'AD401', 'labore258', 'Aut esse quia aut consequatur tempora id incidunt. Soluta fuga earum recusandae qui omnis nam. Aliquid consectetur accusamus excepturi eius minus occaecati aliquam.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('3', 'IPSA8', 'error362', 'Alias delectus molestias quam id nihil. Iure est ut sed enim debitis voluptas veritatis. Voluptates ut rerum unde est vel eos. Exercitationem dolorem doloremque amet ea neque omnis.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('4', 'EXERCITATI', 'quaerat948', 'Velit alias ipsa sed sint. Consequatur perspiciatis omnis architecto qui esse aut non. Atque rerum ut itaque qui doloremque atque ipsam.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('5', 'CONSEQUATU', 'iusto896', 'Harum iste nobis debitis repellendus perferendis et quisquam. Reprehenderit quo laboriosam voluptatem. Ut et in autem laborum ea voluptatibus rem et.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('6', 'DOLOR86', 'accusantium885', 'Dolore iste sed et accusantium. Natus consequatur dolores laudantium sapiente porro commodi. Ea qui animi rerum ut omnis. Possimus ad aliquam molestias minima.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('7', 'QUO709', 'quas495', 'Incidunt non nobis quam occaecati. Voluptatem quaerat eum omnis optio. Omnis dolorem quos pariatur eaque. Sed sunt aut et nam facere.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('8', 'REICIENDIS', 'ut556', 'Nisi quae iusto enim. Veniam magni autem dolorum a suscipit. A recusandae saepe ut et non et.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('9', 'MOLESTIAS5', 'ab272', 'Praesentium quisquam et totam animi. Voluptatem enim quae rem vero sed. Amet non blanditiis consectetur sed aut dolores quia dolorum. Et praesentium eaque architecto velit iure consequuntur quo.', '1', '2016-12-28 07:01:17', '2016-12-28 07:01:17');
INSERT INTO `permissions` VALUES ('10', 'QUIDEM206', 'explicabo307', 'Magnam distinctio totam ducimus vel qui. Consequatur dolore rerum eveniet. Tenetur beatae beatae repellat omnis porro rerum quibusdam. Rerum qui exercitationem architecto dolor.', '1', '2016-12-28 07:01:18', '2016-12-28 07:01:18');

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(10) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `province_name_unique` (`name`),
  KEY `province_department_id_foreign` (`department_id`),
  CONSTRAINT `province_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', 'repudiandae atque suscipit196', '18', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `province` VALUES ('2', 'autem officiis quia755', '16', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `province` VALUES ('3', 'eos dolores repudiandae603', '19', '1', '2016-12-28 07:01:22', '2016-12-28 07:01:22');
INSERT INTO `province` VALUES ('4', 'perspiciatis quia modi849', '19', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('5', 'et aut deserunt84', '18', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('6', 'architecto nam provident527', '3', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('7', 'ab sint ducimus578', '12', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('8', 'voluptas aut consequatur256', '17', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('9', 'ullam ipsam assumenda261', '6', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('10', 'tempora ut accusamus934', '8', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('11', 'laboriosam sed animi20', '14', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('12', 'rerum sunt deleniti379', '13', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('13', 'sit non tempore353', '3', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('14', 'quae et impedit847', '6', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('15', 'eius ipsam voluptas920', '10', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('16', 'totam necessitatibus non752', '8', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('17', 'iusto saepe odit633', '13', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('18', 'consequatur est id161', '18', '1', '2016-12-28 07:01:23', '2016-12-28 07:01:23');
INSERT INTO `province` VALUES ('19', 'esse repellat molestiae133', '17', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('20', 'eum velit a573', '14', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('21', 'odio eius voluptatibus446', '15', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('22', 'voluptas laudantium consequuntur161', '13', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('23', 'rerum et qui695', '4', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('24', 'non ad qui42', '1', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('25', 'temporibus occaecati tempora483', '2', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('26', 'modi aperiam et994', '18', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('27', 'et molestiae quia785', '6', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('28', 'aut illum alias885', '16', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('29', 'et quia ut717', '16', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('30', 'ut eos earum732', '8', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('31', 'quaerat ad excepturi501', '24', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('32', 'alias ut maxime952', '16', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('33', 'possimus sit et82', '8', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('34', 'et modi tempora608', '16', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('35', 'quisquam quisquam corrupti909', '15', '1', '2016-12-28 07:01:24', '2016-12-28 07:01:24');
INSERT INTO `province` VALUES ('36', 'beatae ex non843', '2', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('37', 'repellendus delectus sed797', '22', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('38', 'tempora autem voluptatem235', '16', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('39', 'commodi laboriosam eius950', '24', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('40', 'quo ea expedita541', '13', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('41', 'assumenda eos et254', '4', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('42', 'ab maiores nulla795', '21', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('43', 'quia repellendus enim415', '15', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('44', 'aliquid ipsam voluptas422', '10', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('45', 'qui deserunt porro330', '10', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('46', 'esse voluptatum harum237', '22', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('47', 'eius aut doloribus331', '11', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('48', 'ex sunt ut909', '24', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('49', 'sunt odio doloribus561', '15', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('50', 'atque labore nobis61', '23', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('51', 'velit sunt rerum161', '11', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('52', 'reiciendis velit non24', '4', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('53', 'et facere impedit364', '13', '1', '2016-12-28 07:01:25', '2016-12-28 07:01:25');
INSERT INTO `province` VALUES ('54', 'aut modi qui983', '6', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('55', 'corporis eius blanditiis635', '15', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('56', 'ut ut aspernatur438', '17', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('57', 'ut voluptatibus iusto172', '19', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('58', 'sed tempora et256', '4', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('59', 'dolorem aut impedit109', '9', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('60', 'optio quaerat soluta494', '3', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('61', 'officia non in93', '2', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('62', 'accusamus at laboriosam357', '9', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('63', 'enim quas quo993', '12', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('64', 'sed aliquid ut592', '22', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('65', 'dignissimos iure qui304', '24', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('66', 'sit odio doloremque773', '22', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('67', 'inventore dolor nesciunt520', '8', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('68', 'dolores iure amet183', '4', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('69', 'cum omnis voluptatum140', '9', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('70', 'qui inventore cumque274', '23', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('71', 'numquam omnis aspernatur16', '24', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('72', 'nobis sed pariatur683', '9', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('73', 'qui et voluptas880', '3', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('74', 'quaerat qui quia677', '15', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('75', 'odio maxime omnis87', '23', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('76', 'aut esse ducimus648', '9', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('77', 'itaque et ut13', '24', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('78', 'ea quod voluptatem720', '20', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('79', 'recusandae exercitationem eaque341', '17', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('80', 'libero quisquam et140', '3', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('81', 'minima mollitia nam494', '2', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('82', 'exercitationem quia autem664', '16', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('83', 'natus est voluptas330', '2', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('84', 'quia veritatis eum3', '20', '1', '2016-12-28 07:01:26', '2016-12-28 07:01:26');
INSERT INTO `province` VALUES ('85', 'rerum doloribus sed484', '19', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('86', 'non est ut92', '15', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('87', 'ipsam autem est810', '20', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('88', 'nobis quo sapiente925', '17', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('89', 'dolorem et eum876', '19', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('90', 'sunt voluptas voluptatem957', '11', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('91', 'aut a aut598', '6', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('92', 'aspernatur tempore culpa477', '24', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('93', 'qui nisi non131', '16', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('94', 'omnis accusantium et697', '6', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('95', 'est iusto iure336', '5', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('96', 'culpa earum hic802', '16', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('97', 'corrupti tempora delectus338', '13', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('98', 'ipsam voluptatem quo983', '22', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('99', 'qui sit incidunt77', '8', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('100', 'magni libero est731', '11', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('101', 'qui architecto sequi545', '22', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('102', 'sint commodi ab65', '22', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('103', 'odio nihil voluptatum753', '5', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('104', 'dignissimos consequatur voluptatem260', '23', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('105', 'et sapiente aut152', '2', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('106', 'modi ullam dolorum470', '6', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('107', 'vel vitae atque938', '11', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('108', 'impedit dolore sed986', '19', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('109', 'tempora et voluptate214', '23', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('110', 'rerum rem maiores651', '21', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('111', 'quod est aut621', '18', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('112', 'ducimus aspernatur vitae29', '16', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('113', 'voluptatibus ut praesentium848', '21', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('114', 'laudantium adipisci vitae811', '14', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('115', 'ipsa sed sit333', '13', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('116', 'nam consequatur esse385', '5', '1', '2016-12-28 07:01:27', '2016-12-28 07:01:27');
INSERT INTO `province` VALUES ('117', 'rerum error sed216', '14', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('118', 'ipsa ut neque886', '11', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('119', 'ut omnis accusamus888', '19', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('120', 'quo voluptas explicabo649', '13', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('121', 'voluptas velit illum230', '10', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('122', 'nam eos rerum32', '17', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('123', 'id eos debitis860', '18', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('124', 'animi unde facere952', '14', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('125', 'rerum est occaecati87', '17', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('126', 'possimus sit sed659', '15', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('127', 'ex quo quos957', '8', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('128', 'voluptatem veniam necessitatibus85', '14', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('129', 'incidunt sapiente aut63', '3', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('130', 'necessitatibus quibusdam ut371', '22', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('131', 'dolores ex similique610', '15', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('132', 'placeat sint modi461', '12', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('133', 'voluptate nobis est842', '19', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('134', 'illum expedita perferendis584', '6', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('135', 'quisquam sequi est980', '20', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('136', 'id suscipit omnis220', '11', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('137', 'dolor expedita ipsam832', '12', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('138', 'quis dolor sequi616', '11', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('139', 'iure repellat in722', '13', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('140', 'animi qui voluptatum487', '10', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('141', 'vel quis saepe584', '1', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('142', 'rerum accusantium aut753', '24', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('143', 'non repudiandae quae136', '16', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('144', 'non culpa rerum207', '4', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('145', 'soluta omnis voluptatem281', '8', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('146', 'suscipit et dolorem226', '15', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('147', 'sed ut exercitationem625', '15', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('148', 'consequatur nobis ut745', '14', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('149', 'nulla quia maiores773', '1', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('150', 'reprehenderit aperiam asperiores335', '9', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('151', 'minima esse ea897', '15', '1', '2016-12-28 07:01:28', '2016-12-28 07:01:28');
INSERT INTO `province` VALUES ('152', 'illum et facere902', '10', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('153', 'tenetur aperiam consequatur405', '15', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('154', 'minima a dolorem142', '14', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('155', 'ad deserunt sint48', '20', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('156', 'tempore quidem in456', '24', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('157', 'minima quod laborum198', '18', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('158', 'et et velit228', '24', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('159', 'officia aut omnis286', '24', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('160', 'hic culpa et127', '10', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('161', 'quis blanditiis fugiat229', '14', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('162', 'hic soluta maxime209', '17', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('163', 'inventore et maxime942', '3', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('164', 'alias voluptatum natus989', '17', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('165', 'laboriosam ducimus qui683', '5', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('166', 'ullam autem voluptatem166', '21', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('167', 'fugit rerum voluptas456', '23', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('168', 'recusandae aspernatur sed671', '7', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('169', 'doloribus necessitatibus magni546', '10', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('170', 'culpa accusantium sit642', '6', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('171', 'eius voluptatem illo63', '1', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('172', 'dolores maiores rerum324', '23', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('173', 'molestiae et aut881', '5', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('174', 'debitis aut tenetur318', '3', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('175', 'fugiat fugit vitae950', '21', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('176', 'quis asperiores voluptatem521', '16', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('177', 'aut dolor officiis166', '21', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('178', 'nostrum laborum minima876', '2', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('179', 'aliquid cupiditate rerum288', '20', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('180', 'dolores quia ut390', '10', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('181', 'expedita rerum dolorem751', '7', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('182', 'est explicabo voluptate291', '22', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('183', 'recusandae itaque esse470', '23', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('184', 'vel et est679', '8', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('185', 'eum harum voluptate225', '14', '1', '2016-12-28 07:01:29', '2016-12-28 07:01:29');
INSERT INTO `province` VALUES ('186', 'temporibus numquam odio454', '10', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('187', 'omnis facere sed722', '16', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('188', 'nesciunt est alias815', '17', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('189', 'quos error vero289', '1', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('190', 'quod ex nobis905', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('191', 'beatae quia sint285', '3', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('192', 'beatae quia id8', '11', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('193', 'necessitatibus repudiandae animi957', '21', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('194', 'quia voluptatibus et267', '10', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('195', 'voluptatem ut ullam2', '22', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('196', 'enim odit officiis352', '13', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('197', 'earum consequatur ea821', '3', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('198', 'quia voluptatem cum500', '17', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('199', 'amet deleniti perspiciatis554', '23', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('200', 'quis et provident760', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('201', 'facilis nihil vel5', '6', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('202', 'vero earum quisquam903', '4', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('203', 'ut quibusdam dolor701', '11', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('204', 'consequatur et vitae121', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('205', 'reprehenderit blanditiis enim279', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('206', 'blanditiis vel dolorem421', '8', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('207', 'consequuntur voluptatem eligendi740', '11', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('208', 'mollitia molestiae quo504', '3', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('209', 'praesentium eos reprehenderit172', '21', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('210', 'cum voluptatem odio367', '19', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('211', 'est dolores quia659', '24', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('212', 'quo possimus dolore895', '4', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('213', 'officiis minus amet144', '7', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('214', 'ratione voluptas explicabo934', '7', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('215', 'est porro voluptatem878', '20', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('216', 'excepturi nulla expedita7', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('217', 'et incidunt sit882', '11', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('218', 'rerum aperiam quo603', '4', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('219', 'vero voluptas voluptas954', '14', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('220', 'sed voluptatem aut201', '12', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('221', 'dolores quam in279', '6', '1', '2016-12-28 07:01:30', '2016-12-28 07:01:30');
INSERT INTO `province` VALUES ('222', 'id incidunt mollitia35', '14', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('223', 'voluptatibus aut nulla557', '20', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('224', 'ex similique facilis786', '21', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('225', 'pariatur veniam voluptatem516', '21', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('226', 'quis atque iste25', '17', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('227', 'rerum in sunt897', '1', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('228', 'et qui distinctio704', '10', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('229', 'expedita earum et464', '12', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('230', 'eum incidunt consequatur595', '24', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('231', 'repudiandae distinctio reprehenderit124', '6', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('232', 'nam corrupti deleniti904', '19', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('233', 'aliquid neque ducimus716', '19', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('234', 'soluta sed dignissimos881', '23', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('235', 'quis molestiae quaerat429', '21', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('236', 'voluptas omnis et945', '21', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('237', 'aut temporibus nihil929', '8', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('238', 'incidunt dolor velit628', '15', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('239', 'corrupti delectus unde946', '15', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('240', 'maxime dolorem culpa900', '16', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('241', 'et quo qui810', '10', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('242', 'consectetur consectetur quae297', '2', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('243', 'necessitatibus accusantium hic72', '20', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('244', 'eum ad quos92', '12', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('245', 'occaecati aliquid exercitationem300', '9', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('246', 'fugiat similique temporibus502', '13', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('247', 'qui dolorem nesciunt540', '1', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('248', 'laudantium aliquid ipsum735', '21', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('249', 'enim numquam adipisci861', '13', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');
INSERT INTO `province` VALUES ('250', 'temporibus quod earum740', '12', '1', '2016-12-28 07:01:31', '2016-12-28 07:01:31');

-- ----------------------------
-- Table structure for session
-- ----------------------------
DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `start_session` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `destroy_session` datetime DEFAULT NULL,
  `user_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `table_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of session
-- ----------------------------
INSERT INTO `session` VALUES ('1', 'a304f8c20fdee54643c981b5cbbd8e6e3fc30d57b646662fa4bfcb5d2554647c', '0', '2017-04-02 18:24:35', '2017-04-02 19:41:13', '1', 'user');
INSERT INTO `session` VALUES ('2', 'd2678c1ede1b0202c4443159c30479a421ef9decb5e27582f876260aaf6d437e', '1', '2017-04-02 19:41:48', null, '1', 'user');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dni` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `ruc` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `names` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `surnames` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_photo` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `staff_type_id` int(10) unsigned NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_dni_unique` (`dni`),
  UNIQUE KEY `staff_email_unique` (`email`),
  KEY `staff_staff_type_id_foreign` (`staff_type_id`),
  CONSTRAINT `staff_staff_type_id_foreign` FOREIGN KEY (`staff_type_id`) REFERENCES `staff_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'fqb200', null, 'Michele', 'Stanton', 'F', 'mraz.alexys@murphy.com', '1995-01-09', null, null, null, '2', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff` VALUES ('2', 'fhq168', null, 'Erna', 'Hilll', 'M', 'jamarcus35@kuphal.info', '2013-06-05', null, null, null, '3', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff` VALUES ('3', 'iwu5', null, 'Zane', 'Treutel', 'M', 'bosco.gretchen@kemmer.info', '1977-01-10', null, null, null, '3', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff` VALUES ('4', 'xfb214', null, 'Mallie', 'Connelly', 'M', 'johnpaul.quigley@murray.com', '1973-09-22', null, null, null, '2', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('5', 'fkb323', null, 'Zachary', 'McKenzie', 'M', 'salvador00@hotmail.com', '2005-12-20', null, null, null, '1', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('6', 'gso724', null, 'Albina', 'Kunze', 'M', 'padberg.concepcion@gmail.com', '2003-01-26', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('7', 'fhe585', null, 'Althea', 'D\'Amore', 'M', 'leone94@gmail.com', '2004-03-15', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('8', 'pyy366', null, 'Jamal', 'Pacocha', 'F', 'orlando24@hessel.com', '1970-03-30', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('9', 'afq778', null, 'Mylene', 'Rowe', 'M', 'barton.henri@sauer.com', '1977-02-11', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('10', 'drm679', null, 'Stephania', 'O\'Connell', 'F', 'yhodkiewicz@hotmail.com', '1992-07-28', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('11', 'yrx673', null, 'Neal', 'O\'Hara', 'M', 'kovacek.cornell@hotmail.com', '2010-12-22', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('12', 'awf731', null, 'Blake', 'Senger', 'F', 'kmaggio@yahoo.com', '1970-09-30', null, null, null, '1', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('13', 'dux865', null, 'Millie', 'Schiller', 'F', 'irma.hudson@smith.com', '1975-09-22', null, null, null, '2', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('14', 'eta789', null, 'Donna', 'Robel', 'M', 'anabel96@weissnat.net', '2007-08-02', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('15', 'qsw66', null, 'Luisa', 'Runolfsson', 'F', 'lurline.collier@gmail.com', '1987-05-25', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('16', 'nqw634', null, 'Greg', 'Stoltenberg', 'M', 'okunze@strosin.com', '1995-05-31', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('17', 'nrf215', null, 'Jarrod', 'Kessler', 'F', 'eric90@yahoo.com', '1996-09-06', null, null, null, '1', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('18', 'vlq236', null, 'Mathias', 'Ward', 'M', 'marilou81@gmail.com', '2000-08-19', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('19', 'ids405', null, 'Joesph', 'Metz', 'M', 'madelynn26@rosenbaum.com', '2003-06-06', null, null, null, '2', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('20', 'sko607', null, 'Sincere', 'Wuckert', 'M', 'julia.rice@hotmail.com', '1986-04-09', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('21', 'ylu281', null, 'Tyree', 'Medhurst', 'F', 'amina.mraz@gorczany.com', '1993-07-26', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('22', 'hvx172', null, 'Enrique', 'Langworth', 'M', 'brekke.leora@hotmail.com', '2008-09-10', null, null, null, '4', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('23', 'lgo625', null, 'Urban', 'Krajcik', 'M', 'elmo.mueller@adams.com', '1978-10-06', null, null, null, '2', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('24', 'fiw852', null, 'Adelle', 'Gutkowski', 'F', 'jaskolski.maude@bartoletti.biz', '2001-03-23', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('25', 'qmq426', null, 'Nakia', 'Bayer', 'M', 'iwelch@gibson.com', '1978-11-11', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('26', 'vjj31', null, 'Rod', 'Parker', 'F', 'maybelle74@balistreri.net', '1995-02-25', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('27', 'hqk478', null, 'Lempi', 'Gottlieb', 'M', 'kuhlman.jadyn@yahoo.com', '2007-05-29', null, null, null, '1', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('28', 'uhy37', null, 'Frances', 'Bernier', 'M', 'vivienne.stanton@hotmail.com', '2004-07-19', null, null, null, '3', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('29', 'wrn514', null, 'Reginald', 'Walsh', 'M', 'jschiller@yahoo.com', '1988-03-03', null, null, null, '1', '1', '2016-12-28 07:01:51', '2016-12-28 07:01:51');
INSERT INTO `staff` VALUES ('30', 'xvp114', null, 'Wilfred', 'Hayes', 'F', 'christa.hegmann@trantow.com', '2001-09-19', null, null, null, '2', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('31', 'hll374', null, 'Grayce', 'Deckow', 'F', 'manuel67@beatty.info', '2014-10-08', null, null, null, '3', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('32', 'kgo345', null, 'Roxanne', 'Hermiston', 'F', 'willard36@larson.info', '1971-12-27', null, null, null, '2', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('33', 'kgt258', null, 'Alvena', 'Hettinger', 'M', 'miller.mateo@rogahn.info', '1988-04-01', null, null, null, '3', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('34', 'cwq925', null, 'Cory', 'Douglas', 'F', 'antonietta41@white.com', '1996-06-17', null, null, null, '3', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('35', 'fnl69', null, 'Orval', 'Ritchie', 'M', 'nikolas07@emard.biz', '1996-05-30', null, null, null, '4', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('36', 'wie64', null, 'Tracey', 'Schimmel', 'F', 'buddy.kerluke@hotmail.com', '2001-08-28', null, null, null, '1', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('37', 'nbu505', null, 'Bartholome', 'Kub', 'M', 'geo16@shields.com', '1981-05-10', null, null, null, '1', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('38', 'hgy971', null, 'Elaina', 'Pacocha', 'F', 'roman.paucek@johnston.biz', '1972-02-15', null, null, null, '3', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('39', 'nqs333', null, 'Mabel', 'Muller', 'M', 'xjacobi@wisoky.com', '2003-05-25', null, null, null, '1', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');
INSERT INTO `staff` VALUES ('40', 'hax922', null, 'Jayde', 'Stokes', 'M', 'shuels@gmail.com', '1988-04-08', null, null, null, '3', '1', '2016-12-28 07:01:52', '2016-12-28 07:01:52');

-- ----------------------------
-- Table structure for staff_type
-- ----------------------------
DROP TABLE IF EXISTS `staff_type`;
CREATE TABLE `staff_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_type_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of staff_type
-- ----------------------------
INSERT INTO `staff_type` VALUES ('1', 'aperiam899', 'Nemo sunt rerum sit exercitationem cumque mollitia porro. Voluptate repellat a aperiam dicta eveniet. Reprehenderit corporis corporis corporis distinctio.', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff_type` VALUES ('2', 'non162', 'Voluptatem qui earum ipsum nihil. Tempore delectus amet sit aut. Illum praesentium aperiam officiis deleniti ipsum voluptatibus.', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff_type` VALUES ('3', 'quibusdam220', 'Ad sapiente ut est delectus architecto. Laboriosam qui id fugit nisi sint voluptas voluptatum et. Eum quae blanditiis enim rerum enim sit explicabo. Porro explicabo aut eligendi quia est et.', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');
INSERT INTO `staff_type` VALUES ('4', 'velit468', 'Est ullam officia corrupti neque labore et recusandae amet. Expedita itaque dignissimos velit voluptatem ullam. Repellat dolore pariatur qui eaque. Voluptas natus molestias magnam aut quia velit sed.', '1', '2016-12-28 07:01:50', '2016-12-28 07:01:50');

-- ----------------------------
-- Table structure for super_user
-- ----------------------------
DROP TABLE IF EXISTS `super_user`;
CREATE TABLE `super_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_photo` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `super_user_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of super_user
-- ----------------------------
INSERT INTO `super_user` VALUES ('1', 'Colt Rohan', 'eloy.kris@hotmail.com', '$2y$10$vH7.ENF2onljsRKCXgG/Kuze55BOq9oUVtaUu5HSJN90W5V72F8Ta', 'F', null, null, 'http://lorempixel.com/640/480/?93917', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('2', 'Prof. Summer Ledner DVM', 'dheidenreich@yahoo.com', '$2y$10$9tZh8SYaafx2qfp.oy35je1cX1nMZG0gHyD8TYBJdDbl.KxBj30iG', 'M', null, null, 'http://lorempixel.com/640/480/?75666', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('3', 'Arne Jerde', 'wsanford@hotmail.com', '$2y$10$h91na867.PTmr8CjfkwkUOg2q/nqnRHuYONRyvsHBrIYQBuMhyPaW', 'M', null, null, 'http://lorempixel.com/640/480/?55677', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('4', 'Lola Kuhic', 'kylee26@gmail.com', '$2y$10$hb6RdAjwa6QujJLJPuvXouD.jwKflsUB7Qkuyk5CEtR0l66QlFIQK', 'F', null, null, 'http://lorempixel.com/640/480/?25973', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('5', 'Tressie Wolff', 'keenan29@hotmail.com', '$2y$10$rrA.NhfqZREFTaiFTWoppOm0DFzCoMr2H9QPgZkzJEp7EE5mOB2aO', 'F', null, null, 'http://lorempixel.com/640/480/?56415', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('6', 'Mrs. Oma Bosco II', 'steuber.missouri@hotmail.com', '$2y$10$GagQlCgIW7q5yrm6fiaQxuiYF/kjBQTY1K4uXQW1IAB7bO571Kfzy', 'M', null, null, 'http://lorempixel.com/640/480/?69838', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('7', 'Matteo Hills', 'mosciski.martina@gmail.com', '$2y$10$pwfnXRlazjtvzm8PVroWNu1dyqHJQ1IUlFvAxW8QT3kBZb.stW.u.', 'F', null, null, 'http://lorempixel.com/640/480/?74552', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('8', 'Terrill Ryan', 'weimann.agustin@yahoo.com', '$2y$10$H18hevbc065FGiG/e/b4FeyvcLiJrUDpoGKFZwz1kdpTGc1jr2/A.', 'F', null, null, 'http://lorempixel.com/640/480/?88970', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('9', 'Oswaldo O\'Hara', 'alemke@gmail.com', '$2y$10$GKTdJZ7uMEsv5T2gl5Q.j.VeAm/kNKcRw.hDUppcmkF0ORfoIKbfy', 'F', null, null, 'http://lorempixel.com/640/480/?81271', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');
INSERT INTO `super_user` VALUES ('10', 'Breana Erdman', 'abernathy.felicita@yahoo.com', '$2y$10$frTxBUQAl/xusIwA.i3t..KdM6gLZzES1h1fqnl9/B6BOjV3fpWlS', 'M', null, null, 'http://lorempixel.com/640/480/?77308', '1', '2016-12-28 07:01:20', '2016-12-28 07:01:20');

-- ----------------------------
-- Table structure for system_tables
-- ----------------------------
DROP TABLE IF EXISTS `system_tables`;
CREATE TABLE `system_tables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `prefix` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `current` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `owner` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_tables
-- ----------------------------
INSERT INTO `system_tables` VALUES ('1', 'client_type', 'CLT', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('2', 'clients', 'CL', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('3', 'country', 'CTR', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('4', 'department', 'DPT', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('5', 'district', 'DST', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('6', 'local_rating', 'LRT', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('7', 'local_type', 'LOCT', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('8', 'locals', 'LOC', '7', '1', 'admin', '2017-04-02 10:31:16', '2017-04-02 12:39:22');
INSERT INTO `system_tables` VALUES ('9', 'migrations', 'MIG', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('10', 'permissions', 'PER', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('11', 'province', 'PROV', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('12', 'staff', 'STF', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('13', 'staff_type', 'STFT', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('14', 'super_user', 'SU', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('15', 'user_app', 'UA', '0', '1', 'admin', '2017-04-02 10:31:16', null);
INSERT INTO `system_tables` VALUES ('16', 'user', 'U', '1', '1', 'admin', '2017-04-02 10:31:16', null);

-- ----------------------------
-- Table structure for system_token
-- ----------------------------
DROP TABLE IF EXISTS `system_token`;
CREATE TABLE `system_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_token` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `usages` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of system_token
-- ----------------------------
INSERT INTO `system_token` VALUES ('1', '123456', 'session', '1', '2017-04-02 16:20:41', null);
INSERT INTO `system_token` VALUES ('2', '654321', 'user', '1', '2017-04-02 17:05:52', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `staff_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_code_unique` (`code`),
  UNIQUE KEY `users_username_unique` (`username`),
  KEY `users_staff_id_foreign` (`staff_id`),
  CONSTRAINT `users_staff_id_foreign` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'U1', 'admin', '$2y$10$7ufVaStAumvSZOYm9qt1Z.nndK2NeXA2dpQIu8AlOHhXSm/sSTv.G', '1', '1', null, null);

-- ----------------------------
-- Table structure for user_app
-- ----------------------------
DROP TABLE IF EXISTS `user_app`;
CREATE TABLE `user_app` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ID_FB` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ID_GG` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_photo` varchar(350) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_app
-- ----------------------------
INSERT INTO `user_app` VALUES ('1', '822287', '329330', 'Eddie Fisher PhD', 'mayer.sonya@hotmail.com', '$2y$10$hd7IS/wmr90GdKXavUvN1u7DLtxGSm.NvvzgxzlMQySjtSPg8qKxa', 'F', null, null, 'http://lorempixel.com/640/480/?58957', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('2', '911660', '790167', 'Linda Hackett', 'liliane54@gmail.com', '$2y$10$9b/8lS5sy9rMT..k9VzxKuLlms5afGcRdF0wSus4L1qKVbBIkBdxy', 'F', null, null, 'http://lorempixel.com/640/480/?24341', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('3', '870379', '608350', 'Corbin Stoltenberg', 'jennings26@yahoo.com', '$2y$10$tguCWuXfh49DNc8PCUhq.OeuVZdbg8dGeb5mZKD0h6WOjGknkRsGa', 'M', null, null, 'http://lorempixel.com/640/480/?18469', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('4', '644062', '630106', 'Enrico Fadel', 'goldner.amani@hotmail.com', '$2y$10$8c9oaKXOs0vwJ0j2HlfU..OK2HTvnPbw/njcspZ78MAtQAFVlLRDi', 'M', null, null, 'http://lorempixel.com/640/480/?30044', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('5', '350344', '125507', 'Ms. Paige Will I', 'ara00@gmail.com', '$2y$10$JsuHqf2CgbnaiLg2/neoPe0OPm0QXGvILu/P9onoCJFb3N3u5lib.', 'M', null, null, 'http://lorempixel.com/640/480/?17424', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('6', '414677', '823563', 'Valentine Gutkowski', 'enrico.kerluke@yahoo.com', '$2y$10$cgNXv2CxIEydh2AbV9n2COeprScLt.YxKYt5fbi83UlB9XMdeNhHa', 'M', null, null, 'http://lorempixel.com/640/480/?92803', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('7', '804627', '439791', 'Judah Bartoletti I', 'aileen.bergnaum@gmail.com', '$2y$10$VT22RnXH9rwvEIUCCMxAAuyCHrTd8JvaTCics/eJPHKtYXIxntR3i', 'M', null, null, 'http://lorempixel.com/640/480/?12144', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('8', '417206', '958130', 'Karley Fahey', 'lborer@gmail.com', '$2y$10$axz8amUu8X5AzFAboUqQ/OrviqGfFgtEtN1JddJIDYjojUAUjnH3y', 'M', null, null, 'http://lorempixel.com/640/480/?42553', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('9', '125080', '721870', 'Jimmy Altenwerth', 'wilber41@yahoo.com', '$2y$10$B/PpSYuyq0vOGt/8Kw14kuzYis2GZWNkUtcKHwR7d1flT6hVwT/Km', 'F', null, null, 'http://lorempixel.com/640/480/?46740', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
INSERT INTO `user_app` VALUES ('10', '458034', '661153', 'Idell Hickle', 'grady15@gmail.com', '$2y$10$uxYsn0W23SRaZINCG2ePR./i3XoVyfojqfrJ3RsSz2JqZmfq3Qeci', 'M', null, null, 'http://lorempixel.com/640/480/?17896', '1', '2016-12-28 07:01:19', '2016-12-28 07:01:19');
