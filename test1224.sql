/*
 Navicat MySQL Dump SQL

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80039 (8.0.39)
 Source Host           : localhost:3306
 Source Schema         : test1224

 Target Server Type    : MySQL
 Target Server Version : 80039 (8.0.39)
 File Encoding         : 65001

 Date: 24/12/2024 15:49:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` double(25, 1) NULL DEFAULT NULL,
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (1, '充电宝', 109.9, '品牌商品，安全可靠', 1);
INSERT INTO `goods` VALUES (2, '无线鼠标', 45.9, '双模无线、轻音充电', 1);
INSERT INTO `goods` VALUES (3, 'U盘', 65.0, '闪迪，高速1', 1);
INSERT INTO `goods` VALUES (4, '手机支架', 12.5, '颜值高', 2);
INSERT INTO `goods` VALUES (5, '保温杯', 89.9, '颜色多样，保温持久', 2);
INSERT INTO `goods` VALUES (7, '活页笔记本1', 49.0, '纸张厚实，书写顺滑', 1);
INSERT INTO `goods` VALUES (8, '刘备1', 111.0, '闪迪，高速1', 2);

-- ----------------------------
-- Table structure for type
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of type
-- ----------------------------
INSERT INTO `type` VALUES (1, '电子产品');
INSERT INTO `type` VALUES (2, '生活用品');
INSERT INTO `type` VALUES (3, '服装');

SET FOREIGN_KEY_CHECKS = 1;
