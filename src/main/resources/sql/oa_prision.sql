/*
Navicat MySQL Data Transfer

Source Server         : gzs
Source Server Version : 50644
Source Host           : 101.132.103.111:3306
Source Database       : oa_prision

Target Server Type    : MYSQL
Target Server Version : 50644
File Encoding         : 65001

Date: 2020-05-17 12:52:07
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

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
INSERT INTO `archive_borrow` VALUES ('12', '8', '8', '8', '8', '2点来取', '', '28');
INSERT INTO `archive_borrow` VALUES ('13', '222', '22', '2', '22', null, null, '32');
INSERT INTO `archive_borrow` VALUES ('14', 'iifr', 'p98y9t', '22', 'iuiufu', null, 'iugigi', '36');
INSERT INTO `archive_borrow` VALUES ('15', '审批流程测试', 'aaa', '11', '有需要', null, '通过', '39');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `attachment` VALUES ('8', '英国准备.txt', '/2020/03/b/25b0e6cd-9c32-417e-849e-b015ea42b9d0.txt', 'txt', '110', 'text/plain', 'document', '2020-03-20 21:28:13', '3');
INSERT INTO `attachment` VALUES ('9', '英国准备.txt', '/2020/03/b/28c30eba-36cd-4b94-8b8b-97d0a55e2352.txt', 'txt', '110', 'text/plain', 'document', '2020-03-20 21:48:45', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of attends
-- ----------------------------
INSERT INTO `attends` VALUES ('50', '172.20.10.5', null, '2020-02-13 00:00:00', '11', '8', '1', '14:10', '星期四', null, null);
INSERT INTO `attends` VALUES ('52', '172.20.10.5', null, '2020-02-13 00:00:00', '11', '8', '5', '14:13', '星期四', null, null);
INSERT INTO `attends` VALUES ('53', '172.20.10.5', null, '2020-02-13 00:00:00', '11', '8', '14', '14:17', '星期四', null, null);
INSERT INTO `attends` VALUES ('54', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('55', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('56', null, null, null, '47', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('57', null, null, null, '46', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('58', '172.20.10.5', null, '2020-02-13 00:00:00', '12', '9', '14', '15:22', '星期四', null, null);
INSERT INTO `attends` VALUES ('59', null, null, null, '47', null, '14', null, null, '5', '2020-02-13');
INSERT INTO `attends` VALUES ('60', null, null, null, '47', null, '5', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('61', null, null, null, '47', null, '14', null, null, '1', '2020-02-13');
INSERT INTO `attends` VALUES ('62', null, null, null, '47', null, '10', null, null, '1', '2017-10-14');
INSERT INTO `attends` VALUES ('63', '192.168.80.1', null, '2020-03-03 00:00:00', '11', '8', '1', '12:26', '星期二', null, null);
INSERT INTO `attends` VALUES ('65', '192.168.80.1', null, '2020-03-19 00:00:00', '11', '8', '36', '14:29', '星期四', null, null);
INSERT INTO `attends` VALUES ('66', '192.168.80.1', null, '2020-03-19 00:00:00', '11', '8', '1', '14:30', '星期四', null, null);
INSERT INTO `attends` VALUES ('71', '192.168.80.1', null, '2020-03-19 15:52:12', '11', '8', '3', '15:52', '星期四', null, null);
INSERT INTO `attends` VALUES ('72', '192.168.80.1', null, '2020-03-19 15:52:16', '12', '9', '3', '15:52', '星期四', null, null);
INSERT INTO `attends` VALUES ('82', '192.168.80.1', null, '2020-03-19 18:57:46', '11', '8', '2', '18:57', '星期四', null, null);
INSERT INTO `attends` VALUES ('83', '192.168.80.1', null, '2020-03-19 19:05:15', '11', '8', '38', '19:05', '星期四', null, null);
INSERT INTO `attends` VALUES ('84', '192.168.80.1', null, '2020-03-19 19:10:53', '10', '9', '38', '19:10', '星期四', null, null);
INSERT INTO `attends` VALUES ('85', '192.168.80.1', null, '2020-03-20 13:40:30', '11', '8', '1', '13:40', '星期五', null, null);
INSERT INTO `attends` VALUES ('86', '192.168.80.1', '', '2020-03-20 13:40:32', '10', '9', '1', '13:40', '星期五', null, null);
INSERT INTO `attends` VALUES ('87', '192.168.80.1', '', '2020-03-20 20:59:19', '10', '8', '3', '20:59', '星期五', null, null);
INSERT INTO `attends` VALUES ('89', '192.168.80.1', null, '2020-03-20 21:54:04', '11', '8', '7', '21:54', '星期五', null, null);
INSERT INTO `attends` VALUES ('90', '192.168.80.1', null, '2020-03-21 16:00:18', '11', '8', '1', '16:00', '星期六', null, null);
INSERT INTO `attends` VALUES ('91', '192.168.80.1', null, '2020-03-21 16:00:27', '12', '9', '1', '16:00', '星期六', null, null);
INSERT INTO `attends` VALUES ('92', '192.168.80.1', '', '2020-03-21 16:05:07', '10', '8', '2', '16:05', '星期六', null, null);
INSERT INTO `attends` VALUES ('93', '192.168.80.1', null, '2020-03-21 16:25:30', '11', '8', '4', '16:25', '星期六', null, null);
INSERT INTO `attends` VALUES ('94', '192.168.80.1', null, '2020-03-21 16:25:31', '12', '9', '4', '16:25', '星期六', null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
INSERT INTO `document` VALUES ('13', '2', '2', '', null, '2', '17');
INSERT INTO `document` VALUES ('14', '3', '3', null, null, '3', '18');
INSERT INTO `document` VALUES ('15', '4', '4', null, null, '4', '19');
INSERT INTO `document` VALUES ('16', '5', '5', '', null, '5', '20');
INSERT INTO `document` VALUES ('17', 'yfytdu', 'uyfuf', 'iokpoj', '合格', '22', '35');
INSERT INTO `document` VALUES ('18', '审批流程测试', '233', '通过', '合格', '22', '38');

-- ----------------------------
-- Table structure for `holiday`
-- ----------------------------
DROP TABLE IF EXISTS `holiday`;
CREATE TABLE `holiday` (
  `holiday_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) DEFAULT NULL COMMENT '请假类型',
  `leave_days` int(11) DEFAULT NULL COMMENT '请假天数',
  `leave_reason` varchar(255) DEFAULT NULL COMMENT '请假原因',
  `hand_user` bigint(11) DEFAULT NULL COMMENT '代班人',
  `pro_id` bigint(11) DEFAULT NULL,
  `manager_advice` varchar(255) DEFAULT NULL COMMENT '上级领导建议',
  PRIMARY KEY (`holiday_id`),
  KEY `hand_user` (`hand_user`),
  KEY `pro_id` (`pro_id`),
  CONSTRAINT `holiday_ibfk_1` FOREIGN KEY (`hand_user`) REFERENCES `user` (`user_id`),
  CONSTRAINT `holiday_ibfk_2` FOREIGN KEY (`pro_id`) REFERENCES `process` (`process_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of holiday
-- ----------------------------
INSERT INTO `holiday` VALUES ('1', '39', '2', '飞飞飞', '4', '29', '尽快返工');
INSERT INTO `holiday` VALUES ('2', '40', '2', '反反复复', '8', '30', null);
INSERT INTO `holiday` VALUES ('3', '37', '3', '发发发', '9', '31', null);
INSERT INTO `holiday` VALUES ('4', '38', '1', '111111', '4', '34', '');
INSERT INTO `holiday` VALUES ('5', '38', '1', 'yudyudky', '4', '37', '快回');
INSERT INTO `holiday` VALUES ('6', '39', '1', 'aaa', '4', '40', '快回');
INSERT INTO `holiday` VALUES ('7', '37', '1', '???', '2', '41', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=911 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `permission` VALUES ('879', '1', '101', '1');
INSERT INTO `permission` VALUES ('880', '1', '101', '2');
INSERT INTO `permission` VALUES ('881', '1', '101', '3');
INSERT INTO `permission` VALUES ('882', '1', '101', '4');
INSERT INTO `permission` VALUES ('883', '1', '101', '5');
INSERT INTO `permission` VALUES ('884', '1', '101', '6');
INSERT INTO `permission` VALUES ('885', '1', '101', '7');
INSERT INTO `permission` VALUES ('886', '0', '101', '9');
INSERT INTO `permission` VALUES ('887', '1', '102', '1');
INSERT INTO `permission` VALUES ('888', '1', '102', '2');
INSERT INTO `permission` VALUES ('889', '1', '102', '3');
INSERT INTO `permission` VALUES ('890', '1', '102', '4');
INSERT INTO `permission` VALUES ('891', '1', '102', '5');
INSERT INTO `permission` VALUES ('892', '1', '102', '6');
INSERT INTO `permission` VALUES ('893', '1', '102', '7');
INSERT INTO `permission` VALUES ('894', '0', '102', '9');
INSERT INTO `permission` VALUES ('895', '1', '103', '1');
INSERT INTO `permission` VALUES ('896', '1', '103', '2');
INSERT INTO `permission` VALUES ('897', '1', '103', '3');
INSERT INTO `permission` VALUES ('898', '1', '103', '4');
INSERT INTO `permission` VALUES ('899', '1', '103', '5');
INSERT INTO `permission` VALUES ('900', '0', '103', '6');
INSERT INTO `permission` VALUES ('901', '0', '103', '7');
INSERT INTO `permission` VALUES ('902', '0', '103', '9');
INSERT INTO `permission` VALUES ('903', '1', '100', '1');
INSERT INTO `permission` VALUES ('904', '1', '100', '2');
INSERT INTO `permission` VALUES ('905', '1', '100', '3');
INSERT INTO `permission` VALUES ('906', '1', '100', '4');
INSERT INTO `permission` VALUES ('907', '1', '100', '5');
INSERT INTO `permission` VALUES ('908', '1', '100', '6');
INSERT INTO `permission` VALUES ('909', '1', '100', '7');
INSERT INTO `permission` VALUES ('910', '0', '100', '9');

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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `process` VALUES ('20', '2020-03-18 00:27:40', '22', '2020-03-18 00:26:23', null, '5', null, '0', '2020-03-18 00:26:23', '24', '创建公文', null, '3', 'lzh;f');
INSERT INTO `process` VALUES ('21', '2020-03-18 00:27:54', '22', '2020-03-18 00:27:43', null, '1', null, '0', '2020-03-18 00:27:43', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('22', '2020-03-18 00:28:10', '22', '2020-03-18 00:28:00', null, '2', null, '0', '2020-03-18 00:28:00', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('23', '2020-03-18 00:28:34', '22', '2020-03-18 00:28:19', null, '3', null, '0', '2020-03-18 00:28:19', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('24', '2020-03-18 00:28:46', '22', '2020-03-18 00:28:37', null, '4', null, '0', '2020-03-18 00:28:37', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('25', '2020-03-18 00:29:00', '22', '2020-03-18 00:28:49', null, '5', null, '0', '2020-03-18 00:28:49', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('26', '2020-03-18 00:29:12', '22', '2020-03-18 00:29:02', null, '6', null, '0', '2020-03-18 00:29:02', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('27', '2020-03-18 00:29:25', '22', '2020-03-18 00:29:14', null, '7', null, '0', '2020-03-18 00:29:14', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('28', '2020-03-18 00:29:38', '22', '2020-03-18 00:29:31', null, '8', null, '0', '2020-03-18 00:29:31', '25', '申请借调档案', null, '3', 'lzh;u');
INSERT INTO `process` VALUES ('29', '2020-03-20 16:08:13', '22', '2020-03-20 16:08:07', null, 'b的请假申请', null, '0', '2020-03-20 16:08:07', '25', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('30', '2020-03-20 16:10:04', '22', '2020-03-20 16:09:36', null, 'b的请假申请', null, '0', '2020-03-20 16:09:36', '23', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('31', '2020-03-20 16:10:38', '22', '2020-03-20 16:10:08', null, 'b的请假申请', null, '0', '2020-03-20 16:10:08', '23', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('32', '2020-03-20 16:21:23', '22', '2020-03-20 16:21:13', null, '22', null, '0', '2020-03-20 16:21:13', '23', '申请借调档案', null, '3', 'lzh');
INSERT INTO `process` VALUES ('34', '2020-03-20 16:35:21', '24', '2020-03-20 16:34:34', null, 'b的请假申请', null, '0', '2020-03-20 16:34:34', '26', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('35', '2020-03-20 21:28:13', '24', '2020-03-20 21:27:49', null, 'yfytdu', null, '0', '2020-03-20 21:27:49', '25', '创建公文', '8', '3', 'lzh;f');
INSERT INTO `process` VALUES ('36', '2020-03-20 21:28:39', '22', '2020-03-20 21:28:20', null, 'p98y9t', null, '0', '2020-03-20 21:28:20', '25', '申请借调档案', null, '3', 'lzh;u');
INSERT INTO `process` VALUES ('37', '2020-03-20 21:29:08', '22', '2020-03-20 21:28:43', null, 'b的请假申请', null, '0', '2020-03-20 21:28:43', '25', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('38', '2020-03-20 21:48:45', '22', '2020-03-20 21:48:41', null, '审批流程测试', null, '0', '2020-03-20 21:48:41', '25', '创建公文', '9', '3', 'lzh;f');
INSERT INTO `process` VALUES ('39', '2020-03-20 21:49:12', '22', '2020-03-20 21:48:52', null, 'aaa', null, '0', '2020-03-20 21:48:52', '25', '申请借调档案', null, '3', 'lzh;u');
INSERT INTO `process` VALUES ('40', '2020-03-20 21:49:42', '22', '2020-03-20 21:49:21', null, 'b的请假申请', null, '0', '2020-03-20 21:49:21', '25', '请假申请', null, '3', 'lzh');
INSERT INTO `process` VALUES ('41', '2020-04-11 21:40:52', '22', '2020-04-11 21:39:08', null, 'b?????', null, '0', '2020-04-11 21:39:08', '23', '????', null, '3', 'lzh');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `reviewed` VALUES ('26', '', '2020-03-20 21:11:15', '25', '20', '1', '0');
INSERT INTO `reviewed` VALUES ('27', null, null, '23', '21', '1', '0');
INSERT INTO `reviewed` VALUES ('28', null, null, '23', '22', '1', '0');
INSERT INTO `reviewed` VALUES ('29', null, null, '23', '23', '1', '0');
INSERT INTO `reviewed` VALUES ('30', null, null, '23', '24', '1', '0');
INSERT INTO `reviewed` VALUES ('31', null, null, '23', '25', '1', '0');
INSERT INTO `reviewed` VALUES ('32', null, null, '23', '26', '1', '0');
INSERT INTO `reviewed` VALUES ('33', null, null, '23', '27', '1', '0');
INSERT INTO `reviewed` VALUES ('34', '', '2020-03-18 02:24:24', '25', '28', '1', '0');
INSERT INTO `reviewed` VALUES ('35', '2点来取', '2020-03-20 21:58:15', '25', '28', '22', '0');
INSERT INTO `reviewed` VALUES ('36', '尽快返工', '2020-03-20 20:55:02', '25', '29', '1', '0');
INSERT INTO `reviewed` VALUES ('37', null, null, '23', '30', '1', '0');
INSERT INTO `reviewed` VALUES ('38', null, null, '23', '31', '1', '0');
INSERT INTO `reviewed` VALUES ('39', null, null, '23', '32', '1', '0');
INSERT INTO `reviewed` VALUES ('40', '', '2020-03-20 20:54:45', '26', '34', '1', '0');
INSERT INTO `reviewed` VALUES ('41', null, null, '24', '20', '7', '0');
INSERT INTO `reviewed` VALUES ('42', 'iokpoj', '2020-03-20 21:32:41', '25', '35', '1', '0');
INSERT INTO `reviewed` VALUES ('43', 'iugigi', '2020-03-20 21:33:29', '25', '36', '1', '0');
INSERT INTO `reviewed` VALUES ('44', '快回', '2020-03-20 21:33:54', '25', '37', '1', '0');
INSERT INTO `reviewed` VALUES ('45', '合格', '2020-03-20 21:35:18', '25', '35', '7', '0');
INSERT INTO `reviewed` VALUES ('46', '1点来取', '2020-03-20 21:36:06', '25', '36', '22', '0');
INSERT INTO `reviewed` VALUES ('47', '通过', '2020-03-20 21:50:26', '25', '38', '1', '0');
INSERT INTO `reviewed` VALUES ('48', '通过', '2020-03-20 21:51:02', '25', '39', '1', '0');
INSERT INTO `reviewed` VALUES ('49', '快回', '2020-03-20 21:51:30', '25', '40', '1', '0');
INSERT INTO `reviewed` VALUES ('50', '合格', '2020-03-20 21:54:22', '25', '38', '7', '0');
INSERT INTO `reviewed` VALUES ('51', '1点来取', '2020-03-20 21:55:02', '25', '39', '22', '0');
INSERT INTO `reviewed` VALUES ('52', null, null, '23', '41', '1', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_value` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `statuslist` VALUES ('3', 'label-warning', 'task', '新任务', '0', '20%');
INSERT INTO `statuslist` VALUES ('4', 'label-info', 'task', '已接收', '1', '40%');
INSERT INTO `statuslist` VALUES ('5', 'label-primary', 'task', '进行中', '2', '60%');
INSERT INTO `statuslist` VALUES ('6', 'label-danger', 'task', '已提交', '3', '80%');
INSERT INTO `statuslist` VALUES ('7', 'label-success', 'task', '已完成', '4', '100%');
INSERT INTO `statuslist` VALUES ('8', 'label-info', 'aoa_note_list', '一般', '0', null);
INSERT INTO `statuslist` VALUES ('9', 'label-danger', 'aoa_note_list', '重要', '1', null);
INSERT INTO `statuslist` VALUES ('10', 'label-info', 'attends', '正常', '0', null);
INSERT INTO `statuslist` VALUES ('11', 'label-warning', 'attends', '迟到', '1', null);
INSERT INTO `statuslist` VALUES ('12', 'label-danger', 'attends', '早退', '2', null);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `systemmenu` VALUES ('100', '1', null, 'glyphicon-calendar', '请假管理', '#', '0', '8');
INSERT INTO `systemmenu` VALUES ('101', '1', null, 'glyphicon-record', '请假申请', '/applyholiday', '100', '1');
INSERT INTO `systemmenu` VALUES ('102', '1', null, 'glyphicon-record', '我的申请', '/myholiday', '100', '2');
INSERT INTO `systemmenu` VALUES ('103', '1', null, 'glyphicon-record', '请假审核', '/verifyholiday', '100', '3');

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_list
-- ----------------------------
INSERT INTO `task_list` VALUES ('53', '老赵 ，把老子的意大利炮扛来！！', '2020-03-04 12:35:45', '0', '1', '2020-03-03 17:52:09', '2020-03-03 17:52:09', '2020-03-03 12:35:45', '5', '老赵 ，把老子的意大利炮扛来', null, '意大利炮', '3', '1', 'a');
INSERT INTO `task_list` VALUES ('55', '', '2020-03-21 21:23:24', '0', '1', '2020-03-20 21:23:43', '2020-03-20 21:23:43', '2020-03-20 21:23:24', '3', '抓刘华强', null, '刘华强', '4', '1', 'b');
INSERT INTO `task_list` VALUES ('56', '', '2020-03-21 21:26:07', '0', '0', '2020-03-20 21:26:33', '2020-03-20 21:26:33', '2020-03-20 21:26:07', '6', '快', null, '端杯茶', '3', '1', 'b');
INSERT INTO `task_list` VALUES ('57', '', '2020-03-21 21:47:00', '0', '0', '2020-03-20 21:47:18', '2020-03-20 21:47:18', '2020-03-20 21:47:00', '5', '快', null, '测试', '3', '1', 'a');

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_logger
-- ----------------------------
INSERT INTO `task_logger` VALUES ('38', '2020-03-03 17:54:38', '', '53', 'a', '5');
INSERT INTO `task_logger` VALUES ('39', '2020-03-20 21:27:20', '泡好', '56', 'b', '6');
INSERT INTO `task_logger` VALUES ('40', '2020-04-11 21:38:13', '', '57', 'a', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of task_user
-- ----------------------------
INSERT INTO `task_user` VALUES ('72', '5', '53', '2');
INSERT INTO `task_user` VALUES ('74', '3', '55', '3');
INSERT INTO `task_user` VALUES ('75', '6', '56', '3');
INSERT INTO `task_user` VALUES ('76', '5', '57', '2');

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
INSERT INTO `typelist` VALUES ('3', 'red', 'task', '公事', '0');
INSERT INTO `typelist` VALUES ('4', 'red', 'task', '私事', '1');
INSERT INTO `typelist` VALUES ('5', 'red', 'aoa_note_list', '我的笔记', '0');
INSERT INTO `typelist` VALUES ('6', 'red', 'aoa_note_list', '公司笔记', '1');
INSERT INTO `typelist` VALUES ('7', 'red', 'aoa_note_list', '共享笔记', '2');
INSERT INTO `typelist` VALUES ('8', 'red', 'attends', '上班', '1');
INSERT INTO `typelist` VALUES ('9', 'red', 'attends', '下班', '2');
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
INSERT INTO `typelist` VALUES ('37', '1、年假：工作满一年以上每年可享受带薪年假，当年的年假使用期至次年3月1日止；未经用人单位批准，员工不得自行休假。', 'holiday', '年假', '7');
INSERT INTO `typelist` VALUES ('38', '2、事假：按照平均工作日扣发薪资（包含工资及各类补贴福利）；单次事假原则上不应超过3天，当年累计事假超过15天的视为主动放弃继续履行岗位职责的权利，特殊情况除外。  ', 'holiday', '事假', '4');
INSERT INTO `typelist` VALUES ('39', '3、病假：两天及以上病假必须持工作地二级甲等以上医院相关病假证明单或就医记录证明，否则无法享受病假工资；单次病假超过5天，应当持有工作所在地三级甲等医院提供的病假证明单。原则上当年累计病假超过15天应视为不具备继续履行岗位职责身体条件，特殊情况除外。  ', 'holiday', '病假', null);
INSERT INTO `typelist` VALUES ('40', '4、婚假：婚假为十天，包含休息日，请婚假必须持结婚证明，结婚证必须在泛微工作期间领取，且婚假必须在一年内使用完毕，不得分次休假，国家或地方政府有其他规定的按照当地要求执行；  ', 'holiday', '婚假', '10');
INSERT INTO `typelist` VALUES ('41', '5、产假及哺乳假：按国家及地方法律法规执行，包含休息日与法定节假日；  ', 'holiday', '产假及哺乳假', '180');
INSERT INTO `typelist` VALUES ('42', '6、陪产假：泛微正式男性员工在工作期间配偶生育的，可凭子女出生证明，享受十个自然日陪产假。  ', 'holiday', '陪产假', '10');
INSERT INTO `typelist` VALUES ('43', '7、丧假：直系亲属：配偶、子女、父母可享受三天，岳父母、祖父母、外祖父母可享受一天', 'holiday', '丧假', null);
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
  `worktype` varchar(20) DEFAULT NULL COMMENT '上班类型 ',
  PRIMARY KEY (`user_id`),
  KEY `FKt0vmot9xfbgq14oyij0gwh3gh` (`dept_id`),
  KEY `FKadtg9xju7q1ijcyxlkl9gwv5t` (`position_id`),
  KEY `FKl738mmblfx0uia6671rl17cj9` (`role_id`),
  CONSTRAINT `FKadtg9xju7q1ijcyxlkl9gwv5t` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  CONSTRAINT `FKl738mmblfx0uia6671rl17cj9` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `FKt0vmot9xfbgq14oyij0gwh3gh` FOREIGN KEY (`dept_id`) REFERENCES `dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '浙江省杭州市拱墅区上塘街道浙江树人大学', '62175555555555444', '1986-02-03 00:00:00', 'lzh@pri.com', '1', '2020-03-02 22:43:57', '510322198602030429', '/c8598312-8063-4ccb-ab8a-ca32cfa9860f.png', '0', null, null, null, '1', '123456', '郦卓华', '12000', '浙江树人大学', '男', 'blue', '本科', 'lzh', '我是爸爸', '18888753189', '1', '1', '1', '1', null, 'lzh', '白班');
INSERT INTO `user` VALUES ('2', '浙江省', '6217837736828630', '1994-03-28 00:00:00', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '/65b5e138-6cbe-454e-a636-bdd526a844f3.jpg', '0', null, null, null, '2', '123456', 'a', '1000', '清华大学', '女', 'blue', '硕士', 'a', '', '13203318185', '1', '2', '2', '0', null, 'a', '白班');
INSERT INTO `user` VALUES ('3', '浙江省', '6217002940101998752', '1995-03-05 00:00:00', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '3.jpg', '0', null, null, null, '3', '123456', 'b', '1000', '清华大学', '女', 'blue', '硕士', 'b', '', '18683688154', '1', '3', '2', '0', null, 'b', '夜班');
INSERT INTO `user` VALUES ('4', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '4', '123456', 'c', '3000', '清华大学', '男', 'blue', '硕士', 'c', '', '18173328888', '1', '4', '2', '0', null, 'c', '白班');
INSERT INTO `user` VALUES ('5', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '5', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '5', '123456', 'd', '4000', '清华大学', '男', 'blue', '博士', 'd', '', '18173328976', '6', '11', '5', '0', null, 'd', null);
INSERT INTO `user` VALUES ('6', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '5', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '6', '123456', 'e', '3700', '清华大学', '女', 'blue', '本科', 'e', '', '18868688866', '6', '25', '6', '0', null, 'e', null);
INSERT INTO `user` VALUES ('7', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '7', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '7', '123456', 'f', '5000', '清华大学', '男', 'blue', '本科', 'f', null, '13117336953', '2', '7', '3', '0', null, 'f', '夜班');
INSERT INTO `user` VALUES ('8', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '7', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '8', '123456', 'g', '5000', '清华大学', '女', 'blue', '本科', 'g', null, '13117336954', '2', '21', '6', '0', null, 'g', null);
INSERT INTO `user` VALUES ('9', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '9', '2020-03-02 22:44:21', '510322198602030429', '/820fd533-58a8-4726-a930-585b15575106.jpg', '0', null, null, null, '9', '123456', 'h', '3111', '清华大学', '女', 'blue', '本科', 'h', '', '13034507214', '3', '8', '5', '0', null, 'h', '白班');
INSERT INTO `user` VALUES ('10', '浙江省', '6217002940101998752', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '10', '123456', 'i', '2555', '清华大学', '女', 'blue', '本科', 'i', null, '13117336954', '7', '12', '5', '0', null, 'i', null);
INSERT INTO `user` VALUES ('11', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '11', '123456', 'j', '5000', '清华大学', '男', 'yellow', '硕士', 'j', null, '13117336953', '8', '13', '5', '0', null, 'j', null);
INSERT INTO `user` VALUES ('12', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '12', '123456', 'k', '2000', '清华大学', '男', 'red', '本科', 'k', null, '13117336953', '9', '14', '5', '0', null, 'k', null);
INSERT INTO `user` VALUES ('13', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '13', '123456', 'l', '1000', '清华大学', '女', 'blue', '硕士', 'l', null, '13117336954', '1', '6', '2', '0', null, 'l', null);
INSERT INTO `user` VALUES ('14', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '10', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '14', '123456', 'm', '1000', '清华大学', '女', 'blue', '硕士', 'm', null, '18868688866', '7', '26', '6', '0', null, 'm', null);
INSERT INTO `user` VALUES ('15', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '9', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '15', '123456', 'n', '3000', '清华大学', '男', 'blue', '硕士', 'n', null, '13117336953', '3', '22', '6', '0', null, 'n', null);
INSERT INTO `user` VALUES ('16', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '16', '123456', 'o', '4000', '清华大学', '男', 'blue', '博士', 'o', null, '13117336954', '4', '9', '5', '0', null, 'o', null);
INSERT INTO `user` VALUES ('17', '浙江省', '62175555555555444', '1997-09-19 16:59:29', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '17', '123456', 'p', '3700', '清华大学', '女', 'blue', '本科', 'p', null, '13034507214', '11', '16', '5', '0', null, 'p', null);
INSERT INTO `user` VALUES ('18', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '18', '123456', 'q', '5000', '清华大学', '男', 'blue', '本科', 'q', null, '13117336954', '5', '10', '5', '0', null, 'q', null);
INSERT INTO `user` VALUES ('19', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '19', '123456', 'r', '5000', '清华大学', '女', 'yellow', '本科', 'r', null, '13117336953', '13', '18', '5', '0', null, 'r', null);
INSERT INTO `user` VALUES ('20', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '20', '123456', 's', '3111', '清华大学', '女', 'red', '本科', 's', null, '13117336953', '14', '19', '5', '0', null, 's', null);
INSERT INTO `user` VALUES ('21', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '21', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '21', '123456', 't', '2555', '清华大学', '女', 'blue', '本科', 'y', null, '18868688866', '15', '20', '5', '0', null, 'y', '白班');
INSERT INTO `user` VALUES ('22', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '22', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '22', '123456', 'u', '5000', '清华大学', '男', 'blue', '硕士', 'u', null, '13117336953', '10', '15', '4', '0', null, 'u', '夜班');
INSERT INTO `user` VALUES ('23', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '11', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '23', '123456', 'v', '6000', '清华大学', '女', 'blue', '博士', 'v', '', '13117336954', '8', '28', '7', '0', null, 'v', null);
INSERT INTO `user` VALUES ('24', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '12', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '24', '123456', 'w', '6000', '清华大学', '女', 'blue', '博士', 'w', '', '13117336954', '9', '29', '7', '0', null, 'w', null);
INSERT INTO `user` VALUES ('25', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '20', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '25', '123456', 'x', '5000', '清华大学', '女', 'blue', '本科', 'x', null, '13117336953', '14', '34', '7', '0', null, 'x', null);
INSERT INTO `user` VALUES ('26', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '26', '123456', 'y', '4000', '清华大学', '男', 'blue', '博士', 'y', null, '13117336954', '4', '23', '6', '0', null, 'y', null);
INSERT INTO `user` VALUES ('27', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '13', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '27', '123456', 'z', '2555', '清华大学', '女', 'blue', '本科', 'z', null, '18868688866', '12', '17', '5', '0', null, 'z', null);
INSERT INTO `user` VALUES ('28', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '18', '2020-03-02 22:44:21', '510322198602030429', '', '0', null, null, null, '28', '123456', 'aa', '222', '清华大学', '男', 'blue', '硕士', 'aa', null, '18868688866', '5', '24', '6', '0', null, 'aa', null);
INSERT INTO `user` VALUES ('29', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '1', '2020-03-02 22:44:21', '510322198602030429', '5.jpg', '0', null, null, null, '29', '123456', 'bb', '6666', '清华大学', '男', 'blue', '硕士', 'bb', null, '13600003532', '1', '5', '2', '0', null, 'bb', '白班');
INSERT INTO `user` VALUES ('30', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '17', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '30', '123456', 'cc', '6666', '清华大学', '男', 'red', '本科', 'cc', null, '13600003532', '11', '31', '7', '0', null, 'cc', null);
INSERT INTO `user` VALUES ('31', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '22', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '31', '123456', 'dd', '6666', '清华大学', '男', 'blue', '本科', 'dd', null, '13600003532', '10', '30', '7', '0', null, 'dd', null);
INSERT INTO `user` VALUES ('32', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '19', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '32', '123456', 'ee', '6666', '清华大学', '男', 'blue', '本科', 'ee', null, '13600003532', '13', '33', '7', '0', null, 'ee', null);
INSERT INTO `user` VALUES ('33', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '10', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '33', '123456', 'ff', '6666', '清华大学', '男', 'blue', '本科', 'ff', null, '13600003532', '7', '27', '6', '0', null, 'ff', null);
INSERT INTO `user` VALUES ('34', '浙江省', '62175555555555444', '1996-09-19 16:56:50', '@pri.com', '27', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '34', '123456', 'gg', '6666', '清华大学', '男', 'blue', '本科', 'gg', null, '13600003532', '12', '32', '7', '0', null, 'gg', null);
INSERT INTO `user` VALUES ('35', '浙江省', '62175555555555444', '1996-09-19 16:56:50', 'lzh@pri.com', '21', '2020-03-02 22:44:21', '510322198602030429', null, '0', null, null, null, '35', '123456', 'hh', '1111', '清华大学', '男', 'blue', '本科', 'hh', null, '13600003532', '15', '35', '7', '0', null, 'hh', '35');
INSERT INTO `user` VALUES ('36', '日内瓦', '621661050001963895', '1996-09-19 16:56:50', 'lyl@vip.163.com', '21', '2020-03-19 00:00:00', '210381199909227728', null, '0', null, null, null, '36', '123456', 'lyb', '1000', '斯坦福', '男', 'blue', '博士', 'lyb', null, '13841288888', '15', '20', '7', '0', null, 'ydl', '白班');
INSERT INTO `user` VALUES ('38', '清华大学', '6217002940101998752', '2020-03-19 00:00:00', 'ydl@vip.163.com', '21', '2020-03-19 00:00:00', '210381199909227728', null, '0', null, null, null, '37', '123456', '傻逼', '5000', '北京大学', '男', 'blue', '硕士', '傻逼', null, '18683688154', '15', '20', '7', '0', null, 'ydl', '夜班');

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
) ENGINE=InnoDB AUTO_INCREMENT=454 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `user_login_record` VALUES ('383', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-18 02:48:03', null, '1');
INSERT INTO `user_login_record` VALUES ('384', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 12:55:45', null, '1');
INSERT INTO `user_login_record` VALUES ('385', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 12:56:12', null, '3');
INSERT INTO `user_login_record` VALUES ('386', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 12:56:32', null, '1');
INSERT INTO `user_login_record` VALUES ('387', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 14:24:00', null, '36');
INSERT INTO `user_login_record` VALUES ('388', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 14:30:15', null, '1');
INSERT INTO `user_login_record` VALUES ('389', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 14:54:46', null, '2');
INSERT INTO `user_login_record` VALUES ('390', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 15:37:28', null, '3');
INSERT INTO `user_login_record` VALUES ('391', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 16:24:31', null, '2');
INSERT INTO `user_login_record` VALUES ('392', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 17:04:33', null, '1');
INSERT INTO `user_login_record` VALUES ('393', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 17:04:57', null, '3');
INSERT INTO `user_login_record` VALUES ('394', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 17:05:42', null, '2');
INSERT INTO `user_login_record` VALUES ('395', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 18:30:48', null, '2');
INSERT INTO `user_login_record` VALUES ('396', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 19:05:12', null, '38');
INSERT INTO `user_login_record` VALUES ('397', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-19 23:39:56', null, '1');
INSERT INTO `user_login_record` VALUES ('398', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 12:23:06', null, '1');
INSERT INTO `user_login_record` VALUES ('399', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 13:40:26', null, '1');
INSERT INTO `user_login_record` VALUES ('400', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 14:13:57', null, '1');
INSERT INTO `user_login_record` VALUES ('401', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 14:43:24', null, '1');
INSERT INTO `user_login_record` VALUES ('402', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 14:43:58', null, '3');
INSERT INTO `user_login_record` VALUES ('403', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 15:27:24', null, '1');
INSERT INTO `user_login_record` VALUES ('404', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 16:05:59', null, '3');
INSERT INTO `user_login_record` VALUES ('405', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 18:37:35', null, '1');
INSERT INTO `user_login_record` VALUES ('406', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 20:33:56', null, '1');
INSERT INTO `user_login_record` VALUES ('407', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 20:59:12', null, '3');
INSERT INTO `user_login_record` VALUES ('408', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:01:00', null, '1');
INSERT INTO `user_login_record` VALUES ('409', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:05:47', null, '1');
INSERT INTO `user_login_record` VALUES ('410', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:24:41', null, '1');
INSERT INTO `user_login_record` VALUES ('411', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:27:02', null, '3');
INSERT INTO `user_login_record` VALUES ('412', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:29:44', null, '1');
INSERT INTO `user_login_record` VALUES ('413', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:30:24', null, '3');
INSERT INTO `user_login_record` VALUES ('414', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:32:05', null, '1');
INSERT INTO `user_login_record` VALUES ('415', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:34:23', null, '7');
INSERT INTO `user_login_record` VALUES ('416', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:35:38', null, '22');
INSERT INTO `user_login_record` VALUES ('417', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:36:44', null, '1');
INSERT INTO `user_login_record` VALUES ('418', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:45:14', null, '1');
INSERT INTO `user_login_record` VALUES ('419', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:45:34', null, '1');
INSERT INTO `user_login_record` VALUES ('420', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:48:00', null, '3');
INSERT INTO `user_login_record` VALUES ('421', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:50:03', null, '1');
INSERT INTO `user_login_record` VALUES ('422', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:53:59', null, '7');
INSERT INTO `user_login_record` VALUES ('423', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 21:54:42', null, '22');
INSERT INTO `user_login_record` VALUES ('424', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 22:09:00', null, '1');
INSERT INTO `user_login_record` VALUES ('425', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 22:27:21', null, '1');
INSERT INTO `user_login_record` VALUES ('426', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 22:39:14', null, '1');
INSERT INTO `user_login_record` VALUES ('427', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-20 22:41:50', null, '1');
INSERT INTO `user_login_record` VALUES ('428', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 15:58:43', null, '1');
INSERT INTO `user_login_record` VALUES ('429', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 16:04:31', null, '3');
INSERT INTO `user_login_record` VALUES ('430', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 16:04:46', null, '2');
INSERT INTO `user_login_record` VALUES ('431', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 16:14:32', null, '1');
INSERT INTO `user_login_record` VALUES ('432', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 16:25:26', null, '4');
INSERT INTO `user_login_record` VALUES ('433', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 16:25:49', null, '1');
INSERT INTO `user_login_record` VALUES ('434', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 17:24:47', null, '1');
INSERT INTO `user_login_record` VALUES ('435', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 17:45:14', null, '3');
INSERT INTO `user_login_record` VALUES ('436', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 17:46:01', null, '3');
INSERT INTO `user_login_record` VALUES ('437', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 17:47:58', null, '38');
INSERT INTO `user_login_record` VALUES ('438', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-21 17:48:21', null, '1');
INSERT INTO `user_login_record` VALUES ('439', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-26 23:05:36', null, '1');
INSERT INTO `user_login_record` VALUES ('440', 'Chrome/75.0.3770.100', '172.19.136.157', '2020-03-27 00:34:42', null, '1');
INSERT INTO `user_login_record` VALUES ('441', 'Chrome/75.0.3770.100', '192.168.80.1', '2020-03-27 22:06:30', null, '1');
INSERT INTO `user_login_record` VALUES ('442', 'Safari/13.0.5', '127.0.0.1', '2020-04-10 20:58:13', null, '2');
INSERT INTO `user_login_record` VALUES ('443', 'Chrome 8/81.0.4044.92', '192.168.1.22', '2020-04-10 21:04:45', null, '2');
INSERT INTO `user_login_record` VALUES ('444', 'Chrome 8/81.0.4044.92', '192.168.1.22', '2020-04-10 21:06:36', null, '2');
INSERT INTO `user_login_record` VALUES ('445', 'Safari/13.0.5', '127.0.0.1', '2020-04-11 21:16:29', null, '2');
INSERT INTO `user_login_record` VALUES ('446', 'Safari/13.0.5', '127.0.0.1', '2020-04-11 21:27:18', null, '2');
INSERT INTO `user_login_record` VALUES ('447', 'Chrome 8/81.0.4044.92', '127.0.0.1', '2020-04-11 21:33:08', null, '2');
INSERT INTO `user_login_record` VALUES ('448', 'Chrome 8/81.0.4044.92', '127.0.0.1', '2020-04-11 21:38:55', null, '3');
INSERT INTO `user_login_record` VALUES ('449', 'Chrome 8/81.0.4044.92', '127.0.0.1', '2020-04-11 21:45:10', null, '23');
INSERT INTO `user_login_record` VALUES ('450', 'Chrome 8/81.0.4044.92', '192.168.1.23', '2020-04-11 23:10:29', null, '2');
INSERT INTO `user_login_record` VALUES ('451', 'Chrome 8/81.0.4044.92', '127.0.0.1', '2020-04-12 00:01:50', null, '2');
INSERT INTO `user_login_record` VALUES ('452', 'Chrome 8/81.0.4044.92', '127.0.0.1', '2020-04-12 00:11:52', null, '2');
INSERT INTO `user_login_record` VALUES ('453', 'Chrome/75.0.3770.100', '172.20.10.5', '2020-05-17 12:48:19', null, '1');
