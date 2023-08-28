/*
 Navicat Premium Data Transfer

 Source Server         : java2305
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : localhost:3306
 Source Schema         : house

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 28/08/2023 10:00:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `custname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `career` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('43131334113331131', '王五', 1, '武汉', '13888888888', '科\r\n学家', '2022-11-07 14:52:24');
INSERT INTO `customer` VALUES ('431321199291331132', '孙策', 1, '⻓沙', '134131314131', '船\r\n长', '2022-11-07 14:52:24');
INSERT INTO `customer` VALUES ('431341134191311311', '李四', 0, '⻄\r\n安', '13451313113', 'CEO', '2022-10-07 14:52:24');
INSERT INTO `customer` VALUES ('431341134191311314', '王明', 1, '郑\r\n州', '13413131113', 'CEO', '2022-11-11 14:52:24');
INSERT INTO `customer` VALUES ('431341134191311314', '老雷', 1, '西安', '123456666', '资深程序员', '2023-08-22 18:55:03');
INSERT INTO `customer` VALUES ('1234567897777', '点点', 1, '英国伦敦', '17352228888', '投资人', '2023-08-22 16:26:42');

-- ----------------------------
-- Table structure for house
-- ----------------------------
DROP TABLE IF EXISTS `house`;
CREATE TABLE `house`  (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of house
-- ----------------------------
INSERT INTO `house` VALUES (1, 'xxxx楼盘', '唐兴路', '123456789', 1200.00, '南北通透，冬暖夏凉', 'h1.jpg');
INSERT INTO `house` VALUES (2, 'xxxx公寓', '科技路', '123456789', 1000.00, '南北通透，适合一个人住', 'h2.jpg');

-- ----------------------------
-- Table structure for housemanger
-- ----------------------------
DROP TABLE IF EXISTS `housemanger`;
CREATE TABLE `housemanger`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `housetype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '房屋类型',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '位置',
  `rentprice` double NULL DEFAULT NULL COMMENT '出租价格',
  `deposit` double NULL DEFAULT NULL COMMENT '押金',
  `isrenting` int NULL DEFAULT NULL COMMENT '是否出租，1出租，0未出租',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `houseimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of housemanger
-- ----------------------------
INSERT INTO `housemanger` VALUES (4, '公寓loftss', '玫瑰公寓', 18000, 1800, 1, '单身公寓，装修精美11', '2023-08-23/202308231804092593287.jpg', '2023-08-23 10:04:10');
INSERT INTO `housemanger` VALUES (5, '主卧单间', '南窑头', 8001, 800, 0, '水电齐全，独立卫浴', '2023-08-23/202308231910455619570.jpg', '2023-08-23 11:10:49');
INSERT INTO `housemanger` VALUES (7, '三室一厅', '曲江中心', 32002, 3200, 0, '超大房间，精装修，家电齐全，拎包入住', '2023-08-24/202308240038023453505.jpg', '2023-08-23 16:39:21');
INSERT INTO `housemanger` VALUES (8, '两室一厅', '广州塔', 5000, 5000, 0, '精装修，家电家具齐全，免费WIFI，拎包入住', '2023-08-24/202308240903256546442.jpeg', '2023-08-24 01:04:03');
INSERT INTO `housemanger` VALUES (9, '一室一厅', '汤臣一品', 80000, 80000, 1, '高端楼盘', '2023-08-24/202308240905196245019.jpeg', '2023-08-24 01:05:30');
INSERT INTO `housemanger` VALUES (10, '单间', '南窑头', 650, 650, 1, '小单间，水电齐全，免费wifi', '2023-08-24/202308241039528712068.jpeg', '2023-08-24 01:06:33');
INSERT INTO `housemanger` VALUES (11, '两室一厅', '西辛庄', 6500, 6500, 0, ' 房屋亮点 已传房本 邻地铁 配套齐全 南北通透 出租要求 是一家人 一年起租 租户稳定 ', '2023-08-24/202308240907191567013.jpeg', '2023-08-24 01:08:46');

-- ----------------------------
-- Table structure for rent
-- ----------------------------
DROP TABLE IF EXISTS `rent`;
CREATE TABLE `rent`  (
  `rentid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '出租单号',
  `price` double NULL DEFAULT NULL COMMENT '出租价格',
  `begindate` datetime NULL DEFAULT NULL COMMENT '起租时间',
  `returndate` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `rentflag` int NULL DEFAULT NULL COMMENT '出租状态',
  `identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '客户身份证',
  `id` int NULL DEFAULT NULL COMMENT '房屋编号',
  `opername` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '操作人',
  `createtime` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`rentid`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rent
-- ----------------------------
INSERT INTO `rent` VALUES ('CZ_20220820_142535_142_33930', 1200, '2023-06-07 14:25:35', '2022-08-17 00:00:00', 0, '421087133414144412', 10, '千锋', '2022-08-20 14:25:44');
INSERT INTO `rent` VALUES ('CZ_20220820_152207_989_73622', 800, '2022-08-20 15:22:07', '2022-08-17 00:00:00', 0, '43131334113331131', 8, '千锋', '2022-08-20 15:22:15');
INSERT INTO `rent` VALUES ('CZ_20220820_152221_620_78063', 800, '2022-08-20 15:22:21', '2022-08-24 00:00:00', 0, '421087133414144412', 5, '千锋', '2022-08-20 15:22:27');
INSERT INTO `rent` VALUES ('CZ_20220820_152231_076_51761', 3000, '2022-08-20 15:22:31', '2022-08-10 00:00:00', 0, '421087133414144412', 6, '千锋', '2022-08-20 15:22:36');
INSERT INTO `rent` VALUES ('CZ_20220820_152249_892_77610', 2000, '2022-08-28 15:22:49', '2022-08-31 00:00:00', 0, '421087133414144412', 7, '千锋', '2022-08-20 15:23:10');
INSERT INTO `rent` VALUES ('CZ_20230824_153259_350_74324', 1800, '2023-08-29 16:00:00', '2023-12-23 16:00:00', 0, '421087133414144412', 4, '张三', '2023-12-24 15:33:32');
INSERT INTO `rent` VALUES ('CZ_20230825_094133_453_32377', 680, '2023-08-29 16:00:00', '2023-08-30 16:00:00', 0, '421087133414144412', 10, '张三', NULL);
INSERT INTO `rent` VALUES ('CZ_20230825_103319_759_64606', 18000, '2023-08-30 16:00:00', '2023-09-07 16:00:00', 0, '43131334113331131', 4, '张三', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '⽤户id',
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录名称',
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码(密⽂)',
  `identity` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `realname` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `sex` int NULL DEFAULT NULL COMMENT '性别(0女1男)',
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `positionl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '职位',
  `type` int NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统⽤户',
  `available` int NULL DEFAULT NULL COMMENT '是否(1可 0不可\r\n)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '123456789987', '张三', 1, '陕西', '123456789', '普通员工', 2, 1);
INSERT INTO `user` VALUES (2, 'root', '123456', '123456789987', '李四', 0, '河北', '123456789', '员工', 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
