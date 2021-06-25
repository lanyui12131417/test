/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : curriculumsystem

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 25/06/2021 08:13:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `cno` int(50) NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `teacher` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `semester` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '高数I', '熊菊霞', '2018上学期');
INSERT INTO `course` VALUES (2, '高数II', '熊菊霞', '2018下学期');
INSERT INTO `course` VALUES (3, '算法设计与分析', '刘美玲', '2019下学期');
INSERT INTO `course` VALUES (4, '课程设计II', '刘美玲', '2019下学期');
INSERT INTO `course` VALUES (5, 'JavaWeb', '刘美玲', '2020上学期');
INSERT INTO `course` VALUES (6, 'C语言', '刘美玲', '2018上学期');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `newsNo` int(11) NOT NULL AUTO_INCREMENT,
  `newsTitle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `newsBody` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`newsNo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '【党史学习教育】黄秉生教授作“中国共产党人的信仰”专题报告', '【大学生通讯社报道】6月16日下午，由我校关工委主办、马克思主义学院关工委承办的《相思湖大讲坛》第82讲在求是楼307室举办。原文学院党委书记、院长、退休教授黄秉生作“中国共产党人的信仰”专题报告。报告会由马克思主义学院党总支书记周丽华主持，校关工委秘书长梁淑芳出席报告会。');
INSERT INTO `news` VALUES (2, '【党史学习教育】校领导讲党史学习教育专题党课', '【大学生通讯社报道】6月17日下午，校长谢尚果在科技楼报告厅作题为“学习党史、传承红色基因、建设新时代中国特色社会主义壮美广西”党史学习教育专题党课。法学院和东盟学院党员以及入党积极分子代表参与学习。');
INSERT INTO `news` VALUES (3, '12', '12');
INSERT INTO `news` VALUES (5, '45345', '4354');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11333767', '123456', '教师');
INSERT INTO `user` VALUES ('118583010143', '12345', '学生');
INSERT INTO `user` VALUES ('1234', '1234', '教师');
INSERT INTO `user` VALUES ('6666', '6666', '教师');
INSERT INTO `user` VALUES ('admin', 'admin', '管理员');

SET FOREIGN_KEY_CHECKS = 1;
