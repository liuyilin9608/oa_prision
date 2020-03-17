/*
Navicat MySQL Data Transfer

Source Server         : laomao
Source Server Version : 50626
Source Host           : localhost:3306
Source Database       : oa_prision

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2020-03-18 02:45:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `archive`
-- ----------------------------
DROP TABLE IF EXISTS `archive`;
CREATE TABLE `archive` (
  `arch_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(55) DEFAULT NULL COMMENT '正题名',
  `subtitle` varchar(55) DEFAULT NULL COMMENT '副题名',
  `classno` varchar(55) DEFAULT NULL COMMENT '信息分类号',
  `roomno` varchar(55) DEFAULT NULL COMMENT '馆室代号',
  `totelno` varchar(55) DEFAULT NULL COMMENT '全宗号',
  `minino` varchar(55) DEFAULT NULL COMMENT '微缩号',
  `entityno` varchar(55) DEFAULT NULL COMMENT '实体分类号',
  `archno` varchar(55) DEFAULT NULL COMMENT '案卷号',
  `retention` varchar(20) DEFAULT NULL COMMENT '保管期限',
  `security_level` int(20) DEFAULT NULL COMMENT '加密级别',
  `note` varchar(55) DEFAULT NULL COMMENT '附注',
  `first_resp` varchar(20) DEFAULT NULL COMMENT '第一责任者',
  `other_resp` varchar(20) DEFAULT NULL COMMENT '其他责任者',
  `page` int(20) DEFAULT NULL COMMENT '页数',
  `norm` varchar(20) DEFAULT NULL COMMENT '规格',
  `keyword` varchar(255) DEFAULT NULL COMMENT '主题词',
  `input_time` datetime DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  PRIMARY KEY (`arch_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archive
-- ----------------------------
INSERT INTO `archive` VALUES ('1', '深圳防疫', '新冠病毒新增人数为0', '001', 'R01', 'iiefwefo', 'eiie', 'aaa', 'aa1111', '2年', '3', '', 'lzh', 'u', '1', '', '防疫', '2019-01-01 00:00:00', '1');
INSERT INTO `archive` VALUES ('2', '人事档案', '2222', '002', 'R02', 'foeifh', 'oieowy', 'oioi', 'bb1111', '4年', '2', '人事档案', 'u', 'u', '15', '', '人事', '2020-03-15 13:01:08', '1');
INSERT INTO `archive` VALUES ('3', '啦啦啦额鹅鹅鹅', '呃呃', '003', 'R003', 'hohgoe333322', 'houh', 'eeeee2', 'houho', '6年', '2', '失败', 'lzh', 'u', '50', 'eeeeeeeee', '傻逼', '2020-03-15 00:00:00', '1');
INSERT INTO `archive` VALUES ('4', '啦啦啦', '呃呃', '003', 'R003', 'hohgoe', 'houh', 'e', 'houho', '6年', '2', '失败', 'lzh', 'u', '50', '', '傻逼', '2020-03-15 00:00:00', '0');
INSERT INTO `archive` VALUES ('5', '啦啦啦', '呃呃', '004', 'R003', 'hohgoe', 'houh', 'e', 'houho', '6年', '2', '失败', 'lzh', 'u', '50', '', '傻逼', '2020-03-15 00:00:00', '0');
INSERT INTO `archive` VALUES ('6', 'oiefhoih', 'oijoj', 'ojpjp', 'joij', 'jojp', 'lijoijp', 'oijpj', 'jijp', 'joijp', '2', 'jlij', 'jpj', 'oiho', '11', 'joip', 'kpop', '2020-03-15 00:00:00', '0');

-- ----------------------------
-- Table structure for `archive_borrow`
-- ----------------------------
DROP TABLE IF EXISTS `archive_borrow`;
CREATE TABLE `archive_borrow` (
  `borrow_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `archno` varchar(55) DEFAULT NULL COMMENT '案卷号',
  `title` varchar(55) DEFAULT NULL COMMENT '标题',
  `borrow_days` int(11) DEFAULT NULL COMMENT '借调天数',
  `borrow_reason` varchar(255) DEFAULT NULL COMMENT '借调原因',
  `arch_advice` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL COMMENT '流程',
  PRIMARY KEY (`borrow_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `archive_borrow_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `process` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of archive_borrow
-- ----------------------------
INSERT INTO `archive_borrow` VALUES ('1', '86ejdl', '刘华强', '11', '2020-03-15 17:12:33', null, null, '12');
INSERT INTO `archive_borrow` VALUES ('2', 'woshibaba', '我是爸爸', '3', '有需要', null, null, '13');
INSERT INTO `archive_borrow` VALUES ('3', 'iojfoeij', '偶偶', '33', '快快快', null, '', '14');
INSERT INTO `archive_borrow` VALUES ('4', 'jejfepofj', '意大利炮', '33', 'sb', null, 'www', '15');
INSERT INTO `archive_borrow` VALUES ('5', '1', '1', '1', '1', null, null, '21');
INSERT INTO `archive_borrow` VALUES ('6', '2', '2', '2', '2', null, null, '22');
INSERT INTO `archive_borrow` VALUES ('7', '3', '3', '3', '3', null, null, '23');
INSERT INTO `archive_borrow` VALUES ('8', '4', '4', '4', '4', null, null, '24');
INSERT INTO `archive_borrow` VALUES ('9', '5', '5', '5', '5', null, null, '25');
INSERT INTO `archive_borrow` VALUES ('10', '6', '6', '6', '6', null, null, '26');
INSERT INTO `archive_borrow` VALUES ('11', '7', '7', '7', '7', null, null, '27');
INSERT INTO `archive_borrow` VALUES ('12', '8', '8', '8', '8', null, '', '28');

-- ----------------------------
-- Table structure for `attachment`
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment` (
  `attachment_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attachment_name` varchar(255) DEFAULT NULL,
  `attachment_path` varchar(255) DEFAULT NULL,
  `attachment_shuffix` varchar(255) DEFAULT NULL,
  `attachment_size` varchar(255) DEFAULT NULL,
  `attachment_type` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `upload_time` datetime DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of attachment
-- ----------------------------
INSERT INTO `attachment` VALUES ('1', '学位证.jpg', '/2020/03/b/41ca1ccf-7ff7-4f85-ac6e-49baab90f283.jpg', 'jpg', '280959', 'image/jpeg', 'document', '2020-03-12 00:59:48', '3');
INSERT INTO `attachment` VALUES ('2', '英国准备.txt', '/2020/03/b/4ac9f8b9-f399-445e-af19-228fd25631b0.txt', 'txt', '110', 'text/plain', 'document', '2020-03-12 16:13:46', '3');
INSERT INTO `attachment` VALUES ('3', 'springcloud.docx', '/2020/03/b/4d6bfddc-03c3-4378-8e30-86f02a9506df.docx', 'docx', '13791318', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'document', '2020-03-13 20:44:48', '3');
INSERT INTO `attachment` VALUES ('4', '英语证明.jpg', '/2020/03/b/ce23b250-c4b4-4a83-aa3c-8c54783afb7d.jpg', 'jpg', '257512', 'image/jpeg', 'document', '2020-03-13 20:47:55', '3');
INSERT INTO `attachment` VALUES ('5', '学历在线认证.png', '/2020/03/b/8cdff1b7-38e8-413a-95ed-9f190bb17aef.png', 'png', '173736', 'image/png', 'document', '2020-03-13 20:50:17', '3');
INSERT INTO `attachment` VALUES ('6', '推荐人信息表.doc', '/2020/03/b/8a19efef-f52c-4f31-b259-1edd6e4756f0.doc', 'doc', '59392', 'application/msword', 'document', '2020-03-14 14:21:06', '3');
INSERT INTO `attachment` VALUES ('7', '健康申报+Health+Declaration.docx', '/2020/03/b/e634b64d-da28-462c-9f63-8e8a2f3c6cf3.docx', 'docx', '20281', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'document', '2020-03-14 16:58:11', '3');

-- ----------------------------
-- Table structure for `attends`
-- ----------------------------
DROP TABLE IF EXISTS `attends`;
CREATE TABLE `attends` (
  `attends_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attends_ip` varchar(20) DEFAULT NULL,
  `attends_remark` varchar(20) DEFAULT NULL,
  `attends_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `attends_user_id` bigint(20) DEFAULT NULL,
  `attend_hmtime` varchar(255) DEFAULT NULL,
  `week_ofday` varchar(255) DEFAULT NULL,
  `holiday_days` double(255,0) DEFAULT '0',
  `holiday_start` date DEFAULT NULL,
  PRIMARY KEY (`attends_id`),
  KEY `FKaxgqsm98npnl1rxysh9upfjee` (`attends_user_id`),
  CONSTRAINT `FKaxgqsm98npnl1rxysh9upfjee` FOREIGN KEY (`attends_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of attends
-- ----------------------------
INSERT INTO `attends` VALUES ('49', '172.20.10.5', null, '2020-02-12 16:35:14', '11', '8', '2', '16:35', '星期三', null, null);
INSERT INTO `attends` VALUES ('50', '172.20.10.5', null, '2020-02-13 14:10:19', '11', '8', '1', '14:10', '星期四', null, null);
INSERT INTO `attends` VALUES ('51', '172.20.10.5', null, '2020-02-13 14:10:25', '12', '9', '1', '14:10', '星期四', null, null);
INSERT INTO `attends` VALUES ('52', '172.20.10.5', null, '2020-02-13 14:13:26', '11', '8', '5', '14:13', '星期四', null, null);
INSERT INTO `attends` VALUES ('53', '172.20.10.5', null, '2020-02-13 14:17:46', '11', '8', '14', '14:17', '星期四', null, null);
INSERT INTO `attends` VALUES ('54', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('55', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('56', null, null, null, '47', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('57', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('58', '172.20.10.5', null, '2020-02-13 15:22:37', '12', '9', '14', '15:22', '星期四', null, null);
INSERT INTO `attends` VALUES ('59', null, null, null, '47', null, '14', null, null, '5', '2020-02-13');
INSERT INTO `attends` VALUES ('60', null, null, null, '47', null, '5', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('61', null, null, null, '47', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('62', null, null, null, '47', null, '10', null, null, '1', '2017-10-14');
INSERT INTO `attends` VALUES ('63', '192.168.80.1', null, '2020-03-03 12:26:39', '11', '8', '1', '12:26', '星期二', null, null);

-- ----------------------------
-- Table structure for `catalog`
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `catalog_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catalog_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `cata_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`catalog_id`),
  KEY `FKbsk5nkjlqmd8j9rmkarse6j1x` (`cata_user_id`),
  CONSTRAINT `FKbsk5nkjlqmd8j9rmkarse6j1x` FOREIGN KEY (`cata_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', 'note', '1', '1');
INSERT INTO `catalog` VALUES ('2', '诗词记录', '1', '1');
INSERT INTO `catalog` VALUES ('9', '秒懂百科', '1', '2');
INSERT INTO `catalog` VALUES ('11', '上课要案', '1', '3');
INSERT INTO `catalog` VALUES ('12', '错题收集', '1', '3');
INSERT INTO `catalog` VALUES ('32', '规划(3)', '1', '1');
INSERT INTO `catalog` VALUES ('33', '根目录', '1', null);
INSERT INTO `catalog` VALUES ('34', '规划(4)', '1', '1');

-- ----------------------------
-- Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dept_addr` varchar(255) DEFAULT NULL,
  `dept_fax` varchar(255) DEFAULT NULL,
  `dept_name` varchar(255) DEFAULT NULL,
  `dept_tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `deptmanager` bigint(20) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '五楼', '', '政治处', '3290000', 'zhengzhi@pri.com', '1', '2017-11-15 22:50:05', '2017-11-07 22:50:11');
INSERT INTO `dept` VALUES ('2', '五楼', '', '行政办公室', '3290001', 'xingzheng@pri.com', '7', '2017-09-13 19:04:07', '2010-05-23 00:00:00');
INSERT INTO `dept` VALUES ('3', '四楼', '', '财务科', '3290002', 'caiwu@pri.com', '9', '2017-09-19 16:46:26', '2016-09-19 16:46:32');
INSERT INTO `dept` VALUES ('4', '一楼', '', '狱政管理科', '3290003', 'yuzheng@pri.com', '16', '2016-07-19 16:48:09', '2014-09-19 16:48:20');
INSERT INTO `dept` VALUES ('5', '二楼', '', '教育改造科', '3290004', 'jiaoyu@pri.com', '18', '2020-03-02 21:25:14', '2017-05-09 14:12:14');
INSERT INTO `dept` VALUES ('6', '三楼', '', '生活卫生科', '3290005', 'weisheng@pri.com', '5', null, null);
INSERT INTO `dept` VALUES ('7', '主楼西面门诊部', '', '监狱医院', '3200120', 'yiyuan@pri.com', '10', null, null);
INSERT INTO `dept` VALUES ('8', '一楼', '', '刑罚执行科', '3290006', 'xingfa@pri.com', '11', null, null);
INSERT INTO `dept` VALUES ('9', '主楼东狱警大队部', '', '看守大队', '3290007', 'kanshou@pri.com', '12', null, null);
INSERT INTO `dept` VALUES ('10', '五楼', '', '档案管理科', '3290008', 'dangan@pri.com', '22', null, null);
INSERT INTO `dept` VALUES ('11', '后山', '', '一监区', '3291111', 'one@pri.com', '17', null, null);
INSERT INTO `dept` VALUES ('12', '后山', '', '二监区', '3292222', 'two@pri.com', '27', null, null);
INSERT INTO `dept` VALUES ('13', '后山', '', '三监区', '3293333', 'three@pri.com', '19', null, null);
INSERT INTO `dept` VALUES ('14', '后山', '', '四监区', '3294444', 'four@pri.com', '20', null, null);
INSERT INTO `dept` VALUES ('15', '后山', null, '五监区', '3295555', 'five@pri.com', '21', null, null);

-- ----------------------------
-- Table structure for `director`
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `director_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `company_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_path` int(11) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `companyname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`director_id`),
  KEY `FKi6pfdnqhbc6js940e2o1vape5` (`user_id`),
  CONSTRAINT `FKi6pfdnqhbc6js940e2o1vape5` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of director
-- ----------------------------
INSERT INTO `director` VALUES ('1', '', '', 'zhangsan11@qq.com', null, '13898078837', '222', '', '男', '222', '1', '');
INSERT INTO `director` VALUES ('2', '', '', 'zhengzhi@pri.com', null, '13999922222', 'b', '', '男', 'b', '1', '');

-- ----------------------------
-- Table structure for `director_users`
-- ----------------------------
DROP TABLE IF EXISTS `director_users`;
CREATE TABLE `director_users` (
  `director_users_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `catelog_name` varchar(255) DEFAULT NULL,
  `is_handle` int(11) DEFAULT NULL,
  `director_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `share_user_id` bigint(20) DEFAULT NULL,
  `sharetime` datetime DEFAULT NULL,
  PRIMARY KEY (`director_users_id`),
  KEY `FK675oqfmv4kx9w6bgi9rgsb8nw` (`director_id`),
  KEY `FK7hq4xk2ja9eka4210qkqq03hi` (`user_id`),
  KEY `FKibwkjvmp9383ltkfew1kyy6ny` (`share_user_id`),
  CONSTRAINT `FK675oqfmv4kx9w6bgi9rgsb8nw` FOREIGN KEY (`director_id`) REFERENCES `director` (`director_id`),
  CONSTRAINT `FK7hq4xk2ja9eka4210qkqq03hi` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKibwkjvmp9383ltkfew1kyy6ny` FOREIGN KEY (`share_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of director_users
-- ----------------------------
INSERT INTO `director_users` VALUES ('1', '', '0', null, '1', null, '2020-03-18 00:38:43');
INSERT INTO `director_users` VALUES ('2', '', '1', '1', '1', null, '2020-03-18 00:42:42');
INSERT INTO `director_users` VALUES ('3', '', '1', '2', '1', null, '2020-03-18 00:46:23');

-- ----------------------------
-- Table structure for `document`
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `document_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL COMMENT '上级领导意见',
  `admin_advice` varchar(255) DEFAULT NULL COMMENT '行政办公室主任意见',
  `print_remark` varchar(255) DEFAULT NULL COMMENT '公文印刷数量',
  `pro_id` bigint(20) DEFAULT NULL COMMENT '流程编号',
  PRIMARY KEY (`document_id`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `document_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `process` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of document
-- ----------------------------
INSERT INTO `document` VALUES ('5', '明天去小区门口量体温', '233', null, null, '1', '5');
INSERT INTO `document` VALUES ('6', '明天去小区门口量体温', '加强防疫等级', '量', null, '20', '6');
INSERT INTO `document` VALUES ('7', '啦啦啦', '我是爸爸', '222', null, '22', '7');
INSERT INTO `document` VALUES ('8', '年轻人不要太气盛', '华强', '不气盛叫年轻人嘛', null, '20', '8');
INSERT INTO `document` VALUES ('9', '谢广坤死', '谢飞机', '必死', '属实必死', '222', '9');
INSERT INTO `document` VALUES ('10', '我是爸爸', '爸爸', '爸爸的爸爸叫什么', '爷爷', '10', '10');
INSERT INTO `document` VALUES ('11', '晚上来', '来', '行', 'ojbk', '2', '11');
INSERT INTO `document` VALUES ('12', '1', '1', null, null, '1', '16');
INSERT INTO `document` VALUES ('13', '2', '2', null, null, '2', '17');
INSERT INTO `document` VALUES ('14', '3', '3', null, null, '3', '18');
INSERT INTO `document` VALUES ('15', '4', '4', null, null, '4', '19');
INSERT INTO `document` VALUES ('16', '5', '5', null, null, '5', '20');

-- ----------------------------
-- Table structure for `notepaper`
-- ----------------------------
DROP TABLE IF EXISTS `notepaper`;
CREATE TABLE `notepaper` (
  `notepaper_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `concent` text,
  `create_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `notepaper_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`notepaper_id`),
  KEY `FKsavcqw29haox5bu7y90it8jb7` (`notepaper_user_id`),
  CONSTRAINT `FKsavcqw29haox5bu7y90it8jb7` FOREIGN KEY (`notepaper_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notepaper
-- ----------------------------
INSERT INTO `notepaper` VALUES ('38', '今天有字节跳动的面试', '2020-02-18 15:58:51', '无标题', '1');
INSERT INTO `notepaper` VALUES ('41', '我你爹', '2020-02-18 17:50:35', '无标题', '9');
INSERT INTO `notepaper` VALUES ('42', '明天去小区门口量体温', '2020-03-13 21:27:10', '明天去小区门口量体温', '1');

-- ----------------------------
-- Table structure for `permission`
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`pk_id`),
  KEY `FK2f9f91f213gwtglofko5r429s` (`menu_id`),
  KEY `FK7b71lfkstl47tston4lrd8066` (`role_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `systemmenu` (`menu_id`),
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=879 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('56', '1', '1', '1');
INSERT INTO `permission` VALUES ('57', '1', '2', '1');
INSERT INTO `permission` VALUES ('58', '1', '3', '1');
INSERT INTO `permission` VALUES ('59', '1', '4', '1');
INSERT INTO `permission` VALUES ('60', '1', '5', '1');
INSERT INTO `permission` VALUES ('61', '1', '6', '1');
INSERT INTO `permission` VALUES ('62', '1', '7', '1');
INSERT INTO `permission` VALUES ('63', '1', '8', '1');
INSERT INTO `permission` VALUES ('64', '1', '9', '1');
INSERT INTO `permission` VALUES ('65', '1', '10', '1');
INSERT INTO `permission` VALUES ('66', '1', '11', '1');
INSERT INTO `permission` VALUES ('67', '1', '12', '1');
INSERT INTO `permission` VALUES ('68', '1', '13', '1');
INSERT INTO `permission` VALUES ('69', '1', '14', '1');
INSERT INTO `permission` VALUES ('70', '1', '15', '1');
INSERT INTO `permission` VALUES ('71', '1', '16', '1');
INSERT INTO `permission` VALUES ('72', '1', '17', '1');
INSERT INTO `permission` VALUES ('73', '1', '18', '1');
INSERT INTO `permission` VALUES ('74', '1', '19', '1');
INSERT INTO `permission` VALUES ('75', '1', '20', '1');
INSERT INTO `permission` VALUES ('76', '1', '21', '1');
INSERT INTO `permission` VALUES ('77', '1', '22', '1');
INSERT INTO `permission` VALUES ('78', '1', '23', '1');
INSERT INTO `permission` VALUES ('79', '1', '24', '1');
INSERT INTO `permission` VALUES ('80', '1', '25', '1');
INSERT INTO `permission` VALUES ('81', '1', '26', '1');
INSERT INTO `permission` VALUES ('82', '1', '27', '1');
INSERT INTO `permission` VALUES ('83', '1', '28', '1');
INSERT INTO `permission` VALUES ('84', '1', '29', '1');
INSERT INTO `permission` VALUES ('85', '1', '30', '1');
INSERT INTO `permission` VALUES ('86', '1', '31', '1');
INSERT INTO `permission` VALUES ('87', '1', '32', '1');
INSERT INTO `permission` VALUES ('88', '1', '33', '1');
INSERT INTO `permission` VALUES ('89', '1', '34', '1');
INSERT INTO `permission` VALUES ('90', '1', '35', '1');
INSERT INTO `permission` VALUES ('91', '1', '36', '1');
INSERT INTO `permission` VALUES ('92', '1', '37', '1');
INSERT INTO `permission` VALUES ('93', '1', '38', '1');
INSERT INTO `permission` VALUES ('94', '1', '39', '1');
INSERT INTO `permission` VALUES ('95', '1', '40', '1');
INSERT INTO `permission` VALUES ('96', '1', '41', '1');
INSERT INTO `permission` VALUES ('97', '1', '42', '1');
INSERT INTO `permission` VALUES ('98', '1', '67', '1');
INSERT INTO `permission` VALUES ('99', '0', '76', '1');
INSERT INTO `permission` VALUES ('100', '0', '77', '1');
INSERT INTO `permission` VALUES ('101', '0', '78', '1');
INSERT INTO `permission` VALUES ('102', '0', '79', '1');
INSERT INTO `permission` VALUES ('103', '0', '80', '1');
INSERT INTO `permission` VALUES ('104', '0', '81', '1');
INSERT INTO `permission` VALUES ('105', '0', '82', '1');
INSERT INTO `permission` VALUES ('106', '0', '86', '1');
INSERT INTO `permission` VALUES ('107', '0', '87', '1');
INSERT INTO `permission` VALUES ('108', '0', '88', '1');
INSERT INTO `permission` VALUES ('109', '1', '89', '1');
INSERT INTO `permission` VALUES ('110', '1', '90', '1');
INSERT INTO `permission` VALUES ('111', '0', '1', '2');
INSERT INTO `permission` VALUES ('112', '1', '2', '2');
INSERT INTO `permission` VALUES ('113', '1', '3', '2');
INSERT INTO `permission` VALUES ('114', '0', '4', '2');
INSERT INTO `permission` VALUES ('115', '1', '5', '2');
INSERT INTO `permission` VALUES ('116', '1', '6', '2');
INSERT INTO `permission` VALUES ('117', '1', '7', '2');
INSERT INTO `permission` VALUES ('118', '1', '8', '2');
INSERT INTO `permission` VALUES ('119', '0', '9', '2');
INSERT INTO `permission` VALUES ('120', '1', '10', '2');
INSERT INTO `permission` VALUES ('121', '1', '11', '2');
INSERT INTO `permission` VALUES ('122', '1', '12', '2');
INSERT INTO `permission` VALUES ('123', '1', '13', '2');
INSERT INTO `permission` VALUES ('124', '0', '14', '2');
INSERT INTO `permission` VALUES ('125', '0', '15', '2');
INSERT INTO `permission` VALUES ('126', '0', '16', '2');
INSERT INTO `permission` VALUES ('127', '1', '17', '2');
INSERT INTO `permission` VALUES ('128', '1', '18', '2');
INSERT INTO `permission` VALUES ('129', '1', '19', '2');
INSERT INTO `permission` VALUES ('130', '0', '20', '2');
INSERT INTO `permission` VALUES ('131', '1', '21', '2');
INSERT INTO `permission` VALUES ('132', '0', '22', '2');
INSERT INTO `permission` VALUES ('133', '0', '23', '2');
INSERT INTO `permission` VALUES ('134', '1', '24', '2');
INSERT INTO `permission` VALUES ('135', '0', '25', '2');
INSERT INTO `permission` VALUES ('136', '1', '26', '2');
INSERT INTO `permission` VALUES ('137', '1', '27', '2');
INSERT INTO `permission` VALUES ('138', '1', '28', '2');
INSERT INTO `permission` VALUES ('139', '1', '29', '2');
INSERT INTO `permission` VALUES ('140', '1', '30', '2');
INSERT INTO `permission` VALUES ('141', '1', '31', '2');
INSERT INTO `permission` VALUES ('142', '1', '32', '2');
INSERT INTO `permission` VALUES ('143', '1', '33', '2');
INSERT INTO `permission` VALUES ('144', '1', '34', '2');
INSERT INTO `permission` VALUES ('145', '1', '35', '2');
INSERT INTO `permission` VALUES ('146', '1', '36', '2');
INSERT INTO `permission` VALUES ('147', '1', '37', '2');
INSERT INTO `permission` VALUES ('148', '1', '38', '2');
INSERT INTO `permission` VALUES ('149', '1', '39', '2');
INSERT INTO `permission` VALUES ('150', '1', '40', '2');
INSERT INTO `permission` VALUES ('151', '1', '41', '2');
INSERT INTO `permission` VALUES ('152', '1', '42', '2');
INSERT INTO `permission` VALUES ('153', '1', '67', '2');
INSERT INTO `permission` VALUES ('154', '0', '76', '2');
INSERT INTO `permission` VALUES ('155', '0', '77', '2');
INSERT INTO `permission` VALUES ('156', '0', '78', '2');
INSERT INTO `permission` VALUES ('157', '0', '79', '2');
INSERT INTO `permission` VALUES ('158', '0', '80', '2');
INSERT INTO `permission` VALUES ('159', '0', '81', '2');
INSERT INTO `permission` VALUES ('160', '0', '82', '2');
INSERT INTO `permission` VALUES ('161', '0', '86', '2');
INSERT INTO `permission` VALUES ('162', '0', '87', '2');
INSERT INTO `permission` VALUES ('163', '0', '88', '2');
INSERT INTO `permission` VALUES ('164', '1', '89', '2');
INSERT INTO `permission` VALUES ('165', '0', '90', '2');
INSERT INTO `permission` VALUES ('166', '0', '1', '3');
INSERT INTO `permission` VALUES ('167', '0', '2', '3');
INSERT INTO `permission` VALUES ('168', '1', '3', '3');
INSERT INTO `permission` VALUES ('169', '0', '4', '3');
INSERT INTO `permission` VALUES ('170', '1', '5', '3');
INSERT INTO `permission` VALUES ('171', '1', '6', '3');
INSERT INTO `permission` VALUES ('172', '1', '7', '3');
INSERT INTO `permission` VALUES ('173', '1', '8', '3');
INSERT INTO `permission` VALUES ('174', '0', '9', '3');
INSERT INTO `permission` VALUES ('175', '1', '10', '3');
INSERT INTO `permission` VALUES ('176', '1', '11', '3');
INSERT INTO `permission` VALUES ('177', '1', '12', '3');
INSERT INTO `permission` VALUES ('178', '1', '13', '3');
INSERT INTO `permission` VALUES ('179', '0', '14', '3');
INSERT INTO `permission` VALUES ('180', '0', '15', '3');
INSERT INTO `permission` VALUES ('181', '0', '16', '3');
INSERT INTO `permission` VALUES ('182', '0', '17', '3');
INSERT INTO `permission` VALUES ('183', '0', '18', '3');
INSERT INTO `permission` VALUES ('184', '0', '19', '3');
INSERT INTO `permission` VALUES ('185', '0', '20', '3');
INSERT INTO `permission` VALUES ('186', '1', '21', '3');
INSERT INTO `permission` VALUES ('187', '0', '22', '3');
INSERT INTO `permission` VALUES ('188', '0', '23', '3');
INSERT INTO `permission` VALUES ('189', '1', '24', '3');
INSERT INTO `permission` VALUES ('190', '1', '25', '3');
INSERT INTO `permission` VALUES ('191', '1', '26', '3');
INSERT INTO `permission` VALUES ('192', '1', '27', '3');
INSERT INTO `permission` VALUES ('193', '1', '28', '3');
INSERT INTO `permission` VALUES ('194', '1', '29', '3');
INSERT INTO `permission` VALUES ('195', '1', '30', '3');
INSERT INTO `permission` VALUES ('196', '1', '31', '3');
INSERT INTO `permission` VALUES ('197', '1', '32', '3');
INSERT INTO `permission` VALUES ('198', '1', '33', '3');
INSERT INTO `permission` VALUES ('199', '1', '34', '3');
INSERT INTO `permission` VALUES ('200', '1', '35', '3');
INSERT INTO `permission` VALUES ('201', '1', '36', '3');
INSERT INTO `permission` VALUES ('202', '1', '37', '3');
INSERT INTO `permission` VALUES ('203', '1', '38', '3');
INSERT INTO `permission` VALUES ('204', '1', '39', '3');
INSERT INTO `permission` VALUES ('205', '1', '40', '3');
INSERT INTO `permission` VALUES ('206', '1', '41', '3');
INSERT INTO `permission` VALUES ('207', '1', '42', '3');
INSERT INTO `permission` VALUES ('208', '1', '67', '3');
INSERT INTO `permission` VALUES ('209', '0', '76', '3');
INSERT INTO `permission` VALUES ('210', '0', '77', '3');
INSERT INTO `permission` VALUES ('211', '0', '78', '3');
INSERT INTO `permission` VALUES ('212', '0', '79', '3');
INSERT INTO `permission` VALUES ('213', '0', '80', '3');
INSERT INTO `permission` VALUES ('214', '0', '81', '3');
INSERT INTO `permission` VALUES ('215', '0', '82', '3');
INSERT INTO `permission` VALUES ('216', '0', '86', '3');
INSERT INTO `permission` VALUES ('217', '0', '87', '3');
INSERT INTO `permission` VALUES ('218', '0', '88', '3');
INSERT INTO `permission` VALUES ('219', '0', '89', '3');
INSERT INTO `permission` VALUES ('220', '1', '90', '3');
INSERT INTO `permission` VALUES ('221', '0', '1', '4');
INSERT INTO `permission` VALUES ('222', '0', '2', '4');
INSERT INTO `permission` VALUES ('223', '0', '3', '4');
INSERT INTO `permission` VALUES ('224', '0', '4', '4');
INSERT INTO `permission` VALUES ('225', '1', '5', '4');
INSERT INTO `permission` VALUES ('226', '1', '6', '4');
INSERT INTO `permission` VALUES ('227', '1', '7', '4');
INSERT INTO `permission` VALUES ('228', '1', '8', '4');
INSERT INTO `permission` VALUES ('229', '0', '9', '4');
INSERT INTO `permission` VALUES ('230', '1', '10', '4');
INSERT INTO `permission` VALUES ('231', '1', '11', '4');
INSERT INTO `permission` VALUES ('232', '1', '12', '4');
INSERT INTO `permission` VALUES ('233', '1', '13', '4');
INSERT INTO `permission` VALUES ('234', '0', '14', '4');
INSERT INTO `permission` VALUES ('235', '0', '15', '4');
INSERT INTO `permission` VALUES ('236', '0', '16', '4');
INSERT INTO `permission` VALUES ('237', '0', '17', '4');
INSERT INTO `permission` VALUES ('238', '0', '18', '4');
INSERT INTO `permission` VALUES ('239', '0', '19', '4');
INSERT INTO `permission` VALUES ('240', '0', '20', '4');
INSERT INTO `permission` VALUES ('241', '0', '21', '4');
INSERT INTO `permission` VALUES ('242', '0', '22', '4');
INSERT INTO `permission` VALUES ('243', '0', '23', '4');
INSERT INTO `permission` VALUES ('244', '1', '24', '4');
INSERT INTO `permission` VALUES ('245', '1', '25', '4');
INSERT INTO `permission` VALUES ('246', '1', '26', '4');
INSERT INTO `permission` VALUES ('247', '1', '27', '4');
INSERT INTO `permission` VALUES ('248', '1', '28', '4');
INSERT INTO `permission` VALUES ('249', '1', '29', '4');
INSERT INTO `permission` VALUES ('250', '1', '30', '4');
INSERT INTO `permission` VALUES ('251', '0', '31', '4');
INSERT INTO `permission` VALUES ('252', '1', '32', '4');
INSERT INTO `permission` VALUES ('253', '1', '33', '4');
INSERT INTO `permission` VALUES ('254', '1', '34', '4');
INSERT INTO `permission` VALUES ('255', '1', '35', '4');
INSERT INTO `permission` VALUES ('256', '1', '36', '4');
INSERT INTO `permission` VALUES ('257', '1', '37', '4');
INSERT INTO `permission` VALUES ('258', '1', '38', '4');
INSERT INTO `permission` VALUES ('259', '1', '39', '4');
INSERT INTO `permission` VALUES ('260', '1', '40', '4');
INSERT INTO `permission` VALUES ('261', '1', '41', '4');
INSERT INTO `permission` VALUES ('262', '1', '42', '4');
INSERT INTO `permission` VALUES ('263', '1', '67', '4');
INSERT INTO `permission` VALUES ('264', '0', '76', '4');
INSERT INTO `permission` VALUES ('265', '0', '77', '4');
INSERT INTO `permission` VALUES ('266', '0', '78', '4');
INSERT INTO `permission` VALUES ('267', '0', '79', '4');
INSERT INTO `permission` VALUES ('268', '0', '80', '4');
INSERT INTO `permission` VALUES ('269', '0', '81', '4');
INSERT INTO `permission` VALUES ('270', '0', '82', '4');
INSERT INTO `permission` VALUES ('271', '0', '86', '4');
INSERT INTO `permission` VALUES ('272', '0', '87', '4');
INSERT INTO `permission` VALUES ('273', '0', '88', '4');
INSERT INTO `permission` VALUES ('274', '0', '89', '4');
INSERT INTO `permission` VALUES ('275', '1', '90', '4');
INSERT INTO `permission` VALUES ('276', '0', '1', '5');
INSERT INTO `permission` VALUES ('277', '0', '2', '5');
INSERT INTO `permission` VALUES ('278', '0', '3', '5');
INSERT INTO `permission` VALUES ('279', '0', '4', '5');
INSERT INTO `permission` VALUES ('280', '1', '5', '5');
INSERT INTO `permission` VALUES ('281', '1', '6', '5');
INSERT INTO `permission` VALUES ('282', '1', '7', '5');
INSERT INTO `permission` VALUES ('283', '1', '8', '5');
INSERT INTO `permission` VALUES ('284', '0', '9', '5');
INSERT INTO `permission` VALUES ('285', '1', '10', '5');
INSERT INTO `permission` VALUES ('286', '1', '11', '5');
INSERT INTO `permission` VALUES ('287', '1', '12', '5');
INSERT INTO `permission` VALUES ('288', '1', '13', '5');
INSERT INTO `permission` VALUES ('289', '0', '14', '5');
INSERT INTO `permission` VALUES ('290', '0', '15', '5');
INSERT INTO `permission` VALUES ('291', '0', '16', '5');
INSERT INTO `permission` VALUES ('292', '0', '17', '5');
INSERT INTO `permission` VALUES ('293', '0', '18', '5');
INSERT INTO `permission` VALUES ('294', '0', '19', '5');
INSERT INTO `permission` VALUES ('295', '0', '20', '5');
INSERT INTO `permission` VALUES ('296', '0', '21', '5');
INSERT INTO `permission` VALUES ('297', '0', '22', '5');
INSERT INTO `permission` VALUES ('298', '0', '23', '5');
INSERT INTO `permission` VALUES ('299', '0', '24', '5');
INSERT INTO `permission` VALUES ('300', '1', '25', '5');
INSERT INTO `permission` VALUES ('301', '0', '26', '5');
INSERT INTO `permission` VALUES ('302', '0', '27', '5');
INSERT INTO `permission` VALUES ('303', '1', '28', '5');
INSERT INTO `permission` VALUES ('304', '1', '29', '5');
INSERT INTO `permission` VALUES ('305', '1', '30', '5');
INSERT INTO `permission` VALUES ('306', '1', '31', '5');
INSERT INTO `permission` VALUES ('307', '1', '32', '5');
INSERT INTO `permission` VALUES ('308', '0', '33', '5');
INSERT INTO `permission` VALUES ('309', '1', '34', '5');
INSERT INTO `permission` VALUES ('310', '1', '35', '5');
INSERT INTO `permission` VALUES ('311', '1', '36', '5');
INSERT INTO `permission` VALUES ('312', '1', '37', '5');
INSERT INTO `permission` VALUES ('313', '1', '38', '5');
INSERT INTO `permission` VALUES ('314', '1', '39', '5');
INSERT INTO `permission` VALUES ('315', '1', '40', '5');
INSERT INTO `permission` VALUES ('316', '1', '41', '5');
INSERT INTO `permission` VALUES ('317', '1', '42', '5');
INSERT INTO `permission` VALUES ('318', '0', '67', '5');
INSERT INTO `permission` VALUES ('319', '0', '76', '5');
INSERT INTO `permission` VALUES ('320', '0', '77', '5');
INSERT INTO `permission` VALUES ('321', '0', '78', '5');
INSERT INTO `permission` VALUES ('322', '0', '79', '5');
INSERT INTO `permission` VALUES ('323', '0', '80', '5');
INSERT INTO `permission` VALUES ('324', '0', '81', '5');
INSERT INTO `permission` VALUES ('325', '0', '82', '5');
INSERT INTO `permission` VALUES ('326', '0', '86', '5');
INSERT INTO `permission` VALUES ('327', '0', '87', '5');
INSERT INTO `permission` VALUES ('328', '0', '88', '5');
INSERT INTO `permission` VALUES ('329', '0', '89', '5');
INSERT INTO `permission` VALUES ('330', '1', '90', '5');
INSERT INTO `permission` VALUES ('331', '0', '1', '6');
INSERT INTO `permission` VALUES ('332', '0', '2', '6');
INSERT INTO `permission` VALUES ('333', '0', '3', '6');
INSERT INTO `permission` VALUES ('334', '0', '4', '6');
INSERT INTO `permission` VALUES ('335', '0', '5', '6');
INSERT INTO `permission` VALUES ('336', '1', '6', '6');
INSERT INTO `permission` VALUES ('337', '1', '7', '6');
INSERT INTO `permission` VALUES ('338', '1', '8', '6');
INSERT INTO `permission` VALUES ('339', '0', '9', '6');
INSERT INTO `permission` VALUES ('340', '0', '10', '6');
INSERT INTO `permission` VALUES ('341', '0', '11', '6');
INSERT INTO `permission` VALUES ('342', '0', '12', '6');
INSERT INTO `permission` VALUES ('343', '0', '13', '6');
INSERT INTO `permission` VALUES ('344', '0', '14', '6');
INSERT INTO `permission` VALUES ('345', '0', '15', '6');
INSERT INTO `permission` VALUES ('346', '0', '16', '6');
INSERT INTO `permission` VALUES ('347', '0', '17', '6');
INSERT INTO `permission` VALUES ('348', '0', '18', '6');
INSERT INTO `permission` VALUES ('349', '0', '19', '6');
INSERT INTO `permission` VALUES ('350', '0', '20', '6');
INSERT INTO `permission` VALUES ('351', '0', '21', '6');
INSERT INTO `permission` VALUES ('352', '0', '22', '6');
INSERT INTO `permission` VALUES ('353', '0', '23', '6');
INSERT INTO `permission` VALUES ('354', '0', '24', '6');
INSERT INTO `permission` VALUES ('355', '0', '25', '6');
INSERT INTO `permission` VALUES ('356', '0', '26', '6');
INSERT INTO `permission` VALUES ('357', '0', '27', '6');
INSERT INTO `permission` VALUES ('358', '0', '28', '6');
INSERT INTO `permission` VALUES ('359', '0', '29', '6');
INSERT INTO `permission` VALUES ('360', '0', '30', '6');
INSERT INTO `permission` VALUES ('361', '0', '31', '6');
INSERT INTO `permission` VALUES ('362', '1', '32', '6');
INSERT INTO `permission` VALUES ('363', '0', '33', '6');
INSERT INTO `permission` VALUES ('364', '0', '34', '6');
INSERT INTO `permission` VALUES ('365', '0', '35', '6');
INSERT INTO `permission` VALUES ('366', '0', '36', '6');
INSERT INTO `permission` VALUES ('367', '0', '37', '6');
INSERT INTO `permission` VALUES ('368', '0', '38', '6');
INSERT INTO `permission` VALUES ('369', '1', '39', '6');
INSERT INTO `permission` VALUES ('370', '1', '40', '6');
INSERT INTO `permission` VALUES ('371', '0', '41', '6');
INSERT INTO `permission` VALUES ('372', '0', '42', '6');
INSERT INTO `permission` VALUES ('373', '0', '67', '6');
INSERT INTO `permission` VALUES ('374', '0', '76', '6');
INSERT INTO `permission` VALUES ('375', '0', '77', '6');
INSERT INTO `permission` VALUES ('376', '0', '78', '6');
INSERT INTO `permission` VALUES ('377', '0', '79', '6');
INSERT INTO `permission` VALUES ('378', '0', '80', '6');
INSERT INTO `permission` VALUES ('379', '0', '81', '6');
INSERT INTO `permission` VALUES ('380', '0', '82', '6');
INSERT INTO `permission` VALUES ('381', '0', '86', '6');
INSERT INTO `permission` VALUES ('382', '0', '87', '6');
INSERT INTO `permission` VALUES ('383', '0', '88', '6');
INSERT INTO `permission` VALUES ('384', '0', '89', '6');
INSERT INTO `permission` VALUES ('385', '0', '90', '6');
INSERT INTO `permission` VALUES ('386', '0', '1', '7');
INSERT INTO `permission` VALUES ('387', '0', '2', '7');
INSERT INTO `permission` VALUES ('388', '0', '3', '7');
INSERT INTO `permission` VALUES ('389', '1', '4', '7');
INSERT INTO `permission` VALUES ('390', '0', '5', '7');
INSERT INTO `permission` VALUES ('391', '1', '6', '7');
INSERT INTO `permission` VALUES ('392', '1', '7', '7');
INSERT INTO `permission` VALUES ('393', '1', '8', '7');
INSERT INTO `permission` VALUES ('394', '1', '9', '7');
INSERT INTO `permission` VALUES ('395', '1', '10', '7');
INSERT INTO `permission` VALUES ('396', '0', '11', '7');
INSERT INTO `permission` VALUES ('397', '0', '12', '7');
INSERT INTO `permission` VALUES ('398', '0', '13', '7');
INSERT INTO `permission` VALUES ('399', '0', '14', '7');
INSERT INTO `permission` VALUES ('400', '0', '15', '7');
INSERT INTO `permission` VALUES ('401', '0', '16', '7');
INSERT INTO `permission` VALUES ('402', '0', '17', '7');
INSERT INTO `permission` VALUES ('403', '0', '18', '7');
INSERT INTO `permission` VALUES ('404', '0', '19', '7');
INSERT INTO `permission` VALUES ('405', '0', '20', '7');
INSERT INTO `permission` VALUES ('406', '0', '21', '7');
INSERT INTO `permission` VALUES ('407', '1', '22', '7');
INSERT INTO `permission` VALUES ('408', '1', '23', '7');
INSERT INTO `permission` VALUES ('409', '0', '24', '7');
INSERT INTO `permission` VALUES ('410', '0', '25', '7');
INSERT INTO `permission` VALUES ('411', '0', '26', '7');
INSERT INTO `permission` VALUES ('412', '0', '27', '7');
INSERT INTO `permission` VALUES ('413', '0', '28', '7');
INSERT INTO `permission` VALUES ('414', '0', '29', '7');
INSERT INTO `permission` VALUES ('415', '0', '30', '7');
INSERT INTO `permission` VALUES ('416', '0', '31', '7');
INSERT INTO `permission` VALUES ('417', '1', '32', '7');
INSERT INTO `permission` VALUES ('418', '1', '33', '7');
INSERT INTO `permission` VALUES ('419', '1', '34', '7');
INSERT INTO `permission` VALUES ('420', '1', '35', '7');
INSERT INTO `permission` VALUES ('421', '0', '36', '7');
INSERT INTO `permission` VALUES ('422', '0', '37', '7');
INSERT INTO `permission` VALUES ('423', '0', '38', '7');
INSERT INTO `permission` VALUES ('424', '1', '39', '7');
INSERT INTO `permission` VALUES ('425', '1', '40', '7');
INSERT INTO `permission` VALUES ('426', '0', '41', '7');
INSERT INTO `permission` VALUES ('427', '0', '42', '7');
INSERT INTO `permission` VALUES ('428', '0', '67', '7');
INSERT INTO `permission` VALUES ('429', '0', '76', '7');
INSERT INTO `permission` VALUES ('430', '0', '77', '7');
INSERT INTO `permission` VALUES ('431', '0', '78', '7');
INSERT INTO `permission` VALUES ('432', '0', '79', '7');
INSERT INTO `permission` VALUES ('433', '0', '80', '7');
INSERT INTO `permission` VALUES ('434', '0', '81', '7');
INSERT INTO `permission` VALUES ('435', '0', '82', '7');
INSERT INTO `permission` VALUES ('436', '0', '86', '7');
INSERT INTO `permission` VALUES ('437', '0', '87', '7');
INSERT INTO `permission` VALUES ('438', '0', '88', '7');
INSERT INTO `permission` VALUES ('439', '0', '89', '7');
INSERT INTO `permission` VALUES ('440', '0', '90', '7');
INSERT INTO `permission` VALUES ('441', '1', '91', '1');
INSERT INTO `permission` VALUES ('442', '1', '91', '2');
INSERT INTO `permission` VALUES ('443', '0', '91', '3');
INSERT INTO `permission` VALUES ('444', '0', '91', '4');
INSERT INTO `permission` VALUES ('445', '0', '91', '5');
INSERT INTO `permission` VALUES ('446', '0', '91', '6');
INSERT INTO `permission` VALUES ('447', '0', '91', '7');
INSERT INTO `permission` VALUES ('448', '1', '92', '1');
INSERT INTO `permission` VALUES ('449', '1', '92', '2');
INSERT INTO `permission` VALUES ('450', '1', '92', '3');
INSERT INTO `permission` VALUES ('451', '1', '92', '4');
INSERT INTO `permission` VALUES ('452', '1', '92', '5');
INSERT INTO `permission` VALUES ('453', '1', '92', '6');
INSERT INTO `permission` VALUES ('454', '1', '92', '7');
INSERT INTO `permission` VALUES ('455', '1', '93', '1');
INSERT INTO `permission` VALUES ('456', '1', '93', '2');
INSERT INTO `permission` VALUES ('457', '1', '93', '3');
INSERT INTO `permission` VALUES ('458', '1', '93', '4');
INSERT INTO `permission` VALUES ('459', '1', '93', '5');
INSERT INTO `permission` VALUES ('460', '1', '93', '6');
INSERT INTO `permission` VALUES ('461', '1', '93', '7');
INSERT INTO `permission` VALUES ('462', '1', '94', '1');
INSERT INTO `permission` VALUES ('463', '1', '94', '2');
INSERT INTO `permission` VALUES ('464', '1', '94', '3');
INSERT INTO `permission` VALUES ('465', '0', '94', '4');
INSERT INTO `permission` VALUES ('466', '0', '94', '5');
INSERT INTO `permission` VALUES ('467', '0', '94', '6');
INSERT INTO `permission` VALUES ('468', '0', '94', '7');
INSERT INTO `permission` VALUES ('469', '1', '95', '1');
INSERT INTO `permission` VALUES ('470', '0', '95', '2');
INSERT INTO `permission` VALUES ('471', '0', '95', '3');
INSERT INTO `permission` VALUES ('472', '1', '95', '4');
INSERT INTO `permission` VALUES ('473', '0', '95', '5');
INSERT INTO `permission` VALUES ('474', '0', '95', '6');
INSERT INTO `permission` VALUES ('475', '0', '95', '7');
INSERT INTO `permission` VALUES ('476', '1', '96', '1');
INSERT INTO `permission` VALUES ('477', '1', '96', '2');
INSERT INTO `permission` VALUES ('478', '1', '96', '3');
INSERT INTO `permission` VALUES ('479', '1', '96', '4');
INSERT INTO `permission` VALUES ('480', '1', '96', '5');
INSERT INTO `permission` VALUES ('481', '1', '96', '6');
INSERT INTO `permission` VALUES ('482', '1', '96', '7');
INSERT INTO `permission` VALUES ('483', '1', '97', '1');
INSERT INTO `permission` VALUES ('484', '1', '97', '2');
INSERT INTO `permission` VALUES ('485', '1', '97', '3');
INSERT INTO `permission` VALUES ('486', '1', '97', '4');
INSERT INTO `permission` VALUES ('487', '1', '97', '5');
INSERT INTO `permission` VALUES ('488', '1', '97', '6');
INSERT INTO `permission` VALUES ('499', '1', '97', '7');
INSERT INTO `permission` VALUES ('500', '1', '98', '1');
INSERT INTO `permission` VALUES ('501', '1', '98', '2');
INSERT INTO `permission` VALUES ('502', '1', '98', '3');
INSERT INTO `permission` VALUES ('623', '0', '1', '8');
INSERT INTO `permission` VALUES ('624', '0', '2', '8');
INSERT INTO `permission` VALUES ('625', '0', '4', '8');
INSERT INTO `permission` VALUES ('626', '0', '6', '8');
INSERT INTO `permission` VALUES ('627', '0', '7', '8');
INSERT INTO `permission` VALUES ('628', '0', '8', '8');
INSERT INTO `permission` VALUES ('629', '0', '9', '8');
INSERT INTO `permission` VALUES ('630', '0', '14', '8');
INSERT INTO `permission` VALUES ('631', '0', '15', '8');
INSERT INTO `permission` VALUES ('632', '0', '16', '8');
INSERT INTO `permission` VALUES ('633', '0', '17', '8');
INSERT INTO `permission` VALUES ('634', '0', '18', '8');
INSERT INTO `permission` VALUES ('635', '0', '19', '8');
INSERT INTO `permission` VALUES ('636', '0', '20', '8');
INSERT INTO `permission` VALUES ('637', '0', '22', '8');
INSERT INTO `permission` VALUES ('638', '0', '23', '8');
INSERT INTO `permission` VALUES ('639', '0', '25', '8');
INSERT INTO `permission` VALUES ('640', '0', '26', '8');
INSERT INTO `permission` VALUES ('641', '0', '31', '8');
INSERT INTO `permission` VALUES ('642', '0', '32', '8');
INSERT INTO `permission` VALUES ('643', '0', '33', '8');
INSERT INTO `permission` VALUES ('644', '0', '34', '8');
INSERT INTO `permission` VALUES ('645', '0', '35', '8');
INSERT INTO `permission` VALUES ('646', '0', '36', '8');
INSERT INTO `permission` VALUES ('647', '0', '37', '8');
INSERT INTO `permission` VALUES ('648', '0', '38', '8');
INSERT INTO `permission` VALUES ('649', '0', '39', '8');
INSERT INTO `permission` VALUES ('650', '0', '40', '8');
INSERT INTO `permission` VALUES ('651', '0', '41', '8');
INSERT INTO `permission` VALUES ('652', '0', '42', '8');
INSERT INTO `permission` VALUES ('653', '0', '89', '8');
INSERT INTO `permission` VALUES ('654', '0', '90', '8');
INSERT INTO `permission` VALUES ('655', '0', '91', '8');
INSERT INTO `permission` VALUES ('656', '0', '92', '8');
INSERT INTO `permission` VALUES ('657', '0', '93', '8');
INSERT INTO `permission` VALUES ('658', '0', '94', '8');
INSERT INTO `permission` VALUES ('659', '0', '95', '8');
INSERT INTO `permission` VALUES ('660', '0', '96', '8');
INSERT INTO `permission` VALUES ('661', '0', '97', '8');
INSERT INTO `permission` VALUES ('662', '0', '98', '8');
INSERT INTO `permission` VALUES ('663', '0', '1', '9');
INSERT INTO `permission` VALUES ('664', '0', '2', '9');
INSERT INTO `permission` VALUES ('665', '0', '4', '9');
INSERT INTO `permission` VALUES ('666', '0', '6', '9');
INSERT INTO `permission` VALUES ('667', '0', '7', '9');
INSERT INTO `permission` VALUES ('668', '0', '8', '9');
INSERT INTO `permission` VALUES ('669', '0', '9', '9');
INSERT INTO `permission` VALUES ('670', '0', '14', '9');
INSERT INTO `permission` VALUES ('671', '0', '15', '9');
INSERT INTO `permission` VALUES ('672', '0', '16', '9');
INSERT INTO `permission` VALUES ('673', '0', '17', '9');
INSERT INTO `permission` VALUES ('674', '0', '18', '9');
INSERT INTO `permission` VALUES ('675', '0', '19', '9');
INSERT INTO `permission` VALUES ('676', '0', '20', '9');
INSERT INTO `permission` VALUES ('677', '0', '22', '9');
INSERT INTO `permission` VALUES ('678', '0', '23', '9');
INSERT INTO `permission` VALUES ('679', '0', '25', '9');
INSERT INTO `permission` VALUES ('680', '0', '26', '9');
INSERT INTO `permission` VALUES ('681', '0', '31', '9');
INSERT INTO `permission` VALUES ('682', '0', '32', '9');
INSERT INTO `permission` VALUES ('683', '0', '33', '9');
INSERT INTO `permission` VALUES ('684', '0', '34', '9');
INSERT INTO `permission` VALUES ('685', '0', '35', '9');
INSERT INTO `permission` VALUES ('686', '0', '36', '9');
INSERT INTO `permission` VALUES ('687', '0', '37', '9');
INSERT INTO `permission` VALUES ('688', '0', '38', '9');
INSERT INTO `permission` VALUES ('689', '0', '39', '9');
INSERT INTO `permission` VALUES ('690', '0', '40', '9');
INSERT INTO `permission` VALUES ('691', '0', '41', '9');
INSERT INTO `permission` VALUES ('692', '0', '42', '9');
INSERT INTO `permission` VALUES ('693', '0', '89', '9');
INSERT INTO `permission` VALUES ('694', '0', '90', '9');
INSERT INTO `permission` VALUES ('695', '0', '91', '9');
INSERT INTO `permission` VALUES ('696', '0', '92', '9');
INSERT INTO `permission` VALUES ('697', '0', '93', '9');
INSERT INTO `permission` VALUES ('698', '0', '94', '9');
INSERT INTO `permission` VALUES ('699', '0', '95', '9');
INSERT INTO `permission` VALUES ('700', '0', '96', '9');
INSERT INTO `permission` VALUES ('701', '0', '97', '9');
INSERT INTO `permission` VALUES ('702', '0', '98', '9');
INSERT INTO `permission` VALUES ('703', '1', '99', '1');
INSERT INTO `permission` VALUES ('704', '1', '99', '2');
INSERT INTO `permission` VALUES ('705', '1', '99', '3');
INSERT INTO `permission` VALUES ('706', '1', '99', '4');
INSERT INTO `permission` VALUES ('707', '1', '99', '5');
INSERT INTO `permission` VALUES ('708', '1', '99', '6');
INSERT INTO `permission` VALUES ('709', '1', '99', '7');
INSERT INTO `permission` VALUES ('710', '0', '99', '9');
INSERT INTO `permission` VALUES ('711', '1', '98', '4');
INSERT INTO `permission` VALUES ('712', '1', '98', '5');
INSERT INTO `permission` VALUES ('713', '0', '98', '6');
INSERT INTO `permission` VALUES ('714', '0', '98', '7');
INSERT INTO `permission` VALUES ('715', '0', '1', '9');
INSERT INTO `permission` VALUES ('716', '0', '2', '9');
INSERT INTO `permission` VALUES ('717', '0', '4', '9');
INSERT INTO `permission` VALUES ('718', '0', '6', '9');
INSERT INTO `permission` VALUES ('719', '0', '7', '9');
INSERT INTO `permission` VALUES ('720', '0', '8', '9');
INSERT INTO `permission` VALUES ('721', '0', '9', '9');
INSERT INTO `permission` VALUES ('722', '0', '14', '9');
INSERT INTO `permission` VALUES ('723', '0', '15', '9');
INSERT INTO `permission` VALUES ('724', '0', '16', '9');
INSERT INTO `permission` VALUES ('725', '0', '17', '9');
INSERT INTO `permission` VALUES ('726', '0', '18', '9');
INSERT INTO `permission` VALUES ('727', '0', '19', '9');
INSERT INTO `permission` VALUES ('728', '0', '20', '9');
INSERT INTO `permission` VALUES ('729', '0', '22', '9');
INSERT INTO `permission` VALUES ('730', '0', '23', '9');
INSERT INTO `permission` VALUES ('731', '0', '25', '9');
INSERT INTO `permission` VALUES ('732', '0', '26', '9');
INSERT INTO `permission` VALUES ('733', '0', '31', '9');
INSERT INTO `permission` VALUES ('734', '0', '32', '9');
INSERT INTO `permission` VALUES ('735', '0', '33', '9');
INSERT INTO `permission` VALUES ('736', '0', '34', '9');
INSERT INTO `permission` VALUES ('737', '0', '35', '9');
INSERT INTO `permission` VALUES ('738', '0', '36', '9');
INSERT INTO `permission` VALUES ('739', '0', '37', '9');
INSERT INTO `permission` VALUES ('740', '0', '38', '9');
INSERT INTO `permission` VALUES ('741', '0', '39', '9');
INSERT INTO `permission` VALUES ('742', '0', '40', '9');
INSERT INTO `permission` VALUES ('743', '0', '41', '9');
INSERT INTO `permission` VALUES ('744', '0', '42', '9');
INSERT INTO `permission` VALUES ('745', '0', '89', '9');
INSERT INTO `permission` VALUES ('746', '0', '90', '9');
INSERT INTO `permission` VALUES ('747', '0', '91', '9');
INSERT INTO `permission` VALUES ('748', '0', '92', '9');
INSERT INTO `permission` VALUES ('749', '0', '93', '9');
INSERT INTO `permission` VALUES ('750', '0', '94', '9');
INSERT INTO `permission` VALUES ('751', '0', '95', '9');
INSERT INTO `permission` VALUES ('752', '0', '96', '9');
INSERT INTO `permission` VALUES ('753', '0', '97', '9');
INSERT INTO `permission` VALUES ('754', '0', '98', '9');
INSERT INTO `permission` VALUES ('755', '0', '99', '9');
INSERT INTO `permission` VALUES ('756', '0', '1', '10');
INSERT INTO `permission` VALUES ('757', '0', '2', '10');
INSERT INTO `permission` VALUES ('758', '0', '4', '10');
INSERT INTO `permission` VALUES ('759', '0', '6', '10');
INSERT INTO `permission` VALUES ('760', '0', '7', '10');
INSERT INTO `permission` VALUES ('761', '0', '8', '10');
INSERT INTO `permission` VALUES ('762', '0', '9', '10');
INSERT INTO `permission` VALUES ('763', '0', '14', '10');
INSERT INTO `permission` VALUES ('764', '0', '15', '10');
INSERT INTO `permission` VALUES ('765', '0', '16', '10');
INSERT INTO `permission` VALUES ('766', '0', '17', '10');
INSERT INTO `permission` VALUES ('767', '0', '18', '10');
INSERT INTO `permission` VALUES ('768', '0', '19', '10');
INSERT INTO `permission` VALUES ('769', '0', '20', '10');
INSERT INTO `permission` VALUES ('770', '0', '22', '10');
INSERT INTO `permission` VALUES ('771', '0', '23', '10');
INSERT INTO `permission` VALUES ('772', '0', '25', '10');
INSERT INTO `permission` VALUES ('773', '0', '26', '10');
INSERT INTO `permission` VALUES ('774', '0', '31', '10');
INSERT INTO `permission` VALUES ('775', '0', '32', '10');
INSERT INTO `permission` VALUES ('776', '0', '33', '10');
INSERT INTO `permission` VALUES ('777', '0', '34', '10');
INSERT INTO `permission` VALUES ('778', '0', '35', '10');
INSERT INTO `permission` VALUES ('779', '0', '36', '10');
INSERT INTO `permission` VALUES ('780', '0', '37', '10');
INSERT INTO `permission` VALUES ('781', '0', '38', '10');
INSERT INTO `permission` VALUES ('782', '0', '39', '10');
INSERT INTO `permission` VALUES ('783', '0', '40', '10');
INSERT INTO `permission` VALUES ('784', '0', '41', '10');
INSERT INTO `permission` VALUES ('785', '0', '42', '10');
INSERT INTO `permission` VALUES ('786', '0', '89', '10');
INSERT INTO `permission` VALUES ('787', '0', '90', '10');
INSERT INTO `permission` VALUES ('788', '0', '91', '10');
INSERT INTO `permission` VALUES ('789', '0', '92', '10');
INSERT INTO `permission` VALUES ('790', '0', '93', '10');
INSERT INTO `permission` VALUES ('791', '0', '94', '10');
INSERT INTO `permission` VALUES ('792', '0', '95', '10');
INSERT INTO `permission` VALUES ('793', '0', '96', '10');
INSERT INTO `permission` VALUES ('794', '0', '97', '10');
INSERT INTO `permission` VALUES ('795', '0', '98', '10');
INSERT INTO `permission` VALUES ('796', '0', '99', '10');
INSERT INTO `permission` VALUES ('797', '0', '1', '11');
INSERT INTO `permission` VALUES ('798', '0', '2', '11');
INSERT INTO `permission` VALUES ('799', '0', '4', '11');
INSERT INTO `permission` VALUES ('800', '0', '6', '11');
INSERT INTO `permission` VALUES ('801', '0', '7', '11');
INSERT INTO `permission` VALUES ('802', '0', '8', '11');
INSERT INTO `permission` VALUES ('803', '0', '9', '11');
INSERT INTO `permission` VALUES ('804', '0', '14', '11');
INSERT INTO `permission` VALUES ('805', '0', '15', '11');
INSERT INTO `permission` VALUES ('806', '0', '16', '11');
INSERT INTO `permission` VALUES ('807', '0', '17', '11');
INSERT INTO `permission` VALUES ('808', '0', '18', '11');
INSERT INTO `permission` VALUES ('809', '0', '19', '11');
INSERT INTO `permission` VALUES ('810', '0', '20', '11');
INSERT INTO `permission` VALUES ('811', '0', '22', '11');
INSERT INTO `permission` VALUES ('812', '0', '23', '11');
INSERT INTO `permission` VALUES ('813', '0', '25', '11');
INSERT INTO `permission` VALUES ('814', '0', '26', '11');
INSERT INTO `permission` VALUES ('815', '0', '31', '11');
INSERT INTO `permission` VALUES ('816', '0', '32', '11');
INSERT INTO `permission` VALUES ('817', '0', '33', '11');
INSERT INTO `permission` VALUES ('818', '0', '34', '11');
INSERT INTO `permission` VALUES ('819', '0', '35', '11');
INSERT INTO `permission` VALUES ('820', '0', '36', '11');
INSERT INTO `permission` VALUES ('821', '0', '37', '11');
INSERT INTO `permission` VALUES ('822', '0', '38', '11');
INSERT INTO `permission` VALUES ('823', '0', '39', '11');
INSERT INTO `permission` VALUES ('824', '0', '40', '11');
INSERT INTO `permission` VALUES ('825', '0', '41', '11');
INSERT INTO `permission` VALUES ('826', '0', '42', '11');
INSERT INTO `permission` VALUES ('827', '0', '89', '11');
INSERT INTO `permission` VALUES ('828', '0', '90', '11');
INSERT INTO `permission` VALUES ('829', '0', '91', '11');
INSERT INTO `permission` VALUES ('830', '0', '92', '11');
INSERT INTO `permission` VALUES ('831', '0', '93', '11');
INSERT INTO `permission` VALUES ('832', '0', '94', '11');
INSERT INTO `permission` VALUES ('833', '0', '95', '11');
INSERT INTO `permission` VALUES ('834', '0', '96', '11');
INSERT INTO `permission` VALUES ('835', '0', '97', '11');
INSERT INTO `permission` VALUES ('836', '0', '98', '11');
INSERT INTO `permission` VALUES ('837', '0', '99', '11');
INSERT INTO `permission` VALUES ('838', '0', '1', '12');
INSERT INTO `permission` VALUES ('839', '0', '2', '12');
INSERT INTO `permission` VALUES ('840', '0', '4', '12');
INSERT INTO `permission` VALUES ('841', '0', '6', '12');
INSERT INTO `permission` VALUES ('842', '0', '7', '12');
INSERT INTO `permission` VALUES ('843', '0', '8', '12');
INSERT INTO `permission` VALUES ('844', '0', '9', '12');
INSERT INTO `permission` VALUES ('845', '0', '14', '12');
INSERT INTO `permission` VALUES ('846', '0', '15', '12');
INSERT INTO `permission` VALUES ('847', '0', '16', '12');
INSERT INTO `permission` VALUES ('848', '0', '17', '12');
INSERT INTO `permission` VALUES ('849', '0', '18', '12');
INSERT INTO `permission` VALUES ('850', '0', '19', '12');
INSERT INTO `permission` VALUES ('851', '0', '20', '12');
INSERT INTO `permission` VALUES ('852', '0', '22', '12');
INSERT INTO `permission` VALUES ('853', '0', '23', '12');
INSERT INTO `permission` VALUES ('854', '0', '25', '12');
INSERT INTO `permission` VALUES ('855', '0', '26', '12');
INSERT INTO `permission` VALUES ('856', '0', '31', '12');
INSERT INTO `permission` VALUES ('857', '0', '32', '12');
INSERT INTO `permission` VALUES ('858', '0', '33', '12');
INSERT INTO `permission` VALUES ('859', '0', '34', '12');
INSERT INTO `permission` VALUES ('860', '0', '35', '12');
INSERT INTO `permission` VALUES ('861', '0', '36', '12');
INSERT INTO `permission` VALUES ('862', '0', '37', '12');
INSERT INTO `permission` VALUES ('863', '0', '38', '12');
INSERT INTO `permission` VALUES ('864', '0', '39', '12');
INSERT INTO `permission` VALUES ('865', '0', '40', '12');
INSERT INTO `permission` VALUES ('866', '0', '41', '12');
INSERT INTO `permission` VALUES ('867', '0', '42', '12');
INSERT INTO `permission` VALUES ('868', '0', '89', '12');
INSERT INTO `permission` VALUES ('869', '0', '90', '12');
INSERT INTO `permission` VALUES ('870', '0', '91', '12');
INSERT INTO `permission` VALUES ('871', '0', '92', '12');
INSERT INTO `permission` VALUES ('872', '0', '93', '12');
INSERT INTO `permission` VALUES ('873', '0', '94', '12');
INSERT INTO `permission` VALUES ('874', '0', '95', '12');
INSERT INTO `permission` VALUES ('875', '0', '96', '12');
INSERT INTO `permission` VALUES ('876', '0', '97', '12');
INSERT INTO `permission` VALUES ('877', '0', '98', '12');
INSERT INTO `permission` VALUES ('878', '0', '99', '12');

-- ----------------------------
-- Table structure for `position`
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position` (
  `position_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `describtion` varchar(255) DEFAULT NULL,
  `deptid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('1', '1', '监狱长', '管理系统最高权限', '1');
INSERT INTO `position` VALUES ('2', '2', '政委', '领导班子', '1');
INSERT INTO `position` VALUES ('3', '3', '副监狱长', '领导班子', '1');
INSERT INTO `position` VALUES ('4', '4', '副政委', '领导班子', '1');
INSERT INTO `position` VALUES ('5', '5', '工会主席', '领导班子', '1');
INSERT INTO `position` VALUES ('6', '6', '政治处主任', '领导班子', '1');
INSERT INTO `position` VALUES ('7', '7', '行政办公室主任', '部门领导', '2');
INSERT INTO `position` VALUES ('8', '8', '财务主管', '部门领导', '3');
INSERT INTO `position` VALUES ('9', '9', '狱政管理科主任', '部门领导', '4');
INSERT INTO `position` VALUES ('10', '10', '教育改造办主任', '部门领导', '5');
INSERT INTO `position` VALUES ('11', '11', '生活卫生办主任', '部门领导', '6');
INSERT INTO `position` VALUES ('12', '12', '监狱医院院长', '部门领导', '7');
INSERT INTO `position` VALUES ('13', '13', '刑法执行科长', '部门领导', '8');
INSERT INTO `position` VALUES ('14', '14', '看守大队队长', '部门领导', '9');
INSERT INTO `position` VALUES ('15', '15', '档案科科长', '部门领导', '10');
INSERT INTO `position` VALUES ('16', '16', '一监区长', '部门领导', '11');
INSERT INTO `position` VALUES ('17', '17', '二监区长', '部门领导', '12');
INSERT INTO `position` VALUES ('18', '18', '三监区长', '部门领导', '13');
INSERT INTO `position` VALUES ('19', '19', '四监区长', '部门领导', '14');
INSERT INTO `position` VALUES ('20', '20', '五监区长', '部门领导', '15');
INSERT INTO `position` VALUES ('21', '21', '行政办公室科员', '行政办公室科员', '2');
INSERT INTO `position` VALUES ('22', '22', '会计', '会计', '3');
INSERT INTO `position` VALUES ('23', '23', '狱政管理科科员', '狱政管理科科员', '4');
INSERT INTO `position` VALUES ('24', '24', '教职工', '教职工', '5');
INSERT INTO `position` VALUES ('25', '25', '生活卫生办科员', '生活卫生办科员', '6');
INSERT INTO `position` VALUES ('26', '26', '医生', '医生', '7');
INSERT INTO `position` VALUES ('27', '27', '护士', '护士', '7');
INSERT INTO `position` VALUES ('28', '28', '刑法执行科科员', '刑法执行科科员', '8');
INSERT INTO `position` VALUES ('29', '29', '看守大队警务员', '看守大队警务员', '9');
INSERT INTO `position` VALUES ('30', '30', '档案管理员', '档案管理员', '10');
INSERT INTO `position` VALUES ('31', '31', '一监区警员', '一监区警员', '11');
INSERT INTO `position` VALUES ('32', '32', '二监区警员', '二监区警员', '12');
INSERT INTO `position` VALUES ('33', '33', '三监区警员', '三监区警员', '13');
INSERT INTO `position` VALUES ('34', '34', '四监区警员', '四监区警员', '14');
INSERT INTO `position` VALUES ('35', '35', '五监区警员', '五监区警员', '15');

-- ----------------------------
-- Table structure for `prision`
-- ----------------------------
DROP TABLE IF EXISTS `prision`;
CREATE TABLE `prision` (
  `prision_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prision_name` varchar(255) DEFAULT NULL,
  `prision_area` int(11) DEFAULT NULL,
  `prision_room` int(11) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `intime` date DEFAULT NULL,
  `inreason` varchar(255) DEFAULT NULL,
  `prision_term_old` int(11) DEFAULT NULL,
  `prision_term_new` int(11) DEFAULT NULL,
  `change_term` int(11) DEFAULT NULL,
  `change_reason` varchar(255) DEFAULT NULL,
  `health` varchar(255) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `work` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  `police_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`prision_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prision
-- ----------------------------
INSERT INTO `prision` VALUES ('1', '高育良', '1', '1', '男', '1976-03-07', '2020-03-07', '贪污罪', '10', '11', '1', '监狱斗殴', '头部受伤', '正常', '全勤', null, '1', null);
INSERT INTO `prision` VALUES ('2', '刘华强', '1', '5', '男', '1985-07-28', '2020-03-07', '杀人', '15', '15', '1', null, '健康', '正常', '全勤', null, '1', null);
INSERT INTO `prision` VALUES ('21', '封彪', '4', '3', '男', '1988-01-14', '2020-03-18', '杀人', '10', '10', '0', '', '', '', '', '', '0', null);
INSERT INTO `prision` VALUES ('25', '封彪1', '1', '1', '男', '2020-03-17', '2020-03-10', '强奸', '2', '2', '0', '', '良好', '上进', '积极', 'b', '1', null);
INSERT INTO `prision` VALUES ('29', '宋老虎', '3', '4', '男', '1988-08-02', '2020-03-02', '黑恶势力', '14', '13', '0', '从良', '良好', '经常缺席', '积极', '', '0', null);

-- ----------------------------
-- Table structure for `prisoner_archive`
-- ----------------------------
DROP TABLE IF EXISTS `prisoner_archive`;
CREATE TABLE `prisoner_archive` (
  `prisoner_id` varchar(10) DEFAULT NULL,
  `prisoner_name` varchar(255) DEFAULT NULL,
  `prisoner_crime` varchar(255) DEFAULT NULL,
  `prisoner_age` varchar(255) DEFAULT NULL,
  `prisoner_identity` varchar(255) DEFAULT NULL,
  `prisoner_address` varchar(255) DEFAULT NULL,
  `prisoner_in_time` datetime DEFAULT NULL,
  `prisoner_sentencetime` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of prisoner_archive
-- ----------------------------

-- ----------------------------
-- Table structure for `process`
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `process_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '流程id',
  `apply_time` datetime DEFAULT NULL COMMENT '流程申请时间',
  `deeply_id` bigint(20) DEFAULT NULL COMMENT '紧急程度',
  `end_time` datetime DEFAULT NULL COMMENT '流程结束时间',
  `process_des` text COMMENT '流程申请原因内容',
  `process_name` varchar(255) DEFAULT NULL COMMENT '标题',
  `procsee_days` int(11) DEFAULT NULL COMMENT '流程总天数',
  `is_checked` int(10) DEFAULT NULL COMMENT '流程是否被驳回',
  `start_time` datetime DEFAULT NULL COMMENT '流程开始时间',
  `status_id` bigint(20) DEFAULT NULL COMMENT '流程审核状态 id',
  `type_name` varchar(255) DEFAULT NULL COMMENT '流程申请类型 ',
  `pro_file_id` bigint(20) DEFAULT NULL COMMENT '流程附件id',
  `process_user_id` bigint(20) DEFAULT NULL COMMENT '流程申请人',
  `shenuser` varchar(255) DEFAULT NULL COMMENT '审核人',
  PRIMARY KEY (`process_id`),
  KEY `FKiltoi9iw3vjixl6u4cd60fi1p` (`pro_file_id`),
  KEY `FKhtdg4du5ryotah5v1dgyjfh2t` (`process_user_id`),
  CONSTRAINT `FKhtdg4du5ryotah5v1dgyjfh2t` FOREIGN KEY (`process_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKiltoi9iw3vjixl6u4cd60fi1p` FOREIGN KEY (`pro_file_id`) REFERENCES `attachment` (`attachment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('5', '2020-03-12 00:00:00', '22', '2020-03-12 00:00:00', null, '抗疫', null, '0', '2020-03-12 00:00:00', '23', '创建公文', '2', '3', 'lzh');
INSERT INTO `process` VALUES ('6', '2020-03-12 00:00:00', '22', '2020-03-12 00:00:00', null, '明天去小区门口量体温', null, '0', '2020-03-12 00:00:00', '23', '创建公文', '1', '3', 'lzh');
INSERT INTO `process` VALUES ('7', '2020-03-13 00:00:00', '22', '2020-03-13 00:00:00', null, '啦啦啦', null, '0', '2020-03-13 00:00:00', '25', '创建公文', '3', '3', 'lzh;lzh');
INSERT INTO `process` VALUES ('8', '2020-03-13 00:00:00', '22', '2020-03-13 00:00:00', null, '年轻人不要太气盛', null, '0', '2020-03-13 00:00:00', '24', '创建公文', '4', '3', 'lzh;f;f');
INSERT INTO `process` VALUES ('9', '2020-03-13 00:00:00', '22', '2020-03-13 00:00:00', null, '谢广坤死', null, '0', '2020-03-13 00:00:00', '25', '创建公文', '5', '3', 'lzh;f');
INSERT INTO `process` VALUES ('10', '2020-03-14 14:21:06', '22', '2020-03-14 14:20:27', null, '我是爸爸', null, '0', '2020-03-14 14:20:27', '25', '创建公文', '6', '3', 'lzh;f');
INSERT INTO `process` VALUES ('11', '2020-03-14 16:58:11', '22', '2020-03-14 16:57:37', null, '晚上来', null, '0', '2020-03-14 16:57:37', '25', '创建公文', '7', '3', 'lzh;f');
INSERT INTO `process` VALUES ('12', '2020-03-15 17:12:39', '24', '2020-03-15 17:12:33', null, '刘华强', null, '0', '2020-03-15 17:12:33', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('13', '2020-03-15 17:50:51', '22', '2020-03-15 17:50:45', null, '我是爸爸', null, '0', '2020-03-15 17:50:45', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('14', '2020-03-15 17:53:12', '22', '2020-03-15 17:52:42', null, '偶偶', null, '0', '2020-03-15 17:52:42', '25', '申请借调档案', null, '3', 'lzh;u');
INSERT INTO `process` VALUES ('15', '2020-03-15 18:18:45', '22', '2020-03-15 18:17:48', null, '意大利炮', null, '0', '2020-03-15 18:17:48', '26', '申请借调档案', null, '3', 'lzh;u');
INSERT INTO `process` VALUES ('16', '2020-03-18 00:25:15', '22', '2020-03-18 00:24:58', null, '1', null, '0', '2020-03-18 00:24:58', '23', '创建公文', null, '3', 'lzh');
INSERT INTO `process` VALUES ('17', '2020-03-18 00:25:30', '22', '2020-03-18 00:25:18', null, '2', null, '0', '2020-03-18 00:25:18', '23', '创建公文', null, '3', 'lzh');
INSERT INTO `process` VALUES ('18', '2020-03-18 00:26:03', '22', '2020-03-18 00:25:33', null, '3', null, '0', '2020-03-18 00:25:33', '23', '创建公文', null, '3', 'lzh');
INSERT INTO `process` VALUES ('19', '2020-03-18 00:26:20', '22', '2020-03-18 00:26:09', null, '4', null, '0', '2020-03-18 00:26:09', '23', '创建公文', null, '3', 'lzh');
INSERT INTO `process` VALUES ('20', '2020-03-18 00:27:40', '22', '2020-03-18 00:26:23', null, '5', null, '0', '2020-03-18 00:26:23', '23', '创建公文', null, '3', 'lzh');
INSERT INTO `process` VALUES ('21', '2020-03-18 00:27:54', '22', '2020-03-18 00:27:43', null, '1', null, '0', '2020-03-18 00:27:43', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('22', '2020-03-18 00:28:10', '22', '2020-03-18 00:28:00', null, '2', null, '0', '2020-03-18 00:28:00', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('23', '2020-03-18 00:28:34', '22', '2020-03-18 00:28:19', null, '3', null, '0', '2020-03-18 00:28:19', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('24', '2020-03-18 00:28:46', '22', '2020-03-18 00:28:37', null, '4', null, '0', '2020-03-18 00:28:37', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('25', '2020-03-18 00:29:00', '22', '2020-03-18 00:28:49', null, '5', null, '0', '2020-03-18 00:28:49', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('26', '2020-03-18 00:29:12', '22', '2020-03-18 00:29:02', null, '6', null, '0', '2020-03-18 00:29:02', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('27', '2020-03-18 00:29:25', '22', '2020-03-18 00:29:14', null, '7', null, '0', '2020-03-18 00:29:14', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('28', '2020-03-18 00:29:38', '22', '2020-03-18 00:29:31', null, '8', null, '0', '2020-03-18 00:29:31', '24', '申请借调档案', null, '3', 'lzh;u');

-- ----------------------------
-- Table structure for `reviewed`
-- ----------------------------
DROP TABLE IF EXISTS `reviewed`;
CREATE TABLE `reviewed` (
  `reviewed_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `advice` varchar(255) DEFAULT NULL,
  `reviewed_time` datetime DEFAULT NULL,
  `status_id` bigint(20) DEFAULT NULL,
  `pro_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `del` int(11) DEFAULT NULL,
  PRIMARY KEY (`reviewed_id`),
  KEY `FKevjvy6myxg1l0ibiuph3i7jw2` (`pro_id`),
  KEY `FK2iljei0wvy0cylwwyfh5dr9yk` (`user_id`),
  CONSTRAINT `FK2iljei0wvy0cylwwyfh5dr9yk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKevjvy6myxg1l0ibiuph3i7jw2` FOREIGN KEY (`pro_id`) REFERENCES `process` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reviewed
-- ----------------------------
INSERT INTO `reviewed` VALUES ('5', null, null, '23', '5', '1', '0');
INSERT INTO `reviewed` VALUES ('6', null, null, '23', '6', '1', '0');
INSERT INTO `reviewed` VALUES ('7', '', '2020-03-14 14:06:27', '23', '7', '1', '0');
INSERT INTO `reviewed` VALUES ('8', '不气盛叫年轻人嘛', '2020-03-14 14:08:13', '25', '8', '1', '0');
INSERT INTO `reviewed` VALUES ('9', '必死', '2020-03-14 14:07:39', '25', '9', '1', '0');
INSERT INTO `reviewed` VALUES ('10', '属实必死', '2020-03-14 14:12:25', '25', '9', '7', '0');
INSERT INTO `reviewed` VALUES ('11', null, null, '24', '8', '7', '0');
INSERT INTO `reviewed` VALUES ('12', '爸爸的爸爸叫什么', '2020-03-14 14:22:26', '25', '10', '1', '0');
INSERT INTO `reviewed` VALUES ('13', '爷爷', '2020-03-14 14:23:08', '25', '10', '7', '0');
INSERT INTO `reviewed` VALUES ('14', '行', '2020-03-14 16:58:58', '25', '11', '1', '0');
INSERT INTO `reviewed` VALUES ('15', 'ojbk', '2020-03-14 16:59:36', '25', '11', '7', '0');
INSERT INTO `reviewed` VALUES ('16', null, null, '23', '12', '1', '0');
INSERT INTO `reviewed` VALUES ('17', null, null, '23', '13', '1', '0');
INSERT INTO `reviewed` VALUES ('18', '', '2020-03-17 21:58:23', '26', '14', '1', '0');
INSERT INTO `reviewed` VALUES ('19', 'www', '2020-03-17 21:57:21', '25', '15', '1', '0');
INSERT INTO `reviewed` VALUES ('20', '', '2020-03-17 22:14:08', '26', '15', '22', '0');
INSERT INTO `reviewed` VALUES ('21', '22', '2020-03-17 22:13:59', '25', '14', '22', '0');
INSERT INTO `reviewed` VALUES ('22', null, null, '23', '16', '1', '0');
INSERT INTO `reviewed` VALUES ('23', null, null, '23', '17', '1', '0');
INSERT INTO `reviewed` VALUES ('24', null, null, '23', '18', '1', '0');
INSERT INTO `reviewed` VALUES ('25', null, null, '23', '19', '1', '0');
INSERT INTO `reviewed` VALUES ('26', null, null, '23', '20', '1', '0');
INSERT INTO `reviewed` VALUES ('27', null, null, '23', '21', '1', '0');
INSERT INTO `reviewed` VALUES ('28', null, null, '23', '22', '1', '0');
INSERT INTO `reviewed` VALUES ('29', null, null, '23', '23', '1', '0');
INSERT INTO `reviewed` VALUES ('30', null, null, '23', '24', '1', '0');
INSERT INTO `reviewed` VALUES ('31', null, null, '23', '25', '1', '0');
INSERT INTO `reviewed` VALUES ('32', null, null, '23', '26', '1', '0');
INSERT INTO `reviewed` VALUES ('33', null, null, '23', '27', '1', '0');
INSERT INTO `reviewed` VALUES ('34', '', '2020-03-18 02:24:24', '25', '28', '1', '0');
INSERT INTO `reviewed` VALUES ('35', null, null, '24', '28', '22', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', null);
INSERT INTO `role` VALUES ('2', '政治处领导', null);
INSERT INTO `role` VALUES ('3', '公文管理员', null);
INSERT INTO `role` VALUES ('4', '档案管理员', null);
INSERT INTO `role` VALUES ('5', '部门领导', null);
INSERT INTO `role` VALUES ('6', '文职员工', null);
INSERT INTO `role` VALUES ('7', '狱警', null);
INSERT INTO `role` VALUES ('9', '实习生', null);

-- ----------------------------
-- Table structure for `statuslist`
-- ----------------------------
DROP TABLE IF EXISTS `statuslist`;
CREATE TABLE `statuslist` (
  `status_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_color` varchar(255) DEFAULT NULL,
  `status_model` varchar(255) DEFAULT NULL,
  `status_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  `sort_precent` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of statuslist
-- ----------------------------
INSERT INTO `statuslist` VALUES ('1', 'label-success', 'aoa_mailnumber', '有效', '0', null);
INSERT INTO `statuslist` VALUES ('2', 'label-default', 'aoa_mailnumber', '无效', '1', null);
INSERT INTO `statuslist` VALUES ('3', 'label-warning', 'aoa_task_list', '新任务', '0', '20%');
INSERT INTO `statuslist` VALUES ('4', 'label-info', 'aoa_task_list', '已接收', '1', '40%');
INSERT INTO `statuslist` VALUES ('5', 'label-primary', 'aoa_task_list', '进行中', '2', '60%');
INSERT INTO `statuslist` VALUES ('6', 'label-danger', 'aoa_task_list', '已提交', '3', '80%');
INSERT INTO `statuslist` VALUES ('7', 'label-success', 'aoa_task_list', '已完成', '4', '100%');
INSERT INTO `statuslist` VALUES ('8', 'label-info', 'aoa_note_list', '一般', '0', null);
INSERT INTO `statuslist` VALUES ('9', 'label-danger', 'aoa_note_list', '重要', '1', null);
INSERT INTO `statuslist` VALUES ('10', 'label-info', 'aoa_attends_list', '正常', '0', null);
INSERT INTO `statuslist` VALUES ('11', 'label-warning', 'aoa_attends_list', '迟到', '1', null);
INSERT INTO `statuslist` VALUES ('12', 'label-danger', 'aoa_attends_list', '早退', '2', null);
INSERT INTO `statuslist` VALUES ('13', 'label-danger', 'a', '旷工', '3', null);
INSERT INTO `statuslist` VALUES ('14', 'label-primary', 'inform', '一般', '0', null);
INSERT INTO `statuslist` VALUES ('15', 'label-warning', 'inform', '重要', '1', '');
INSERT INTO `statuslist` VALUES ('16', 'label-danger', 'inform', '紧急', '2', null);
INSERT INTO `statuslist` VALUES ('17', 'label-warning', 'aoa_plan_list', '未完成', '0', null);
INSERT INTO `statuslist` VALUES ('18', 'label-success', 'aoa_plan_list', '已完成', '1', null);
INSERT INTO `statuslist` VALUES ('19', 'label-info', 'aoa_plan_list', '已取消', '2', null);
INSERT INTO `statuslist` VALUES ('20', 'label-primary', 'aoa_in_mail_list', '一般', '0', null);
INSERT INTO `statuslist` VALUES ('21', 'label-warning', 'aoa_in_mail_list', '重要', '1', null);
INSERT INTO `statuslist` VALUES ('22', 'label-danger', 'aoa_in_mail_list', '紧急', '2', null);
INSERT INTO `statuslist` VALUES ('23', 'label-info', 'process', '未处理', '0', null);
INSERT INTO `statuslist` VALUES ('24', 'label-primary', 'process', '处理中', '1', null);
INSERT INTO `statuslist` VALUES ('25', 'label-success', 'process', '已批准', '2', null);
INSERT INTO `statuslist` VALUES ('26', 'label-danger', 'process', '未通过', '3', null);
INSERT INTO `statuslist` VALUES ('27', 'label-primary', 'aoa_schedule_list', '一般', '0', null);
INSERT INTO `statuslist` VALUES ('28', 'label-warning', 'aoa_schedule_list', '重要', '1', null);
INSERT INTO `statuslist` VALUES ('29', 'label-danger', 'aoa_schedule_list', '紧急', '2', null);

-- ----------------------------
-- Table structure for `systemmenu`
-- ----------------------------
DROP TABLE IF EXISTS `systemmenu`;
CREATE TABLE `systemmenu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_show` int(11) DEFAULT NULL,
  `menu_grade` int(11) DEFAULT NULL,
  `menu_icon` varchar(255) DEFAULT NULL,
  `menu_name` varchar(255) DEFAULT NULL,
  `menu_url` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `sort_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of systemmenu
-- ----------------------------
INSERT INTO `systemmenu` VALUES ('1', '1', null, 'glyphicon-cog', '系统管理', '##', '0', '1');
INSERT INTO `systemmenu` VALUES ('2', '1', null, 'glyphicon-education', '用户管理', '#', '0', '2');
INSERT INTO `systemmenu` VALUES ('4', '1', null, 'glyphicon-time', '考勤管理', '#', '0', '4');
INSERT INTO `systemmenu` VALUES ('6', '1', null, 'glyphicon-bell', '公文管理', '#', '0', '5');
INSERT INTO `systemmenu` VALUES ('7', '1', null, 'glyphicon-envelope', '档案管理', '#', '0', '6');
INSERT INTO `systemmenu` VALUES ('8', '1', null, 'glyphicon-flag', '任务管理', '#', '0', '7');
INSERT INTO `systemmenu` VALUES ('9', '1', null, 'glyphicon-calendar', '犯人管理\r\n\r\n', '/prisionmanage', '4', '4');
INSERT INTO `systemmenu` VALUES ('14', '1', null, 'glyphicon-record', '菜单管理', '/testsysmenu', '1', '2');
INSERT INTO `systemmenu` VALUES ('15', '1', null, 'glyphicon-record', '类型管理', '/testsystype', '1', '1');
INSERT INTO `systemmenu` VALUES ('16', '1', null, 'glyphicon-record', '状态管理', '/testsysstatus', '1', '3');
INSERT INTO `systemmenu` VALUES ('17', '1', null, 'glyphicon-record', '部门管理', '/deptmanage', '2', '1');
INSERT INTO `systemmenu` VALUES ('18', '1', null, 'glyphicon-record', '职位管理', '/positionmanage', '2', '3');
INSERT INTO `systemmenu` VALUES ('19', '1', null, 'glyphicon-record', '用户管理', '/usermanage', '2', '4');
INSERT INTO `systemmenu` VALUES ('20', '1', null, 'glyphicon-record', '在线用户', '/morelogrecord', '2', '2');
INSERT INTO `systemmenu` VALUES ('22', '1', null, 'glyphicon-record', '考勤管理', '/attendceatt', '4', '1');
INSERT INTO `systemmenu` VALUES ('23', '1', null, 'glyphicon-record', '考勤周报表', '/attendceweek', '4', '2');
INSERT INTO `systemmenu` VALUES ('25', '1', null, 'glyphicon-record', '我的申请', '/flowmanage', '5', '1');
INSERT INTO `systemmenu` VALUES ('26', '1', null, 'glyphicon-record', '流程审核', '/audit', '5', '2');
INSERT INTO `systemmenu` VALUES ('31', '1', null, 'glyphicon-record', '任务管理', '/taskmanage', '8', '1');
INSERT INTO `systemmenu` VALUES ('32', '1', null, 'glyphicon-record', '我的任务', '/mytask', '8', '2');
INSERT INTO `systemmenu` VALUES ('33', '1', null, 'glyphicon-record', '日程管理', '/daymanage', '9', '1');
INSERT INTO `systemmenu` VALUES ('34', '1', null, 'glyphicon-record', '我的日历', '/daycalendar', '9', '2');
INSERT INTO `systemmenu` VALUES ('35', '1', null, 'glyphicon-record', '计划管理', '/planview', '10', '1');
INSERT INTO `systemmenu` VALUES ('36', '1', null, 'glyphicon-record', '计划报表', '/myplan', '10', '2');
INSERT INTO `systemmenu` VALUES ('37', '1', null, 'glyphicon-record', '文件管理', '/filemanage', '11', '1');
INSERT INTO `systemmenu` VALUES ('38', '1', null, 'glyphicon-record', '笔记管理', '/noteview', '12', '0');
INSERT INTO `systemmenu` VALUES ('39', '1', null, 'glyphicon-earphone', '通讯录', '#', '999', '3');
INSERT INTO `systemmenu` VALUES ('40', '1', null, 'glyphicon-record', '通讯录', '/addrmanage', '999', '1');
INSERT INTO `systemmenu` VALUES ('41', '1', null, 'glyphicon-record', '我的管理', '/chatmanage', '13', '1');
INSERT INTO `systemmenu` VALUES ('42', '1', null, 'glyphicon-record', '讨论区列表', '/chatlist', '13', '2');
INSERT INTO `systemmenu` VALUES ('89', '1', null, 'glyphicon-record', '超级管理员', '/adminmanage', '13', '0');
INSERT INTO `systemmenu` VALUES ('90', '1', null, 'glyphicon-record', '新建流程', '/xinxeng', '5', '0');
INSERT INTO `systemmenu` VALUES ('91', '1', null, 'glyphicon-record', '角色管理', '/rolemanage', '2', '5');
INSERT INTO `systemmenu` VALUES ('92', '1', null, 'glyphicon-record', '新建公文', '/createdocument', '6', '1');
INSERT INTO `systemmenu` VALUES ('93', '1', null, 'glyphicon-record', '我的提交', '/mydocument', '6', '2');
INSERT INTO `systemmenu` VALUES ('94', '1', null, 'glyphicon-record', '公文审核', '/verifydocument', '6', '3');
INSERT INTO `systemmenu` VALUES ('95', '1', null, 'glyphicon-record', '档案管理', '/archivemanage', '7', '1');
INSERT INTO `systemmenu` VALUES ('96', '1', null, 'glyphicon-record', '档案借调', '/borrowarchive', '7', '2');
INSERT INTO `systemmenu` VALUES ('97', '1', null, 'glyphicon-record', '我的提交', '/myarchives', '7', '3');
INSERT INTO `systemmenu` VALUES ('98', '1', null, 'glyphicon-record', '借调审核', '/verifyarchives', '7', '4');
INSERT INTO `systemmenu` VALUES ('99', '1', null, 'glyphicon-record', '公文展示', '/showdocument', '6', '4');

-- ----------------------------
-- Table structure for `task_list`
-- ----------------------------
DROP TABLE IF EXISTS `task_list`;
CREATE TABLE `task_list` (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_cancel` int(11) DEFAULT '0',
  `is_top` int(11) DEFAULT '0',
  `modify_time` datetime DEFAULT NULL,
  `publish_time` datetime DEFAULT NULL,
  `star_time` datetime DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `task_describe` varchar(255) NOT NULL,
  `ticking` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `task_push_user_id` bigint(20) DEFAULT NULL,
  `reciverlist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK7qch0fh6s2y73dvngy1m87aw7` (`task_push_user_id`),
  CONSTRAINT `FK7qch0fh6s2y73dvngy1m87aw7` FOREIGN KEY (`task_push_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_list
-- ----------------------------
INSERT INTO `task_list` VALUES ('53', '老赵 ，把老子的意大利炮扛来！！', '2020-03-04 12:35:45', '0', '1', '2020-03-03 17:52:09', '2020-03-03 17:52:09', '2020-03-03 12:35:45', '5', '老赵 ，把老子的意大利炮扛来', null, '意大利炮', '3', '1', 'a');

-- ----------------------------
-- Table structure for `task_logger`
-- ----------------------------
DROP TABLE IF EXISTS `task_logger`;
CREATE TABLE `task_logger` (
  `logger_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `logger_ticking` varchar(255) DEFAULT NULL,
  `task_id` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `logger_statusid` int(11) DEFAULT NULL,
  PRIMARY KEY (`logger_id`),
  KEY `FK5gu0thq54i7ujc6cict009h4y` (`task_id`),
  CONSTRAINT `FK5gu0thq54i7ujc6cict009h4y` FOREIGN KEY (`task_id`) REFERENCES `task_list` (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_logger
-- ----------------------------
INSERT INTO `task_logger` VALUES ('38', '2020-03-03 17:54:38', '', '53', 'a', '5');

-- ----------------------------
-- Table structure for `task_user`
-- ----------------------------
DROP TABLE IF EXISTS `task_user`;
CREATE TABLE `task_user` (
  `pk_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status_id` bigint(20) DEFAULT NULL COMMENT '任务状态',
  `task_id` bigint(20) DEFAULT NULL COMMENT '任务id',
  `task_recive_user_id` bigint(20) DEFAULT NULL COMMENT '接收者id',
  PRIMARY KEY (`pk_id`),
  KEY `FK2714kl5ywm5chya4dxte8c788` (`task_id`),
  KEY `FK654dfo0oouy3fk07fs7rqo4ld` (`task_recive_user_id`),
  CONSTRAINT `FK2714kl5ywm5chya4dxte8c788` FOREIGN KEY (`task_id`) REFERENCES `task_list` (`task_id`),
  CONSTRAINT `FK654dfo0oouy3fk07fs7rqo4ld` FOREIGN KEY (`task_recive_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_user
-- ----------------------------
INSERT INTO `task_user` VALUES ('72', '5', '53', '2');

-- ----------------------------
-- Table structure for `typelist`
-- ----------------------------
DROP TABLE IF EXISTS `typelist`;
CREATE TABLE `typelist` (
  `type_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_color` varchar(255) DEFAULT NULL,
  `type_model` varchar(255) DEFAULT NULL,
  `type_name` varchar(255) DEFAULT NULL,
  `sort_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of typelist
-- ----------------------------
INSERT INTO `typelist` VALUES ('1', 'red', 'aoa_mailnumber', '系统邮件', '0');
INSERT INTO `typelist` VALUES ('2', 'red', 'aoa_mailnumber', '公司邮件', '1');
INSERT INTO `typelist` VALUES ('3', 'red', 'aoa_task_list', '公事', '0');
INSERT INTO `typelist` VALUES ('4', 'red', 'aoa_task_list', '私事', '1');
INSERT INTO `typelist` VALUES ('5', 'red', 'aoa_note_list', '我的笔记', '0');
INSERT INTO `typelist` VALUES ('6', 'red', 'aoa_note_list', '公司笔记', '1');
INSERT INTO `typelist` VALUES ('7', 'red', 'aoa_note_list', '共享笔记', '2');
INSERT INTO `typelist` VALUES ('8', 'red', 'aoa_attends_list', '上班', '1');
INSERT INTO `typelist` VALUES ('9', 'red', 'aoa_attends_list', '下班', '2');
INSERT INTO `typelist` VALUES ('10', 'red', 'inform', '公告', '0');
INSERT INTO `typelist` VALUES ('11', 'red', 'inform', '通知', '1');
INSERT INTO `typelist` VALUES ('12', 'red', 'inform', '投票', '2');
INSERT INTO `typelist` VALUES ('13', 'red', 'aoa_plan_list', '日计划', '0');
INSERT INTO `typelist` VALUES ('14', 'red', 'aoa_plan_list', '周计划', '1');
INSERT INTO `typelist` VALUES ('15', 'red', 'aoa_plan_list', '月计划', '2');
INSERT INTO `typelist` VALUES ('16', 'red', 'aoa_in_mail_list', '邮件', '0');
INSERT INTO `typelist` VALUES ('17', 'red', 'aoa_in_mail_list', '通知', '1');
INSERT INTO `typelist` VALUES ('18', 'red', 'aoa_in_mail_list', '公告', '2');
INSERT INTO `typelist` VALUES ('19', 'label-danger', 'chat', '公告', '0');
INSERT INTO `typelist` VALUES ('20', 'label-success', 'chat', '讨论', '1');
INSERT INTO `typelist` VALUES ('21', 'label-warning', 'chat', '投票', '2');
INSERT INTO `typelist` VALUES ('22', 'red', 'process', '正常', '0');
INSERT INTO `typelist` VALUES ('23', 'red', 'process', '重要', '1');
INSERT INTO `typelist` VALUES ('24', 'red', 'process', '紧急', '2');
INSERT INTO `typelist` VALUES ('25', 'red', 'aoa_bursement', '银行卡', '0');
INSERT INTO `typelist` VALUES ('26', 'red', 'aoa_bursement', '现金', '1');
INSERT INTO `typelist` VALUES ('27', 'red', 'aoa_bursement', '其他', '2');
INSERT INTO `typelist` VALUES ('28', 'red', 'aoa_evection', '销售拜访', '0');
INSERT INTO `typelist` VALUES ('29', 'red', 'aoa_evection', '售前支持', '1');
INSERT INTO `typelist` VALUES ('30', 'red', 'aoa_evection', '项目支持', '2');
INSERT INTO `typelist` VALUES ('31', 'red', 'aoa_evection', '客服外出', '3');
INSERT INTO `typelist` VALUES ('32', 'red', 'aoa_evection', '其他', '4');
INSERT INTO `typelist` VALUES ('33', 'red', 'aoa_overtime', '工作日', '0');
INSERT INTO `typelist` VALUES ('34', 'red', 'aoa_overtime', '休息日', '1');
INSERT INTO `typelist` VALUES ('35', 'red', 'aoa_overtime', '节假日', '2');
INSERT INTO `typelist` VALUES ('36', 'red', 'aoa_overtime', '其他', '3');
INSERT INTO `typelist` VALUES ('37', '1、年假：工作满一年以上每年可享受带薪年假，当年的年假使用期至次年3月1日止；未经用人单位批准，员工不得自行休假。', 'aoa_holiday', '年假', '7');
INSERT INTO `typelist` VALUES ('38', '2、事假：按照平均工作日扣发薪资（包含工资及各类补贴福利）；单次事假原则上不应超过3天，当年累计事假超过15天的视为主动放弃继续履行岗位职责的权利，特殊情况除外。  ', 'aoa_holiday', '事假', '4');
INSERT INTO `typelist` VALUES ('39', '3、病假：两天及以上病假必须持工作地二级甲等以上医院相关病假证明单或就医记录证明，否则无法享受病假工资；单次病假超过5天，应当持有工作所在地三级甲等医院提供的病假证明单。原则上当年累计病假超过15天应视为不具备继续履行岗位职责身体条件，特殊情况除外。  ', 'aoa_holiday', '病假', null);
INSERT INTO `typelist` VALUES ('40', '4、婚假：婚假为十天，包含休息日，请婚假必须持结婚证明，结婚证必须在泛微工作期间领取，且婚假必须在一年内使用完毕，不得分次休假，国家或地方政府有其他规定的按照当地要求执行；  ', 'aoa_holiday', '婚假', '10');
INSERT INTO `typelist` VALUES ('41', '5、产假及哺乳假：按国家及地方法律法规执行，包含休息日与法定节假日；  ', 'aoa_holiday', '产假及哺乳假', '180');
INSERT INTO `typelist` VALUES ('42', '6、陪产假：泛微正式男性员工在工作期间配偶生育的，可凭子女出生证明，享受十个自然日陪产假。  ', 'aoa_holiday', '陪产假', '10');
INSERT INTO `typelist` VALUES ('43', '7、丧假：直系亲属：配偶、子女、父母可享受三天，岳父母、祖父母、外祖父母可享受一天', 'aoa_holiday', '丧假', null);
INSERT INTO `typelist` VALUES ('44', '', 'aoa_schedule_list', '日程提醒', '0');
INSERT INTO `typelist` VALUES ('45', '', 'aoa_schedule_list', '假日安排', '1');
INSERT INTO `typelist` VALUES ('46', 'red', 'aoa_attends_list', '请假', '3');
INSERT INTO `typelist` VALUES ('47', 'red', 'aoa_attends_list', '出差', '4');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `birth` datetime DEFAULT NULL,
  `eamil` varchar(255) DEFAULT NULL,
  `father_id` bigint(20) DEFAULT NULL,
  `hire_time` datetime DEFAULT NULL,
  `user_idcard` varchar(255) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `is_lock` int(11) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modify_user_id` bigint(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `real_name` varchar(255) DEFAULT NULL,
  `salary` float DEFAULT NULL,
  `user_school` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `theme_skin` varchar(255) DEFAULT NULL,
  `user_edu` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_sign` varchar(255) DEFAULT NULL,
  `user_tel` varchar(255) DEFAULT NULL,
  `dept_id` bigint(20) DEFAULT NULL,
  `position_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  `superman` int(11) DEFAULT NULL,
  `holiday` int(11) DEFAULT NULL,
  `pinyin` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FKt0vmot9xfbgq14oyij0gwh3gh` (`dept_id`),
  KEY `FKadtg9xju7q1ijcyxlkl9gwv5t` (`position_id`),
  KEY `FKl738mmblfx0uia6671rl17cj9` (`role_id`),
  CONSTRAINT `FKadtg9xju7q1ijcyxlkl9gwv5t` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  CONSTRAINT `FKl738mmblfx0uia6671rl17cj9` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FKt0vmot9xfbgq14oyij0gwh3gh` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '浙江省杭州市拱墅区上塘街道浙江树人大学', '62175555555555444', '1986-02-03 00:00:00', 'lzh@pri.com', '0', '2020-03-02 22:43:57', '510322198602030429', '/c78405f8-63c6-4800-a393-be80f0612ab5.png', '0', null, null, null, '1', '123456', '郦卓华', '12000', '浙江树人大学', '男', 'blue', '本科', 'lzh', '我是爸爸', '18888753189', '1', '1', '1', '1', null, 'lzh');
INSERT INTO `user` VALUES ('2', '浙江省', '6217837736828630', '1994-03-28 00:00:00', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '/65b5e138-6cbe-454e-a636-bdd526a844f3.jpg', '0', null, null, null, '2', '123456', 'a', '1000', '清华大学', '女', 'blue', '硕士', 'a', '', '13203318185', '1', '2', '2', '0', null, 'a');
INSERT INTO `user` VALUES ('3', '浙江省', '6217002940101998752', '1995-03-05 00:00:00', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '3.jpg', '0', null, null, null, '3', '123456', 'b', '1000', '清华大学', '女', 'blue', '硕士', 'b', '', '18683688154', '1', '3', '2', '0', null, 'b');
INSERT INTO `user` VALUES ('4', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '4', '123456', 'c', '3000', '清华大学', '男', 'blue', '硕士', 'c', '', '18173328888', '1', '4', '2', '0', null, 'c');
INSERT INTO `user` VALUES ('5', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '5', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '5', '123456', 'd', '4000', '清华大学', '男', 'blue', '博士', 'd', '', '18173328976', '6', '11', '5', '0', null, 'd');
INSERT INTO `user` VALUES ('6', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '5', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '6', '123456', 'e', '3700', '清华大学', '女', 'blue', '本科', 'e', '', '18868688866', '6', '25', '6', '0', null, 'e');
INSERT INTO `user` VALUES ('7', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '7', '123456', 'f', '5000', '清华大学', '男', 'blue', '本科', 'f', null, '13117336953', '2', '7', '3', '0', null, 'f');
INSERT INTO `user` VALUES ('8', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '7', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '8', '123456', 'g', '5000', '清华大学', '女', 'blue', '本科', 'g', null, '13117336954', '2', '21', '6', '0', null, 'g');
INSERT INTO `user` VALUES ('9', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '/820fd533-58a8-4726-a930-585b15575106.jpg', '0', null, null, null, '9', '123456', 'h', '3111', '清华大学', '女', 'blue', '本科', 'h', '', '13034507214', '3', '8', '5', '0', null, 'h');
INSERT INTO `user` VALUES ('10', '浙江省', '6217002940101998752', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '10', '123456', 'i', '2555', '清华大学', '女', 'blue', '本科', 'i', null, '13117336954', '7', '12', '5', '0', null, 'i');
INSERT INTO `user` VALUES ('11', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '11', '123456', 'j', '5000', '清华大学', '男', 'yellow', '硕士', 'j', null, '13117336953', '8', '13', '5', '0', null, 'j');
INSERT INTO `user` VALUES ('12', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '12', '123456', 'k', '2000', '清华大学', '男', 'red', '本科', 'k', null, '13117336953', '9', '14', '5', '0', null, 'k');
INSERT INTO `user` VALUES ('13', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '13', '123456', 'l', '1000', '清华大学', '女', 'blue', '硕士', 'l', null, '13117336954', '1', '6', '2', '0', null, 'l');
INSERT INTO `user` VALUES ('14', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '10', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '14', '123456', 'm', '1000', '清华大学', '女', 'blue', '硕士', 'm', null, '18868688866', '7', '26', '6', '0', null, 'm');
INSERT INTO `user` VALUES ('15', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '9', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '15', '123456', 'n', '3000', '清华大学', '男', 'blue', '硕士', 'n', null, '13117336953', '3', '22', '6', '0', null, 'n');
INSERT INTO `user` VALUES ('16', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '16', '123456', 'o', '4000', '清华大学', '男', 'blue', '博士', 'o', null, '13117336954', '4', '9', '5', '0', null, 'o');
INSERT INTO `user` VALUES ('17', '浙江省', '62175555555555444', '1997-09-19 16:59:29', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '17', '123456', 'p', '3700', '清华大学', '女', 'blue', '本科', 'p', null, '13034507214', '11', '16', '5', '0', null, 'p');
INSERT INTO `user` VALUES ('18', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '18', '123456', 'q', '5000', '清华大学', '男', 'blue', '本科', 'q', null, '13117336954', '5', '10', '5', '0', null, 'q');
INSERT INTO `user` VALUES ('19', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '19', '123456', 'r', '5000', '清华大学', '女', 'yellow', '本科', 'r', null, '13117336953', '13', '18', '5', '0', null, 'r');
INSERT INTO `user` VALUES ('20', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '20', '123456', 's', '3111', '清华大学', '女', 'red', '本科', 's', null, '13117336953', '14', '19', '5', '0', null, 's');
INSERT INTO `user` VALUES ('21', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '16', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '21', '123456', 't', '2555', '清华大学', '女', 'blue', '本科', 'y', null, '18868688866', '15', '20', '5', '0', null, 'y');
INSERT INTO `user` VALUES ('22', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '22', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '22', '123456', 'u', '5000', '清华大学', '男', 'blue', '硕士', 'u', null, '13117336953', '10', '15', '4', '0', null, 'u');
INSERT INTO `user` VALUES ('23', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '11', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '23', '123456', 'v', '6000', '清华大学', '女', 'blue', '博士', 'v', '', '13117336954', '8', '28', '7', '0', null, 'v');
INSERT INTO `user` VALUES ('24', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '12', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '24', '123456', 'w', '6000', '清华大学', '女', 'blue', '博士', 'w', '', '13117336954', '9', '29', '7', '0', null, 'w');
INSERT INTO `user` VALUES ('25', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '20', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '25', '123456', 'x', '5000', '清华大学', '女', 'blue', '本科', 'x', null, '13117336953', '14', '34', '7', '0', null, 'x');
INSERT INTO `user` VALUES ('26', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '26', '123456', 'y', '4000', '清华大学', '男', 'blue', '博士', 'y', null, '13117336954', '4', '23', '6', '0', null, 'y');
INSERT INTO `user` VALUES ('27', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '27', '123456', 'z', '2555', '清华大学', '女', 'blue', '本科', 'z', null, '18868688866', '12', '17', '5', '0', null, 'z');
INSERT INTO `user` VALUES ('28', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '18', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '28', '123456', 'aa', '222', '清华大学', '男', 'blue', '硕士', 'aa', null, '18868688866', '5', '24', '6', '0', null, 'aa');
INSERT INTO `user` VALUES ('29', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '5.jpg', '0', null, null, null, '29', '123456', 'bb', '6666', '清华大学', '男', 'green', '硕士', 'bb', null, '13600003532', '1', '5', '2', '0', null, 'bb');
INSERT INTO `user` VALUES ('30', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '17', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '30', '123456', 'cc', '6666', '清华大学', '男', 'red', '本科', 'cc', null, '13600003532', '11', '31', '7', '0', null, 'cc');
INSERT INTO `user` VALUES ('31', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '22', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '31', '123456', 'dd', '6666', '清华大学', '男', 'blue', '本科', 'dd', null, '13600003532', '10', '30', '7', '0', null, 'dd');
INSERT INTO `user` VALUES ('32', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '19', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '32', '123456', 'ee', '6666', '清华大学', '男', 'blue', '本科', 'ee', null, '13600003532', '13', '33', '7', '0', null, 'ee');
INSERT INTO `user` VALUES ('33', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '10', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '33', '123456', 'ff', '6666', '清华大学', '男', 'blue', '本科', 'ff', null, '13600003532', '7', '27', '6', '0', null, 'ff');
INSERT INTO `user` VALUES ('34', '浙江省', '62175555555555444', '1996-09-19 16:56:50', '@pri.com', '27', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '34', '123456', 'gg', '6666', '清华大学', '男', 'blue', '本科', 'gg', null, '13600003532', '12', '32', '7', '0', null, 'gg');
INSERT INTO `user` VALUES ('35', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '26', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '35', '123456', 'hh', '1111', '清华大学', '男', 'blue', '本科', 'hh', null, '13600003532', '15', '35', '7', '0', null, 'hh');

-- ----------------------------
-- Table structure for `user_log`
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip_addr` varchar(255) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FKherb88q97dxbtcge09ii875qm` (`user_id`),
  CONSTRAINT `FKherb88q97dxbtcge09ii875qm` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3232 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_log
-- ----------------------------
INSERT INTO `user_log` VALUES ('1022', '192.168.1.157', '2017-10-14 12:51:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1023', '192.168.1.157', '2017-10-14 12:51:40', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1024', '192.168.1.157', '2017-10-14 13:00:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1025', '192.168.56.1', '2017-10-14 13:01:24', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1026', '192.168.56.1', '2017-10-14 13:01:31', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1027', '192.168.56.1', '2017-10-14 13:06:13', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1028', '192.168.56.1', '2017-10-14 13:13:49', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1029', '192.168.56.1', '2017-10-14 13:14:00', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1030', '192.168.56.1', '2017-10-14 13:14:15', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1031', '192.168.56.1', '2017-10-14 13:18:28', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1032', '192.168.56.1', '2017-10-14 13:22:46', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1033', '192.168.56.1', '2017-10-14 13:23:09', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1034', '192.168.56.1', '2017-10-14 13:25:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1035', '192.168.56.1', '2017-10-14 13:26:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1036', '192.168.56.1', '2017-10-14 13:28:29', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1037', '192.168.56.1', '2017-10-14 13:28:40', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1038', '192.168.56.1', '2017-10-14 13:28:55', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1039', '192.168.56.1', '2017-10-14 13:31:06', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1040', '192.168.56.1', '2017-10-14 13:31:14', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1041', '192.168.56.1', '2017-10-14 13:32:01', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1042', '192.168.56.1', '2017-10-14 13:32:33', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1043', '192.168.56.1', '2017-10-14 13:32:47', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1044', '192.168.56.1', '2017-10-14 13:35:18', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1045', '192.168.1.157', '2017-10-14 14:24:55', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1046', '192.168.1.157', '2017-10-14 14:27:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1047', '192.168.1.157', '2017-10-14 14:31:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1048', '192.168.1.157', '2017-10-14 14:31:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1049', '192.168.1.157', '2017-10-14 14:31:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1050', '192.168.1.157', '2017-10-14 14:31:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1051', '192.168.56.1', '2017-10-14 14:49:38', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1052', '192.168.56.1', '2017-10-14 14:50:07', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1053', '192.168.56.1', '2017-10-14 14:50:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1054', '192.168.56.1', '2017-10-14 14:50:30', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1055', '192.168.56.1', '2017-10-14 15:01:57', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1056', '192.168.56.1', '2017-10-14 15:05:40', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1057', '192.168.56.1', '2017-10-14 15:05:53', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1058', '192.168.56.1', '2017-10-14 15:06:52', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1059', '192.168.56.1', '2017-10-14 15:20:18', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1060', '192.168.1.157', '2017-10-14 16:00:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1061', '192.168.1.157', '2017-10-14 16:06:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1062', '192.168.1.157', '2017-10-14 16:07:01', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1063', '192.168.1.157', '2017-10-14 16:08:51', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1064', '192.168.1.157', '2017-10-14 16:13:38', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1065', '192.168.56.1', '2017-10-14 16:15:25', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1066', '192.168.56.1', '2017-10-14 16:15:25', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1067', '192.168.1.157', '2017-10-14 16:16:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1068', '192.168.56.1', '2017-10-14 16:16:22', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1069', '192.168.1.157', '2017-10-14 16:18:22', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1070', '192.168.56.1', '2017-10-14 16:18:48', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1071', '192.168.56.1', '2017-10-14 16:18:50', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1072', '192.168.1.157', '2017-10-14 16:20:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1073', '192.168.56.1', '2017-10-14 16:21:12', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1074', '192.168.56.1', '2017-10-14 16:22:10', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1075', '192.168.56.1', '2017-10-14 16:22:16', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1076', '192.168.56.1', '2017-10-14 16:22:33', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1077', '192.168.56.1', '2017-10-14 16:27:46', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1078', '192.168.56.1', '2017-10-14 16:29:06', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1079', '192.168.56.1', '2017-10-14 16:29:43', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1080', '192.168.1.157', '2017-10-14 16:30:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1081', '192.168.56.1', '2017-10-14 16:31:01', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1082', '192.168.1.157', '2017-10-14 16:36:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1083', '172.27.198.122', '2017-10-14 16:37:04', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1084', '172.27.198.122', '2017-10-14 16:37:05', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1085', '192.168.56.1', '2017-10-14 16:37:26', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1086', '192.168.56.1', '2017-10-14 16:38:54', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1087', '192.168.1.157', '2017-10-14 16:39:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1088', '192.168.56.1', '2017-10-14 16:39:56', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1089', '192.168.1.157', '2017-10-14 16:41:53', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1090', '192.168.56.1', '2017-10-14 16:42:03', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1091', '192.168.56.1', '2017-10-14 16:42:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1092', '192.168.56.1', '2017-10-14 16:45:21', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1093', '192.168.56.1', '2017-10-14 16:46:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1094', '192.168.1.157', '2017-10-14 16:47:31', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1095', '192.168.56.1', '2017-10-14 16:48:09', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1096', '192.168.1.157', '2017-10-14 16:56:32', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1097', '192.168.56.1', '2017-10-14 16:57:51', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1098', '192.168.1.157', '2017-10-14 16:58:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1099', '192.168.1.157', '2017-10-14 16:59:17', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1100', '192.168.56.1', '2017-10-14 17:01:23', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1101', '192.168.56.1', '2017-10-14 17:01:46', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1102', '192.168.1.157', '2017-10-14 17:02:29', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1103', '192.168.1.157', '2017-10-14 17:02:44', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1104', '192.168.1.157', '2017-10-14 17:04:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1105', '192.168.1.157', '2017-10-14 17:04:51', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1106', '192.168.1.157', '2017-10-14 17:05:23', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1107', '192.168.1.157', '2017-10-14 17:07:39', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1108', '192.168.1.157', '2017-10-14 17:08:59', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1109', '192.168.1.157', '2017-10-14 17:09:19', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1110', '192.168.1.157', '2017-10-14 17:53:53', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1111', '192.168.1.157', '2017-10-14 17:54:18', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1112', '192.168.1.157', '2017-10-14 17:54:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1113', '192.168.1.157', '2017-10-14 17:56:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1114', '192.168.1.157', '2017-10-14 19:42:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1115', '172.27.198.122', '2017-10-14 19:55:11', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1116', '172.27.198.122', '2017-10-14 19:55:32', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1117', '172.27.198.122', '2017-10-14 20:01:44', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1118', '192.168.1.157', '2017-10-14 20:02:55', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1119', '192.168.1.157', '2017-10-14 20:06:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1120', '192.168.56.1', '2017-10-14 20:06:49', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1121', '192.168.1.157', '2017-10-14 20:06:53', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1122', '192.168.1.157', '2017-10-14 20:07:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1123', '192.168.1.157', '2017-10-14 20:10:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1124', '192.168.56.1', '2017-10-14 20:11:16', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1125', '192.168.56.1', '2017-10-14 20:16:16', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1126', '192.168.56.1', '2017-10-14 20:18:58', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1127', '192.168.56.1', '2017-10-14 20:19:20', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1128', '192.168.1.157', '2017-10-14 20:26:19', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1129', '192.168.1.157', '2017-10-14 20:26:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1130', '192.168.1.157', '2017-10-14 20:27:40', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1131', '192.168.56.1', '2017-10-14 20:28:43', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1132', '192.168.56.1', '2017-10-14 20:30:03', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1133', '192.168.56.1', '2017-10-14 20:32:36', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1134', '192.168.56.1', '2017-10-14 20:35:29', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1135', '192.168.56.1', '2017-10-14 20:37:08', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1136', '192.168.56.1', '2017-10-14 20:38:02', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1137', '192.168.56.1', '2017-10-14 20:38:13', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1138', '192.168.56.1', '2017-10-14 20:38:58', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1139', '172.27.198.122', '2017-10-14 20:44:01', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1140', '172.27.198.122', '2017-10-14 20:47:08', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1141', '172.31.17.170', '2017-10-14 20:49:43', '流程管理', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1142', '172.27.198.122', '2017-10-14 20:50:00', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1143', '172.31.17.170', '2017-10-14 20:50:09', '流程管理', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1144', '172.27.198.122', '2017-10-14 20:51:08', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1145', '192.168.1.157', '2017-10-14 20:52:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1146', '172.31.17.170', '2017-10-14 20:52:48', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1147', '192.168.56.1', '2017-10-14 20:52:54', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1148', '192.168.56.1', '2017-10-14 20:54:11', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1149', '172.31.17.170', '2017-10-14 20:54:17', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1150', '172.31.17.170', '2017-10-14 20:55:14', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1151', '172.31.17.170', '2017-10-14 20:55:23', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1152', '192.168.56.1', '2017-10-14 20:57:39', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1153', '192.168.1.157', '2017-10-14 21:09:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1154', '192.168.1.157', '2017-10-14 21:10:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1155', '192.168.1.157', '2017-10-14 21:10:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1156', '192.168.1.157', '2017-10-14 21:14:54', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1157', '192.168.56.1', '2017-10-14 21:16:51', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1158', '172.27.198.122', '2017-10-14 21:17:36', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1159', '172.27.198.122', '2017-10-14 21:18:21', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1160', '172.27.198.122', '2017-10-14 21:19:17', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1161', '192.168.56.1', '2017-10-14 21:21:16', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1162', '192.168.56.1', '2017-10-14 21:21:16', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1163', '172.27.198.122', '2017-10-14 21:21:21', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1164', '192.168.56.1', '2017-10-14 21:21:26', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1165', '172.27.198.122', '2017-10-14 21:22:15', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1166', '192.168.56.1', '2017-10-14 21:22:36', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1167', '172.27.198.122', '2017-10-14 21:22:46', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1168', '172.27.198.122', '2017-10-14 21:23:17', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1169', '172.27.198.122', '2017-10-14 21:26:14', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1170', '192.168.56.1', '2017-10-14 21:27:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1171', '172.27.198.122', '2017-10-14 21:27:58', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1172', '192.168.1.157', '2017-10-14 21:28:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1173', '172.27.198.122', '2017-10-14 21:28:40', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1174', '172.27.198.122', '2017-10-14 21:28:54', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1175', '172.27.198.122', '2017-10-14 21:29:03', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1176', '192.168.56.1', '2017-10-14 21:29:42', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1177', '172.27.198.122', '2017-10-14 21:30:57', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1178', '172.27.198.122', '2017-10-14 21:32:30', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1179', '172.27.198.122', '2017-10-14 21:32:43', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1180', '172.27.198.122', '2017-10-14 21:33:22', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1181', '192.168.56.1', '2017-10-14 21:34:42', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1182', '192.168.56.1', '2017-10-14 21:34:50', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1183', '172.27.198.122', '2017-10-14 21:34:58', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1184', '192.168.56.1', '2017-10-14 21:37:27', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1185', '192.168.56.1', '2017-10-14 21:38:04', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1186', '192.168.1.157', '2017-10-14 21:38:55', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1187', '192.168.56.1', '2017-10-14 21:39:43', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1188', '192.168.56.1', '2017-10-14 21:39:47', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1189', '192.168.56.1', '2017-10-14 21:39:50', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1190', '192.168.56.1', '2017-10-14 21:55:26', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1191', '192.168.56.1', '2017-10-14 21:56:04', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1192', '192.168.56.1', '2017-10-14 22:08:01', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1193', '192.168.56.1', '2017-10-14 22:08:42', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1194', '192.168.56.1', '2017-10-14 22:08:44', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1195', '192.168.1.157', '2017-10-14 22:09:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1196', '192.168.56.1', '2017-10-14 22:10:14', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1197', '192.168.56.1', '2017-10-14 22:11:44', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1198', '192.168.56.1', '2017-10-14 22:11:50', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1199', '192.168.56.1', '2017-10-14 22:11:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1200', '192.168.56.1', '2017-10-14 22:12:09', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1201', '192.168.56.1', '2017-10-14 22:13:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1202', '192.168.56.1', '2017-10-14 22:14:09', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1203', '192.168.56.1', '2017-10-14 22:16:40', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1204', '192.168.1.157', '2017-10-14 22:17:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1205', '192.168.56.1', '2017-10-14 22:17:30', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1206', '192.168.56.1', '2017-10-14 22:22:28', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1207', '192.168.1.157', '2017-10-14 22:32:01', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1208', '192.168.1.157', '2017-10-14 22:32:23', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1209', '192.168.1.157', '2017-10-14 22:32:30', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1210', '192.168.56.1', '2017-10-14 22:33:02', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1211', '192.168.56.1', '2017-10-14 22:33:11', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1212', '192.168.56.1', '2017-10-14 22:33:13', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1213', '192.168.56.1', '2017-10-14 22:36:10', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1214', '192.168.56.1', '2017-10-14 22:37:39', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1215', '192.168.1.157', '2017-10-14 22:46:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1216', '192.168.1.157', '2017-10-14 22:47:32', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1217', '192.168.1.157', '2017-10-14 22:49:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1218', '192.168.1.157', '2017-10-14 22:50:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1219', '192.168.56.1', '2017-10-14 22:51:21', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1220', '192.168.1.157', '2017-10-14 22:51:57', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1221', '192.168.56.1', '2017-10-14 22:52:01', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1222', '192.168.1.157', '2017-10-14 22:54:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1223', '192.168.1.157', '2017-10-14 22:56:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1224', '192.168.1.157', '2017-10-14 22:58:38', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1225', '192.168.56.1', '2017-10-14 22:58:55', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1226', '192.168.56.1', '2017-10-14 22:59:10', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1227', '192.168.56.1', '2017-10-14 23:02:03', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1228', '192.168.56.1', '2017-10-14 23:02:49', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1229', '192.168.1.157', '2017-10-14 23:05:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1230', '192.168.1.157', '2017-10-14 23:11:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1231', '192.168.1.157', '2017-10-14 23:12:30', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1232', '192.168.1.157', '2017-10-14 23:13:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1233', '192.168.1.157', '2017-10-14 23:13:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1234', '192.168.1.157', '2017-10-14 23:15:09', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1235', '192.168.1.157', '2017-10-14 23:15:41', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1236', '192.168.1.157', '2017-10-14 23:16:41', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1237', '192.168.1.157', '2017-10-14 23:18:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1238', '192.168.1.157', '2017-10-14 23:19:12', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1239', '192.168.1.157', '2017-10-14 23:20:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1240', '192.168.1.157', '2017-10-14 23:21:32', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1241', '192.168.1.157', '2017-10-14 23:21:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1242', '192.168.1.157', '2017-10-14 23:21:35', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1243', '192.168.56.1', '2017-10-14 23:21:52', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1244', '192.168.56.1', '2017-10-14 23:22:51', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1245', '192.168.56.1', '2017-10-14 23:22:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1246', '192.168.1.157', '2017-10-14 23:23:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1247', '192.168.1.157', '2017-10-14 23:24:04', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1248', '192.168.1.157', '2017-10-14 23:26:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1249', '192.168.1.157', '2017-10-14 23:29:04', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1250', '192.168.1.157', '2017-10-14 23:30:30', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1251', '192.168.1.157', '2017-10-14 23:34:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1252', '192.168.1.157', '2017-10-14 23:50:18', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1253', '192.168.1.157', '2017-10-14 23:52:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1254', '192.168.56.1', '2017-10-15 00:02:00', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1255', '192.168.1.157', '2017-10-15 00:03:53', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1256', '192.168.56.1', '2017-10-15 00:03:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1257', '192.168.56.1', '2017-10-15 00:04:32', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1258', '192.168.56.1', '2017-10-15 00:05:42', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1259', '192.168.56.1', '2017-10-15 00:05:55', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1260', '192.168.56.1', '2017-10-15 00:05:56', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1261', '192.168.56.1', '2017-10-15 00:06:13', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1262', '192.168.56.1', '2017-10-15 00:06:28', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1263', '192.168.1.157', '2017-10-15 00:09:05', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1264', '192.168.56.1', '2017-10-15 00:09:37', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1265', '192.168.56.1', '2017-10-15 00:11:01', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1266', '192.168.56.1', '2017-10-15 00:11:31', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1267', '192.168.56.1', '2017-10-15 00:11:52', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1268', '192.168.1.157', '2017-10-15 00:12:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1269', '192.168.56.1', '2017-10-15 00:12:49', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1270', '192.168.1.157', '2017-10-15 00:13:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1271', '192.168.1.157', '2017-10-15 00:13:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1272', '192.168.56.1', '2017-10-15 00:13:15', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1273', '192.168.56.1', '2017-10-15 00:13:23', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1274', '192.168.1.157', '2017-10-15 00:13:51', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1275', '192.168.56.1', '2017-10-15 00:15:10', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1276', '192.168.56.1', '2017-10-15 00:15:38', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1277', '192.168.56.1', '2017-10-15 00:15:48', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1278', '192.168.1.157', '2017-10-15 00:17:54', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1279', '192.168.56.1', '2017-10-15 00:18:50', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1280', '192.168.56.1', '2017-10-15 00:19:51', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1281', '192.168.56.1', '2017-10-15 00:21:00', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1282', '192.168.1.157', '2017-10-15 00:22:06', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1283', '192.168.1.157', '2017-10-15 00:22:31', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1284', '172.31.17.170', '2017-10-15 00:38:57', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1285', '172.31.17.170', '2017-10-15 00:39:15', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1286', '192.168.1.157', '2017-10-15 00:39:42', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1287', '192.168.1.157', '2017-10-15 00:40:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1288', '192.168.1.157', '2017-10-15 00:41:31', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1289', '192.168.1.157', '2017-10-15 00:42:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1290', '192.168.1.157', '2017-10-15 00:42:56', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('1291', '192.168.1.157', '2017-10-15 00:44:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1292', '192.168.1.157', '2017-10-15 00:45:05', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1293', '192.168.1.157', '2017-10-15 00:45:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1294', '192.168.1.157', '2017-10-15 00:47:35', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1295', '192.168.1.157', '2017-10-15 01:01:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1296', '192.168.1.157', '2017-10-15 01:04:41', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1297', '172.27.198.122', '2017-10-15 10:25:12', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1298', '192.168.1.157', '2017-10-15 11:05:04', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1299', '192.168.1.157', '2017-10-15 11:05:09', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1300', '192.168.1.157', '2017-10-15 11:09:21', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1301', '192.168.1.157', '2017-10-15 11:12:10', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1302', '192.168.1.157', '2017-10-15 11:12:12', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1303', '192.168.1.157', '2017-10-15 11:13:28', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1304', '192.168.1.157', '2017-10-15 11:13:31', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1305', '192.168.1.157', '2017-10-15 11:13:37', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1306', '192.168.1.157', '2017-10-15 11:13:55', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('1307', '192.168.1.157', '2017-10-15 11:15:33', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('1308', '192.168.1.157', '2017-10-15 11:34:18', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('1309', '192.168.1.157', '2017-10-15 11:34:26', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1310', '192.168.1.157', '2017-10-15 11:34:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1311', '192.168.56.1', '2017-10-15 14:03:17', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1312', '192.168.56.1', '2017-10-15 14:04:16', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1313', '192.168.56.1', '2017-10-15 14:04:19', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1314', '192.168.56.1', '2017-10-15 14:04:38', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1315', '192.168.56.1', '2017-10-15 14:04:56', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1316', '192.168.56.1', '2017-10-15 14:05:41', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1317', '192.168.56.1', '2017-10-15 14:06:54', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1318', '192.168.56.1', '2017-10-15 14:08:53', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1319', '192.168.56.1', '2017-10-15 14:09:02', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1320', '192.168.56.1', '2017-10-15 14:09:56', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1321', '192.168.56.1', '2017-10-15 14:10:54', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1322', '192.168.56.1', '2017-10-15 14:10:57', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1323', '172.31.17.170', '2017-10-15 14:13:46', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1324', '192.168.1.157', '2017-10-15 14:15:28', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1325', '192.168.1.157', '2017-10-15 14:15:34', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1326', '192.168.1.157', '2017-10-15 15:00:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1327', '192.168.1.157', '2017-10-15 15:01:50', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1328', '192.168.137.1', '2017-10-15 15:02:06', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1329', '192.168.137.1', '2017-10-15 15:02:11', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1330', '192.168.1.157', '2017-10-15 15:02:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1331', '192.168.1.157', '2017-10-15 15:03:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1332', '192.168.1.157', '2017-10-15 15:03:59', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1333', '192.168.1.157', '2017-10-15 15:04:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1334', '192.168.137.1', '2017-10-15 15:04:27', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1335', '192.168.137.1', '2017-10-15 15:04:31', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1336', '192.168.1.157', '2017-10-15 15:04:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1337', '192.168.1.157', '2017-10-15 15:05:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1338', '192.168.1.157', '2017-10-15 15:06:12', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1339', '192.168.1.157', '2017-10-15 15:08:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1340', '192.168.1.157', '2017-10-15 15:08:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1341', '192.168.1.157', '2017-10-15 15:08:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1342', '192.168.1.157', '2017-10-15 15:09:52', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1343', '192.168.1.157', '2017-10-15 15:10:34', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1344', '192.168.1.157', '2017-10-15 15:11:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1345', '192.168.1.157', '2017-10-15 15:11:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1346', '192.168.1.157', '2017-10-15 15:13:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1347', '192.168.1.157', '2017-10-15 15:14:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1348', '192.168.1.157', '2017-10-15 15:14:29', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1349', '192.168.56.1', '2017-10-15 15:15:27', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1350', '192.168.1.157', '2017-10-15 15:15:57', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1351', '192.168.1.157', '2017-10-15 15:18:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1352', '192.168.56.1', '2017-10-15 15:29:51', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1353', '192.168.56.1', '2017-10-15 15:31:30', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1354', '192.168.56.1', '2017-10-15 15:32:51', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1355', '192.168.137.1', '2017-10-15 15:37:58', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1356', '192.168.137.1', '2017-10-15 15:38:12', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('1357', '192.168.137.1', '2017-10-15 15:38:13', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1358', '192.168.56.1', '2017-10-15 15:45:19', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1359', '192.168.56.1', '2017-10-15 15:45:24', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1360', '192.168.1.157', '2017-10-15 15:47:01', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1361', '192.168.56.1', '2017-10-15 15:47:00', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1362', '192.168.1.157', '2017-10-15 15:47:26', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1363', '192.168.56.1', '2017-10-15 15:47:34', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1364', '192.168.56.1', '2017-10-15 15:47:57', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1365', '192.168.56.1', '2017-10-15 15:48:08', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1366', '192.168.1.157', '2017-10-15 15:49:27', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1367', '192.168.1.157', '2017-10-15 16:08:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1368', '192.168.56.1', '2017-10-15 16:11:39', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1369', '192.168.56.1', '2017-10-15 16:11:41', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1370', '192.168.56.1', '2017-10-15 16:13:21', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1371', '192.168.56.1', '2017-10-15 16:14:06', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1372', '192.168.1.157', '2017-10-15 16:14:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1373', '192.168.1.157', '2017-10-15 16:16:17', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1374', '192.168.56.1', '2017-10-15 16:16:35', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1375', '192.168.1.157', '2017-10-15 16:17:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1376', '192.168.56.1', '2017-10-15 16:17:19', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1377', '192.168.1.157', '2017-10-15 16:18:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1378', '192.168.1.157', '2017-10-15 16:21:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1379', '192.168.1.157', '2017-10-15 16:22:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1380', '192.168.1.157', '2017-10-15 16:23:17', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1381', '192.168.56.1', '2017-10-15 16:49:51', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1382', '192.168.137.1', '2017-10-15 17:16:03', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1383', '192.168.1.157', '2017-10-15 18:30:42', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1384', '192.168.56.1', '2017-10-15 18:30:48', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1385', '192.168.1.157', '2017-10-15 18:31:40', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1386', '192.168.1.157', '2017-10-15 18:32:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1387', '192.168.1.157', '2017-10-15 18:33:39', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1388', '192.168.1.157', '2017-10-15 18:33:43', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1389', '192.168.56.1', '2017-10-15 18:34:19', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1390', '192.168.1.157', '2017-10-15 18:35:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1391', '192.168.1.157', '2017-10-15 18:35:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1392', '192.168.56.1', '2017-10-15 18:36:56', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1393', '192.168.56.1', '2017-10-15 18:36:56', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1394', '192.168.1.157', '2017-10-15 18:37:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1395', '192.168.56.1', '2017-10-15 18:37:55', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1396', '192.168.56.1', '2017-10-15 18:37:56', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1397', '192.168.1.157', '2017-10-15 18:38:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1398', '192.168.1.157', '2017-10-15 18:39:42', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1399', '192.168.56.1', '2017-10-15 18:40:01', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1400', '192.168.137.1', '2017-10-15 18:43:32', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1401', '192.168.56.1', '2017-10-15 18:44:06', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1402', '192.168.56.1', '2017-10-15 18:44:15', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1403', '192.168.1.157', '2017-10-15 18:45:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1404', '192.168.1.157', '2017-10-15 18:46:07', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1405', '192.168.56.1', '2017-10-15 18:46:11', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1406', '192.168.56.1', '2017-10-15 18:46:12', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1407', '192.168.1.157', '2017-10-15 18:46:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1408', '192.168.1.157', '2017-10-15 18:47:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1409', '192.168.56.1', '2017-10-15 18:48:55', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1410', '192.168.1.157', '2017-10-15 18:48:59', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1411', '192.168.1.157', '2017-10-15 18:49:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1412', '192.168.1.157', '2017-10-15 18:49:49', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1413', '192.168.56.1', '2017-10-15 18:51:25', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1414', '192.168.56.1', '2017-10-15 18:51:47', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1415', '192.168.56.1', '2017-10-15 18:52:04', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1416', '192.168.1.157', '2017-10-15 18:52:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1417', '192.168.56.1', '2017-10-15 18:54:34', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1418', '192.168.56.1', '2017-10-15 18:55:44', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1419', '192.168.56.1', '2017-10-15 18:55:53', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1420', '192.168.1.157', '2017-10-15 18:58:12', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1421', '192.168.137.1', '2017-10-15 18:59:02', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1422', '192.168.137.1', '2017-10-15 18:59:08', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1423', '192.168.1.157', '2017-10-15 18:59:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1424', '192.168.1.157', '2017-10-15 18:59:55', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1425', '192.168.56.1', '2017-10-15 19:00:59', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1426', '192.168.137.1', '2017-10-15 19:01:25', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1427', '192.168.137.1', '2017-10-15 19:01:47', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1428', '192.168.56.1', '2017-10-15 19:02:07', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1429', '192.168.56.1', '2017-10-15 19:02:08', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1430', '192.168.56.1', '2017-10-15 19:02:11', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1431', '192.168.56.1', '2017-10-15 19:02:15', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1432', '192.168.56.1', '2017-10-15 19:02:24', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1433', '192.168.137.1', '2017-10-15 19:05:01', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1434', '192.168.1.157', '2017-10-15 19:07:06', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1435', '192.168.1.157', '2017-10-15 19:10:05', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1436', '192.168.1.157', '2017-10-15 19:16:05', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1437', '192.168.56.1', '2017-10-15 19:16:10', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1438', '192.168.56.1', '2017-10-15 19:16:24', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1439', '192.168.56.1', '2017-10-15 19:16:32', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1440', '192.168.1.157', '2017-10-15 19:17:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1441', '192.168.137.1', '2017-10-15 19:17:15', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1442', '192.168.137.1', '2017-10-15 19:17:20', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1443', '192.168.56.1', '2017-10-15 19:17:47', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1444', '192.168.56.1', '2017-10-15 19:17:49', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1445', '192.168.56.1', '2017-10-15 19:17:50', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1446', '192.168.56.1', '2017-10-15 19:17:57', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1447', '192.168.56.1', '2017-10-15 19:17:58', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1448', '192.168.137.1', '2017-10-15 19:18:28', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1449', '192.168.56.1', '2017-10-15 19:18:52', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1450', '192.168.56.1', '2017-10-15 19:20:26', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1451', '192.168.1.157', '2017-10-15 19:21:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1452', '192.168.56.1', '2017-10-15 19:21:50', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1453', '192.168.56.1', '2017-10-15 19:22:35', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1454', '192.168.56.1', '2017-10-15 19:22:43', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1455', '192.168.1.157', '2017-10-15 19:23:05', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1456', '192.168.56.1', '2017-10-15 19:23:23', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1457', '192.168.1.157', '2017-10-15 19:24:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1458', '192.168.1.157', '2017-10-15 19:25:19', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1459', '192.168.56.1', '2017-10-15 19:26:58', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1460', '192.168.56.1', '2017-10-15 19:27:33', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1461', '192.168.56.1', '2017-10-15 19:40:30', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1462', '192.168.1.157', '2017-10-15 19:41:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1463', '192.168.1.157', '2017-10-15 19:41:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1464', '192.168.1.157', '2017-10-15 19:42:19', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1465', '192.168.56.1', '2017-10-15 19:42:54', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1466', '192.168.137.1', '2017-10-15 19:43:06', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1467', '192.168.1.157', '2017-10-15 19:43:54', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1468', '192.168.1.157', '2017-10-15 19:44:18', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1469', '192.168.1.157', '2017-10-15 19:44:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1470', '192.168.56.1', '2017-10-15 19:45:24', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1471', '192.168.56.1', '2017-10-15 19:45:28', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1472', '192.168.1.157', '2017-10-15 19:45:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1473', '192.168.56.1', '2017-10-15 19:47:07', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1474', '192.168.1.157', '2017-10-15 19:47:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1475', '192.168.1.157', '2017-10-15 19:47:54', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1476', '192.168.1.157', '2017-10-15 19:50:25', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1477', '192.168.1.157', '2017-10-15 19:51:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1478', '192.168.1.157', '2017-10-15 19:51:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1479', '192.168.1.157', '2017-10-15 19:52:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1480', '192.168.1.157', '2017-10-15 19:53:22', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1481', '192.168.1.157', '2017-10-15 19:55:04', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1482', '192.168.1.157', '2017-10-15 19:55:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1483', '192.168.1.157', '2017-10-15 19:56:39', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1484', '192.168.56.1', '2017-10-15 20:00:02', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1485', '192.168.56.1', '2017-10-15 20:00:13', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1486', '192.168.56.1', '2017-10-15 20:00:18', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1487', '192.168.137.1', '2017-10-15 20:01:32', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1488', '192.168.56.1', '2017-10-15 20:02:15', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1489', '192.168.56.1', '2017-10-15 20:02:44', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1490', '192.168.56.1', '2017-10-15 20:02:46', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1491', '192.168.56.1', '2017-10-15 20:03:02', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1492', '192.168.56.1', '2017-10-15 20:03:02', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1493', '192.168.56.1', '2017-10-15 20:03:05', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1494', '192.168.56.1', '2017-10-15 20:03:05', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1495', '192.168.56.1', '2017-10-15 20:04:03', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1496', '192.168.56.1', '2017-10-15 20:04:14', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1497', '192.168.56.1', '2017-10-15 20:11:37', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1498', '192.168.56.1', '2017-10-15 20:12:22', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1499', '192.168.56.1', '2017-10-15 20:14:14', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1500', '192.168.56.1', '2017-10-15 20:14:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1501', '192.168.56.1', '2017-10-15 20:14:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1502', '192.168.56.1', '2017-10-15 20:17:26', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1503', '192.168.56.1', '2017-10-15 20:18:05', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1504', '192.168.1.157', '2017-10-15 20:45:09', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1505', '192.168.1.157', '2017-10-15 20:46:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1506', '192.168.1.157', '2017-10-15 20:47:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1507', '192.168.1.157', '2017-10-15 20:47:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1508', '192.168.137.1', '2017-10-15 20:47:56', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1509', '192.168.1.157', '2017-10-15 20:48:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1510', '192.168.1.157', '2017-10-15 20:48:54', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1511', '192.168.1.157', '2017-10-15 20:49:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1512', '192.168.1.157', '2017-10-15 20:50:26', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1513', '192.168.137.1', '2017-10-15 20:50:38', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1514', '192.168.1.157', '2017-10-15 20:51:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1515', '192.168.137.1', '2017-10-15 20:51:41', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1516', '192.168.137.1', '2017-10-15 20:52:02', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1517', '192.168.1.157', '2017-10-15 20:52:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1518', '192.168.137.1', '2017-10-15 20:53:02', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1519', '192.168.137.1', '2017-10-15 20:53:20', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1520', '192.168.1.157', '2017-10-15 20:53:35', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1521', '192.168.137.1', '2017-10-15 20:53:37', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1522', '192.168.1.157', '2017-10-15 20:53:53', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1523', '192.168.137.1', '2017-10-15 20:53:59', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1524', '192.168.56.1', '2017-10-15 20:59:48', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1525', '192.168.1.157', '2017-10-15 21:00:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1526', '192.168.56.1', '2017-10-15 21:11:46', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1527', '192.168.56.1', '2017-10-15 21:11:59', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1528', '192.168.56.1', '2017-10-15 21:18:37', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1529', '192.168.56.1', '2017-10-15 21:19:16', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1530', '192.168.56.1', '2017-10-15 21:19:56', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1531', '192.168.1.157', '2017-10-15 21:20:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1532', '192.168.1.157', '2017-10-15 21:20:16', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1533', '192.168.1.157', '2017-10-15 21:20:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1534', '192.168.1.157', '2017-10-15 21:22:14', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1535', '192.168.56.1', '2017-10-15 21:22:25', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1536', '192.168.1.157', '2017-10-15 21:23:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1537', '192.168.56.1', '2017-10-15 21:23:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1538', '192.168.56.1', '2017-10-15 21:24:25', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1539', '192.168.56.1', '2017-10-15 21:24:54', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1540', '192.168.56.1', '2017-10-15 21:26:35', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1541', '192.168.56.1', '2017-10-15 21:29:47', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1542', '192.168.1.157', '2017-10-15 21:47:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1543', '192.168.1.157', '2017-10-15 21:48:47', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1544', '192.168.1.157', '2017-10-15 21:49:25', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1545', '192.168.1.157', '2017-10-15 21:50:48', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1546', '192.168.1.157', '2017-10-15 21:57:41', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1547', '192.168.1.157', '2017-10-15 22:02:17', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1548', '192.168.1.157', '2017-10-15 22:03:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1549', '192.168.1.157', '2017-10-15 22:03:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1550', '192.168.1.157', '2017-10-15 22:04:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1551', '192.168.1.157', '2017-10-15 22:06:24', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1552', '192.168.1.157', '2017-10-15 22:09:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1553', '192.168.1.157', '2017-10-15 22:12:36', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1554', '192.168.1.157', '2017-10-15 22:26:06', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1555', '192.168.1.157', '2017-10-15 22:30:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1556', '192.168.1.157', '2017-10-15 22:31:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1557', '192.168.1.157', '2017-10-15 22:31:38', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1558', '192.168.1.157', '2017-10-15 22:31:50', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1559', '192.168.1.157', '2017-10-15 22:33:06', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1560', '192.168.1.101', '2017-10-15 22:34:05', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1561', '192.168.1.157', '2017-10-15 22:34:21', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1562', '192.168.1.157', '2017-10-15 22:35:17', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1563', '192.168.1.157', '2017-10-15 22:37:09', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1564', '192.168.1.101', '2017-10-15 22:38:03', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1565', '192.168.1.157', '2017-10-15 22:38:28', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1566', '192.168.1.157', '2017-10-15 22:41:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1567', '192.168.1.157', '2017-10-15 22:42:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1568', '192.168.1.157', '2017-10-15 22:43:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1569', '192.168.1.157', '2017-10-15 22:56:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1570', '192.168.1.157', '2017-10-15 22:57:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1571', '192.168.1.157', '2017-10-15 22:57:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1572', '192.168.1.157', '2017-10-15 22:59:06', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1573', '192.168.1.157', '2017-10-15 22:59:27', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1574', '192.168.1.157', '2017-10-15 23:00:11', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1575', '192.168.1.101', '2017-10-15 23:01:33', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1576', '192.168.1.101', '2017-10-15 23:01:40', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1577', '192.168.1.157', '2017-10-15 23:08:03', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1578', '192.168.1.157', '2017-10-15 23:09:33', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1579', '192.168.1.157', '2017-10-15 23:12:58', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1580', '192.168.1.157', '2017-10-15 23:14:57', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1581', '192.168.1.101', '2017-10-15 23:16:28', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1582', '192.168.1.157', '2017-10-15 23:18:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1583', '192.168.1.157', '2017-10-15 23:19:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1584', '192.168.1.157', '2017-10-15 23:23:32', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1585', '192.168.1.157', '2017-10-15 23:24:26', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1586', '192.168.1.101', '2017-10-15 23:25:44', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1587', '192.168.1.157', '2017-10-15 23:27:04', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1588', '192.168.1.157', '2017-10-15 23:28:13', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1589', '192.168.1.157', '2017-10-15 23:29:00', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1590', '192.168.1.101', '2017-10-15 23:29:08', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('1591', '192.168.1.101', '2017-10-15 23:29:09', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('1592', '192.168.1.101', '2017-10-15 23:29:10', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1593', '192.168.1.157', '2017-10-15 23:29:50', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1594', '192.168.1.157', '2017-10-15 23:40:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1595', '192.168.1.157', '2017-10-15 23:40:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1596', '192.168.1.157', '2017-10-15 23:40:59', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1597', '192.168.1.157', '2017-10-15 23:40:59', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1598', '192.168.1.157', '2017-10-15 23:44:18', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1599', '192.168.1.157', '2017-10-15 23:48:02', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1600', '192.168.1.157', '2017-10-15 23:48:25', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1601', '192.168.1.157', '2017-10-15 23:49:38', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1602', '192.168.1.157', '2017-10-15 23:50:22', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1603', '192.168.1.157', '2017-10-15 23:50:57', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1604', '192.168.1.157', '2017-10-15 23:51:26', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1605', '192.168.1.157', '2017-10-15 23:53:07', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1606', '192.168.1.157', '2017-10-15 23:53:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1607', '192.168.1.157', '2017-10-15 23:53:20', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1608', '192.168.1.157', '2017-10-15 23:58:04', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1609', '192.168.1.157', '2017-10-15 23:58:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1610', '192.168.1.104', '2017-10-16 08:29:51', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1611', '172.31.17.170', '2017-10-16 09:21:38', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1612', '172.31.17.170', '2017-10-16 09:22:31', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1613', '172.31.17.170', '2017-10-16 09:22:40', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1614', '172.31.17.170', '2017-10-16 09:23:08', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1615', '192.168.1.104', '2017-10-16 09:27:33', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1616', '192.168.1.104', '2017-10-16 09:28:34', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1617', '192.168.1.104', '2017-10-16 09:28:36', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1618', '172.31.17.170', '2017-10-16 09:29:34', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1619', '192.168.1.104', '2017-10-16 09:32:23', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1620', '172.31.17.170', '2017-10-16 09:32:43', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1621', '192.168.1.102', '2017-10-16 14:46:47', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1622', '192.168.1.102', '2017-10-16 14:46:49', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1623', '192.168.56.1', '2017-10-16 15:35:27', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1624', '192.168.1.102', '2017-10-16 15:54:05', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1625', '192.168.56.1', '2017-10-16 15:54:52', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1626', '192.168.1.102', '2017-10-16 15:58:06', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1627', '192.168.56.1', '2017-10-16 16:02:55', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1628', '192.168.1.102', '2017-10-16 16:36:46', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1629', '192.168.56.1', '2017-10-16 16:37:51', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1630', '192.168.56.1', '2017-10-16 16:42:00', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1631', '192.168.56.1', '2017-10-16 16:42:41', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1632', '192.168.56.1', '2017-10-16 16:42:46', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1633', '192.168.56.1', '2017-10-16 16:57:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1634', '192.168.56.1', '2017-10-16 16:57:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1635', '192.168.56.1', '2017-10-16 17:05:46', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1636', '192.168.56.1', '2017-10-16 17:05:49', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1637', '192.168.56.1', '2017-10-16 17:17:02', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1638', '192.168.56.1', '2017-10-16 17:24:32', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1639', '192.168.56.1', '2017-10-16 17:26:13', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1640', '192.168.56.1', '2017-10-16 17:26:23', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1641', '192.168.56.1', '2017-10-16 17:37:23', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1642', '192.168.56.1', '2017-10-16 17:45:58', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1643', '192.168.56.1', '2017-10-16 17:46:51', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1644', '192.168.56.1', '2017-10-16 17:46:54', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1645', '192.168.56.1', '2017-10-16 17:46:57', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1646', '192.168.1.157', '2017-10-16 18:14:39', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1647', '192.168.1.157', '2017-10-16 18:14:42', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('1648', '192.168.1.157', '2017-10-16 18:14:43', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1649', '192.168.1.157', '2017-10-16 18:14:44', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('1650', '192.168.1.157', '2017-10-16 18:14:45', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1651', '192.168.1.157', '2017-10-16 18:14:45', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('1652', '192.168.56.1', '2017-10-16 18:17:20', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1653', '192.168.1.157', '2017-10-16 18:33:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1654', '172.27.198.122', '2017-10-16 19:08:31', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1655', '172.31.17.170', '2017-10-16 19:32:18', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1656', '172.27.198.122', '2017-10-16 19:33:26', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1657', '192.168.1.104', '2017-10-16 21:30:38', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1658', '192.168.1.104', '2017-10-16 21:32:22', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1659', '192.168.56.1', '2017-10-17 14:49:13', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1660', '172.27.198.122', '2017-10-17 15:20:51', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1661', '172.27.198.122', '2017-10-17 15:27:27', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('1662', '172.27.198.122', '2017-10-17 15:27:37', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1663', '192.168.56.1', '2017-10-17 15:28:18', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1664', '172.27.198.122', '2017-10-17 15:37:49', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1665', '172.27.198.122', '2017-10-17 15:38:21', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('1666', '172.27.198.122', '2017-10-17 15:53:12', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1667', '192.168.56.1', '2017-10-17 15:54:10', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1668', '172.31.17.170', '2017-10-17 16:17:34', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1669', '172.31.17.170', '2017-10-17 16:17:48', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1670', '192.168.56.1', '2017-10-17 16:18:48', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1671', '172.27.198.122', '2017-10-17 16:22:00', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1672', '192.168.56.1', '2017-10-17 16:22:47', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1673', '192.168.56.1', '2017-10-17 16:23:17', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1674', '172.27.198.122', '2017-10-17 16:45:12', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1675', '192.168.56.1', '2017-10-17 16:45:27', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1676', '172.27.198.122', '2017-10-17 16:47:41', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1677', '192.168.56.1', '2017-10-17 16:49:19', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1678', '172.27.198.122', '2017-10-17 16:49:22', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1679', '192.168.56.1', '2017-10-17 16:54:48', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1680', '172.27.198.122', '2017-10-17 17:07:59', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1681', '172.27.198.122', '2017-10-17 17:11:01', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1682', '172.27.198.122', '2017-10-17 17:21:01', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1683', '172.27.198.122', '2017-10-17 17:21:17', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1684', '192.168.56.1', '2017-10-17 17:35:15', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1685', '172.27.198.122', '2017-10-17 17:35:48', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1686', '172.27.198.122', '2017-10-17 17:35:54', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1687', '192.168.56.1', '2017-10-17 17:40:36', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1688', '172.27.198.122', '2017-10-17 17:44:19', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1689', '172.27.198.122', '2017-10-17 17:44:49', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1690', '192.168.56.1', '2017-10-17 17:52:42', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1691', '172.27.198.122', '2017-10-17 17:53:48', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1692', '172.27.198.122', '2017-10-17 17:53:51', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('1693', '172.27.198.122', '2017-10-17 17:53:54', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('1694', '172.27.198.122', '2017-10-17 17:53:56', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1695', '192.168.56.1', '2017-10-17 17:54:12', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1696', '172.27.198.122', '2017-10-17 17:55:55', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('1697', '192.168.56.1', '2017-10-17 17:57:28', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1698', '172.27.198.122', '2017-10-17 17:57:42', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('1699', '192.168.56.1', '2017-10-17 18:00:27', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1700', '172.27.198.122', '2017-10-17 18:17:28', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1701', '192.168.56.1', '2017-10-17 18:17:27', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1702', '192.168.56.1', '2017-10-17 18:17:34', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1703', '172.27.198.122', '2017-10-17 18:17:43', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1704', '192.168.56.1', '2017-10-17 18:17:47', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1705', '172.27.198.122', '2017-10-17 18:19:25', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1706', '172.31.17.170', '2017-10-17 19:56:34', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1707', '192.168.56.1', '2017-10-17 19:56:56', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1708', '172.31.17.170', '2017-10-17 19:57:27', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1709', '172.31.17.170', '2017-10-17 19:57:42', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1710', '192.168.56.1', '2017-10-17 19:58:55', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1711', '192.168.43.91', '2017-10-17 20:35:53', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1712', '192.168.56.1', '2017-10-17 20:37:36', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1713', '192.168.56.1', '2017-10-17 20:56:55', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1714', '192.168.56.1', '2017-10-17 20:56:58', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1715', '192.168.56.1', '2017-10-17 21:01:17', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1716', '172.27.198.122', '2017-10-17 21:52:15', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1717', '192.168.56.1', '2017-10-17 21:53:02', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1718', '192.168.56.1', '2017-10-17 21:56:17', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1719', '192.168.1.111', '2017-10-17 23:27:03', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1720', '172.31.17.170', '2017-10-18 11:25:21', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1721', '172.27.198.122', '2017-10-18 14:34:49', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1722', '172.27.198.122', '2017-10-18 14:39:31', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1723', '172.27.198.122', '2017-10-18 14:44:41', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1724', '172.27.198.122', '2017-10-18 15:15:09', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('1725', '172.27.198.122', '2017-10-18 15:21:39', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1726', '172.31.17.170', '2017-10-18 15:27:45', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1727', '172.31.17.170', '2017-10-18 15:29:39', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1728', '172.27.198.122', '2017-10-18 15:34:35', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1729', '172.31.17.170', '2017-10-18 15:38:44', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1730', '172.27.198.122', '2017-10-18 15:41:44', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1731', '172.31.17.170', '2017-10-18 15:44:47', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1732', '172.31.17.170', '2017-10-18 15:44:50', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1733', '172.31.17.170', '2017-10-18 15:44:53', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1734', '172.31.17.170', '2017-10-18 15:44:58', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1735', '172.31.17.170', '2017-10-18 15:45:10', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1736', '172.31.17.170', '2017-10-18 15:50:10', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1737', '172.31.17.170', '2017-10-18 15:51:04', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1738', '172.31.17.170', '2017-10-18 15:53:07', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1739', '192.168.56.1', '2017-10-18 15:53:24', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1740', '172.31.17.170', '2017-10-18 15:53:33', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1741', '192.168.56.1', '2017-10-18 15:53:32', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1742', '192.168.56.1', '2017-10-18 15:53:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1743', '192.168.56.1', '2017-10-18 15:53:45', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1744', '172.31.17.170', '2017-10-18 15:54:01', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1745', '172.31.17.170', '2017-10-18 15:54:07', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1746', '172.31.17.170', '2017-10-18 15:55:04', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1747', '172.31.17.170', '2017-10-18 15:55:09', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1748', '172.31.17.170', '2017-10-18 15:55:12', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1749', '172.31.17.170', '2017-10-18 15:55:15', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1750', '172.31.17.170', '2017-10-18 15:55:20', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1751', '172.27.198.122', '2017-10-18 15:56:02', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1752', '172.31.17.170', '2017-10-18 15:56:35', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1753', '172.27.198.122', '2017-10-18 15:56:43', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1754', '192.168.56.1', '2017-10-18 15:58:41', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1755', '192.168.56.1', '2017-10-18 15:58:47', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1756', '192.168.56.1', '2017-10-18 15:58:50', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1757', '192.168.56.1', '2017-10-18 15:59:00', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1758', '192.168.56.1', '2017-10-18 16:00:51', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1759', '192.168.56.1', '2017-10-18 16:02:38', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1760', '172.27.198.122', '2017-10-18 16:03:24', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1761', '192.168.56.1', '2017-10-18 16:05:15', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1762', '172.31.17.170', '2017-10-18 16:07:51', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1763', '192.168.56.1', '2017-10-18 16:08:48', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1764', '172.31.17.170', '2017-10-18 16:09:05', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1765', '192.168.56.1', '2017-10-18 16:10:20', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1766', '192.168.56.1', '2017-10-18 16:10:39', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1767', '172.31.17.170', '2017-10-18 16:11:33', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1768', '172.31.17.170', '2017-10-18 16:12:14', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1769', '172.31.17.170', '2017-10-18 16:12:21', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1770', '172.27.198.122', '2017-10-18 16:13:30', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1771', '172.31.17.170', '2017-10-18 16:13:37', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1772', '172.31.17.170', '2017-10-18 16:15:07', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1773', '172.31.17.170', '2017-10-18 16:15:26', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1774', '172.31.17.170', '2017-10-18 16:15:34', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1775', '172.31.17.170', '2017-10-18 16:15:41', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1776', '172.31.17.170', '2017-10-18 16:15:56', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1777', '172.31.17.170', '2017-10-18 16:16:01', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1778', '172.27.198.122', '2017-10-18 16:16:05', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1779', '172.31.17.170', '2017-10-18 16:16:27', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1780', '172.31.17.170', '2017-10-18 16:16:50', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1781', '172.31.17.170', '2017-10-18 16:16:56', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1782', '172.31.17.170', '2017-10-18 16:16:59', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1783', '172.31.17.170', '2017-10-18 16:17:03', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1784', '172.31.17.170', '2017-10-18 16:17:06', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1785', '172.27.198.122', '2017-10-18 16:19:05', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1786', '192.168.56.1', '2017-10-18 16:19:17', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1787', '172.27.198.122', '2017-10-18 16:19:22', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1788', '172.27.198.122', '2017-10-18 16:19:35', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1789', '192.168.56.1', '2017-10-18 16:20:46', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1790', '172.27.198.122', '2017-10-18 16:21:31', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1791', '172.31.17.170', '2017-10-18 16:22:41', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1792', '172.31.17.170', '2017-10-18 16:23:01', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1793', '172.31.17.170', '2017-10-18 16:23:03', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1794', '172.31.17.170', '2017-10-18 16:23:10', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1795', '172.27.198.122', '2017-10-18 16:23:42', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1796', '172.31.17.170', '2017-10-18 16:23:59', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1797', '172.27.198.122', '2017-10-18 16:25:36', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1798', '192.168.56.1', '2017-10-18 16:26:57', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1799', '172.27.198.122', '2017-10-18 16:27:00', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1800', '172.31.17.170', '2017-10-18 16:27:07', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1801', '192.168.56.1', '2017-10-18 16:29:22', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1802', '172.31.17.170', '2017-10-18 16:30:22', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1803', '172.31.17.170', '2017-10-18 16:30:42', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1804', '172.31.17.170', '2017-10-18 16:30:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1805', '172.31.17.170', '2017-10-18 16:30:49', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1806', '172.31.17.170', '2017-10-18 16:30:53', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1807', '172.31.17.170', '2017-10-18 16:30:58', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1808', '172.31.17.170', '2017-10-18 16:31:01', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1809', '172.31.17.170', '2017-10-18 16:31:03', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1810', '172.31.17.170', '2017-10-18 16:31:05', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1811', '172.31.17.170', '2017-10-18 16:32:51', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1812', '192.168.56.1', '2017-10-18 16:33:17', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1813', '172.31.17.170', '2017-10-18 16:38:33', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1814', '192.168.56.1', '2017-10-18 16:39:29', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1815', '172.31.17.170', '2017-10-18 16:40:39', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1816', '172.27.198.122', '2017-10-18 16:42:04', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1817', '192.168.56.1', '2017-10-18 16:42:23', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1818', '172.31.17.170', '2017-10-18 16:45:44', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1819', '172.27.198.122', '2017-10-18 16:45:42', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1820', '172.27.198.122', '2017-10-18 16:45:43', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1821', '172.31.17.170', '2017-10-18 16:45:52', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1822', '172.31.17.170', '2017-10-18 16:45:55', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1823', '172.31.17.170', '2017-10-18 16:45:58', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1824', '172.31.17.170', '2017-10-18 16:46:01', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1825', '172.31.17.170', '2017-10-18 16:46:03', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1826', '172.27.198.122', '2017-10-18 16:46:48', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1827', '172.31.17.170', '2017-10-18 16:47:20', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1828', '172.31.17.170', '2017-10-18 16:47:24', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1829', '172.27.198.122', '2017-10-18 16:47:55', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1830', '192.168.56.1', '2017-10-18 16:47:55', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1831', '172.31.17.170', '2017-10-18 16:48:08', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1832', '172.27.198.122', '2017-10-18 16:48:07', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1833', '172.31.17.170', '2017-10-18 16:48:11', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1834', '172.31.17.170', '2017-10-18 16:48:14', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1835', '172.27.198.122', '2017-10-18 16:48:44', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1836', '192.168.56.1', '2017-10-18 16:50:46', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1837', '172.27.198.122', '2017-10-18 16:51:50', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1838', '192.168.56.1', '2017-10-18 16:51:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1839', '172.27.198.122', '2017-10-18 16:53:05', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1840', '192.168.56.1', '2017-10-18 16:54:12', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1841', '172.27.198.122', '2017-10-18 16:54:20', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1842', '192.168.56.1', '2017-10-18 16:55:35', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1843', '172.31.17.170', '2017-10-18 16:55:53', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1844', '172.31.17.170', '2017-10-18 16:55:57', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1845', '192.168.56.1', '2017-10-18 16:56:54', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1846', '172.31.17.170', '2017-10-18 16:56:59', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1847', '172.31.17.170', '2017-10-18 16:57:32', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1848', '172.31.17.170', '2017-10-18 16:57:36', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1849', '172.31.17.170', '2017-10-18 16:57:38', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1850', '192.168.56.1', '2017-10-18 17:00:41', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1851', '172.27.198.122', '2017-10-18 17:01:26', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1852', '192.168.56.1', '2017-10-18 17:01:50', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1853', '172.27.198.122', '2017-10-18 17:03:23', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1854', '192.168.56.1', '2017-10-18 17:04:58', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('1855', '192.168.56.1', '2017-10-18 17:06:18', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1856', '172.27.198.122', '2017-10-18 17:08:17', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1857', '192.168.56.1', '2017-10-18 17:08:16', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1858', '192.168.56.1', '2017-10-18 17:08:31', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1859', '192.168.56.1', '2017-10-18 17:14:10', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1860', '192.168.56.1', '2017-10-18 17:16:10', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1861', '172.27.198.122', '2017-10-18 17:21:48', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1862', '192.168.56.1', '2017-10-18 17:21:49', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1863', '192.168.56.1', '2017-10-18 17:22:38', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1864', '192.168.56.1', '2017-10-18 17:22:47', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1865', '192.168.56.1', '2017-10-18 17:23:10', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1866', '172.27.198.122', '2017-10-18 17:23:17', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1867', '192.168.56.1', '2017-10-18 17:24:10', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1868', '192.168.56.1', '2017-10-18 17:25:09', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1869', '192.168.56.1', '2017-10-18 17:28:54', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1870', '172.27.198.122', '2017-10-18 17:29:41', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1871', '192.168.56.1', '2017-10-18 17:31:30', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1872', '192.168.56.1', '2017-10-18 17:31:36', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1873', '172.27.198.122', '2017-10-18 17:35:17', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1874', '192.168.56.1', '2017-10-18 17:35:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1875', '172.27.198.122', '2017-10-18 17:35:57', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1876', '192.168.56.1', '2017-10-18 17:38:16', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1877', '192.168.56.1', '2017-10-18 17:38:20', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1878', '192.168.56.1', '2017-10-18 17:39:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1879', '172.27.198.122', '2017-10-18 17:40:26', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1880', '192.168.56.1', '2017-10-18 17:42:21', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1881', '172.27.198.122', '2017-10-18 17:42:59', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1882', '192.168.56.1', '2017-10-18 17:43:01', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1883', '192.168.56.1', '2017-10-18 17:43:12', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1884', '192.168.56.1', '2017-10-18 17:43:18', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1885', '192.168.56.1', '2017-10-18 17:44:38', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1886', '172.27.198.122', '2017-10-18 17:45:31', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1887', '192.168.56.1', '2017-10-18 17:45:38', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1888', '172.27.198.122', '2017-10-18 17:45:48', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1889', '192.168.56.1', '2017-10-18 18:11:01', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1890', '192.168.1.157', '2017-10-18 18:15:09', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('1891', '192.168.56.1', '2017-10-18 18:15:34', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1892', '192.168.1.186', '2017-10-18 18:15:48', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1893', '192.168.1.186', '2017-10-18 18:15:49', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1894', '192.168.1.186', '2017-10-18 18:15:55', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1895', '192.168.1.157', '2017-10-18 18:16:05', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1896', '192.168.1.186', '2017-10-18 18:16:17', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1897', '192.168.56.1', '2017-10-18 18:16:22', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1898', '192.168.1.186', '2017-10-18 18:16:33', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1899', '192.168.1.186', '2017-10-18 18:16:53', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1900', '192.168.1.157', '2017-10-18 18:17:42', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1901', '192.168.1.157', '2017-10-18 18:17:44', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1902', '192.168.1.157', '2017-10-18 18:19:15', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1903', '192.168.1.157', '2017-10-18 18:19:17', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1904', '192.168.1.186', '2017-10-18 18:19:28', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1905', '192.168.1.157', '2017-10-18 18:23:56', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1906', '192.168.1.157', '2017-10-18 18:28:25', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('1907', '172.20.10.14', '2017-10-18 18:38:22', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1908', '172.20.10.14', '2017-10-18 18:38:42', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1909', '192.168.56.1', '2017-10-18 19:45:21', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1910', '192.168.56.1', '2017-10-18 19:45:45', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1911', '172.20.10.14', '2017-10-18 19:50:19', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('1912', '172.20.10.14', '2017-10-18 19:50:26', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1913', '192.168.56.1', '2017-10-18 19:52:44', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1914', '192.168.56.1', '2017-10-18 19:55:31', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1915', '192.168.1.233', '2017-10-19 19:43:48', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1916', '192.168.1.233', '2017-10-19 19:51:52', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1917', '192.168.1.233', '2017-10-19 20:14:52', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1918', '172.31.17.170', '2017-10-19 22:04:44', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1919', '192.168.56.1', '2017-10-19 22:31:01', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1920', '192.168.56.1', '2017-10-19 22:31:04', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1921', '192.168.56.1', '2017-10-19 22:31:06', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1922', '192.168.56.1', '2017-10-19 22:31:13', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1923', '192.168.56.1', '2017-10-19 22:32:15', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1924', '192.168.56.1', '2017-10-19 22:42:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1925', '192.168.56.1', '2017-10-19 22:42:56', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1926', '192.168.56.1', '2017-10-19 22:45:21', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('1927', '192.168.56.1', '2017-10-19 22:45:23', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1928', '192.168.56.1', '2017-10-19 22:45:29', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1929', '192.168.56.1', '2017-10-19 22:45:33', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1930', '192.168.56.1', '2017-10-19 22:45:40', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1931', '192.168.56.1', '2017-10-19 22:45:46', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1932', '192.168.56.1', '2017-10-19 22:45:49', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1933', '192.168.56.1', '2017-10-19 22:45:53', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('1934', '192.168.56.1', '2017-10-19 22:45:57', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1935', '192.168.56.1', '2017-10-19 22:46:00', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('1936', '192.168.56.1', '2017-10-19 22:46:05', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('1937', '192.168.56.1', '2017-10-19 22:46:10', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1938', '192.168.56.1', '2017-10-19 22:56:30', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1939', '192.168.56.1', '2017-10-19 22:58:19', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1940', '192.168.56.1', '2017-10-19 22:58:23', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1941', '192.168.56.1', '2017-10-19 23:14:54', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1942', '192.168.56.1', '2017-10-19 23:15:26', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1943', '192.168.56.1', '2017-10-19 23:16:23', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('1944', '192.168.56.1', '2017-10-19 23:16:26', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1945', '192.168.56.1', '2017-10-19 23:16:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1946', '192.168.56.1', '2017-10-19 23:16:34', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1947', '192.168.56.1', '2017-10-19 23:16:36', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1948', '192.168.56.1', '2017-10-19 23:17:38', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1949', '192.168.56.1', '2017-10-19 23:32:41', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1950', '192.168.56.1', '2017-10-19 23:32:43', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1951', '192.168.56.1', '2017-10-19 23:32:46', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('1952', '192.168.56.1', '2017-10-19 23:32:50', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1953', '192.168.56.1', '2017-10-19 23:32:55', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1954', '192.168.56.1', '2017-10-19 23:32:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1955', '192.168.56.1', '2017-10-19 23:35:32', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1956', '192.168.1.157', '2017-10-19 23:36:43', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1957', '192.168.56.1', '2017-10-19 23:37:24', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1958', '192.168.1.157', '2017-10-19 23:37:40', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1959', '192.168.56.1', '2017-10-19 23:38:34', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1960', '192.168.56.1', '2017-10-19 23:38:37', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1961', '192.168.56.1', '2017-10-19 23:42:34', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1962', '192.168.56.1', '2017-10-19 23:42:45', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1963', '192.168.56.1', '2017-10-19 23:43:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('1964', '192.168.56.1', '2017-10-19 23:44:58', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('1965', '192.168.1.157', '2017-10-19 23:53:24', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1966', '192.168.43.91', '2017-10-20 00:06:35', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1967', '192.168.43.91', '2017-10-20 00:06:34', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1968', '172.31.17.170', '2017-10-20 08:15:58', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1969', '172.31.17.170', '2017-10-20 08:18:02', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('1970', '172.31.17.170', '2017-10-20 08:18:09', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('1971', '172.31.17.170', '2017-10-20 08:19:43', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1972', '172.31.17.170', '2017-10-20 08:19:45', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1973', '172.31.17.170', '2017-10-20 08:19:49', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1974', '172.31.17.170', '2017-10-20 08:19:53', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1975', '172.31.17.170', '2017-10-20 08:19:56', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1976', '172.31.17.170', '2017-10-20 08:19:59', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('1977', '172.31.17.170', '2017-10-20 08:20:02', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('1978', '172.31.17.170', '2017-10-20 09:27:14', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('1979', '172.31.17.170', '2017-10-20 09:32:52', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('1980', '172.31.17.170', '2017-10-20 09:36:28', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1981', '172.31.17.170', '2017-10-20 09:45:21', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1982', '172.31.17.170', '2017-10-20 09:45:31', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1983', '172.31.17.170', '2017-10-20 09:45:34', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1984', '172.31.17.170', '2017-10-20 09:45:41', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1985', '172.31.17.170', '2017-10-20 09:47:04', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1986', '172.31.17.170', '2017-10-20 09:48:23', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('1987', '172.31.17.170', '2017-10-20 09:59:59', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1988', '172.31.17.170', '2017-10-20 10:00:24', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1989', '172.31.17.170', '2017-10-20 10:00:38', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1990', '172.31.17.170', '2017-10-20 10:00:51', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('1991', '172.31.17.170', '2017-10-20 10:01:03', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('1992', '172.31.17.170', '2017-10-20 10:02:51', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('1993', '172.31.17.170', '2017-10-20 10:03:05', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('1994', '172.31.17.170', '2017-10-20 10:03:18', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('1995', '172.31.17.170', '2017-10-20 10:04:08', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('1996', '172.31.17.170', '2017-10-20 10:05:25', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('1997', '172.31.17.170', '2017-10-20 10:09:17', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('1998', '172.31.17.170', '2017-10-20 10:09:21', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('1999', '172.31.17.170', '2017-10-20 10:09:27', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2000', '172.31.17.170', '2017-10-20 10:12:14', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2001', '172.31.17.170', '2017-10-20 10:12:34', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2002', '172.31.17.170', '2017-10-20 10:12:44', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2003', '172.31.17.170', '2017-10-20 10:12:47', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2004', '172.31.17.170', '2017-10-20 10:13:33', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2005', '172.31.17.170', '2017-10-20 10:19:10', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2006', '172.31.17.170', '2017-10-20 10:19:31', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2007', '172.31.17.170', '2017-10-20 10:19:43', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2008', '172.31.17.170', '2017-10-20 10:21:34', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2009', '172.31.17.170', '2017-10-20 10:21:39', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2010', '172.31.17.170', '2017-10-20 10:35:13', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2011', '172.31.17.170', '2017-10-20 10:35:19', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2012', '172.31.17.170', '2017-10-20 10:37:10', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2013', '172.31.17.170', '2017-10-20 10:37:14', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2014', '172.31.17.170', '2017-10-20 10:40:12', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2015', '172.31.17.170', '2017-10-20 10:41:00', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2016', '172.31.17.170', '2017-10-20 10:41:04', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2017', '172.31.17.170', '2017-10-20 10:41:10', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2018', '172.31.17.170', '2017-10-20 10:41:16', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2019', '172.31.17.170', '2017-10-20 10:41:21', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2020', '172.31.17.170', '2017-10-20 10:41:23', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2021', '172.31.17.170', '2017-10-20 11:03:50', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2022', '172.31.17.170', '2017-10-20 11:04:55', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2023', '172.31.17.170', '2017-10-20 11:04:59', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2024', '192.168.56.1', '2017-10-20 12:58:47', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2025', '192.168.56.1', '2017-10-20 12:59:04', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2026', '192.168.56.1', '2017-10-20 12:59:17', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2027', '192.168.56.1', '2017-10-20 13:00:07', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2028', '192.168.56.1', '2017-10-20 13:00:13', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2029', '192.168.56.1', '2017-10-20 21:08:58', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2030', '192.168.56.1', '2017-10-20 21:09:14', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2031', '192.168.56.1', '2017-10-20 21:09:19', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2032', '192.168.56.1', '2017-10-20 21:10:45', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2033', '192.168.56.1', '2017-10-20 21:14:28', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2034', '192.168.56.1', '2017-10-20 21:16:54', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2035', '192.168.56.1', '2017-10-20 21:20:14', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('2036', '172.27.198.122', '2017-10-20 21:23:07', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2037', '172.27.198.122', '2017-10-20 21:24:02', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2038', '172.27.198.122', '2017-10-20 21:24:10', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2039', '192.168.56.1', '2017-10-20 21:24:18', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2040', '172.27.198.122', '2017-10-20 21:24:51', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2041', '172.27.198.122', '2017-10-20 21:30:14', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2042', '172.31.17.170', '2017-10-20 23:42:49', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2043', '172.31.17.170', '2017-10-20 23:43:01', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2044', '172.31.17.170', '2017-10-20 23:43:33', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2045', '172.31.17.170', '2017-10-20 23:43:48', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2046', '172.31.17.170', '2017-10-20 23:44:05', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('2047', '172.31.17.170', '2017-10-20 23:44:10', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2048', '172.31.17.170', '2017-10-20 23:46:32', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2049', '172.31.17.170', '2017-10-20 23:46:38', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2050', '172.31.17.170', '2017-10-20 23:46:44', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('2051', '172.31.17.170', '2017-10-20 23:46:49', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2052', '172.31.17.170', '2017-10-20 23:54:43', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2053', '172.31.17.170', '2017-10-20 23:54:57', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2054', '172.31.17.170', '2017-10-20 23:57:16', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2055', '172.31.17.170', '2017-10-21 00:30:56', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2056', '172.31.17.170', '2017-10-21 00:31:01', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2057', '172.31.17.170', '2017-10-21 00:32:40', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2058', '172.31.17.170', '2017-10-21 00:32:44', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2059', '172.31.17.170', '2017-10-21 00:32:53', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2060', '172.31.17.170', '2017-10-21 00:36:44', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2061', '172.31.17.170', '2017-10-21 00:51:45', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2062', '172.31.17.170', '2017-10-21 00:51:49', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2063', '172.31.17.170', '2017-10-21 00:51:54', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2064', '172.31.17.170', '2017-10-21 00:54:38', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2065', '172.31.17.170', '2017-10-21 00:54:39', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2066', '172.31.17.170', '2017-10-21 00:57:19', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2067', '172.31.17.170', '2017-10-21 00:57:19', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2068', '172.31.17.170', '2017-10-21 00:59:50', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2069', '172.31.17.170', '2017-10-21 01:00:21', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2070', '172.31.17.170', '2017-10-21 01:00:25', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2071', '172.31.17.170', '2017-10-21 01:35:26', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2072', '172.31.17.170', '2017-10-21 01:35:28', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2073', '172.31.17.170', '2017-10-21 01:35:31', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2074', '172.31.17.170', '2017-10-21 01:35:33', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2075', '172.31.17.170', '2017-10-21 01:35:37', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2076', '172.31.17.170', '2017-10-21 01:35:41', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2077', '172.31.17.170', '2017-10-21 01:35:46', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2078', '172.31.17.170', '2017-10-21 15:06:16', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2079', '172.31.17.170', '2017-10-21 15:06:24', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2080', '172.31.17.170', '2017-10-21 15:06:28', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2081', '172.31.17.170', '2017-10-21 15:06:33', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2082', '172.31.17.170', '2017-10-21 15:06:36', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2083', '172.31.17.170', '2017-10-21 15:07:53', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2084', '172.31.17.170', '2017-10-21 15:08:17', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2085', '172.31.17.170', '2017-10-21 15:08:22', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2086', '172.31.17.170', '2017-10-21 15:08:28', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2087', '172.31.17.170', '2017-10-21 15:12:13', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2088', '172.31.17.170', '2017-10-21 15:12:44', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2089', '172.31.17.170', '2017-10-21 15:12:50', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2090', '172.31.17.170', '2017-10-21 15:14:13', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2091', '172.31.17.170', '2017-10-21 15:14:55', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2092', '172.31.17.170', '2017-10-21 15:48:53', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2093', '172.31.17.170', '2017-10-21 16:06:09', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2094', '172.31.17.170', '2017-10-21 16:06:14', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2095', '172.31.17.170', '2017-10-21 16:18:53', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2096', '172.31.17.170', '2017-10-21 16:18:56', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2097', '172.31.17.170', '2017-10-21 16:18:59', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2098', '172.31.17.170', '2017-10-21 16:19:24', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2099', '172.31.17.170', '2017-10-21 16:19:28', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2100', '172.31.17.170', '2017-10-21 16:37:56', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2101', '172.31.17.170', '2017-10-21 16:38:00', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2102', '172.31.17.170', '2017-10-21 17:17:41', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2103', '172.31.17.170', '2017-10-21 17:17:43', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2104', '172.31.17.170', '2017-10-21 18:01:45', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('2105', '172.31.17.170', '2017-10-21 18:01:47', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2106', '172.31.17.170', '2017-10-21 18:01:47', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('2107', '172.31.17.170', '2017-10-21 18:03:45', '在线用户', '/userlogmanage', '1');
INSERT INTO `user_log` VALUES ('2108', '172.31.17.170', '2017-10-21 18:51:54', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2109', '192.168.1.157', '2017-10-21 19:48:24', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2110', '192.168.1.157', '2017-10-21 19:52:00', '在线用户', '/morelogrecord', '2');
INSERT INTO `user_log` VALUES ('2111', '172.31.17.170', '2017-10-21 19:54:29', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2112', '192.168.1.157', '2017-10-21 19:56:27', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2113', '172.31.17.170', '2017-10-21 20:00:51', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2114', '172.31.17.170', '2017-10-21 20:02:18', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2115', '172.31.17.170', '2017-10-21 20:02:35', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2116', '172.31.17.170', '2017-10-21 20:03:57', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2117', '172.31.17.170', '2017-10-21 20:04:01', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2118', '172.31.17.170', '2017-10-21 20:04:10', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2119', '172.31.17.170', '2017-10-21 20:04:17', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2120', '172.31.17.170', '2017-10-21 20:04:17', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2121', '172.31.17.170', '2017-10-21 20:05:41', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2122', '172.31.17.170', '2017-10-21 20:07:13', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2123', '172.31.17.170', '2017-10-21 20:08:09', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2124', '172.31.17.170', '2017-10-22 00:16:48', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2125', '172.31.17.170', '2017-10-22 00:16:53', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2126', '172.31.17.170', '2017-10-22 00:17:04', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2127', '172.31.17.170', '2017-10-22 00:36:14', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2128', '172.31.17.170', '2017-10-22 00:36:25', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2129', '172.31.17.170', '2017-10-22 00:36:34', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2130', '172.31.17.170', '2017-10-22 08:23:14', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2131', '172.31.17.170', '2017-10-22 08:23:23', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2132', '172.31.17.170', '2017-10-22 08:23:25', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2133', '172.31.17.170', '2017-10-22 08:25:19', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2134', '172.31.17.170', '2017-10-22 08:28:08', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2135', '172.31.17.170', '2017-10-22 08:28:12', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2136', '172.31.17.170', '2017-10-22 08:28:17', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2137', '172.31.17.170', '2017-10-22 08:28:45', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2138', '172.31.17.170', '2017-10-22 08:29:01', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2139', '172.31.17.170', '2017-10-22 08:30:16', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2140', '172.31.17.170', '2017-10-22 08:32:26', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2141', '172.31.17.170', '2017-10-22 08:32:31', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2142', '172.31.17.170', '2017-10-22 08:32:34', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2143', '172.31.17.170', '2017-10-22 08:32:44', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2144', '172.31.17.170', '2017-10-22 08:34:53', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2145', '172.31.17.170', '2017-10-22 08:35:01', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2146', '172.31.17.170', '2017-10-22 08:58:45', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2147', '172.31.17.170', '2017-10-22 09:00:35', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2148', '172.27.198.122', '2017-10-22 10:10:53', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2149', '172.27.198.122', '2017-10-22 10:11:04', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2150', '192.168.1.233', '2017-10-22 10:17:30', '在线用户', '/morelogrecord', '3');
INSERT INTO `user_log` VALUES ('2151', '192.168.1.233', '2017-10-22 10:17:37', '职位管理', '/positionmanage', '3');
INSERT INTO `user_log` VALUES ('2152', '192.168.1.233', '2017-10-22 10:20:39', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2153', '192.168.1.233', '2017-10-22 10:21:14', '用户管理', '/usermanage', '3');
INSERT INTO `user_log` VALUES ('2154', '192.168.1.233', '2017-10-22 10:23:28', '用户管理', '/usermanage', '3');
INSERT INTO `user_log` VALUES ('2155', '192.168.1.233', '2017-10-22 10:27:41', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2156', '192.168.1.233', '2017-10-22 10:28:01', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2157', '192.168.1.233', '2017-10-22 10:28:47', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2158', '192.168.1.233', '2017-10-22 10:29:15', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2159', '192.168.1.233', '2017-10-22 10:29:23', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2160', '192.168.1.233', '2017-10-22 10:29:27', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2161', '192.168.1.233', '2017-10-22 10:29:35', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2162', '192.168.1.233', '2017-10-22 10:32:36', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2163', '192.168.1.233', '2017-10-22 10:32:44', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2164', '192.168.1.233', '2017-10-22 10:32:47', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2165', '192.168.1.233', '2017-10-22 10:33:15', '用户管理', '/usermanage', '3');
INSERT INTO `user_log` VALUES ('2166', '192.168.1.233', '2017-10-22 10:33:32', '计划管理', '/planview', '3');
INSERT INTO `user_log` VALUES ('2167', '192.168.1.233', '2017-10-22 10:33:36', '计划报表', '/myplan', '3');
INSERT INTO `user_log` VALUES ('2168', '192.168.1.233', '2017-10-22 10:34:31', '我的管理', '/chatmanage', '3');
INSERT INTO `user_log` VALUES ('2169', '192.168.1.233', '2017-10-22 10:34:37', '讨论区列表', '/chatlist', '3');
INSERT INTO `user_log` VALUES ('2170', '192.168.1.157', '2017-10-22 10:36:11', '讨论区列表', '/chatlist', '5');
INSERT INTO `user_log` VALUES ('2171', '192.168.1.233', '2017-10-22 10:38:03', '计划报表', '/myplan', '3');
INSERT INTO `user_log` VALUES ('2172', '192.168.1.233', '2017-10-22 10:43:22', '计划报表', '/myplan', '3');
INSERT INTO `user_log` VALUES ('2173', '192.168.1.233', '2017-10-22 10:44:09', '计划报表', '/myplan', '3');
INSERT INTO `user_log` VALUES ('2174', '192.168.1.233', '2017-10-22 10:48:23', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2175', '192.168.1.233', '2017-10-22 10:48:26', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2176', '192.168.1.233', '2017-10-22 10:49:07', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2177', '192.168.1.233', '2017-10-22 10:49:30', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2178', '192.168.1.233', '2017-10-22 10:50:01', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2179', '192.168.1.233', '2017-10-22 10:50:13', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2180', '192.168.1.233', '2017-10-22 10:51:27', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2181', '192.168.1.233', '2017-10-22 10:51:51', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2182', '192.168.1.233', '2017-10-22 10:51:56', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2183', '192.168.1.233', '2017-10-22 10:57:36', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2184', '192.168.1.233', '2017-10-22 11:00:44', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2185', '192.168.1.233', '2017-10-22 11:01:57', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2186', '192.168.1.233', '2017-10-22 11:04:08', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2187', '192.168.1.233', '2017-10-22 11:10:20', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2188', '192.168.1.233', '2017-10-22 11:11:32', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2189', '192.168.1.233', '2017-10-22 11:14:21', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2190', '192.168.1.233', '2017-10-22 11:16:04', '考勤月报表', '/attendcemonth', '3');
INSERT INTO `user_log` VALUES ('2191', '192.168.1.233', '2017-10-22 11:17:06', '考勤列表', '/attendcelist', '3');
INSERT INTO `user_log` VALUES ('2192', '192.168.1.233', '2017-10-22 11:17:12', '计划管理', '/planview', '3');
INSERT INTO `user_log` VALUES ('2193', '192.168.1.233', '2017-10-22 11:17:15', '笔记管理', '/noteview', '3');
INSERT INTO `user_log` VALUES ('2194', '192.168.1.233', '2017-10-22 11:17:53', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2195', '172.31.17.100', '2017-12-14 20:32:58', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2196', '172.31.17.100', '2017-12-14 20:32:58', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2197', '172.31.17.100', '2017-12-14 20:33:18', '部门管理', '/deptmanage', '7');
INSERT INTO `user_log` VALUES ('2198', '172.31.17.100', '2017-12-14 20:33:18', '部门管理', '/deptmanage', '7');
INSERT INTO `user_log` VALUES ('2199', '172.31.17.100', '2017-12-14 20:33:34', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2200', '172.31.17.100', '2017-12-14 20:33:34', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2201', '172.31.17.100', '2017-12-14 20:33:37', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2202', '172.31.17.100', '2017-12-14 20:33:37', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2203', '172.31.17.100', '2017-12-14 20:33:39', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2204', '172.31.17.100', '2017-12-14 20:33:39', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2205', '172.31.17.100', '2017-12-14 20:33:41', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2206', '172.31.17.100', '2017-12-14 20:33:41', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2207', '172.31.17.100', '2017-12-14 20:33:45', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2208', '172.31.17.100', '2017-12-14 20:33:45', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2209', '172.31.17.100', '2017-12-14 20:33:47', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('2210', '172.31.17.100', '2017-12-14 20:33:47', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('2211', '172.31.17.100', '2017-12-14 20:33:48', '新建流程', '/xinxeng', '7');
INSERT INTO `user_log` VALUES ('2212', '172.31.17.100', '2017-12-14 20:33:48', '新建流程', '/xinxeng', '7');
INSERT INTO `user_log` VALUES ('2213', '172.31.17.100', '2017-12-14 20:33:52', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2214', '172.31.17.100', '2017-12-14 20:33:52', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2215', '172.31.17.100', '2017-12-14 20:33:54', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2216', '172.31.17.100', '2017-12-14 20:33:56', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2217', '172.31.17.100', '2017-12-16 19:31:10', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2218', '172.31.17.100', '2017-12-16 19:34:12', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2219', '172.31.17.100', '2017-12-16 19:34:13', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2220', '172.31.17.100', '2017-12-16 19:34:15', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2221', '172.31.17.100', '2017-12-16 19:34:15', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2222', '172.31.17.100', '2017-12-16 19:34:21', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2223', '172.31.17.100', '2017-12-16 19:34:30', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2224', '172.31.17.100', '2017-12-16 19:35:08', '职位管理', '/positionmanage', '7');
INSERT INTO `user_log` VALUES ('2225', '172.31.17.100', '2017-12-16 19:35:19', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2226', '172.31.17.100', '2017-12-16 19:35:21', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2227', '172.31.17.100', '2017-12-16 19:35:25', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2228', '172.31.17.100', '2017-12-16 19:35:35', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2229', '172.31.17.100', '2017-12-16 19:35:36', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2230', '172.27.93.0', '2017-12-20 10:18:13', '部门管理', '/deptmanage', '5');
INSERT INTO `user_log` VALUES ('2231', '172.27.93.0', '2017-12-20 10:18:15', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('2232', '172.27.93.0', '2017-12-20 10:18:16', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('2233', '172.27.93.0', '2017-12-20 10:18:38', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('2234', '172.27.93.0', '2017-12-20 10:18:39', '考勤周报表', '/attendceweek', '5');
INSERT INTO `user_log` VALUES ('2235', '172.27.93.0', '2017-12-20 10:18:42', '考勤月报表', '/attendcemonth', '5');
INSERT INTO `user_log` VALUES ('2236', '172.27.93.0', '2017-12-20 10:18:43', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('2237', '172.27.93.0', '2017-12-20 10:18:44', '考勤月报表', '/attendcemonth', '5');
INSERT INTO `user_log` VALUES ('2238', '172.27.93.0', '2017-12-20 10:18:45', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('2239', '172.27.93.0', '2017-12-20 10:18:48', '任务管理', '/taskmanage', '5');
INSERT INTO `user_log` VALUES ('2240', '172.27.93.0', '2017-12-20 10:18:50', '我的任务', '/mytask', '5');
INSERT INTO `user_log` VALUES ('2241', '172.27.93.0', '2017-12-20 10:18:53', '邮件管理', '/mail', '5');
INSERT INTO `user_log` VALUES ('2242', '172.31.17.236', '2017-12-23 12:38:13', '部门管理', '/deptmanage', '7');
INSERT INTO `user_log` VALUES ('2243', '172.31.17.236', '2017-12-23 12:38:34', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2244', '172.31.17.236', '2017-12-23 12:38:38', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2245', '172.31.17.236', '2017-12-23 12:38:41', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2246', '172.31.17.236', '2017-12-23 12:38:44', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2247', '172.31.17.236', '2017-12-23 12:38:47', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2248', '172.31.17.236', '2017-12-23 12:38:51', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2249', '172.31.17.236', '2017-12-23 12:38:54', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2250', '172.31.17.236', '2017-12-23 12:39:04', '新建流程', '/xinxeng', '7');
INSERT INTO `user_log` VALUES ('2251', '172.31.17.236', '2017-12-23 12:39:07', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('2252', '172.31.17.236', '2017-12-23 12:39:10', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2253', '172.31.17.236', '2017-12-23 12:39:14', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2254', '172.31.17.236', '2017-12-23 12:39:17', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2255', '172.31.17.236', '2017-12-23 12:39:20', '账号管理', '/accountmanage', '7');
INSERT INTO `user_log` VALUES ('2256', '172.31.17.236', '2017-12-23 12:39:22', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2257', '172.31.17.236', '2017-12-23 12:39:39', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2258', '172.31.17.236', '2017-12-23 12:39:41', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2259', '172.31.17.236', '2017-12-23 12:39:44', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2260', '172.31.17.236', '2017-12-23 12:39:46', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2261', '172.31.17.236', '2017-12-23 12:39:47', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2262', '172.31.17.236', '2017-12-23 12:40:44', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2263', '172.31.17.236', '2017-12-23 12:40:47', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2264', '172.31.17.236', '2017-12-23 12:40:49', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2265', '172.31.17.236', '2017-12-23 12:40:51', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2266', '172.31.17.236', '2017-12-23 12:41:01', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2267', '172.31.17.236', '2017-12-23 17:27:04', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2268', '172.31.17.236', '2017-12-23 17:27:40', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2269', '172.31.17.236', '2017-12-23 17:27:44', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2270', '172.31.17.236', '2017-12-23 17:29:45', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2271', '172.31.17.236', '2017-12-23 17:30:00', '通讯录', '/addrmanage', '7');
INSERT INTO `user_log` VALUES ('2272', '172.31.17.236', '2017-12-23 17:31:24', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2273', '172.31.17.236', '2017-12-23 17:31:28', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2274', '172.31.17.236', '2017-12-23 17:31:38', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2275', '172.31.17.236', '2017-12-23 17:31:40', '部门管理', '/deptmanage', '7');
INSERT INTO `user_log` VALUES ('2276', '172.31.17.236', '2017-12-23 17:31:43', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2277', '172.31.17.236', '2017-12-23 17:31:45', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2278', '172.31.17.236', '2017-12-23 17:31:51', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2279', '172.31.17.236', '2017-12-23 17:31:53', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2280', '172.31.17.236', '2017-12-23 17:32:18', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2281', '172.31.17.236', '2017-12-23 17:34:17', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2282', '172.31.17.236', '2017-12-23 17:34:26', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2283', '172.31.17.236', '2017-12-23 17:35:38', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2284', '172.31.17.236', '2017-12-23 17:35:39', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2285', '172.31.17.236', '2017-12-23 17:35:41', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2286', '172.31.17.236', '2017-12-23 17:35:42', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2287', '172.31.17.236', '2017-12-23 17:35:43', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2288', '172.31.17.236', '2017-12-23 17:35:44', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2289', '172.31.17.236', '2017-12-23 17:35:59', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2290', '172.31.17.236', '2017-12-23 17:36:01', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2291', '172.31.17.236', '2017-12-23 17:36:03', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2292', '172.31.17.236', '2017-12-23 17:36:20', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2293', '172.31.17.236', '2017-12-23 17:36:23', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2294', '172.31.17.236', '2017-12-23 17:36:25', '账号管理', '/accountmanage', '7');
INSERT INTO `user_log` VALUES ('2295', '172.31.17.236', '2017-12-23 17:36:28', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2296', '172.31.17.236', '2017-12-23 17:36:42', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2297', '172.31.17.236', '2017-12-23 17:36:45', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2298', '172.31.17.236', '2017-12-23 17:36:47', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2299', '172.31.17.236', '2017-12-23 17:36:47', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2300', '192.168.2.100', '2018-02-01 21:54:46', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2301', '192.168.2.100', '2018-02-01 21:55:01', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2302', '192.168.2.100', '2018-02-01 21:55:28', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2303', '192.168.2.100', '2018-02-01 21:55:48', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2304', '192.168.2.100', '2018-02-01 21:58:17', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2305', '192.168.2.100', '2018-02-01 21:58:20', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2306', '192.168.2.100', '2018-02-01 21:58:33', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2307', '192.168.2.100', '2018-02-01 21:58:57', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2308', '192.168.2.100', '2018-02-01 21:59:08', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2309', '192.168.2.100', '2018-02-01 21:59:12', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2310', '192.168.2.100', '2018-02-01 22:01:21', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2311', '192.168.2.100', '2018-02-02 23:41:09', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2312', '192.168.2.100', '2018-02-02 23:41:19', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2313', '192.168.2.100', '2018-02-02 23:43:36', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2314', '192.168.2.100', '2018-02-02 23:43:39', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2315', '192.168.2.100', '2018-02-02 23:43:53', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2316', '192.168.2.100', '2018-02-02 23:44:07', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2317', '192.168.2.100', '2018-02-02 23:44:10', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2318', '192.168.2.100', '2018-02-02 23:44:16', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2319', '192.168.2.100', '2018-02-02 23:45:16', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2320', '192.168.2.100', '2018-02-02 23:45:28', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2321', '192.168.2.100', '2018-02-03 00:02:33', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2322', '192.168.2.100', '2018-02-03 00:07:02', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2323', '192.168.2.100', '2018-02-03 00:07:02', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2324', '192.168.2.100', '2018-02-03 00:07:13', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2325', '192.168.2.100', '2018-02-03 00:07:20', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2326', '192.168.2.100', '2018-02-03 00:09:49', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2327', '192.168.2.100', '2018-02-03 00:09:59', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2328', '192.168.2.100', '2018-02-03 00:36:31', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2329', '192.168.2.100', '2018-02-03 00:36:38', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2330', '192.168.2.100', '2018-02-03 00:36:42', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2331', '192.168.2.100', '2018-02-03 00:36:42', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2332', '192.168.2.100', '2018-02-03 00:36:46', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2333', '192.168.2.100', '2018-02-03 22:26:41', '文件管理', '/filemanage', '13');
INSERT INTO `user_log` VALUES ('2334', '192.168.2.100', '2018-02-03 22:26:46', '笔记管理', '/noteview', '13');
INSERT INTO `user_log` VALUES ('2335', '192.168.2.100', '2018-02-03 22:26:49', '我的管理', '/chatmanage', '13');
INSERT INTO `user_log` VALUES ('2336', '192.168.2.100', '2018-02-03 22:26:53', '讨论区列表', '/chatlist', '13');
INSERT INTO `user_log` VALUES ('2337', '192.168.2.100', '2018-02-03 22:27:00', '新建流程', '/xinxeng', '13');
INSERT INTO `user_log` VALUES ('2338', '192.168.2.100', '2018-02-03 22:27:55', '新建流程', '/xinxeng', '13');
INSERT INTO `user_log` VALUES ('2339', '192.168.2.100', '2018-02-03 22:28:16', '新建流程', '/xinxeng', '13');
INSERT INTO `user_log` VALUES ('2340', '192.168.2.100', '2018-02-03 22:29:06', '我的申请', '/flowmanage', '13');
INSERT INTO `user_log` VALUES ('2341', '192.168.2.100', '2018-02-03 22:29:13', '通知列表', '/infromlist', '13');
INSERT INTO `user_log` VALUES ('2342', '192.168.2.100', '2018-02-03 22:29:17', '新建流程', '/xinxeng', '13');
INSERT INTO `user_log` VALUES ('2343', '192.168.2.100', '2018-02-03 22:29:48', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2344', '192.168.2.100', '2018-02-03 22:31:56', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2345', '192.168.2.100', '2018-02-03 22:47:18', '笔记管理', '/noteview', '11');
INSERT INTO `user_log` VALUES ('2346', '192.168.2.100', '2018-02-03 22:48:04', '通知列表', '/infromlist', '11');
INSERT INTO `user_log` VALUES ('2347', '192.168.2.100', '2018-02-03 23:05:49', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2348', '192.168.2.100', '2018-02-03 23:06:28', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2349', '192.168.2.100', '2018-02-03 23:06:36', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2350', '192.168.2.100', '2018-02-03 23:07:11', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2351', '192.168.2.100', '2018-02-03 23:07:42', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2352', '192.168.2.100', '2018-02-03 23:08:56', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2353', '192.168.2.100', '2018-02-03 23:09:14', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2354', '192.168.2.100', '2018-02-03 23:11:02', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2355', '192.168.2.100', '2018-02-03 23:11:44', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2356', '192.168.2.100', '2018-02-03 23:11:47', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2357', '192.168.2.100', '2018-02-03 23:11:52', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2358', '192.168.2.100', '2018-02-03 23:12:25', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2359', '192.168.2.100', '2018-02-03 23:15:31', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2360', '192.168.2.100', '2018-02-03 23:15:39', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2361', '192.168.2.100', '2018-02-03 23:16:10', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2362', '192.168.2.100', '2018-02-03 23:18:01', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2363', '192.168.2.100', '2018-02-03 23:19:20', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2364', '192.168.2.100', '2018-02-03 23:21:06', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2365', '192.168.2.100', '2018-02-03 23:21:11', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2366', '192.168.2.100', '2018-02-03 23:21:17', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2367', '192.168.2.100', '2018-02-03 23:21:21', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2368', '192.168.2.100', '2018-02-03 23:21:24', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2369', '192.168.2.100', '2018-02-03 23:25:39', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2370', '192.168.2.100', '2018-02-03 23:25:42', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2371', '192.168.2.100', '2018-02-03 23:30:09', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2372', '192.168.2.100', '2018-02-03 23:30:20', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2373', '192.168.2.100', '2018-02-03 23:30:26', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2374', '192.168.2.100', '2018-02-03 23:30:34', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2375', '192.168.2.100', '2018-02-03 23:31:40', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2376', '192.168.2.100', '2018-02-03 23:33:46', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2377', '192.168.2.100', '2018-02-03 23:34:51', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2378', '192.168.2.100', '2018-02-03 23:35:14', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2379', '192.168.2.100', '2018-02-03 23:35:27', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2380', '192.168.2.100', '2018-02-03 23:35:34', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2381', '192.168.2.100', '2018-02-03 23:35:58', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2382', '192.168.2.100', '2018-02-03 23:36:08', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2383', '192.168.2.100', '2018-02-03 23:36:30', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2384', '192.168.2.100', '2018-02-03 23:38:09', '通知列表', '/infromlist', '2');
INSERT INTO `user_log` VALUES ('2385', '192.168.2.100', '2018-02-03 23:38:27', '我的任务', '/mytask', '2');
INSERT INTO `user_log` VALUES ('2386', '192.168.2.100', '2018-02-03 23:38:32', '通知列表', '/infromlist', '2');
INSERT INTO `user_log` VALUES ('2387', '192.168.2.100', '2018-02-04 00:15:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2388', '192.168.2.100', '2018-02-04 00:21:51', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2389', '192.168.2.100', '2018-02-04 00:23:15', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2390', '192.168.2.100', '2018-02-04 01:05:28', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2391', '192.168.2.100', '2018-02-04 01:05:32', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2392', '192.168.2.100', '2018-02-04 01:05:44', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2393', '192.168.2.100', '2018-02-04 01:07:42', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2394', '192.168.2.100', '2018-02-04 01:07:51', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2395', '192.168.2.100', '2018-02-04 01:08:12', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2396', '192.168.2.100', '2018-02-04 01:11:42', '通知管理', '/infrommanage', '2');
INSERT INTO `user_log` VALUES ('2397', '192.168.2.100', '2018-02-04 01:16:23', '考勤管理', '/attendceatt', '3');
INSERT INTO `user_log` VALUES ('2398', '192.168.2.100', '2018-02-04 01:16:27', '考勤周报表', '/attendceweek', '3');
INSERT INTO `user_log` VALUES ('2399', '192.168.2.100', '2018-02-04 01:17:13', '考勤管理', '/attendceatt', '2');
INSERT INTO `user_log` VALUES ('2400', '192.168.2.100', '2018-02-04 01:25:40', '通知管理', '/infrommanage', '2');
INSERT INTO `user_log` VALUES ('2401', '192.168.2.100', '2018-02-04 01:37:03', '通知管理', '/infrommanage', '2');
INSERT INTO `user_log` VALUES ('2402', '192.168.2.100', '2018-02-05 19:48:28', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2403', '192.168.2.100', '2018-02-05 19:48:34', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2404', '192.168.2.100', '2018-02-05 19:48:35', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2405', '192.168.2.100', '2018-02-05 19:50:44', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2406', '192.168.2.100', '2018-02-05 19:52:46', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2407', '192.168.2.100', '2018-02-05 19:54:16', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2408', '192.168.2.100', '2018-02-05 20:35:22', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2409', '192.168.2.100', '2018-02-06 17:48:12', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2410', '192.168.2.100', '2018-02-06 17:48:21', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2411', '192.168.2.100', '2018-02-06 17:48:45', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2412', '192.168.2.100', '2018-02-06 17:48:49', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2413', '192.168.2.100', '2018-02-06 17:48:52', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2414', '192.168.2.100', '2018-02-06 17:49:01', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2415', '192.168.2.100', '2018-02-06 17:49:03', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2416', '192.168.2.100', '2018-02-06 17:49:24', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2417', '192.168.2.100', '2018-02-06 17:49:36', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2418', '192.168.2.100', '2018-02-06 18:01:44', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2419', '192.168.2.100', '2018-02-06 18:01:57', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2420', '192.168.2.100', '2018-02-06 18:02:00', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2421', '192.168.2.100', '2018-02-06 18:02:15', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2422', '192.168.2.100', '2018-02-06 18:02:29', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2423', '192.168.2.100', '2018-02-06 19:42:37', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2424', '192.168.2.100', '2018-02-06 19:43:25', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2425', '192.168.2.100', '2018-02-06 19:43:28', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2426', '192.168.2.100', '2018-02-06 19:43:31', '我的日历', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('2427', '192.168.2.100', '2018-02-06 19:43:38', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2428', '192.168.2.100', '2018-02-06 19:43:53', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2429', '192.168.2.100', '2018-02-06 19:48:20', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2430', '192.168.2.100', '2018-02-06 19:48:22', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2431', '192.168.2.100', '2018-02-06 19:48:26', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2432', '192.168.2.100', '2018-02-06 19:48:30', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('2433', '192.168.2.100', '2018-02-06 19:48:34', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2434', '192.168.2.100', '2018-02-06 19:48:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2435', '192.168.2.100', '2018-02-06 19:48:51', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2436', '192.168.2.100', '2018-02-06 19:48:57', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2437', '192.168.2.100', '2018-02-06 19:49:12', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2438', '192.168.2.100', '2018-02-07 00:41:23', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2439', '192.168.2.100', '2018-02-07 00:41:59', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2440', '192.168.2.100', '2018-02-07 00:42:32', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2441', '192.168.2.100', '2018-02-07 00:42:38', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2442', '192.168.2.100', '2018-02-07 00:42:50', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2443', '192.168.2.100', '2018-02-08 18:17:06', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2444', '192.168.2.100', '2018-02-08 18:17:24', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2445', '192.168.2.100', '2018-02-08 18:17:27', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2446', '192.168.2.100', '2018-02-08 20:47:53', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2447', '192.168.2.100', '2018-02-08 20:47:57', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2448', '192.168.2.100', '2018-02-08 21:26:28', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2449', '192.168.2.100', '2018-02-08 21:26:29', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2450', '192.168.2.100', '2018-02-08 22:21:48', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2451', '192.168.2.100', '2018-02-09 00:47:54', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('2452', '192.168.2.100', '2018-02-09 00:48:38', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2453', '192.168.2.100', '2018-02-09 00:48:45', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2454', '192.168.2.100', '2018-02-09 00:50:38', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2455', '192.168.2.100', '2018-02-09 00:50:56', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2456', '192.168.2.100', '2018-02-09 00:51:14', '我的任务', '/mytask', '1');
INSERT INTO `user_log` VALUES ('2457', '192.168.2.100', '2018-02-09 00:51:28', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('2458', '192.168.2.100', '2018-02-09 00:51:34', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2459', '192.168.2.100', '2018-02-09 00:51:40', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2460', '192.168.2.100', '2018-02-09 00:51:51', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2461', '192.168.2.100', '2018-02-09 01:03:52', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2462', '192.168.2.100', '2018-02-09 01:03:57', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2463', '192.168.2.100', '2018-02-11 09:49:46', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2464', '192.168.2.100', '2018-02-11 10:03:51', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2465', '192.168.2.100', '2018-02-11 10:05:52', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2466', '192.168.2.100', '2018-02-19 13:22:37', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2467', '192.168.2.100', '2018-02-19 13:22:40', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2468', '192.168.2.100', '2018-02-19 13:22:43', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2469', '192.168.2.100', '2018-02-19 13:22:49', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2470', '192.168.2.100', '2018-02-19 13:22:55', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2471', '192.168.2.100', '2018-02-19 13:33:42', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2472', '192.168.2.100', '2018-02-19 13:33:47', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2473', '192.168.1.104', '2018-03-01 19:13:42', '部门管理', '/deptmanage', '5');
INSERT INTO `user_log` VALUES ('2474', '192.168.1.104', '2018-03-01 19:13:48', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('2475', '192.168.1.104', '2018-03-01 19:13:49', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('2476', '192.168.1.104', '2018-03-01 19:13:58', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2477', '192.168.1.104', '2018-03-01 19:13:59', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2478', '192.168.1.104', '2018-03-01 19:22:02', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2479', '192.168.1.104', '2018-03-01 19:22:41', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2480', '192.168.1.104', '2018-03-01 19:23:36', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2481', '192.168.1.104', '2018-03-01 19:23:37', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2482', '192.168.1.104', '2018-03-01 19:23:40', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2483', '192.168.1.104', '2018-03-01 19:24:09', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2484', '192.168.1.104', '2018-03-01 19:24:26', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2485', '192.168.1.104', '2018-03-01 19:27:29', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2486', '192.168.1.104', '2018-03-01 19:28:15', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2487', '192.168.1.104', '2018-03-01 19:31:42', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('2488', '192.168.1.104', '2018-03-01 19:41:46', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2489', '192.168.1.104', '2018-03-01 19:41:47', '通知列表', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('2490', '192.168.1.104', '2018-03-01 19:51:13', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2491', '192.168.1.104', '2018-03-01 19:51:20', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2492', '192.168.3.105', '2018-12-14 15:36:31', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('2493', '192.168.3.105', '2018-12-14 15:39:41', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('2494', '192.168.3.105', '2018-12-14 15:39:59', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('2495', '192.168.3.105', '2018-12-14 15:40:00', '考勤周报表', '/attendceweek', '5');
INSERT INTO `user_log` VALUES ('2496', '192.168.3.105', '2018-12-14 15:40:02', '考勤月报表', '/attendcemonth', '5');
INSERT INTO `user_log` VALUES ('2497', '192.168.3.105', '2018-12-14 15:40:04', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('2498', '192.168.3.105', '2018-12-14 15:40:05', '考勤月报表', '/attendcemonth', '5');
INSERT INTO `user_log` VALUES ('2499', '192.168.3.105', '2018-12-14 15:40:23', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('2500', '192.168.3.105', '2018-12-14 15:40:37', '通知管理', '/infrommanage', '5');
INSERT INTO `user_log` VALUES ('2501', '192.168.3.105', '2018-12-14 15:40:39', '通知列表', '/infromlist', '5');
INSERT INTO `user_log` VALUES ('2502', '192.168.3.105', '2018-12-14 15:40:55', '任务管理', '/taskmanage', '5');
INSERT INTO `user_log` VALUES ('2503', '192.168.3.105', '2018-12-14 15:40:59', '我的任务', '/mytask', '5');
INSERT INTO `user_log` VALUES ('2504', '192.168.3.105', '2018-12-14 15:41:03', '日程管理', '/daymanage', '5');
INSERT INTO `user_log` VALUES ('2505', '192.168.3.105', '2018-12-14 15:41:04', '我的日历', '/daycalendar', '5');
INSERT INTO `user_log` VALUES ('2506', '192.168.3.105', '2018-12-14 15:41:17', '计划管理', '/planview', '5');
INSERT INTO `user_log` VALUES ('2507', '192.168.3.105', '2018-12-14 15:41:37', '文件管理', '/filemanage', '5');
INSERT INTO `user_log` VALUES ('2508', '192.168.3.105', '2018-12-14 15:41:40', '文件管理', '/filemanage', '5');
INSERT INTO `user_log` VALUES ('2509', '192.168.3.105', '2018-12-14 15:42:02', '笔记管理', '/noteview', '5');
INSERT INTO `user_log` VALUES ('2510', '192.168.3.105', '2018-12-14 15:42:22', '通讯录', '/addrmanage', '5');
INSERT INTO `user_log` VALUES ('2511', '192.168.3.105', '2018-12-14 15:42:42', '我的管理', '/chatmanage', '5');
INSERT INTO `user_log` VALUES ('2512', '192.168.80.1', '2019-12-31 15:53:52', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2513', '192.168.80.1', '2019-12-31 15:53:58', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2514', '192.168.80.1', '2019-12-31 15:54:02', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2515', '192.168.80.1', '2019-12-31 15:54:07', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2516', '192.168.80.1', '2019-12-31 15:54:11', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2517', '192.168.80.1', '2019-12-31 15:54:12', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2518', '192.168.80.1', '2019-12-31 15:54:13', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2519', '192.168.80.1', '2019-12-31 15:54:13', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2520', '192.168.80.1', '2019-12-31 15:54:16', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2521', '192.168.80.1', '2019-12-31 15:54:24', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2522', '192.168.80.1', '2019-12-31 15:54:27', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2523', '192.168.80.1', '2019-12-31 15:54:27', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2524', '192.168.80.1', '2019-12-31 15:54:30', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2525', '192.168.80.1', '2019-12-31 15:54:31', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2526', '192.168.80.1', '2019-12-31 15:54:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('2527', '192.168.80.1', '2019-12-31 15:54:33', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2528', '192.168.80.1', '2019-12-31 15:54:34', '通知管理', '/infrommanage', '1');
INSERT INTO `user_log` VALUES ('2529', '192.168.80.1', '2019-12-31 15:54:36', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2530', '192.168.80.1', '2019-12-31 15:54:39', '任务管理', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('2531', '192.168.80.1', '2019-12-31 15:54:41', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2532', '192.168.80.1', '2019-12-31 15:54:45', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2533', '192.168.80.1', '2019-12-31 15:54:48', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2534', '192.168.80.1', '2019-12-31 15:54:55', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2535', '192.168.80.1', '2019-12-31 15:54:55', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2536', '192.168.80.1', '2019-12-31 16:17:29', '超级管理员', '/adminmanage', '1');
INSERT INTO `user_log` VALUES ('2537', '192.168.80.1', '2019-12-31 16:17:30', '我的管理', '/chatmanage', '1');
INSERT INTO `user_log` VALUES ('2538', '192.168.80.1', '2019-12-31 16:17:30', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2539', '192.168.80.1', '2019-12-31 16:17:32', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2540', '192.168.80.1', '2019-12-31 16:17:35', '笔记管理', '/noteview', '1');
INSERT INTO `user_log` VALUES ('2541', '192.168.80.1', '2019-12-31 16:17:38', '文件管理', '/filemanage', '1');
INSERT INTO `user_log` VALUES ('2542', '192.168.80.1', '2019-12-31 16:17:41', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2543', '192.168.80.1', '2019-12-31 16:20:17', '计划管理', '/planview', '1');
INSERT INTO `user_log` VALUES ('2544', '192.168.80.1', '2019-12-31 16:20:17', '计划报表', '/myplan', '1');
INSERT INTO `user_log` VALUES ('2545', '192.168.80.1', '2019-12-31 16:20:20', '日程管理', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('2546', '192.168.80.1', '2019-12-31 16:20:23', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2547', '192.168.80.1', '2019-12-31 16:29:25', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2548', '192.168.80.1', '2019-12-31 16:29:26', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2549', '192.168.80.1', '2019-12-31 16:29:27', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2550', '192.168.80.1', '2019-12-31 16:29:28', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2551', '192.168.80.1', '2019-12-31 16:29:33', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2552', '192.168.80.1', '2019-12-31 16:29:34', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2553', '192.168.80.1', '2019-12-31 16:29:35', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2554', '192.168.80.1', '2019-12-31 16:29:36', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2555', '192.168.80.1', '2019-12-31 17:08:20', '部门管理', '/deptmanage', '2');
INSERT INTO `user_log` VALUES ('2556', '192.168.80.1', '2020-01-01 22:07:50', '流程审核', '/audit', '2');
INSERT INTO `user_log` VALUES ('2557', '192.168.80.1', '2020-01-01 22:09:17', '讨论区列表', '/chatlist', '2');
INSERT INTO `user_log` VALUES ('2558', '192.168.80.1', '2020-01-01 22:12:27', '通讯录', '/addrmanage', '2');
INSERT INTO `user_log` VALUES ('2559', '192.168.80.1', '2020-01-03 17:06:44', '部门管理', '/deptmanage', '2');
INSERT INTO `user_log` VALUES ('2560', '192.168.80.1', '2020-01-03 23:02:59', '部门管理', '/deptmanage', '2');
INSERT INTO `user_log` VALUES ('2561', '192.168.80.1', '2020-01-03 23:03:03', '职位管理', '/positionmanage', '2');
INSERT INTO `user_log` VALUES ('2562', '172.20.10.5', '2020-02-11 23:29:22', '流程审核', '/audit', '2');
INSERT INTO `user_log` VALUES ('2563', '172.20.10.5', '2020-02-11 23:32:32', '角色列表', '/rolemanage', '2');
INSERT INTO `user_log` VALUES ('2564', '172.20.10.5', '2020-02-12 16:31:48', '流程审核', '/audit', '2');
INSERT INTO `user_log` VALUES ('2565', '172.20.10.5', '2020-02-12 16:32:00', '通知管理', '/infrommanage', '2');
INSERT INTO `user_log` VALUES ('2566', '172.20.10.5', '2020-02-12 16:32:02', '通知列表', '/infromlist', '2');
INSERT INTO `user_log` VALUES ('2567', '172.20.10.5', '2020-02-12 16:32:04', '账号管理', '/accountmanage', '2');
INSERT INTO `user_log` VALUES ('2568', '172.20.10.5', '2020-02-12 16:32:08', '邮件管理', '/mail', '2');
INSERT INTO `user_log` VALUES ('2569', '172.20.10.5', '2020-02-12 16:32:26', '任务管理', '/taskmanage', '2');
INSERT INTO `user_log` VALUES ('2570', '172.20.10.5', '2020-02-12 16:32:27', '我的任务', '/mytask', '2');
INSERT INTO `user_log` VALUES ('2571', '172.20.10.5', '2020-02-12 16:32:35', '我的任务', '/mytask', '2');
INSERT INTO `user_log` VALUES ('2572', '172.20.10.5', '2020-02-12 16:33:14', '我的日历', '/daycalendar', '2');
INSERT INTO `user_log` VALUES ('2573', '172.20.10.5', '2020-02-12 16:33:23', '我的日历', '/daycalendar', '2');
INSERT INTO `user_log` VALUES ('2574', '172.20.10.5', '2020-02-12 16:33:27', '计划管理', '/planview', '2');
INSERT INTO `user_log` VALUES ('2575', '172.20.10.5', '2020-02-12 16:33:35', '文件管理', '/filemanage', '2');
INSERT INTO `user_log` VALUES ('2576', '172.20.10.5', '2020-02-12 16:33:44', '超级管理员', '/adminmanage', '2');
INSERT INTO `user_log` VALUES ('2577', '172.20.10.5', '2020-02-12 16:34:15', '我的任务', '/mytask', '2');
INSERT INTO `user_log` VALUES ('2578', '172.20.10.5', '2020-02-12 16:34:17', '邮件管理', '/mail', '2');
INSERT INTO `user_log` VALUES ('2579', '172.20.10.5', '2020-02-12 16:34:19', '通知列表', '/infromlist', '2');
INSERT INTO `user_log` VALUES ('2580', '172.20.10.5', '2020-02-12 16:34:20', '通知列表', '/infromlist', '2');
INSERT INTO `user_log` VALUES ('2581', '172.20.10.5', '2020-02-12 16:34:23', '邮件管理', '/mail', '2');
INSERT INTO `user_log` VALUES ('2582', '172.20.10.5', '2020-02-12 16:34:24', '我的任务', '/mytask', '2');
INSERT INTO `user_log` VALUES ('2583', '172.20.10.5', '2020-02-12 16:34:47', '文件管理', '/filemanage', '2');
INSERT INTO `user_log` VALUES ('2584', '172.20.10.5', '2020-02-12 16:34:56', '考勤列表', '/attendcelist', '2');
INSERT INTO `user_log` VALUES ('2585', '172.20.10.5', '2020-02-12 16:35:06', '考勤列表', '/attendcelist', '2');
INSERT INTO `user_log` VALUES ('2586', '172.20.10.5', '2020-02-12 16:35:18', '考勤列表', '/attendcelist', '2');
INSERT INTO `user_log` VALUES ('2587', '172.20.10.5', '2020-02-12 16:50:54', '通讯录', '/addrmanage', '2');
INSERT INTO `user_log` VALUES ('2588', '172.20.10.5', '2020-02-12 16:51:05', '讨论区列表', '/chatlist', '2');
INSERT INTO `user_log` VALUES ('2589', '172.20.10.5', '2020-02-13 13:43:38', '部门管理', '/deptmanage', '2');
INSERT INTO `user_log` VALUES ('2590', '172.20.10.5', '2020-02-13 13:44:01', '部门管理', '/deptmanage', '2');
INSERT INTO `user_log` VALUES ('2591', '172.20.10.5', '2020-02-13 13:44:05', '职位管理', '/positionmanage', '2');
INSERT INTO `user_log` VALUES ('2592', '172.20.10.5', '2020-02-13 13:44:43', '职位管理', '/positionmanage', '2');
INSERT INTO `user_log` VALUES ('2593', '172.20.10.5', '2020-02-13 13:50:35', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2594', '172.20.10.5', '2020-02-13 13:50:48', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2595', '172.20.10.5', '2020-02-13 13:51:05', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2596', '172.20.10.5', '2020-02-13 13:52:39', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2597', '172.20.10.5', '2020-02-13 13:52:54', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2598', '172.20.10.5', '2020-02-13 13:53:20', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2599', '172.20.10.5', '2020-02-13 13:56:05', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2600', '172.20.10.5', '2020-02-13 13:56:09', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2601', '172.20.10.5', '2020-02-13 13:56:55', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2602', '172.20.10.5', '2020-02-13 13:57:05', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2603', '172.20.10.5', '2020-02-13 13:58:12', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2604', '172.20.10.5', '2020-02-13 13:58:14', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2605', '172.20.10.5', '2020-02-13 13:58:16', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2606', '172.20.10.5', '2020-02-13 13:58:22', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2607', '172.20.10.5', '2020-02-13 13:58:24', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2608', '172.20.10.5', '2020-02-13 13:58:26', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2609', '172.20.10.5', '2020-02-13 13:59:40', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2610', '172.20.10.5', '2020-02-13 13:59:58', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2611', '172.20.10.5', '2020-02-13 14:01:17', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2612', '172.20.10.5', '2020-02-13 14:01:17', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2613', '172.20.10.5', '2020-02-13 14:01:31', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2614', '172.20.10.5', '2020-02-13 14:01:32', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2615', '172.20.10.5', '2020-02-13 14:02:44', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2616', '172.20.10.5', '2020-02-13 14:02:45', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2617', '172.20.10.5', '2020-02-13 14:03:02', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2618', '172.20.10.5', '2020-02-13 14:03:03', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2619', '172.20.10.5', '2020-02-13 14:03:04', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2620', '172.20.10.5', '2020-02-13 14:03:07', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2621', '172.20.10.5', '2020-02-13 14:06:41', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2622', '172.20.10.5', '2020-02-13 14:07:22', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2623', '172.20.10.5', '2020-02-13 14:09:51', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2624', '172.20.10.5', '2020-02-13 14:10:26', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2625', '172.20.10.5', '2020-02-13 14:10:37', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2626', '172.20.10.5', '2020-02-13 14:10:39', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2627', '172.20.10.5', '2020-02-13 14:10:43', '考勤列表', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('2628', '172.20.10.5', '2020-02-13 14:10:54', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('2629', '172.20.10.5', '2020-02-13 14:10:59', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('2630', '172.20.10.5', '2020-02-13 14:11:00', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('2631', '172.20.10.5', '2020-02-13 14:11:02', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2632', '172.20.10.5', '2020-02-13 14:11:20', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('2633', '172.20.10.5', '2020-02-13 14:11:22', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2634', '172.20.10.5', '2020-02-13 14:13:32', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2635', '172.20.10.5', '2020-02-13 14:13:33', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2636', '172.20.10.5', '2020-02-13 14:14:55', '用户管理', '/usermanage', '3');
INSERT INTO `user_log` VALUES ('2637', '172.20.10.5', '2020-02-13 14:18:39', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2638', '172.20.10.5', '2020-02-13 14:18:41', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2639', '172.20.10.5', '2020-02-13 14:18:46', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2640', '172.20.10.5', '2020-02-13 14:18:53', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2641', '172.20.10.5', '2020-02-13 14:18:55', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2642', '172.20.10.5', '2020-02-13 14:18:55', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2643', '172.20.10.5', '2020-02-13 14:18:56', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2644', '172.20.10.5', '2020-02-13 14:18:58', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2645', '172.20.10.5', '2020-02-13 14:19:00', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2646', '172.20.10.5', '2020-02-13 14:19:01', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2647', '172.20.10.5', '2020-02-13 14:19:01', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2648', '172.20.10.5', '2020-02-13 14:19:03', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2649', '172.20.10.5', '2020-02-13 14:19:06', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('2650', '172.20.10.5', '2020-02-13 14:19:07', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('2651', '172.20.10.5', '2020-02-13 14:19:07', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('2652', '172.20.10.5', '2020-02-13 14:19:09', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2653', '172.20.10.5', '2020-02-13 14:24:50', '讨论区列表', '/chatlist', '1');
INSERT INTO `user_log` VALUES ('2654', '172.20.10.5', '2020-02-13 14:26:15', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('2655', '172.20.10.5', '2020-02-13 14:33:51', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2656', '172.20.10.5', '2020-02-13 14:34:49', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2657', '172.20.10.5', '2020-02-13 14:34:49', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2658', '172.20.10.5', '2020-02-13 14:41:22', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2659', '172.20.10.5', '2020-02-13 14:43:36', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2660', '172.20.10.5', '2020-02-13 14:43:51', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2661', '172.20.10.5', '2020-02-13 14:43:52', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2662', '172.20.10.5', '2020-02-13 14:44:03', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2663', '172.20.10.5', '2020-02-13 14:44:05', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2664', '172.20.10.5', '2020-02-13 14:45:07', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2665', '172.20.10.5', '2020-02-13 14:45:32', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2666', '172.20.10.5', '2020-02-13 14:45:47', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2667', '172.20.10.5', '2020-02-13 14:46:37', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2668', '172.20.10.5', '2020-02-13 14:46:55', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2669', '172.20.10.5', '2020-02-13 14:46:55', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2670', '172.20.10.5', '2020-02-13 14:48:05', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2671', '172.20.10.5', '2020-02-13 14:48:45', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2672', '172.20.10.5', '2020-02-13 14:49:11', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2673', '172.20.10.5', '2020-02-13 14:49:29', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2674', '172.20.10.5', '2020-02-13 14:49:30', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2675', '172.20.10.5', '2020-02-13 14:49:41', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2676', '172.20.10.5', '2020-02-13 14:50:37', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2677', '172.20.10.5', '2020-02-13 14:50:38', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2678', '172.20.10.5', '2020-02-13 14:51:34', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2679', '172.20.10.5', '2020-02-13 14:53:03', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2680', '172.20.10.5', '2020-02-13 14:53:05', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2681', '172.20.10.5', '2020-02-13 14:53:28', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2682', '172.20.10.5', '2020-02-13 14:53:52', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2683', '172.20.10.5', '2020-02-13 14:53:52', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2684', '172.20.10.5', '2020-02-13 14:55:14', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2685', '172.20.10.5', '2020-02-13 14:55:15', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2686', '172.20.10.5', '2020-02-13 14:56:24', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2687', '172.20.10.5', '2020-02-13 14:56:54', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2688', '172.20.10.5', '2020-02-13 14:59:48', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2689', '172.20.10.5', '2020-02-13 15:00:31', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2690', '172.20.10.5', '2020-02-13 15:01:22', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2691', '172.20.10.5', '2020-02-13 15:01:37', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2692', '172.20.10.5', '2020-02-13 15:02:20', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2693', '172.20.10.5', '2020-02-13 15:03:29', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2694', '172.20.10.5', '2020-02-13 15:03:29', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2695', '172.20.10.5', '2020-02-13 15:03:32', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2696', '172.20.10.5', '2020-02-13 15:03:34', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2697', '172.20.10.5', '2020-02-13 15:03:34', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2698', '172.20.10.5', '2020-02-13 15:03:36', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2699', '172.20.10.5', '2020-02-13 15:03:38', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2700', '172.20.10.5', '2020-02-13 15:03:38', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2701', '172.20.10.5', '2020-02-13 15:03:39', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2702', '172.20.10.5', '2020-02-13 15:03:39', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2703', '172.20.10.5', '2020-02-13 15:03:40', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2704', '172.20.10.5', '2020-02-13 15:03:40', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2705', '172.20.10.5', '2020-02-13 15:03:48', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2706', '172.20.10.5', '2020-02-13 15:04:12', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2707', '172.20.10.5', '2020-02-13 15:04:43', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2708', '172.20.10.5', '2020-02-13 15:05:56', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2709', '172.20.10.5', '2020-02-13 15:06:26', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2710', '172.20.10.5', '2020-02-13 15:08:21', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2711', '172.20.10.5', '2020-02-13 15:08:23', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2712', '172.20.10.5', '2020-02-13 15:08:28', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2713', '172.20.10.5', '2020-02-13 15:08:28', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2714', '172.20.10.5', '2020-02-13 15:08:29', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2715', '172.20.10.5', '2020-02-13 15:08:29', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2716', '172.20.10.5', '2020-02-13 15:08:29', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2717', '172.20.10.5', '2020-02-13 15:08:31', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2718', '172.20.10.5', '2020-02-13 15:08:35', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2719', '172.20.10.5', '2020-02-13 15:08:36', '我的申请', '/flowmanage', '3');
INSERT INTO `user_log` VALUES ('2720', '172.20.10.5', '2020-02-13 15:08:39', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2721', '172.20.10.5', '2020-02-13 15:08:41', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2722', '172.20.10.5', '2020-02-13 15:08:42', '我的申请', '/flowmanage', '3');
INSERT INTO `user_log` VALUES ('2723', '172.20.10.5', '2020-02-13 15:08:42', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2724', '172.20.10.5', '2020-02-13 15:09:46', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2725', '172.20.10.5', '2020-02-13 15:09:51', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2726', '172.20.10.5', '2020-02-13 15:10:01', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2727', '172.20.10.5', '2020-02-13 15:10:25', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2728', '172.20.10.5', '2020-02-13 15:10:28', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2729', '172.20.10.5', '2020-02-13 15:10:29', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2730', '172.20.10.5', '2020-02-13 15:10:32', '我的申请', '/flowmanage', '3');
INSERT INTO `user_log` VALUES ('2731', '172.20.10.5', '2020-02-13 15:10:34', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2732', '172.20.10.5', '2020-02-13 15:10:51', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2733', '172.20.10.5', '2020-02-13 15:10:56', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2734', '172.20.10.5', '2020-02-13 15:11:02', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2735', '172.20.10.5', '2020-02-13 15:11:14', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('2736', '172.20.10.5', '2020-02-13 15:11:30', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2737', '172.20.10.5', '2020-02-13 15:13:27', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2738', '172.20.10.5', '2020-02-13 15:22:45', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2739', '172.20.10.5', '2020-02-13 15:23:34', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2740', '172.20.10.5', '2020-02-13 15:24:14', '通知列表', '/infromlist', '14');
INSERT INTO `user_log` VALUES ('2741', '172.20.10.5', '2020-02-13 15:24:16', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2742', '172.20.10.5', '2020-02-13 15:25:56', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2743', '172.20.10.5', '2020-02-13 15:26:17', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2744', '172.20.10.5', '2020-02-13 15:26:40', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2745', '172.20.10.5', '2020-02-13 15:26:42', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2746', '172.20.10.5', '2020-02-13 15:26:43', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2747', '172.20.10.5', '2020-02-13 15:26:45', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2748', '172.20.10.5', '2020-02-13 15:26:45', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2749', '172.20.10.5', '2020-02-13 15:26:46', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2750', '172.20.10.5', '2020-02-13 15:26:46', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2751', '172.20.10.5', '2020-02-13 15:26:47', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2752', '172.20.10.5', '2020-02-13 15:26:48', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2753', '172.20.10.5', '2020-02-13 15:26:48', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2754', '172.20.10.5', '2020-02-13 15:27:06', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2755', '172.20.10.5', '2020-02-13 15:28:00', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2756', '172.20.10.5', '2020-02-13 15:28:04', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('2757', '172.20.10.5', '2020-02-13 15:29:11', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2758', '172.20.10.5', '2020-02-13 15:30:40', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2759', '172.20.10.5', '2020-02-13 15:30:41', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('2760', '172.20.10.5', '2020-02-13 15:30:47', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2761', '172.20.10.5', '2020-02-13 15:31:00', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2762', '172.20.10.5', '2020-02-13 15:31:35', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2763', '172.20.10.5', '2020-02-13 15:31:52', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2764', '172.20.10.5', '2020-02-13 15:32:03', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2765', '172.20.10.5', '2020-02-13 15:32:23', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2766', '172.20.10.5', '2020-02-13 15:33:33', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2767', '172.20.10.5', '2020-02-13 15:33:36', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2768', '172.20.10.5', '2020-02-13 15:33:36', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2769', '172.20.10.5', '2020-02-13 15:33:37', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2770', '172.20.10.5', '2020-02-13 15:33:37', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2771', '172.20.10.5', '2020-02-13 15:34:05', '我的申请', '/flowmanage', '3');
INSERT INTO `user_log` VALUES ('2772', '172.20.10.5', '2020-02-13 15:34:05', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2773', '172.20.10.5', '2020-02-13 15:35:00', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2774', '172.20.10.5', '2020-02-13 15:35:19', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2775', '172.20.10.5', '2020-02-13 15:35:49', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2776', '172.20.10.5', '2020-02-13 15:36:08', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2777', '172.20.10.5', '2020-02-13 15:45:37', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2778', '172.20.10.5', '2020-02-13 15:46:27', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2779', '172.20.10.5', '2020-02-13 15:47:37', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2780', '172.20.10.5', '2020-02-13 15:48:12', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2781', '172.20.10.5', '2020-02-13 15:48:20', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('2782', '172.20.10.5', '2020-02-13 15:48:46', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2783', '172.20.10.5', '2020-02-13 15:49:54', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('2784', '172.20.10.5', '2020-02-13 15:50:10', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2785', '172.20.10.5', '2020-02-13 15:50:23', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2786', '172.20.10.5', '2020-02-13 15:50:38', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2787', '172.20.10.5', '2020-02-13 15:50:49', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2788', '172.20.10.5', '2020-02-13 15:51:22', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2789', '172.20.10.5', '2020-02-13 15:51:48', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2790', '172.20.10.5', '2020-02-13 15:51:58', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2791', '172.20.10.5', '2020-02-13 15:52:19', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2792', '172.20.10.5', '2020-02-13 15:53:15', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2793', '172.20.10.5', '2020-02-13 15:53:35', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2794', '172.20.10.5', '2020-02-13 15:53:58', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2795', '172.20.10.5', '2020-02-13 15:54:53', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2796', '172.20.10.5', '2020-02-13 15:55:54', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2797', '172.20.10.5', '2020-02-13 15:56:53', '我的申请', '/flowmanage', '14');
INSERT INTO `user_log` VALUES ('2798', '172.20.10.5', '2020-02-13 15:58:11', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2799', '172.20.10.5', '2020-02-13 15:59:18', '流程审核', '/audit', '6');
INSERT INTO `user_log` VALUES ('2800', '172.20.10.5', '2020-02-13 15:59:56', '流程审核', '/audit', '6');
INSERT INTO `user_log` VALUES ('2801', '172.20.10.5', '2020-02-13 16:00:12', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2802', '172.20.10.5', '2020-02-13 16:00:55', '流程审核', '/audit', '5');
INSERT INTO `user_log` VALUES ('2803', '172.20.10.5', '2020-02-13 16:01:10', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2804', '172.20.10.5', '2020-02-13 16:01:45', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2805', '172.20.10.5', '2020-02-13 16:03:13', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2806', '172.20.10.5', '2020-02-13 16:03:32', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2807', '172.20.10.5', '2020-02-13 16:03:57', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2808', '172.20.10.5', '2020-02-13 16:03:58', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2809', '172.20.10.5', '2020-02-13 16:03:58', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2810', '172.20.10.5', '2020-02-13 16:03:59', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2811', '172.20.10.5', '2020-02-13 16:04:07', '我的申请', '/flowmanage', '18');
INSERT INTO `user_log` VALUES ('2812', '172.20.10.5', '2020-02-13 16:04:26', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2813', '172.20.10.5', '2020-02-13 16:04:42', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('2814', '172.20.10.5', '2020-02-13 16:05:43', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2815', '172.20.10.5', '2020-02-13 16:05:47', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2816', '172.20.10.5', '2020-02-13 16:05:49', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2817', '172.20.10.5', '2020-02-13 16:05:54', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2818', '172.20.10.5', '2020-02-13 16:06:12', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2819', '172.20.10.5', '2020-02-13 16:06:18', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2820', '172.20.10.5', '2020-02-13 16:06:21', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2821', '172.20.10.5', '2020-02-13 16:06:22', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2822', '172.20.10.5', '2020-02-13 16:06:29', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2823', '172.20.10.5', '2020-02-13 16:06:36', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2824', '172.20.10.5', '2020-02-13 16:06:39', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2825', '172.20.10.5', '2020-02-13 16:06:45', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2826', '172.20.10.5', '2020-02-13 16:07:05', '邮件管理', '/mail', '18');
INSERT INTO `user_log` VALUES ('2827', '172.20.10.5', '2020-02-13 16:07:18', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2828', '172.20.10.5', '2020-02-13 16:07:20', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2829', '172.20.10.5', '2020-02-13 16:07:20', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2830', '172.20.10.5', '2020-02-13 16:07:23', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2831', '172.20.10.5', '2020-02-13 16:07:23', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2832', '172.20.10.5', '2020-02-13 16:07:23', '通知列表', '/infromlist', '18');
INSERT INTO `user_log` VALUES ('2833', '172.20.10.5', '2020-02-13 16:07:27', '账号管理', '/accountmanage', '18');
INSERT INTO `user_log` VALUES ('2834', '172.20.10.5', '2020-02-13 16:07:29', '邮件管理', '/mail', '18');
INSERT INTO `user_log` VALUES ('2835', '172.20.10.5', '2020-02-13 16:07:30', '账号管理', '/accountmanage', '18');
INSERT INTO `user_log` VALUES ('2836', '172.20.10.5', '2020-02-13 16:07:31', '邮件管理', '/mail', '18');
INSERT INTO `user_log` VALUES ('2837', '172.20.10.5', '2020-02-13 16:07:33', '我的任务', '/mytask', '18');
INSERT INTO `user_log` VALUES ('2838', '172.20.10.5', '2020-02-13 16:07:58', '邮件管理', '/mail', '8');
INSERT INTO `user_log` VALUES ('2839', '172.20.10.5', '2020-02-13 16:08:07', '通知列表', '/infromlist', '8');
INSERT INTO `user_log` VALUES ('2840', '172.20.10.5', '2020-02-13 16:08:17', '邮件管理', '/mail', '8');
INSERT INTO `user_log` VALUES ('2841', '172.20.10.5', '2020-02-13 16:08:19', '笔记管理', '/noteview', '8');
INSERT INTO `user_log` VALUES ('2842', '172.20.10.5', '2020-02-13 16:08:29', '讨论区列表', '/chatlist', '8');
INSERT INTO `user_log` VALUES ('2843', '172.20.10.5', '2020-02-13 16:08:32', '我的管理', '/chatmanage', '8');
INSERT INTO `user_log` VALUES ('2844', '172.20.10.5', '2020-02-13 16:08:36', '通讯录', '/addrmanage', '8');
INSERT INTO `user_log` VALUES ('2845', '172.20.10.5', '2020-02-13 16:08:39', '笔记管理', '/noteview', '8');
INSERT INTO `user_log` VALUES ('2846', '172.20.10.5', '2020-02-13 16:08:41', '文件管理', '/filemanage', '8');
INSERT INTO `user_log` VALUES ('2847', '172.20.10.5', '2020-02-13 16:08:44', '计划管理', '/planview', '8');
INSERT INTO `user_log` VALUES ('2848', '172.20.10.5', '2020-02-13 16:08:45', '计划报表', '/myplan', '8');
INSERT INTO `user_log` VALUES ('2849', '172.20.10.5', '2020-02-13 16:08:48', '我的日历', '/daycalendar', '8');
INSERT INTO `user_log` VALUES ('2850', '172.20.10.5', '2020-02-13 16:09:07', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2851', '172.20.10.5', '2020-02-13 16:09:11', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2852', '172.20.10.5', '2020-02-13 16:09:14', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2853', '172.20.10.5', '2020-02-13 16:09:15', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2854', '172.20.10.5', '2020-02-13 16:09:23', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2855', '172.20.10.5', '2020-02-13 16:09:36', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2856', '172.20.10.5', '2020-02-13 16:09:38', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2857', '172.20.10.5', '2020-02-13 16:09:39', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2858', '172.20.10.5', '2020-02-13 16:09:48', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2859', '172.20.10.5', '2020-02-13 16:09:52', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2860', '172.20.10.5', '2020-02-13 16:09:56', '账号管理', '/accountmanage', '7');
INSERT INTO `user_log` VALUES ('2861', '172.20.10.5', '2020-02-13 16:10:06', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2862', '172.20.10.5', '2020-02-13 16:11:00', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2863', '172.20.10.5', '2020-02-13 16:11:12', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2864', '172.20.10.5', '2020-02-13 16:11:14', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2865', '172.20.10.5', '2020-02-13 16:11:15', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2866', '172.20.10.5', '2020-02-13 16:11:40', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2867', '172.20.10.5', '2020-02-13 16:11:44', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2868', '172.20.10.5', '2020-02-13 16:11:46', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2869', '172.20.10.5', '2020-02-13 16:11:49', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2870', '172.20.10.5', '2020-02-13 16:12:16', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2871', '172.20.10.5', '2020-02-13 16:12:20', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2872', '172.20.10.5', '2020-02-13 16:12:23', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2873', '172.20.10.5', '2020-02-13 16:12:26', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2874', '172.20.10.5', '2020-02-13 16:12:41', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2875', '172.20.10.5', '2020-02-13 16:13:09', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2876', '172.20.10.5', '2020-02-13 16:13:10', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2877', '172.20.10.5', '2020-02-13 16:13:18', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2878', '172.20.10.5', '2020-02-13 16:13:18', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2879', '172.20.10.5', '2020-02-13 16:13:21', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2880', '172.20.10.5', '2020-02-13 16:13:24', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2881', '172.20.10.5', '2020-02-13 16:13:25', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2882', '172.20.10.5', '2020-02-13 16:13:26', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2883', '172.20.10.5', '2020-02-13 16:13:29', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2884', '172.20.10.5', '2020-02-13 16:13:35', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2885', '172.20.10.5', '2020-02-13 16:14:12', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2886', '172.20.10.5', '2020-02-13 16:14:13', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2887', '172.20.10.5', '2020-02-13 16:14:17', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2888', '172.20.10.5', '2020-02-13 16:14:45', '笔记管理', '/noteview', '7');
INSERT INTO `user_log` VALUES ('2889', '172.20.10.5', '2020-02-13 16:15:03', '笔记管理', '/noteview', '7');
INSERT INTO `user_log` VALUES ('2890', '172.20.10.5', '2020-02-13 16:15:06', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2891', '172.20.10.5', '2020-02-13 16:15:14', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2892', '172.20.10.5', '2020-02-13 16:15:18', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2893', '172.20.10.5', '2020-02-13 16:16:08', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2894', '172.20.10.5', '2020-02-13 16:16:10', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2895', '172.20.10.5', '2020-02-13 16:16:10', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2896', '172.20.10.5', '2020-02-13 16:16:11', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2897', '172.20.10.5', '2020-02-13 16:16:12', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2898', '172.20.10.5', '2020-02-13 16:16:19', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2899', '172.20.10.5', '2020-02-13 16:16:40', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2900', '172.20.10.5', '2020-02-13 16:16:43', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2901', '172.20.10.5', '2020-02-13 16:16:46', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2902', '172.20.10.5', '2020-02-13 16:16:47', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2903', '172.20.10.5', '2020-02-13 16:16:48', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2904', '172.20.10.5', '2020-02-13 16:16:50', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2905', '172.20.10.5', '2020-02-13 16:23:56', '通知列表', '/infromlist', '9');
INSERT INTO `user_log` VALUES ('2906', '172.20.10.5', '2020-02-13 16:24:27', '账号管理', '/accountmanage', '9');
INSERT INTO `user_log` VALUES ('2907', '172.20.10.5', '2020-02-13 16:24:32', '邮件管理', '/mail', '9');
INSERT INTO `user_log` VALUES ('2908', '172.20.10.5', '2020-02-13 16:24:54', '我的任务', '/mytask', '9');
INSERT INTO `user_log` VALUES ('2909', '172.20.10.5', '2020-02-13 16:25:07', '我的任务', '/mytask', '9');
INSERT INTO `user_log` VALUES ('2910', '172.20.10.5', '2020-02-13 16:25:47', '我的任务', '/mytask', '9');
INSERT INTO `user_log` VALUES ('2911', '172.20.10.5', '2020-02-13 16:25:52', '我的任务', '/mytask', '9');
INSERT INTO `user_log` VALUES ('2912', '172.20.10.5', '2020-02-13 16:25:58', '我的任务', '/mytask', '9');
INSERT INTO `user_log` VALUES ('2913', '172.20.10.5', '2020-02-13 16:26:11', '邮件管理', '/mail', '9');
INSERT INTO `user_log` VALUES ('2914', '172.20.10.5', '2020-02-13 16:26:41', '邮件管理', '/mail', '9');
INSERT INTO `user_log` VALUES ('2915', '172.20.10.5', '2020-02-13 16:26:46', '我的日历', '/daycalendar', '9');
INSERT INTO `user_log` VALUES ('2916', '172.20.10.5', '2020-02-13 16:27:12', '计划管理', '/planview', '9');
INSERT INTO `user_log` VALUES ('2917', '172.20.10.5', '2020-02-13 16:27:14', '计划报表', '/myplan', '9');
INSERT INTO `user_log` VALUES ('2918', '172.20.10.5', '2020-02-13 16:27:16', '计划管理', '/planview', '9');
INSERT INTO `user_log` VALUES ('2919', '172.20.10.5', '2020-02-13 16:27:39', '文件管理', '/filemanage', '9');
INSERT INTO `user_log` VALUES ('2920', '172.20.10.5', '2020-02-13 16:27:44', '文件管理', '/filemanage', '9');
INSERT INTO `user_log` VALUES ('2921', '172.20.10.5', '2020-02-13 16:27:51', '文件管理', '/filemanage', '9');
INSERT INTO `user_log` VALUES ('2922', '172.20.10.5', '2020-02-13 16:28:04', '笔记管理', '/noteview', '9');
INSERT INTO `user_log` VALUES ('2923', '172.20.10.5', '2020-02-13 16:28:38', '笔记管理', '/noteview', '9');
INSERT INTO `user_log` VALUES ('2924', '172.20.10.5', '2020-02-13 16:29:19', '笔记管理', '/noteview', '9');
INSERT INTO `user_log` VALUES ('2925', '172.20.10.5', '2020-02-13 16:30:45', '通讯录', '/addrmanage', '9');
INSERT INTO `user_log` VALUES ('2926', '172.20.10.5', '2020-02-13 16:30:59', '通讯录', '/addrmanage', '9');
INSERT INTO `user_log` VALUES ('2927', '172.20.10.5', '2020-02-13 16:31:07', '笔记管理', '/noteview', '9');
INSERT INTO `user_log` VALUES ('2928', '172.20.10.5', '2020-02-13 16:31:35', '笔记管理', '/noteview', '9');
INSERT INTO `user_log` VALUES ('2929', '172.20.10.5', '2020-02-13 16:31:44', '讨论区列表', '/chatlist', '9');
INSERT INTO `user_log` VALUES ('2930', '172.20.10.5', '2020-02-13 16:32:13', '通讯录', '/addrmanage', '9');
INSERT INTO `user_log` VALUES ('2931', '172.20.10.5', '2020-02-13 16:33:03', '讨论区列表', '/chatlist', '7');
INSERT INTO `user_log` VALUES ('2932', '172.20.10.5', '2020-02-13 16:33:04', '我的管理', '/chatmanage', '7');
INSERT INTO `user_log` VALUES ('2933', '172.20.10.5', '2020-02-13 16:33:10', '笔记管理', '/noteview', '7');
INSERT INTO `user_log` VALUES ('2934', '172.20.10.5', '2020-02-13 16:34:04', '文件管理', '/filemanage', '7');
INSERT INTO `user_log` VALUES ('2935', '172.20.10.5', '2020-02-13 16:34:06', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2936', '172.20.10.5', '2020-02-13 16:34:09', '计划报表', '/myplan', '7');
INSERT INTO `user_log` VALUES ('2937', '172.20.10.5', '2020-02-13 16:34:11', '计划管理', '/planview', '7');
INSERT INTO `user_log` VALUES ('2938', '172.20.10.5', '2020-02-13 16:34:17', '日程管理', '/daymanage', '7');
INSERT INTO `user_log` VALUES ('2939', '172.20.10.5', '2020-02-13 16:34:18', '我的日历', '/daycalendar', '7');
INSERT INTO `user_log` VALUES ('2940', '172.20.10.5', '2020-02-13 16:34:19', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2941', '172.20.10.5', '2020-02-13 16:34:21', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2942', '172.20.10.5', '2020-02-13 16:34:22', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2943', '172.20.10.5', '2020-02-13 16:34:37', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2944', '172.20.10.5', '2020-02-13 16:34:38', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2945', '172.20.10.5', '2020-02-13 16:34:40', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2946', '172.20.10.5', '2020-02-13 16:34:52', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2947', '172.20.10.5', '2020-02-13 16:34:58', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2948', '172.20.10.5', '2020-02-13 16:34:59', '我的任务', '/mytask', '7');
INSERT INTO `user_log` VALUES ('2949', '172.20.10.5', '2020-02-13 16:34:59', '任务管理', '/taskmanage', '7');
INSERT INTO `user_log` VALUES ('2950', '172.20.10.5', '2020-02-13 16:35:00', '账号管理', '/accountmanage', '7');
INSERT INTO `user_log` VALUES ('2951', '172.20.10.5', '2020-02-13 16:35:01', '邮件管理', '/mail', '7');
INSERT INTO `user_log` VALUES ('2952', '172.20.10.5', '2020-02-13 16:35:13', '通知管理', '/infrommanage', '7');
INSERT INTO `user_log` VALUES ('2953', '172.20.10.5', '2020-02-13 16:35:15', '通知列表', '/infromlist', '7');
INSERT INTO `user_log` VALUES ('2954', '172.20.10.5', '2020-02-13 16:35:21', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2955', '172.20.10.5', '2020-02-13 16:35:22', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2956', '172.20.10.5', '2020-02-13 16:35:23', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2957', '172.20.10.5', '2020-02-13 16:35:24', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2958', '172.20.10.5', '2020-02-13 16:35:25', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2959', '172.20.10.5', '2020-02-13 16:35:26', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2960', '172.20.10.5', '2020-02-13 16:35:27', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2961', '172.20.10.5', '2020-02-13 16:35:28', '考勤列表', '/attendcelist', '7');
INSERT INTO `user_log` VALUES ('2962', '172.20.10.5', '2020-02-13 16:35:38', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2963', '172.20.10.5', '2020-02-13 16:35:46', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2964', '172.20.10.5', '2020-02-13 16:36:27', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2965', '172.20.10.5', '2020-02-13 16:36:28', '考勤管理', '/attendceatt', '7');
INSERT INTO `user_log` VALUES ('2966', '172.20.10.5', '2020-02-13 16:36:30', '考勤月报表', '/attendcemonth', '7');
INSERT INTO `user_log` VALUES ('2967', '172.20.10.5', '2020-02-13 16:36:31', '考勤周报表', '/attendceweek', '7');
INSERT INTO `user_log` VALUES ('2968', '172.20.10.5', '2020-02-13 16:36:33', '在线用户', '/morelogrecord', '7');
INSERT INTO `user_log` VALUES ('2969', '172.20.10.5', '2020-02-13 16:36:33', '用户管理', '/usermanage', '7');
INSERT INTO `user_log` VALUES ('2970', '172.20.10.5', '2020-02-13 21:21:53', '用户管理', '/usermanage', '7');
INSERT INTO `user_log` VALUES ('2971', '172.20.10.5', '2020-02-13 21:21:57', '用户管理', '/usermanage', '7');
INSERT INTO `user_log` VALUES ('2972', '172.20.10.5', '2020-02-13 21:22:05', '在线用户', '/morelogrecord', '7');
INSERT INTO `user_log` VALUES ('2973', '172.20.10.5', '2020-02-13 21:22:05', '部门管理', '/deptmanage', '7');
INSERT INTO `user_log` VALUES ('2974', '172.20.10.5', '2020-02-13 21:22:29', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('2975', '172.20.10.5', '2020-02-13 23:16:50', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2976', '172.20.10.5', '2020-02-13 23:17:15', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2977', '172.20.10.5', '2020-02-13 23:17:25', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2978', '172.20.10.5', '2020-02-13 23:17:27', '邮件管理', '/mail', '1');
INSERT INTO `user_log` VALUES ('2979', '172.20.10.5', '2020-02-13 23:22:51', '账号管理', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('2980', '172.20.10.5', '2020-02-18 13:42:45', '通讯录', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('2981', '172.20.10.5', '2020-02-18 13:44:54', '新建流程', '/xinxeng', '9');
INSERT INTO `user_log` VALUES ('2982', '172.20.10.5', '2020-02-18 13:46:07', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2983', '172.20.10.5', '2020-02-18 13:46:08', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2984', '172.20.10.5', '2020-02-18 13:46:11', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2985', '172.20.10.5', '2020-02-18 14:36:48', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2986', '172.20.10.5', '2020-02-18 14:36:49', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2987', '172.20.10.5', '2020-02-18 14:36:52', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2988', '172.20.10.5', '2020-02-18 14:38:52', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2989', '172.20.10.5', '2020-02-18 14:38:52', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2990', '172.20.10.5', '2020-02-18 14:38:58', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2991', '172.20.10.5', '2020-02-18 14:38:59', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2992', '172.20.10.5', '2020-02-18 14:39:01', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('2993', '172.20.10.5', '2020-02-18 14:43:03', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('2994', '172.20.10.5', '2020-02-18 14:43:04', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2995', '172.20.10.5', '2020-02-18 14:43:04', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2996', '172.20.10.5', '2020-02-18 14:58:47', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2997', '172.20.10.5', '2020-02-18 14:58:52', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('2998', '172.20.10.5', '2020-02-18 14:58:53', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('2999', '172.20.10.5', '2020-02-18 14:58:54', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3000', '172.20.10.5', '2020-02-18 14:58:55', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3001', '172.20.10.5', '2020-02-18 14:58:57', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('3002', '172.20.10.5', '2020-02-18 14:58:58', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3003', '172.20.10.5', '2020-02-18 14:58:58', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('3004', '172.20.10.5', '2020-02-18 14:59:00', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3005', '172.20.10.5', '2020-02-18 14:59:01', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3006', '172.20.10.5', '2020-02-18 14:59:02', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3007', '172.20.10.5', '2020-02-18 14:59:13', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3008', '172.20.10.5', '2020-02-18 15:11:30', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3009', '172.20.10.5', '2020-02-18 15:21:38', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3010', '172.20.10.5', '2020-02-18 15:21:38', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3011', '172.20.10.5', '2020-02-18 15:21:41', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3012', '172.20.10.5', '2020-02-18 15:21:44', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3013', '172.20.10.5', '2020-02-18 15:26:38', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3014', '172.20.10.5', '2020-02-18 15:26:39', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3015', '172.20.10.5', '2020-02-18 15:26:40', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3016', '172.20.10.5', '2020-02-18 15:27:10', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3017', '172.20.10.5', '2020-02-18 15:27:11', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3018', '172.20.10.5', '2020-02-18 15:27:12', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3019', '172.20.10.5', '2020-02-18 15:27:13', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3020', '172.20.10.5', '2020-02-18 15:27:14', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3021', '172.20.10.5', '2020-02-18 15:28:17', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3022', '172.20.10.5', '2020-02-18 15:28:18', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3023', '172.20.10.5', '2020-02-18 15:28:18', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3024', '172.20.10.5', '2020-02-18 15:46:58', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3025', '172.20.10.5', '2020-02-18 15:50:11', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3026', '172.20.10.5', '2020-02-18 15:50:28', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3027', '172.20.10.5', '2020-02-18 18:59:06', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3028', '172.20.10.5', '2020-02-18 19:19:10', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('3029', '172.20.10.5', '2020-02-18 19:19:15', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3030', '172.20.10.5', '2020-02-18 19:19:16', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('3031', '172.20.10.5', '2020-02-18 19:19:17', '考勤月报表', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('3032', '172.20.10.5', '2020-02-18 19:19:29', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3033', '172.20.10.5', '2020-02-18 19:19:31', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('3034', '172.20.10.5', '2020-02-18 19:19:33', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3035', '172.20.10.5', '2020-02-18 22:04:03', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3036', '172.20.10.5', '2020-02-18 22:16:21', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3037', '172.20.10.5', '2020-02-18 22:18:37', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3038', '172.20.10.5', '2020-02-18 22:18:38', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3039', '172.20.10.5', '2020-02-18 22:18:39', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3040', '172.20.10.5', '2020-02-18 22:20:41', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3041', '172.20.10.5', '2020-02-18 22:33:41', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3042', '172.20.10.5', '2020-02-18 22:33:42', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3043', '172.20.10.5', '2020-02-18 22:33:44', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3044', '172.20.10.5', '2020-02-18 22:55:37', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3045', '172.20.10.5', '2020-02-18 22:55:59', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3046', '172.20.10.5', '2020-02-18 22:56:02', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3047', '172.20.10.5', '2020-02-18 22:56:03', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3048', '172.20.10.5', '2020-02-18 22:56:04', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3049', '172.20.10.5', '2020-02-18 22:57:33', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3050', '172.20.10.5', '2020-02-18 22:57:34', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3051', '172.20.10.5', '2020-02-18 22:57:45', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3052', '172.20.10.5', '2020-02-18 22:57:47', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3053', '172.20.10.5', '2020-02-18 22:57:47', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3054', '172.20.10.5', '2020-02-18 22:57:48', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3055', '172.20.10.5', '2020-02-18 22:57:50', '职位管理', '/positionmanage', '5');
INSERT INTO `user_log` VALUES ('3056', '172.20.10.5', '2020-02-18 22:57:51', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3057', '172.20.10.5', '2020-02-18 22:59:37', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3058', '172.20.10.5', '2020-02-18 22:59:51', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3059', '172.20.10.5', '2020-02-18 23:01:45', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3060', '172.20.10.5', '2020-02-18 23:02:06', '用户管理', '/usermanage', '5');
INSERT INTO `user_log` VALUES ('3061', '172.20.10.5', '2020-02-18 23:32:04', '在线用户', '/morelogrecord', '5');
INSERT INTO `user_log` VALUES ('3062', '172.20.10.5', '2020-02-18 23:47:51', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3063', '172.20.10.5', '2020-02-18 23:48:59', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3064', '172.20.10.5', '2020-02-18 23:49:02', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('3065', '172.20.10.5', '2020-02-19 11:59:03', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('3066', '172.20.10.5', '2020-02-19 11:59:09', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3067', '172.20.10.5', '2020-02-19 12:03:07', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('3068', '172.20.10.5', '2020-02-19 12:03:10', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3069', '172.20.10.5', '2020-02-19 12:03:14', '类型管理', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('3070', '172.20.10.5', '2020-02-19 12:03:16', '用户管理', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3071', '172.20.10.5', '2020-02-19 12:03:18', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3072', '172.20.10.5', '2020-02-19 12:03:18', '职位管理', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3073', '172.20.10.5', '2020-02-19 12:03:23', '在线用户', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3074', '172.20.10.5', '2020-02-19 12:03:25', '部门管理', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3075', '172.20.10.5', '2020-02-19 12:03:29', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('3076', '172.20.10.5', '2020-02-19 12:06:21', '状态管理', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('3077', '172.20.10.5', '2020-02-19 12:06:23', '菜单管理', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3078', '172.20.10.5', '2020-02-19 23:06:57', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3079', '172.20.10.5', '2020-02-20 00:09:56', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3080', '172.20.10.5', '2020-02-20 00:10:29', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3081', '172.20.10.5', '2020-02-20 00:10:30', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3082', '172.20.10.5', '2020-02-20 00:10:32', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3083', '172.20.10.5', '2020-02-20 00:10:32', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3084', '172.20.10.5', '2020-02-20 00:10:34', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3085', '172.20.10.5', '2020-02-20 00:10:34', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3086', '172.20.10.5', '2020-02-20 00:10:35', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3087', '172.20.10.5', '2020-02-20 00:41:30', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3088', '172.20.10.5', '2020-02-20 00:41:30', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3089', '172.20.10.5', '2020-02-20 00:41:31', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3090', '172.20.10.5', '2020-02-20 00:41:34', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3091', '172.20.10.5', '2020-02-20 00:41:36', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3092', '172.20.10.5', '2020-02-20 00:41:47', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3093', '172.20.10.5', '2020-02-20 00:41:49', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3094', '172.20.10.5', '2020-02-20 00:48:59', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3095', '172.20.10.5', '2020-02-20 00:54:00', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3096', '172.20.10.5', '2020-02-20 00:54:10', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3097', '172.20.10.5', '2020-02-20 00:54:13', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3098', '172.20.10.5', '2020-02-20 00:54:14', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3099', '172.20.10.5', '2020-02-20 21:54:02', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3100', '172.20.10.5', '2020-02-20 21:54:03', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3101', '172.20.10.5', '2020-02-20 22:14:06', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3102', '172.20.10.5', '2020-02-20 22:14:07', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3103', '172.20.10.5', '2020-02-20 22:14:07', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3104', '172.20.10.5', '2020-02-20 22:35:18', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3105', '172.20.10.5', '2020-02-20 22:35:20', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3106', '172.20.10.5', '2020-02-20 22:35:45', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3107', '172.20.10.5', '2020-02-20 22:35:49', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3108', '172.20.10.5', '2020-02-20 22:35:51', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3109', '172.20.10.5', '2020-02-20 22:35:52', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3110', '172.20.10.5', '2020-02-20 22:36:02', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3111', '172.20.10.5', '2020-02-20 22:36:03', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3112', '172.20.10.5', '2020-02-20 22:36:03', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3113', '172.20.10.5', '2020-02-20 22:36:06', '我的申请', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3114', '172.20.10.5', '2020-02-20 22:36:07', '流程审核', '/audit', '1');
INSERT INTO `user_log` VALUES ('3115', '172.20.10.5', '2020-02-20 22:38:09', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('3116', '172.20.10.5', '2020-02-20 22:40:50', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('3117', '172.20.10.5', '2020-02-20 22:41:28', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('3118', '172.20.10.5', '2020-02-20 22:41:29', '我的申请', '/flowmanage', '5');
INSERT INTO `user_log` VALUES ('3119', '172.20.10.5', '2020-02-20 22:41:30', '新建流程', '/xinxeng', '5');
INSERT INTO `user_log` VALUES ('3120', '172.20.10.5', '2020-02-20 22:43:04', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('3121', '172.20.10.5', '2020-02-20 22:43:07', '考勤周报表', '/attendceweek', '5');
INSERT INTO `user_log` VALUES ('3122', '172.20.10.5', '2020-02-20 22:43:08', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('3123', '172.20.10.5', '2020-02-20 22:43:31', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('3124', '172.20.10.5', '2020-02-20 22:43:31', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('3125', '172.20.10.5', '2020-02-20 22:45:19', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('3126', '172.20.10.5', '2020-02-20 22:47:42', '考勤周报表', '/attendceweek', '5');
INSERT INTO `user_log` VALUES ('3127', '172.20.10.5', '2020-02-20 22:47:42', '考勤管理', '/attendceatt', '5');
INSERT INTO `user_log` VALUES ('3128', '172.20.10.5', '2020-02-20 23:29:59', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('3129', '172.20.10.5', '2020-02-20 23:30:08', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('3130', '172.20.10.5', '2020-02-20 23:33:16', '考勤列表', '/attendcelist', '5');
INSERT INTO `user_log` VALUES ('3131', '172.20.10.5', '2020-02-21 01:12:07', '角色列表', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('3132', '172.20.10.5', '2020-02-22 14:10:11', '考勤管理', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3133', '172.20.10.5', '2020-02-22 14:10:13', '考勤周报表', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('3134', '172.20.10.5', '2020-02-22 14:10:16', '新建流程', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3135', '172.20.10.5', '2020-02-22 14:18:12', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3136', '172.20.10.5', '2020-02-22 14:18:39', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3137', '172.20.10.5', '2020-02-22 15:48:50', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3138', '172.20.10.5', '2020-02-22 15:49:08', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3139', '172.20.10.5', '2020-02-22 15:49:09', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3140', '172.20.10.5', '2020-02-22 15:49:09', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3141', '172.20.10.5', '2020-02-22 15:49:27', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3142', '172.20.10.5', '2020-02-22 15:49:54', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3143', '172.20.10.5', '2020-02-22 16:11:20', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3144', '172.20.10.5', '2020-02-22 16:11:49', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3145', '172.20.10.5', '2020-02-22 16:12:11', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3146', '172.20.10.5', '2020-02-22 16:38:09', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3147', '172.20.10.5', '2020-02-22 17:15:00', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3148', '172.20.10.5', '2020-02-22 17:48:31', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3149', '172.20.10.5', '2020-02-22 17:49:39', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('3150', '172.20.10.5', '2020-02-22 17:49:42', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3151', '172.20.10.5', '2020-02-22 17:50:52', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3152', '172.20.10.5', '2020-02-22 18:03:14', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3153', '172.20.10.5', '2020-02-22 18:04:02', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3154', '172.20.10.5', '2020-02-22 18:04:04', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3155', '172.20.10.5', '2020-02-22 18:04:04', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('3156', '172.20.10.5', '2020-02-22 18:06:13', '在线用户', '/morelogrecord', '7');
INSERT INTO `user_log` VALUES ('3157', '172.20.10.5', '2020-02-22 18:06:18', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('3158', '172.20.10.5', '2020-02-22 18:06:28', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('3159', '172.20.10.5', '2020-02-22 18:07:32', '流程审核', '/audit', '7');
INSERT INTO `user_log` VALUES ('3160', '172.20.10.5', '2020-02-22 18:07:32', '我的申请', '/flowmanage', '7');
INSERT INTO `user_log` VALUES ('3161', '172.20.10.5', '2020-02-22 18:07:49', '我的申请', '/flowmanage', '9');
INSERT INTO `user_log` VALUES ('3162', '172.20.10.5', '2020-02-22 18:08:06', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('3163', '172.20.10.5', '2020-02-22 18:25:47', '流程审核', '/audit', '3');
INSERT INTO `user_log` VALUES ('3164', '192.168.80.1', '2020-02-26 15:19:31', '????', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('3165', '192.168.80.1', '2020-02-26 15:37:37', '????', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3166', '192.168.80.1', '2020-02-26 15:41:52', '????', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('3167', '192.168.80.1', '2020-02-26 15:42:14', '????', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3168', '192.168.80.1', '2020-02-26 15:42:36', '????', '/testsystype', '1');
INSERT INTO `user_log` VALUES ('3169', '192.168.80.1', '2020-02-26 15:45:16', '????', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3170', '192.168.80.1', '2020-02-26 15:46:01', '????', '/testsysstatus', '1');
INSERT INTO `user_log` VALUES ('3171', '192.168.80.1', '2020-02-26 15:47:37', '????', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3172', '192.168.80.1', '2020-02-26 15:47:41', '????', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3173', '192.168.80.1', '2020-02-26 15:47:44', '????', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3174', '192.168.80.1', '2020-02-26 15:47:46', '????', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3175', '192.168.80.1', '2020-02-26 15:49:02', '????', '/morelogrecord', '1');
INSERT INTO `user_log` VALUES ('3176', '192.168.80.1', '2020-02-26 15:50:26', '????', '/usermanage', '1');
INSERT INTO `user_log` VALUES ('3177', '192.168.80.1', '2020-02-26 15:52:16', '????', '/rolemanage', '1');
INSERT INTO `user_log` VALUES ('3178', '192.168.80.1', '2020-02-26 15:54:22', '????', '/deptmanage', '1');
INSERT INTO `user_log` VALUES ('3179', '192.168.80.1', '2020-02-26 15:57:39', '????', '/positionmanage', '1');
INSERT INTO `user_log` VALUES ('3180', '192.168.80.1', '2020-02-26 16:00:22', '????', '/xinxeng', '1');
INSERT INTO `user_log` VALUES ('3181', '192.168.80.1', '2020-02-26 16:01:48', '????', '/flowmanage', '1');
INSERT INTO `user_log` VALUES ('3182', '192.168.80.1', '2020-02-26 16:04:16', '????', '/audit', '1');
INSERT INTO `user_log` VALUES ('3183', '192.168.80.1', '2020-02-26 16:18:08', '????', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('3184', '192.168.80.1', '2020-02-26 16:18:20', '????', '/mail', '1');
INSERT INTO `user_log` VALUES ('3185', '192.168.80.1', '2020-02-26 16:18:29', '????', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('3186', '192.168.80.1', '2020-02-26 16:19:21', '????', '/planview', '1');
INSERT INTO `user_log` VALUES ('3187', '192.168.80.1', '2020-02-26 16:19:26', '????', '/myplan', '1');
INSERT INTO `user_log` VALUES ('3188', '192.168.80.1', '2020-02-26 16:19:59', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3189', '192.168.80.1', '2020-02-26 16:20:19', '????', '/testsysmenu', '1');
INSERT INTO `user_log` VALUES ('3190', '192.168.80.1', '2020-02-26 16:21:52', '???', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('3191', '192.168.80.1', '2020-02-26 16:27:09', '?????', '/attendceweek', '1');
INSERT INTO `user_log` VALUES ('3192', '192.168.80.1', '2020-02-26 16:27:23', '?????', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('3193', '192.168.80.1', '2020-02-26 16:32:09', '????', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('3194', '192.168.80.1', '2020-02-26 16:32:18', '?????', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('3195', '192.168.80.1', '2020-02-26 16:32:49', '????', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('3196', '192.168.80.1', '2020-02-26 16:32:59', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3197', '192.168.80.1', '2020-02-26 16:33:01', '????', '/mytask', '1');
INSERT INTO `user_log` VALUES ('3198', '192.168.80.1', '2020-02-26 16:33:02', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3199', '192.168.80.1', '2020-02-26 16:33:03', '????', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('3200', '192.168.80.1', '2020-02-26 16:33:03', '????', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('3201', '192.168.80.1', '2020-02-26 16:33:07', '????', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('3202', '192.168.80.1', '2020-02-26 16:34:05', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3203', '192.168.80.1', '2020-02-26 16:34:06', '????', '/mytask', '1');
INSERT INTO `user_log` VALUES ('3204', '192.168.80.1', '2020-02-26 16:34:12', '????', '/daycalendar', '1');
INSERT INTO `user_log` VALUES ('3205', '192.168.80.1', '2020-02-26 16:34:12', '????', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('3206', '192.168.80.1', '2020-02-26 16:34:21', '????', '/planview', '1');
INSERT INTO `user_log` VALUES ('3207', '192.168.80.1', '2020-02-26 16:34:29', '????', '/myplan', '1');
INSERT INTO `user_log` VALUES ('3208', '192.168.80.1', '2020-02-26 16:34:37', '????', '/planview', '1');
INSERT INTO `user_log` VALUES ('3209', '192.168.80.1', '2020-02-26 16:34:56', '????', '/daymanage', '1');
INSERT INTO `user_log` VALUES ('3210', '192.168.80.1', '2020-02-26 16:35:02', '????', '/planview', '1');
INSERT INTO `user_log` VALUES ('3211', '192.168.80.1', '2020-02-26 16:35:14', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3212', '192.168.80.1', '2020-02-26 16:36:08', '????', '/mytask', '1');
INSERT INTO `user_log` VALUES ('3213', '192.168.80.1', '2020-02-26 16:36:18', '????', '/taskmanage', '1');
INSERT INTO `user_log` VALUES ('3214', '192.168.80.1', '2020-02-26 16:47:48', '????', '/mytask', '1');
INSERT INTO `user_log` VALUES ('3215', '192.168.80.1', '2020-02-26 16:50:25', '????', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3216', '192.168.80.1', '2020-02-26 16:50:35', '?????', '/attendcemonth', '1');
INSERT INTO `user_log` VALUES ('3217', '192.168.80.1', '2020-02-26 16:55:05', '????', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('3218', '192.168.80.1', '2020-02-26 16:55:05', '????', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3219', '192.168.80.1', '2020-02-26 16:55:11', '????', '/attendceatt', '1');
INSERT INTO `user_log` VALUES ('3220', '192.168.80.1', '2020-02-26 16:59:01', '????', '/infromlist', '1');
INSERT INTO `user_log` VALUES ('3221', '192.168.80.1', '2020-02-26 16:59:05', '????', '/mail', '1');
INSERT INTO `user_log` VALUES ('3222', '192.168.80.1', '2020-02-26 16:59:10', '????', '/mytask', '1');
INSERT INTO `user_log` VALUES ('3223', '192.168.80.1', '2020-02-26 16:59:16', '????', '/attendcelist', '1');
INSERT INTO `user_log` VALUES ('3224', '192.168.80.1', '2020-02-26 17:07:02', '???', '/addrmanage', '1');
INSERT INTO `user_log` VALUES ('3225', '192.168.80.1', '2020-02-26 17:07:04', '????', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('3226', '192.168.80.1', '2020-02-26 17:07:11', '????', '/mail', '1');
INSERT INTO `user_log` VALUES ('3227', '192.168.80.1', '2020-02-26 17:07:11', '????', '/mail', '1');
INSERT INTO `user_log` VALUES ('3228', '192.168.80.1', '2020-02-26 17:07:26', '????', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('3229', '192.168.80.1', '2020-02-26 17:07:31', '????', '/mail', '1');
INSERT INTO `user_log` VALUES ('3230', '192.168.80.1', '2020-02-26 17:08:00', '????', '/accountmanage', '1');
INSERT INTO `user_log` VALUES ('3231', '192.168.80.1', '2020-02-26 17:08:10', '????', '/mail', '1');

-- ----------------------------
-- Table structure for `user_login_record`
-- ----------------------------
DROP TABLE IF EXISTS `user_login_record`;
CREATE TABLE `user_login_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) DEFAULT NULL,
  `ip_addr` varchar(255) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `FKks6qpqj3ss4e4timjt0xok1p0` (`user_id`),
  CONSTRAINT `FKks6qpqj3ss4e4timjt0xok1p0` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user_login_record
-- ----------------------------
INSERT INTO `user_login_record` VALUES ('200', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 16:11:43', null, '7');
INSERT INTO `user_login_record` VALUES ('201', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 17:14:55', null, '7');
INSERT INTO `user_login_record` VALUES ('202', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 17:50:49', null, '9');
INSERT INTO `user_login_record` VALUES ('203', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 18:02:22', null, '7');
INSERT INTO `user_login_record` VALUES ('204', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 18:07:44', null, '9');
INSERT INTO `user_login_record` VALUES ('205', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 18:08:02', null, '3');
INSERT INTO `user_login_record` VALUES ('206', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-22 19:15:11', null, '1');
INSERT INTO `user_login_record` VALUES ('207', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-25 22:09:03', null, '1');
INSERT INTO `user_login_record` VALUES ('208', 'Chrome/70.0.3538.25', '192.168.80.1', '2020-02-26 01:19:37', null, '5');
INSERT INTO `user_login_record` VALUES ('209', 'Firefox 7/73.0', '192.168.80.1', '2020-02-26 13:50:38', null, '5');
INSERT INTO `user_login_record` VALUES ('210', 'Chrome/70.0.3538.25', '192.168.80.1', '2020-02-26 15:19:14', null, '1');
INSERT INTO `user_login_record` VALUES ('211', 'Firefox 7/73.0', '192.168.80.1', '2020-02-26 16:26:07', null, '1');
INSERT INTO `user_login_record` VALUES ('212', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-02-26 16:35:37', null, '1');
INSERT INTO `user_login_record` VALUES ('213', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-29 10:00:29', null, '5');
INSERT INTO `user_login_record` VALUES ('214', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-29 10:01:48', null, '1');
INSERT INTO `user_login_record` VALUES ('215', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-02-29 10:26:40', null, '1');
INSERT INTO `user_login_record` VALUES ('216', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-02-29 11:01:47', null, '1');
INSERT INTO `user_login_record` VALUES ('217', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-02-29 11:15:13', null, '1');
INSERT INTO `user_login_record` VALUES ('218', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-02-29 11:39:55', null, '1');
INSERT INTO `user_login_record` VALUES ('219', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 18:47:08', null, '1');
INSERT INTO `user_login_record` VALUES ('220', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 18:55:16', null, '1');
INSERT INTO `user_login_record` VALUES ('221', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 20:30:55', null, '1');
INSERT INTO `user_login_record` VALUES ('222', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 21:28:44', null, '1');
INSERT INTO `user_login_record` VALUES ('223', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 21:36:43', null, '1');
INSERT INTO `user_login_record` VALUES ('224', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 22:01:16', null, '2');
INSERT INTO `user_login_record` VALUES ('225', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 22:23:34', null, '1');
INSERT INTO `user_login_record` VALUES ('226', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-02 23:02:57', null, '1');
INSERT INTO `user_login_record` VALUES ('227', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 10:44:11', null, '1');
INSERT INTO `user_login_record` VALUES ('228', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 11:03:12', null, '1');
INSERT INTO `user_login_record` VALUES ('229', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 11:23:12', null, '1');
INSERT INTO `user_login_record` VALUES ('230', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 12:07:01', null, '1');
INSERT INTO `user_login_record` VALUES ('231', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 12:12:19', null, '1');
INSERT INTO `user_login_record` VALUES ('232', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 12:17:04', null, '1');
INSERT INTO `user_login_record` VALUES ('233', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 12:25:13', null, '1');
INSERT INTO `user_login_record` VALUES ('234', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 17:48:22', null, '1');
INSERT INTO `user_login_record` VALUES ('235', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 17:54:14', null, '2');
INSERT INTO `user_login_record` VALUES ('236', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 17:54:54', null, '1');
INSERT INTO `user_login_record` VALUES ('237', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:14:09', null, '1');
INSERT INTO `user_login_record` VALUES ('238', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:15:41', null, '1');
INSERT INTO `user_login_record` VALUES ('239', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:23:11', null, '1');
INSERT INTO `user_login_record` VALUES ('240', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:29:18', null, '1');
INSERT INTO `user_login_record` VALUES ('241', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:42:13', null, '1');
INSERT INTO `user_login_record` VALUES ('242', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:53:37', null, '1');
INSERT INTO `user_login_record` VALUES ('243', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 18:56:14', null, '1');
INSERT INTO `user_login_record` VALUES ('244', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 19:09:48', null, '1');
INSERT INTO `user_login_record` VALUES ('245', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 19:25:27', null, '1');
INSERT INTO `user_login_record` VALUES ('246', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 19:39:26', null, '1');
INSERT INTO `user_login_record` VALUES ('247', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 19:48:09', null, '1');
INSERT INTO `user_login_record` VALUES ('248', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 19:55:22', null, '1');
INSERT INTO `user_login_record` VALUES ('249', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 20:27:26', null, '1');
INSERT INTO `user_login_record` VALUES ('250', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 20:31:15', null, '1');
INSERT INTO `user_login_record` VALUES ('251', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 20:33:09', null, '1');
INSERT INTO `user_login_record` VALUES ('252', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-03 21:17:34', null, '1');
INSERT INTO `user_login_record` VALUES ('253', 'Chrome 8/80.0.3987.87', '127.0.0.1', '2020-03-05 21:31:43', null, '1');
INSERT INTO `user_login_record` VALUES ('254', 'Chrome 8/80.0.3987.87', '127.0.0.1', '2020-03-05 21:35:07', null, '1');
INSERT INTO `user_login_record` VALUES ('255', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:13:34', null, '1');
INSERT INTO `user_login_record` VALUES ('256', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:26:42', null, '1');
INSERT INTO `user_login_record` VALUES ('257', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:36:14', null, '1');
INSERT INTO `user_login_record` VALUES ('258', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:40:58', null, '1');
INSERT INTO `user_login_record` VALUES ('259', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:41:51', null, '1');
INSERT INTO `user_login_record` VALUES ('260', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 18:57:36', null, '1');
INSERT INTO `user_login_record` VALUES ('261', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 19:16:59', null, '1');
INSERT INTO `user_login_record` VALUES ('262', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 19:23:36', null, '1');
INSERT INTO `user_login_record` VALUES ('263', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-06 20:53:02', null, '1');
INSERT INTO `user_login_record` VALUES ('264', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 13:59:42', null, '1');
INSERT INTO `user_login_record` VALUES ('265', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 15:07:19', null, '1');
INSERT INTO `user_login_record` VALUES ('266', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 15:54:12', null, '1');
INSERT INTO `user_login_record` VALUES ('267', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 16:02:30', null, '1');
INSERT INTO `user_login_record` VALUES ('268', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 16:30:57', null, '1');
INSERT INTO `user_login_record` VALUES ('269', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 16:39:15', null, '1');
INSERT INTO `user_login_record` VALUES ('270', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 16:45:18', null, '1');
INSERT INTO `user_login_record` VALUES ('271', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 16:54:30', null, '1');
INSERT INTO `user_login_record` VALUES ('272', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 18:11:16', null, '1');
INSERT INTO `user_login_record` VALUES ('273', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 18:44:27', null, '1');
INSERT INTO `user_login_record` VALUES ('274', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 20:23:08', null, '1');
INSERT INTO `user_login_record` VALUES ('275', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 21:12:08', null, '1');
INSERT INTO `user_login_record` VALUES ('276', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 21:25:34', null, '1');
INSERT INTO `user_login_record` VALUES ('277', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 21:25:34', null, '1');
INSERT INTO `user_login_record` VALUES ('278', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 21:30:55', null, '1');
INSERT INTO `user_login_record` VALUES ('279', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 21:41:05', null, '1');
INSERT INTO `user_login_record` VALUES ('280', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 22:13:31', null, '1');
INSERT INTO `user_login_record` VALUES ('281', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 22:57:23', null, '1');
INSERT INTO `user_login_record` VALUES ('282', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 23:05:31', null, '1');
INSERT INTO `user_login_record` VALUES ('283', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 23:29:46', null, '1');
INSERT INTO `user_login_record` VALUES ('284', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-07 23:39:53', null, '1');
INSERT INTO `user_login_record` VALUES ('285', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-08 00:00:17', null, '1');
INSERT INTO `user_login_record` VALUES ('286', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-08 00:11:15', null, '1');
INSERT INTO `user_login_record` VALUES ('287', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-08 00:34:37', null, '1');
INSERT INTO `user_login_record` VALUES ('288', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-08 12:17:58', null, '1');
INSERT INTO `user_login_record` VALUES ('289', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-10 09:40:21', null, '1');
INSERT INTO `user_login_record` VALUES ('290', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-11 19:29:04', null, '1');
INSERT INTO `user_login_record` VALUES ('291', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-11 19:40:07', null, '1');
INSERT INTO `user_login_record` VALUES ('292', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-11 20:02:51', null, '1');
INSERT INTO `user_login_record` VALUES ('293', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-11 23:34:33', null, '1');
INSERT INTO `user_login_record` VALUES ('294', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 00:19:18', null, '1');
INSERT INTO `user_login_record` VALUES ('295', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 00:31:06', null, '3');
INSERT INTO `user_login_record` VALUES ('296', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 11:42:14', null, '1');
INSERT INTO `user_login_record` VALUES ('297', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 12:55:20', null, '1');
INSERT INTO `user_login_record` VALUES ('298', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 13:22:57', null, '3');
INSERT INTO `user_login_record` VALUES ('299', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 14:14:54', null, '1');
INSERT INTO `user_login_record` VALUES ('300', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 15:18:47', null, '1');
INSERT INTO `user_login_record` VALUES ('301', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 15:38:02', null, '1');
INSERT INTO `user_login_record` VALUES ('302', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 16:07:26', null, '3');
INSERT INTO `user_login_record` VALUES ('303', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 16:14:12', null, '1');
INSERT INTO `user_login_record` VALUES ('304', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 16:23:54', null, '1');
INSERT INTO `user_login_record` VALUES ('305', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 17:06:27', null, '1');
INSERT INTO `user_login_record` VALUES ('306', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 17:21:26', null, '3');
INSERT INTO `user_login_record` VALUES ('307', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 17:22:10', null, '1');
INSERT INTO `user_login_record` VALUES ('308', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-12 18:10:55', null, '1');
INSERT INTO `user_login_record` VALUES ('309', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 10:06:49', null, '1');
INSERT INTO `user_login_record` VALUES ('310', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 10:45:43', null, '1');
INSERT INTO `user_login_record` VALUES ('311', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 17:21:24', null, '1');
INSERT INTO `user_login_record` VALUES ('312', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 17:22:04', null, '3');
INSERT INTO `user_login_record` VALUES ('313', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 17:41:53', null, '1');
INSERT INTO `user_login_record` VALUES ('314', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 18:01:47', null, '1');
INSERT INTO `user_login_record` VALUES ('315', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 19:09:10', null, '1');
INSERT INTO `user_login_record` VALUES ('316', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 20:10:55', null, '1');
INSERT INTO `user_login_record` VALUES ('317', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 20:44:15', null, '3');
INSERT INTO `user_login_record` VALUES ('318', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 21:22:12', null, '1');
INSERT INTO `user_login_record` VALUES ('319', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 22:22:20', null, '1');
INSERT INTO `user_login_record` VALUES ('320', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 22:26:46', null, '1');
INSERT INTO `user_login_record` VALUES ('321', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 22:41:02', null, '1');
INSERT INTO `user_login_record` VALUES ('322', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 23:54:28', null, '1');
INSERT INTO `user_login_record` VALUES ('323', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-13 23:58:28', null, '7');
INSERT INTO `user_login_record` VALUES ('324', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 00:02:38', null, '1');
INSERT INTO `user_login_record` VALUES ('325', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 12:27:13', null, '1');
INSERT INTO `user_login_record` VALUES ('326', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 13:09:10', null, '1');
INSERT INTO `user_login_record` VALUES ('327', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 13:44:01', null, '7');
INSERT INTO `user_login_record` VALUES ('328', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 13:57:22', null, '1');
INSERT INTO `user_login_record` VALUES ('329', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 13:58:22', null, '4');
INSERT INTO `user_login_record` VALUES ('330', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 13:58:42', null, '1');
INSERT INTO `user_login_record` VALUES ('331', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:03:44', null, '7');
INSERT INTO `user_login_record` VALUES ('332', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:06:10', null, '1');
INSERT INTO `user_login_record` VALUES ('333', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:08:29', null, '7');
INSERT INTO `user_login_record` VALUES ('334', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:11:19', null, '3');
INSERT INTO `user_login_record` VALUES ('335', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:12:05', null, '7');
INSERT INTO `user_login_record` VALUES ('336', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:12:49', null, '3');
INSERT INTO `user_login_record` VALUES ('337', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:21:22', null, '1');
INSERT INTO `user_login_record` VALUES ('338', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:22:44', null, '7');
INSERT INTO `user_login_record` VALUES ('339', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:24:43', null, '3');
INSERT INTO `user_login_record` VALUES ('340', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 14:36:52', null, '1');
INSERT INTO `user_login_record` VALUES ('341', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 16:57:08', null, '3');
INSERT INTO `user_login_record` VALUES ('342', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 16:58:24', null, '1');
INSERT INTO `user_login_record` VALUES ('343', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 16:59:20', null, '7');
INSERT INTO `user_login_record` VALUES ('344', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-14 16:59:53', null, '3');
INSERT INTO `user_login_record` VALUES ('345', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 11:26:37', null, '1');
INSERT INTO `user_login_record` VALUES ('346', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 12:02:22', null, '1');
INSERT INTO `user_login_record` VALUES ('347', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 12:51:17', null, '1');
INSERT INTO `user_login_record` VALUES ('348', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 13:40:44', null, '1');
INSERT INTO `user_login_record` VALUES ('349', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 15:37:20', null, '1');
INSERT INTO `user_login_record` VALUES ('350', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 15:37:59', null, '1');
INSERT INTO `user_login_record` VALUES ('351', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 15:43:08', null, '1');
INSERT INTO `user_login_record` VALUES ('352', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 17:07:20', null, '1');
INSERT INTO `user_login_record` VALUES ('353', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 17:09:46', null, '3');
INSERT INTO `user_login_record` VALUES ('354', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 17:53:24', null, '1');
INSERT INTO `user_login_record` VALUES ('355', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 18:17:12', null, '3');
INSERT INTO `user_login_record` VALUES ('356', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 18:19:41', null, '1');
INSERT INTO `user_login_record` VALUES ('357', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 21:32:21', null, '1');
INSERT INTO `user_login_record` VALUES ('358', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 21:55:20', null, '3');
INSERT INTO `user_login_record` VALUES ('359', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 22:00:30', null, '1');
INSERT INTO `user_login_record` VALUES ('360', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 22:21:48', null, '3');
INSERT INTO `user_login_record` VALUES ('361', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-15 22:24:56', null, '1');
INSERT INTO `user_login_record` VALUES ('362', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 20:55:49', null, '1');
INSERT INTO `user_login_record` VALUES ('363', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 21:47:46', null, '1');
INSERT INTO `user_login_record` VALUES ('364', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 21:58:40', null, '22');
INSERT INTO `user_login_record` VALUES ('365', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 21:59:06', null, '1');
INSERT INTO `user_login_record` VALUES ('366', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 22:10:43', null, '22');
INSERT INTO `user_login_record` VALUES ('367', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 22:11:07', null, '1');
INSERT INTO `user_login_record` VALUES ('368', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 22:13:22', null, '22');
INSERT INTO `user_login_record` VALUES ('369', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 22:14:26', null, '3');
INSERT INTO `user_login_record` VALUES ('370', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-17 22:32:18', null, '1');
INSERT INTO `user_login_record` VALUES ('371', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 00:07:55', null, '3');
INSERT INTO `user_login_record` VALUES ('372', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 00:08:39', null, '1');
INSERT INTO `user_login_record` VALUES ('373', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 00:24:50', null, '3');
INSERT INTO `user_login_record` VALUES ('374', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 00:30:55', null, '1');
INSERT INTO `user_login_record` VALUES ('375', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:05:44', null, '3');
INSERT INTO `user_login_record` VALUES ('376', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:07:05', null, '1');
INSERT INTO `user_login_record` VALUES ('377', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:31:19', null, '3');
INSERT INTO `user_login_record` VALUES ('378', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:35:28', null, '1');
INSERT INTO `user_login_record` VALUES ('379', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:38:36', null, '3');
INSERT INTO `user_login_record` VALUES ('380', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 01:56:09', null, '1');
INSERT INTO `user_login_record` VALUES ('381', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 02:01:32', null, '3');
INSERT INTO `user_login_record` VALUES ('382', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 02:04:22', null, '1');
