/*
 Navicat Premium Data Transfer

 Source Server Type    : MySQL
 Source Server Version : 50728
 Source Schema         : conan_test

 Target Server Type    : MySQL
 Target Server Version : 50728
 File Encoding         : 65001

 Date: 25/03/2021 10:54:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `calendar_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `cron_expression` varchar(200) COLLATE utf8_bin NOT NULL,
  `time_zone_id` varchar(80) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', '1/20 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', '0 0 9 * * ? *', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', '0 0 9 * * ? *', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `entry_id` varchar(95) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `job_group` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `job_class_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `is_durable` varchar(1) COLLATE utf8_bin NOT NULL,
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin NOT NULL,
  `is_update_data` varchar(1) COLLATE utf8_bin NOT NULL,
  `requests_recovery` varchar(1) COLLATE utf8_bin NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 'com.tal.wangxiao.conan.sys.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002F636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720038636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017780E183D878737200176A6176612E7574696C2E4C696E6B6564486173684D617034C04E5C106CC0FB0200015A000B6163636573734F726465727871007E00053F400000000000007708000000100000000078007400007074000561646D696E7074000131740010312F3230202A202A202A202A203F202A74003A7461736B506970656C696E65536572766963652E6173796E635461736B5265706C6179506970656C696E652832392C302C226F6E6C696E65222974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000047400047465737474000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', NULL, 'com.tal.wangxiao.conan.sys.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002F636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720038636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000177813BADE078707400007070707400013174000D3020302039202A202A203F202A74003A7461736B506970656C696E65536572766963652E6173796E635461736B5265706C6179506970656C696E652833362C302C226F6E6C696E65222974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000674000334353674000131740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', NULL, 'com.tal.wangxiao.conan.sys.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372002F636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720038636F6D2E74616C2E77616E677869616F2E636F6E616E2E7379732E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000177814A01D878707400007070707400013174000D3020302039202A202A203F202A74003A7461736B506970656C696E65536572766963652E6173796E635461736B5265706C6179506970656C696E652832392C302C226F6E6C696E65222974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B020000787000000000000000077400096C616C6C616C616C6174000131740001317800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `lock_name` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'bj-sjhl-conan-server-test-11615378732090', 1616640949228, 15000);
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'bj-sjhl-conan-server-test-21611028023691', 1616640953152, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `str_prop_1` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `str_prop_2` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `str_prop_3` varchar(512) COLLATE utf8_bin DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  `bool_prop_2` varchar(1) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL,
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL,
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) COLLATE utf8_bin NOT NULL,
  `trigger_type` varchar(8) COLLATE utf8_bin NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME4', 'DEFAULT', 'TASK_CLASS_NAME4', 'DEFAULT', NULL, 1616639961000, -1, 5, 'PAUSED', 'CRON', 1616639960000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME6', 'DEFAULT', 'TASK_CLASS_NAME6', 'DEFAULT', NULL, 1615424400000, -1, 5, 'PAUSED', 'CRON', 1615378737000, 0, NULL, -1, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME7', 'DEFAULT', 'TASK_CLASS_NAME7', 'DEFAULT', NULL, 1615424400000, -1, 5, 'PAUSED', 'CRON', 1615378737000, 0, NULL, -1, '');
COMMIT;

-- ----------------------------
-- Table structure for bss_api
-- ----------------------------
DROP TABLE IF EXISTS `bss_api`;
CREATE TABLE `bss_api` (
  `api_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `sys_dept_id` int(11) NOT NULL COMMENT '??????id',
  `domain_id` mediumint(11) NOT NULL COMMENT '????????????id',
  `name` varchar(2048) NOT NULL COMMENT '?????????',
  `method` tinyint(11) NOT NULL COMMENT 'http??????\nGET("GET", 0),\n    POST("POST", 1),\n    PUT("PUT", 2),\n    DELETE("DELETE", 3),\n    HEAD("HEAD", 4),\n    CONNECT("CONNECT", 5),\n    OPTIONS("OPTIONS", 6),\n    TRACE("TRACE", 7);',
  `is_online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '???????????????(0-????????????1-?????????)',
  `is_read` tinyint(1) DEFAULT NULL COMMENT '???????????????(0-??????1-???)',
  `is_enable` tinyint(1) DEFAULT NULL COMMENT '????????????(0-?????????1-??????)',
  `recordable_count` int(11) DEFAULT '0' COMMENT '?????????????????????',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `create_by` int(11) DEFAULT NULL COMMENT '?????????',
  `update_time` datetime(1) DEFAULT CURRENT_TIMESTAMP(1) ON UPDATE CURRENT_TIMESTAMP(1) COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '?????????',
  `response_is_json` smallint(1) DEFAULT '0' COMMENT '?????????????????????json 0/1 ???/??? 2/?????????',
  PRIMARY KEY (`api_id`) USING BTREE,
  KEY `domain_id` (`domain_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=159001 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='???????????????';

-- ----------------------------
-- Records of bss_api
-- ----------------------------
BEGIN;
INSERT INTO `bss_api` VALUES (158920, 205, 181, '/v1/student/classroom/initModule', 1, 1, 1, 1, 5, '2021-01-08 18:39:12', 1, '2021-03-01 15:45:43.0', 1, 0);
INSERT INTO `bss_api` VALUES (158921, 205, 181, '/v1/student/getTeacherMetadata', 1, 1, 1, 1, 0, '2021-02-03 10:30:28', 1, '2021-02-03 10:30:28.0', 1, 0);
INSERT INTO `bss_api` VALUES (158922, 100, 181, '/v1/student/grouping/report', 1, 1, 0, 1, 101, '2021-02-24 15:53:42', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158923, 100, 181, '/v1/student/classroom/plan/enter', 1, 1, 0, 1, 101, '2021-02-24 15:53:43', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158924, 100, 181, '/v1/student/signtask/execute', 1, 1, 0, 1, 29, '2021-02-24 15:53:43', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158925, 100, 181, '/v1/student/grouping/threev3/getGroupHonor', 1, 1, 0, 1, 101, '2021-02-24 15:53:43', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158926, 100, 181, '/v1/student/linkMic/callback', 1, 1, 0, 1, 44, '2021-02-24 15:53:43', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158928, 100, 181, '/v1/student/exam/getStuExamStatus', 1, 1, 0, 1, 30, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158929, 100, 181, '/v1/student/puzzle/getContributeStar', 1, 1, 0, 1, 31, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158930, 100, 181, '/v1/student/grouping/threev3/GetGroup', 1, 1, 0, 1, 0, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158931, 100, 181, '/v1/student/exam/reportStuExamStatus', 1, 1, 0, 1, 7, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158932, 100, 181, '/v1/student/playback/planconfig/mget', 1, 1, 0, 1, 61, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158933, 100, 181, '/v2/student/puzzle/getPkResult', 1, 1, 0, 1, 7, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158934, 100, 181, '/v1/student/grouping/groupInfos/get', 1, 1, 0, 1, 7, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158935, 100, 181, '/v1/student/getVirtualStuData', 1, 1, 0, 1, 4, '2021-02-24 15:53:44', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158936, 100, 181, '/v1/student/signtask/status/get', 1, 1, 0, 1, 101, '2021-02-24 15:53:45', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158937, 100, 181, '/v1/student/linkMic/speak', 1, 1, 0, 1, 1, '2021-02-24 15:53:45', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158938, 100, 181, '/v1/student/exam/getExamClassStuRank', 1, 1, 0, 1, 0, '2021-02-24 15:53:45', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158939, 100, 181, '/v1/student/exam/getStuExamResult', 1, 1, 0, 1, 4, '2021-02-24 15:53:45', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158940, 100, 181, '/v1/student/honour/myCardsStatus', 1, 1, 0, 1, 6, '2021-02-24 15:53:45', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158941, 100, 181, '/v1/student/grouping/getRtcToken', 1, 1, 0, 1, 26, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158942, 100, 181, '/v1/student/barrage/history', 1, 1, 0, 1, 9, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158943, 100, 181, '/v1/student/sign/signedStudents/getList', 1, 1, 0, 1, 99, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158944, 100, 181, '/v1/student/grouping/pkIsGrouped', 1, 1, 0, 1, 5, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158945, 100, 181, '/v1/student/duration/push', 1, 1, 0, 1, 101, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158946, 100, 181, '/v1/student/courseware/preload', 1, 1, 0, 1, 101, '2021-02-24 15:53:46', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158948, 100, 181, '/v1/student/plan/version/mget', 1, 1, 0, 1, 101, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158949, 100, 181, '/v1/student/courseware/answerStatus/get', 1, 1, 0, 1, 39, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158950, 100, 181, '/v1/student/speechshow/submit', 1, 1, 0, 1, 0, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158951, 100, 181, '/v1/student/playback/chatrecord/mget', 1, 1, 0, 1, 13, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158952, 100, 181, '/v1/student/classroom/question3/get', 1, 1, 0, 1, 31, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158953, 100, 181, '/v1/student/namesuggest/getUrl', 1, 1, 0, 1, 41, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158954, 100, 181, '/v1/student/keyframe/classSummary/statistics/get', 1, 1, 0, 1, 0, '2021-02-24 15:53:47', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158955, 100, 181, '/v1/student/courseware/submitV2', 1, 1, 0, 1, 42, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158956, 100, 181, '/v2/student/puzzle/getPkStat', 1, 1, 0, 1, 48, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158957, 100, 181, '/v1/student/courseware/speechSubmit', 1, 1, 0, 1, 65, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158959, 100, 181, '/v1/student/speechshow/reportOpenCamera', 1, 1, 0, 1, 0, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158960, 100, 181, '/v1/student/courseWarePage/get', 1, 1, 0, 1, 28, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158961, 100, 181, '/v1/student/grouping/pkForceGroup', 1, 1, 0, 1, 17, '2021-02-24 15:53:48', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158962, 100, 181, '/v1/student/suquestion/test/get', 1, 1, 0, 1, 2, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158963, 100, 181, '/v1/student/plan/version/get', 1, 1, 0, 1, 43, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158964, 100, 181, '/v1/student/linkMic/speakSelect', 1, 1, 0, 1, 20, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158965, 100, 181, '/v1/student/grouping/threev3/Report', 1, 1, 0, 1, 24, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158966, 100, 181, '/v1/student/classroom/planconfig/mget', 1, 1, 0, 1, 101, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158967, 100, 181, '/v1/student/grouping/threev3/getRtcToken', 1, 1, 0, 1, 22, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
INSERT INTO `bss_api` VALUES (158968, 100, 181, '/v1/student/exam/stuSubmitExam', 1, 1, 0, 1, 12, '2021-02-24 15:53:49', 1, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bss_api_rule
-- ----------------------------
DROP TABLE IF EXISTS `bss_api_rule`;
CREATE TABLE `bss_api_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `api_id` int(11) NOT NULL COMMENT 'api id',
  `rule_json` text COLLATE utf8_bin NOT NULL COMMENT '??????????????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bss_api_rule
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_dept_json_rule
-- ----------------------------
DROP TABLE IF EXISTS `bss_dept_json_rule`;
CREATE TABLE `bss_dept_json_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_json` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Schema??????',
  `sys_dept_id` int(11) NOT NULL COMMENT '??????Id',
  `create_time` datetime DEFAULT NULL,
  `create_by` int(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `update_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_dept_json_rule
-- ----------------------------
BEGIN;
INSERT INTO `bss_dept_json_rule` VALUES (13, '{}', 13, NULL, NULL, '2021-01-21 16:12:17', 100);
COMMIT;

-- ----------------------------
-- Table structure for bss_diff
-- ----------------------------
DROP TABLE IF EXISTS `bss_diff`;
CREATE TABLE `bss_diff` (
  `diff_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `task_execution_id` int(11) NOT NULL COMMENT '????????????id',
  `record_id` int(11) DEFAULT NULL COMMENT '??????id',
  `replay_id` int(11) DEFAULT NULL COMMENT '??????id',
  `create_by` int(11) DEFAULT NULL COMMENT '?????????',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `update_time` datetime DEFAULT NULL COMMENT '??????/????????????',
  `success_rate` decimal(11,0) DEFAULT NULL COMMENT '???????????????',
  `diff_error_msg` text,
  PRIMARY KEY (`diff_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='???????????????';

-- ----------------------------
-- Records of bss_diff
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_diff_detail
-- ----------------------------
DROP TABLE IF EXISTS `bss_diff_detail`;
CREATE TABLE `bss_diff_detail` (
  `diff_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `actual_count` int(11) DEFAULT NULL,
  `api_id` int(11) NOT NULL,
  `diff_id` int(11) NOT NULL,
  `expect_count` int(11) NOT NULL,
  PRIMARY KEY (`diff_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_diff_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_domain
-- ----------------------------
DROP TABLE IF EXISTS `bss_domain`;
CREATE TABLE `bss_domain` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `name` varchar(255) NOT NULL COMMENT '??????',
  `online` tinyint(1) NOT NULL DEFAULT '1' COMMENT '???????????????(0-??????1-???)',
  `is_auth` tinyint(1) DEFAULT '0' COMMENT '??????????????????(0-??????1-???)',
  `sys_dept_id` int(11) DEFAULT NULL COMMENT '??????ID',
  `es_source_id` int(11) DEFAULT NULL COMMENT '?????????ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `create_by` int(11) DEFAULT '0' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  `update_by` int(11) DEFAULT '0' COMMENT '?????????',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='???????????????';

-- ----------------------------
-- Records of bss_domain
-- ----------------------------
BEGIN;
INSERT INTO `bss_domain` VALUES (0, 'conan.test.com', 1, 1, NULL, NULL, '2020-12-24 16:52:14', 1, '2021-01-04 18:07:21', 0);
INSERT INTO `bss_domain` VALUES (180, 'string', 0, 0, 103, 1, '2020-12-30 14:15:59', 1, '2021-01-21 15:41:19', 100);
INSERT INTO `bss_domain` VALUES (181, 'studentlive.xueersi.com', 1, 1, 103, 1, '2020-12-30 14:15:59', 1, '2021-01-06 11:49:52', 103);
INSERT INTO `bss_domain` VALUES (184, 'conantest.xesv5.com', 1, 1, 101, 2, '2021-03-01 11:30:23', 1, NULL, 0);
COMMIT;

-- ----------------------------
-- Table structure for bss_domain_auth
-- ----------------------------
DROP TABLE IF EXISTS `bss_domain_auth`;
CREATE TABLE `bss_domain_auth` (
  `auth_id` int(11) NOT NULL AUTO_INCREMENT,
  `curl_url` longtext COLLATE utf8_bin NOT NULL COMMENT '??????URL',
  `response_get_cookie_key` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '??????cookie???header??????key,Cookie\\Token',
  `key_type` tinyint(1) NOT NULL COMMENT '??????cookie????????????1-body???jsonpath?????????2-header????????????',
  `domain_id` int(11) NOT NULL COMMENT '?????????domain_id',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `cookie` longtext COLLATE utf8_bin COMMENT 'cookie??????',
  PRIMARY KEY (`auth_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bss_domain_auth
-- ----------------------------
BEGIN;
INSERT INTO `bss_domain_auth` VALUES (1, 'http://22322789798798798', 'cookie1231321231321200', 1, 0, '2021-02-26 18:32:45', '     ');
INSERT INTO `bss_domain_auth` VALUES (3, 'http://conantest.xesv5.com/admin/domain/domainAuth?id=184', 'cookie', 2, 184, NULL, 'xxx');
COMMIT;

-- ----------------------------
-- Table structure for bss_es_condition_setting
-- ----------------------------
DROP TABLE IF EXISTS `bss_es_condition_setting`;
CREATE TABLE `bss_es_condition_setting` (
  `es_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `index_name` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'ES????????????????????????',
  `domain_id` int(11) NOT NULL COMMENT '??????????????????',
  `api` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'ES???_source??????????????????key?????? ',
  `api_regex` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????',
  `domain` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'ES???_source??????????????????key?????? ',
  `domain_regex` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????',
  `method` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'ES???_source????????????????????????key??????',
  `method_regex` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????????????????',
  `request_body` varchar(45) COLLATE utf8_bin NOT NULL COMMENT 'ES???_source?????????????????????key??????',
  `request_body_regex` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????',
  `header` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'ES???_source?????????????????????key??????',
  `header_regex` varchar(45) COLLATE utf8_bin DEFAULT NULL COMMENT 'Header??????????????????',
  `es_source_id` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`es_setting_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bss_es_condition_setting
-- ----------------------------
BEGIN;
INSERT INTO `bss_es_condition_setting` VALUES (1, 'basiclog-ha-access-*', 181, 'request', '(?<= ).*?(?= )', 'server_name', NULL, 'request_method', NULL, 'request_body', NULL, 'http_cookie', NULL, 1);
INSERT INTO `bss_es_condition_setting` VALUES (4, 'basiclog-ha-access-*', 184, '/api', NULL, 'conantest', '1', 'GET', '1', 'api', '1', '1', '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for bss_es_source
-- ----------------------------
DROP TABLE IF EXISTS `bss_es_source`;
CREATE TABLE `bss_es_source` (
  `es_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `es_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ES??????',
  `es_bean_name` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT 'ES Bean??????(?????????)',
  `es_ip` varchar(255) COLLATE utf8_bin NOT NULL,
  `es_port` int(11) NOT NULL,
  PRIMARY KEY (`es_source_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bss_es_source
-- ----------------------------
BEGIN;
INSERT INTO `bss_es_source` VALUES (1, 'basiclog-ha-access-*', 'haAccess', 'openeclient.xesv5.com', 80);
INSERT INTO `bss_es_source` VALUES (2, '???????????????', 'testBean', '127.0.0.1', 80);
COMMIT;

-- ----------------------------
-- Table structure for bss_record
-- ----------------------------
DROP TABLE IF EXISTS `bss_record`;

CREATE TABLE `bss_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `task_execution_id` int(11) NOT NULL COMMENT '????????????id',
  `api_count` int(11) NULL DEFAULT NULL COMMENT '???????????????',
  `operate_by` int(11) NULL DEFAULT NULL COMMENT '?????????',
  `start_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '????????????',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '????????????',
  `success_rate` decimal(11, 0) NULL DEFAULT NULL COMMENT '???????????????',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `operate_by`(`operate_by`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '???????????????' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bss_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `bss_record_detail`;
CREATE TABLE `bss_record_detail` (
  `record_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `actual_count` int(11) DEFAULT NULL,
  `api_id` int(11) NOT NULL,
  `expect_count` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  PRIMARY KEY (`record_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_record_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_record_result
-- ----------------------------
DROP TABLE IF EXISTS `bss_record_result`;
CREATE TABLE `bss_record_result` (
  `record_result_id` int(11) NOT NULL AUTO_INCREMENT,
  `record_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_bin COMMENT '???????????????body',
  `is_data_dye` int(11) DEFAULT '0' COMMENT '????????????  0?????????  1??????',
  `scene_id` int(11) DEFAULT '0' COMMENT '??????????????????id',
  `header` longtext COLLATE utf8mb4_bin,
  `scene_condition` int(11) DEFAULT '0' COMMENT '??????????????????',
  `request_id` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`record_result_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_record_result
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_replay
-- ----------------------------
DROP TABLE IF EXISTS `bss_replay`;
CREATE TABLE `bss_replay` (
  `replay_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `task_execution_id` int(11) NOT NULL COMMENT '????????????id',
  `record_id` int(11) DEFAULT NULL COMMENT '??????id',
  `operate_by` int(11) DEFAULT NULL COMMENT '?????????',
  `start_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `end_at` datetime DEFAULT NULL COMMENT '????????????',
  `success_rate` decimal(11,0) DEFAULT NULL COMMENT '?????????????????????',
  `is_baseline` tinyint(1) DEFAULT '0' COMMENT '0 ?????????replayId??? baseLine\n1 ?????????replayId??? baseLine',
  `replay_env` varchar(255) DEFAULT NULL COMMENT '????????????',
  `replay_type` int(11) DEFAULT NULL COMMENT '???????????????0-????????????,1-????????????,2-???????????????',
  PRIMARY KEY (`replay_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='???????????????';

-- ----------------------------
-- Records of bss_replay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_replay_detail
-- ----------------------------
DROP TABLE IF EXISTS `bss_replay_detail`;
CREATE TABLE `bss_replay_detail` (
  `replay_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `actual_count` int(11) DEFAULT NULL,
  `api_id` int(11) NOT NULL,
  `expect_count` int(11) NOT NULL,
  `replay_id` int(11) NOT NULL,
  PRIMARY KEY (`replay_detail_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of bss_replay_detail
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_replay_schema_error
-- ----------------------------
DROP TABLE IF EXISTS `bss_replay_schema_error`;
CREATE TABLE `bss_replay_schema_error` (
  `schema_error_id` int(11) NOT NULL AUTO_INCREMENT,
  `replay_id` int(11) NOT NULL COMMENT '??????ID',
  `api_id` int(11) NOT NULL,
  `requst` longtext COLLATE utf8mb4_bin COMMENT '????????????',
  `header` longtext COLLATE utf8mb4_bin COMMENT '?????????',
  `response` longtext COLLATE utf8mb4_bin COMMENT '????????????',
  `error_desc` longtext COLLATE utf8mb4_bin COMMENT '????????????',
  PRIMARY KEY (`schema_error_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_replay_schema_error
-- ----------------------------
BEGIN;
INSERT INTO `bss_replay_schema_error` VALUES (1, 49, 158920, '{\"bizId\":3,\"isPlayback\":0,\"planId\":1157375,\"url\":\"https:\\/\\/studentlive.xueersi.com\\/v1\\/student\\/classroom\\/initModule\",\"classId\":103646,\"stuCouId\":\"9816299\",\"teamId\":1}', '{}', '{\"code\":20601,\"stat\":0,\"msg\":\"cookie???????????????????????????\",\"data\":\"\"}\n', '{???????????????????????????????????????:\"integer\"; ????????????:\"string\"; ??????JsonKey:code; Schemakey????????????\"type\",\"/properties/code\"; ??????????????????0 : \"instance type (integer) does not match any allowed primitive type (allowed: [\\\"string\\\"])\"}; ');
INSERT INTO `bss_replay_schema_error` VALUES (2, 49, 158920, '{\"bizId\":3,\"isPlayback\":0,\"planId\":1157375,\"url\":\"https:\\/\\/studentlive.xueersi.com\\/v1\\/student\\/classroom\\/initModule\",\"classId\":103646,\"stuCouId\":\"9816299\",\"teamId\":1}', '{}', '{\"code\":20601,\"stat\":0,\"msg\":\"cookie???????????????????????????\",\"data\":\"\"}\n', '{???????????????????????????????????????:\"integer\"; ????????????:\"string\"; ??????JsonKey:code; Schemakey????????????\"type\",\"/properties/code\"; ??????????????????0 : \"instance type (integer) does not match any allowed primitive type (allowed: [\\\"string\\\"])\"}; ');
INSERT INTO `bss_replay_schema_error` VALUES (3, 49, 158920, '{\"bizId\":3,\"isPlayback\":0,\"planId\":1157375,\"url\":\"https:\\/\\/studentlive.xueersi.com\\/v1\\/student\\/classroom\\/initModule\",\"classId\":103646,\"stuCouId\":\"9816299\",\"teamId\":1}', '{}', '{\"code\":20601,\"stat\":0,\"msg\":\"cookie???????????????????????????\",\"data\":\"\"}\n', '{???????????????????????????????????????:\"integer\"; ????????????:\"string\"; ??????JsonKey:code; Schemakey????????????\"type\",\"/properties/code\"; ??????????????????0 : \"instance type (integer) does not match any allowed primitive type (allowed: [\\\"string\\\"])\"}; ');
INSERT INTO `bss_replay_schema_error` VALUES (4, 49, 158920, '{\"bizId\":3,\"isPlayback\":0,\"planId\":1157375,\"url\":\"https:\\/\\/studentlive.xueersi.com\\/v1\\/student\\/classroom\\/initModule\",\"classId\":103646,\"stuCouId\":\"9816299\",\"teamId\":1}', '{}', '{\"code\":20601,\"stat\":0,\"msg\":\"cookie???????????????????????????\",\"data\":\"\"}\n', '{???????????????????????????????????????:\"integer\"; ????????????:\"string\"; ??????JsonKey:code; Schemakey????????????\"type\",\"/properties/code\"; ??????????????????0 : \"instance type (integer) does not match any allowed primitive type (allowed: [\\\"string\\\"])\"}; ');
INSERT INTO `bss_replay_schema_error` VALUES (5, 49, 158920, '{\"bizId\":3,\"planId\":1143845,\"stuCouId\":9810440}', '{}', '{\"code\":20601,\"stat\":0,\"msg\":\"cookie???????????????????????????\",\"data\":\"\"}\n', '{???????????????????????????????????????:\"integer\"; ????????????:\"string\"; ??????JsonKey:code; Schemakey????????????\"type\",\"/properties/code\"; ??????????????????0 : \"instance type (integer) does not match any allowed primitive type (allowed: [\\\"string\\\"])\"}; ');
COMMIT;

-- ----------------------------
-- Table structure for bss_schedule_execution
-- ----------------------------
DROP TABLE IF EXISTS `bss_schedule_execution`;
CREATE TABLE `bss_schedule_execution` (
  `schedule_execution_id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(1) NOT NULL COMMENT '???????????????0-?????????1-?????????',
  `task_schedule_id` int(11) NOT NULL COMMENT '????????????ID',
  `task_id` int(11) NOT NULL COMMENT '????????????ID',
  `task_type` int(1) NOT NULL COMMENT '????????????(1-?????????2-??????)',
  `message` varchar(1025) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '????????????',
  `start_at` datetime DEFAULT NULL COMMENT '????????????',
  `operate_by` int(11) DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`schedule_execution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of bss_schedule_execution
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_task
-- ----------------------------
DROP TABLE IF EXISTS `bss_task`;
CREATE TABLE `bss_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `type` tinyint(11) NOT NULL DEFAULT '0' COMMENT '????????????:0 ???????????????1???????????????',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '?????????',
  `status` tinyint(11) NOT NULL DEFAULT '0' COMMENT '0-????????????1-????????????2-???????????????3-???????????????4-???????????? 5-??????????????? 6-??????????????? 7-????????????8-??????????????? 9-????????????',
  `sys_dept_id` mediumint(11) NOT NULL COMMENT '????????????id',
  `create_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '????????????',
  `create_by` int(11) DEFAULT NULL COMMENT '?????????id',
  `update_time` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '?????????id',
  `is_demo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '?????????????????????????????????????????????0-??????1-??????',
  `is_force_lock` tinyint(1) NOT NULL DEFAULT '1' COMMENT '????????????????????????0-???????????????1-???????????????',
  `extend` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '???????????????????????????task???????????????????????????',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_task
-- ----------------------------
BEGIN;
INSERT INTO `bss_task` VALUES (29, 0, '????????????????????????', 3, 205, '2021-01-21 14:55:47.012181', 102, '2021-01-21 14:55:47.012181', NULL, 1, 1, NULL);
INSERT INTO `bss_task` VALUES (42, 0, '22', 1, 100, '2021-03-02 20:32:47.402706', 1, '2021-03-02 20:32:47.402706', NULL, 1, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bss_task_api_relation
-- ----------------------------
DROP TABLE IF EXISTS `bss_task_api_relation`;
CREATE TABLE `bss_task_api_relation` (
  `task_api_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL COMMENT '??????id',
  `api_id` int(11) NOT NULL COMMENT '????????????',
  `record_count` int(11) DEFAULT NULL COMMENT '??????????????????',
  `diff_type` tinyint(2) unsigned zerofill DEFAULT '00' COMMENT '????????????',
  `position` smallint(5) unsigned zerofill DEFAULT '00000' COMMENT '????????????',
  PRIMARY KEY (`task_api_relation_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bss_task_api_relation
-- ----------------------------
BEGIN;
INSERT INTO `bss_task_api_relation` VALUES (1131, 29, 158920, 5, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1132, 29, 158921, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1133, 29, 158922, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1134, 29, 158923, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1135, 29, 158924, 29, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1136, 29, 158925, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1137, 29, 158926, 44, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1138, 29, 158928, 30, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1139, 29, 158929, 31, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1140, 29, 158930, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1141, 29, 158931, 7, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1142, 29, 158932, 61, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1143, 29, 158933, 7, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1144, 29, 158934, 7, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1145, 29, 158935, 4, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1146, 29, 158936, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1147, 29, 158937, 1, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1148, 29, 158938, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1149, 29, 158939, 4, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1150, 29, 158940, 6, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1151, 29, 158941, 26, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1152, 29, 158942, 9, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1153, 29, 158943, 99, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1154, 29, 158944, 5, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1155, 29, 158945, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1156, 29, 158946, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1157, 29, 158948, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1158, 29, 158949, 39, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1159, 29, 158950, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1160, 29, 158951, 13, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1161, 29, 158952, 31, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1162, 29, 158953, 41, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1163, 29, 158954, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1164, 29, 158955, 42, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1165, 29, 158956, 48, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1166, 29, 158957, 65, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1167, 29, 158959, 0, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1168, 29, 158960, 28, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1169, 29, 158961, 17, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1170, 29, 158962, 2, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1171, 29, 158963, 43, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1172, 29, 158964, 20, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1173, 29, 158965, 24, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1174, 29, 158966, 101, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1175, 29, 158967, 22, NULL, NULL);
INSERT INTO `bss_task_api_relation` VALUES (1176, 29, 158968, 12, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for bss_task_execution
-- ----------------------------
DROP TABLE IF EXISTS `bss_task_execution`;
CREATE TABLE `bss_task_execution` (
  `execution_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `task_id` int(11) NOT NULL COMMENT '??????id',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0-????????????1-????????????2-???????????????3-???????????????4-???????????? 5-??????????????? 6-??????????????? 7-????????????8-??????????????? 9-????????????',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `create_by` int(11) DEFAULT NULL COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`execution_id`) USING BTREE,
  KEY `task_id` (`task_id`) USING BTREE,
  KEY `fk_task_execution_1` (`update_by`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='?????????????????????';

-- ----------------------------
-- Records of bss_task_execution
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for bss_task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `bss_task_schedule`;
CREATE TABLE `bss_task_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '????????????Id',
  `schedule_name` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '??????????????????',
  `task_id` int(11) NOT NULL COMMENT '????????????ID',
  `type` int(2) NOT NULL COMMENT '?????????????????????1??????2?????????',
  `cron` varchar(1024) COLLATE utf8mb4_bin NOT NULL COMMENT 'cron?????????',
  `strategy` int(1) NOT NULL COMMENT '????????????\nstrategy=0 ??????\nstrategy=1 ??????1?????????',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `create_by` int(11) DEFAULT NULL COMMENT '????????????',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '????????????',
  `method_name` varchar(500) COLLATE utf8mb4_bin NOT NULL DEFAULT '' COMMENT 'cron??????????????????',
  `cron_task_name` varchar(1024) COLLATE utf8mb4_bin NOT NULL COMMENT '??????????????????bean',
  `status` int(1) NOT NULL COMMENT '???????????????????????????0-?????????1?????????',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of bss_task_schedule
-- ----------------------------
BEGIN;
INSERT INTO `bss_task_schedule` VALUES (1, '????????????????????????', 29, 1, '0 24 18 * * ?', 0, '2021-02-07 19:55:36', 1, '2021-02-07 19:55:36', 1, 'runTask', 'runAutomationScheduleTask', 0);
INSERT INTO `bss_task_schedule` VALUES (2, '????????????', 29, 1, '0 24 8 * * ?', 0, '2021-02-07 20:19:59', 1, '2021-02-07 20:19:59', 1, 'runTask', 'runAutomationScheduleTask', 1);
COMMIT;

-- ----------------------------
-- Table structure for bss_test_user
-- ----------------------------
DROP TABLE IF EXISTS `bss_test_user`;
CREATE TABLE `bss_test_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `type` smallint(2) DEFAULT NULL COMMENT '?????? 0/1 ??????/??????',
  `userId` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '??????ID',
  `status` smallint(255) DEFAULT NULL COMMENT '???????????? 0/1 ??????/??????',
  `sys_dept_id` int(11) DEFAULT NULL COMMENT '??????id',
  `create_time` datetime(6) DEFAULT NULL COMMENT '????????????',
  `create_by` int(11) DEFAULT NULL COMMENT '?????????',
  `update_time` datetime(6) DEFAULT NULL COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '?????????',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of bss_test_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `table_name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `table_comment` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '???????????????',
  `tpl_category` varchar(200) COLLATE utf8_bin DEFAULT 'crud' COMMENT '??????????????????crud???????????? tree???????????????',
  `package_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `business_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `function_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `function_author` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `gen_type` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '?????????????????????0zip????????? 1??????????????????',
  `gen_path` varchar(200) COLLATE utf8_bin DEFAULT '/' COMMENT '??????????????????????????????????????????',
  `options` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='?????????????????????';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (1, 'bss_task', '????????????', 'Task', 'crud', 'com.tal.wangxiao.conan.common', 'admin', 'task', '????????????', 'dengkunnan', '0', '/', '{\"parentMenuId\":\"2001\"}', 'admin', '2020-12-17 18:18:54', '', '2021-01-25 16:05:08', NULL);
INSERT INTO `gen_table` VALUES (2, 'bss_domain', '???????????????', 'Domain', 'crud', 'com.tal.wangxiao.conan.admin', 'admin', 'domain', '????????????', 'dengkunan', '0', '/', NULL, 'admin', '2020-12-21 17:10:04', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'bss_api', '???????????????', 'Api', 'tree', 'com.tal.wangxiao.conan.admin', 'admin', 'api', '????????????', 'dengkunan', '0', '/', '{\"treeCode\":\"sys_dept_id\",\"treeName\":\"sys_dept_id\",\"treeParentCode\":\"id\",\"parentMenuId\":\"2018\"}', 'admin', '2020-12-21 17:55:20', '', '2020-12-24 16:11:25', NULL);
INSERT INTO `gen_table` VALUES (4, 'bss_api_rule', 'Schema????????????', 'ApiRule', 'crud', 'com.tal.wangxiao.conan.admin', 'admin/api', 'rule', '??????Schema??????', 'jiying', '0', '/', '{\"parentMenuId\":\"2010\"}', 'admin', '2020-12-22 16:15:43', '', '2020-12-24 18:04:45', NULL);
INSERT INTO `gen_table` VALUES (5, 'bss_dept_json_rule', '??????Schema????????????', 'DeptJsonRule', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'deptRule', '??????Schema????????????', 'dengkunan', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2020-12-22 16:27:49', '', '2021-01-05 16:33:30', NULL);
INSERT INTO `gen_table` VALUES (6, 'os_agent_config', 'work????????????', 'AgentConfig', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'agent_config', 'work?????????', 'dengkunan', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2020-12-23 10:59:31', '', '2020-12-28 15:35:04', NULL);
INSERT INTO `gen_table` VALUES (7, 'bss_task_api_relation', 'Task??????????????????????????????', 'TaskApiRelation', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'taskApiRelation', 'Task???????????????????????????', 'dengkunan', '0', '/', '{\"parentMenuId\":2002}', 'admin', '2020-12-29 11:02:38', '', '2020-12-29 11:30:38', NULL);
INSERT INTO `gen_table` VALUES (9, 'bss_test_user', '??????????????????', 'TestUser', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'testUser', '??????????????????', 'dengkunan', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32', NULL);
INSERT INTO `gen_table` VALUES (10, 'bss_domain_auth', '????????????', 'DomainAuth', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'domainAuth', '????????????', 'dengkunan', '0', '/', '{}', 'admin', '2020-12-30 16:42:12', '', '2021-02-24 19:20:52', NULL);
INSERT INTO `gen_table` VALUES (11, 'bss_record_detail', '', 'RecordDetail', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'detail', NULL, 'dengkunan', '0', '/', NULL, 'admin', '2021-01-04 19:10:42', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'bss_es_condition_setting', '?????????ES ??????????????????', 'EsConditionSetting', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'esConditionSetting', 'esConditionSetting?????????ES ??????????????????', 'dengkunan', '0', '/', '{}', 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39', NULL);
INSERT INTO `gen_table` VALUES (13, 'bss_es_source', 'ES ????????????????????????????????????ES?????????', 'EsSource', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'esDataSource', 'ES ????????????????????????????????????ES?????????', 'dengkunan', '0', '/', '{\"parentMenuId\":\"2018\"}', 'admin', '2021-01-05 10:42:04', '', '2021-01-05 18:45:53', NULL);
INSERT INTO `gen_table` VALUES (14, 'bss_replay', '???????????????', 'Replay', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'replay', '????????????', 'dengkunan', '0', '/', '{}', 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11', NULL);
INSERT INTO `gen_table` VALUES (16, 'bss_replay_schema_error', '??????schema????????????', 'ReplaySchemaError', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'replaySchemaError', '??????schema????????????', 'dengkunan', '0', '/', '{\"parentMenuId\":2018}', 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34', NULL);
INSERT INTO `gen_table` VALUES (17, 'bss_diff', '???????????????', 'Diff', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'diff', '????????????', 'dengkunan', '0', '/', '{}', 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42', NULL);
INSERT INTO `gen_table` VALUES (18, 'bss_diff_detail', '?????????????????????', 'DiffDetail', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'diffDetail', '?????????????????????', 'dengkunan', '0', '/', '{}', 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34', NULL);
INSERT INTO `gen_table` VALUES (19, 'bss_replay_detail', '', 'ReplayDetail', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'detail', NULL, 'dengkunan', '0', '/', NULL, 'admin', '2021-01-18 19:39:53', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (20, 'bss_task_execution', '?????????????????????', 'TaskExecution', 'crud', 'com.tal.wangxiao.conan.common', 'common', 'execution', '??????????????????', 'dengkunan', '0', '/', NULL, 'huyaoguo', '2021-01-22 17:06:53', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????',
  `column_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `column_comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `column_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA??????',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA?????????',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_increment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_required` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '???????????????1??????',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????1??????',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????????????????1??????',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT 'EQ' COMMENT '???????????????????????????????????????????????????????????????',
  `html_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????????????????????????????????????????????????????????????????????????????',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `sort` int(11) DEFAULT NULL COMMENT '??????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????????????????';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '??????id', 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:08');
INSERT INTO `gen_table_column` VALUES (2, '1', 'type', '????????????:0 ???????????????1???????????????', 'tinyint(11)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'bss_task_type', 2, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:08');
INSERT INTO `gen_table_column` VALUES (3, '1', 'name', '?????????', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (4, '1', 'status', '0-????????????1-????????????2-???????????????3-???????????????4-???????????? 5-??????????????? 6-??????????????? 7-????????????8-??????????????? 9-????????????', 'tinyint(11)', 'Integer', 'status', '0', '0', NULL, '1', NULL, '1', '1', 'EQ', 'radio', 'bss_task_status', 4, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (5, '1', 'sys_dept_id', '????????????id', 'mediumint(11)', 'Integer', 'sysDeptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (10, '1', 'is_demo', '?????????????????????????????????????????????0-??????1-??????', 'tinyint(1)', 'Integer', 'isDemo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'bss_task_is_demo', 10, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (11, '1', 'is_force_lock', '????????????????????????0-???????????????1-???????????????', 'tinyint(1)', 'Integer', 'isForceLock', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'bss_task_is_force_lock', 11, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (12, '1', 'extend', '???????????????????????????task???????????????????????????', 'varchar(255)', 'String', 'extend', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-12-17 18:18:55', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (15, '1', 'create_by', '?????????id', 'mediumint(11)', 'Integer', 'createBy', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 7, '', '2020-12-17 21:06:15', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (16, '1', 'update_by', '?????????id', 'mediumint(11)', 'Integer', 'updateBy', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 9, '', '2020-12-17 21:06:15', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (17, '1', 'create_time', '????????????', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'datetime', '', 6, '', '2020-12-18 11:41:16', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (18, '1', 'update_time', '????????????', 'datetime(6)', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'datetime', '', 8, '', '2020-12-18 11:41:16', '', '2021-01-25 16:05:09');
INSERT INTO `gen_table_column` VALUES (19, '2', 'id', '??????id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'name', '??????', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'online', '???????????????(0-??????1-???)', 'tinyint(1)', 'Integer', 'online', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'create_time', '????????????', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'create_by', '?????????', 'int(11)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '2', 'update_time', '????????????', 'datetime', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '2', 'update_by', '?????????', 'int(11)', 'Long', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '2', 'is_auth', '??????????????????(0-??????1-???)', 'tinyint(1)', 'Integer', 'isAuth', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-21 17:10:04', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'id', '??????id', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-21 17:55:20', '', '2020-12-24 16:11:25');
INSERT INTO `gen_table_column` VALUES (28, '3', 'sys_dept_id', NULL, 'mediumint(11)', 'Long', 'sysDeptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-21 17:55:20', '', '2020-12-24 16:11:25');
INSERT INTO `gen_table_column` VALUES (29, '3', 'domain_id', '????????????id', 'mediumint(11)', 'Long', 'domainId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-21 17:55:20', '', '2020-12-24 16:11:25');
INSERT INTO `gen_table_column` VALUES (30, '3', 'name', '?????????', 'varchar(2048)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'textarea', '', 4, 'admin', '2020-12-21 17:55:20', '', '2020-12-24 16:11:25');
INSERT INTO `gen_table_column` VALUES (32, '3', 'method', 'http??????\nGET(\"GET\", 0),\n    POST(\"POST\", 1),\n    PUT(\"PUT\", 2),\n    DELETE(\"DELETE\", 3),\n    HEAD(\"HEAD\", 4),\n    CONNECT(\"CONNECT\", 5),\n    OPTIONS(\"OPTIONS\", 6),\n    TRACE(\"TRACE\", 7);', 'tinyint(11)', 'Long', 'method', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:25');
INSERT INTO `gen_table_column` VALUES (33, '3', 'is_online', '???????????????(0-????????????1-?????????)', 'tinyint(1)', 'Integer', 'isOnline', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (34, '3', 'is_read', '???????????????(0-??????1-???)', 'tinyint(1)', 'Integer', 'isRead', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (35, '3', 'is_enable', '????????????(0-?????????1-??????)', 'tinyint(1)', 'Integer', 'isEnable', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'bss_isEnable_status', 9, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (36, '3', 'recordable_count', '?????????????????????', 'int(11)', 'Long', 'recordableCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (37, '3', 'create_time', '????????????', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (38, '3', 'create_by', '?????????', 'mediumint(11)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (39, '3', 'update_time', '????????????', 'datetime(1)', 'Date', 'updateTime', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (40, '3', 'update_by', '?????????', 'mediumint(11)', 'Long', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2020-12-21 17:55:21', '', '2020-12-24 16:11:26');
INSERT INTO `gen_table_column` VALUES (41, '4', 'id', 'id', 'int(11)', 'Integer', 'id', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-22 16:15:43', '', '2020-12-24 18:04:45');
INSERT INTO `gen_table_column` VALUES (42, '4', 'api_id', 'api_id', 'int(11)', 'Integer', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-22 16:15:43', '', '2020-12-24 18:04:45');
INSERT INTO `gen_table_column` VALUES (43, '4', 'rule_json', '??????????????????', 'text', 'String', 'ruleJson', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-22 16:15:43', '', '2020-12-24 18:04:45');
INSERT INTO `gen_table_column` VALUES (44, '5', 'id', NULL, 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-22 16:27:49', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (45, '5', 'rule_json', 'Schema??????', 'varchar(255)', 'String', 'ruleJson', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-22 16:27:49', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (47, '6', 'id', '??????', 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-23 10:59:31', '', '2020-12-28 15:35:05');
INSERT INTO `gen_table_column` VALUES (48, '6', 'name', 'kafka???groupId', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-12-23 10:59:31', '', '2020-12-28 15:35:05');
INSERT INTO `gen_table_column` VALUES (49, '6', 'is_enable', '???????????????0-?????????1-??????', 'tinyint(1)', 'Integer', 'isEnable', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'os_agent_work_status', 3, 'admin', '2020-12-23 10:59:31', '', '2020-12-28 15:35:05');
INSERT INTO `gen_table_column` VALUES (50, '6', 'is_busy', '???????????????0-?????????1-????????????2-', 'tinyint(1)', 'Integer', 'isBusy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'os_agent_work_run_status', 4, 'admin', '2020-12-23 10:59:31', '', '2020-12-28 15:35:05');
INSERT INTO `gen_table_column` VALUES (51, '7', 'id', '?????????ID', 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-29 11:02:38', '', '2020-12-29 11:30:38');
INSERT INTO `gen_table_column` VALUES (52, '7', 'task_id', 'Task??????ID', 'int(11)', 'Integer', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-29 11:02:38', '', '2020-12-29 11:30:38');
INSERT INTO `gen_table_column` VALUES (53, '7', 'api_id', '??????ID', 'int(11)', 'Integer', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-29 11:02:38', '', '2020-12-29 11:30:38');
INSERT INTO `gen_table_column` VALUES (54, '7', 'record_count', '???????????????', 'int(11)', 'Integer', 'recordCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-29 11:02:38', '', '2020-12-29 11:30:38');
INSERT INTO `gen_table_column` VALUES (55, '7', 'diff_type', '????????????', 'tinyint(2) unsigned zerofill', 'Integer', 'diffType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, '', '2020-12-29 16:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '7', 'order', '????????????', 'smallint(5) unsigned zerofill', 'Integer', 'order', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, '', '2020-12-29 16:12:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, '9', 'id', 'id', 'int(11)', 'Integer', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (69, '9', 'username', '??????', 'varchar(255)', 'String', 'username', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (70, '9', 'password', '??????', 'varchar(255)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (71, '9', 'type', '??????', 'smallint(2)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'bss_test_type', 4, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (72, '9', 'userId', '??????ID', 'varchar(255)', 'String', 'userid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (73, '9', 'status', '????????????', 'smallint(255)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'bss_test_status', 6, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (74, '9', 'sys_dept_id', '??????id', 'int(11)', 'Integer', 'sysDeptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (75, '9', 'create_time', '????????????', 'datetime(6)', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'datetime', '', 8, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:32');
INSERT INTO `gen_table_column` VALUES (76, '9', 'create_by', '?????????', 'int(11)', 'Integer', 'createBy', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'input', '', 9, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:33');
INSERT INTO `gen_table_column` VALUES (77, '9', 'update_time', '????????????', 'datetime(6)', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, '1', 'EQ', 'datetime', '', 10, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:33');
INSERT INTO `gen_table_column` VALUES (78, '9', 'update_by', '?????????', 'int(11)', 'Integer', 'updateBy', '0', '0', NULL, '1', '1', NULL, '1', 'EQ', 'input', '', 11, 'admin', '2020-12-30 14:44:00', '', '2021-01-05 18:07:33');
INSERT INTO `gen_table_column` VALUES (84, '11', 'id', NULL, 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-04 19:10:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, '11', 'actual_count', NULL, 'int(11)', 'Long', 'actualCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-04 19:10:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, '11', 'api_id', NULL, 'int(11)', 'Long', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-04 19:10:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, '11', 'expect_count', NULL, 'int(11)', 'Long', 'expectCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-04 19:10:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, '11', 'record_id', NULL, 'int(11)', 'Long', 'recordId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-04 19:10:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, '12', 'index_name', 'ES????????????????????????', 'varchar(45)', 'String', 'indexName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (91, '12', 'domain_id', '??????????????????', 'varchar(45)', 'Integer', 'domainId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (92, '12', 'api', 'ES???_source??????????????????key?????? ', 'varchar(45)', 'String', 'api', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (93, '12', 'api_regex', '?????????????????????', 'varchar(45)', 'String', 'apiRegex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (94, '12', 'domain', 'ES???_source??????????????????key?????? ', 'varchar(45)', 'String', 'domain', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (95, '12', 'domain_regex', '?????????????????????', 'varchar(45)', 'String', 'domainRegex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (96, '12', 'method', 'ES???_source????????????????????????key??????', 'varchar(45)', 'String', 'method', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (97, '12', 'method_regex', '??????????????????????????????', 'varchar(45)', 'String', 'methodRegex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:39');
INSERT INTO `gen_table_column` VALUES (98, '12', 'request_body', 'ES???_source?????????????????????key??????', 'varchar(45)', 'String', 'requestBody', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:40');
INSERT INTO `gen_table_column` VALUES (99, '12', 'request_body_regex', '????????????????????????', 'varchar(45)', 'String', 'requestBodyRegex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:40');
INSERT INTO `gen_table_column` VALUES (100, '12', 'header', 'ES???_source?????????????????????key??????', 'varchar(45)', 'String', 'header', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:40');
INSERT INTO `gen_table_column` VALUES (101, '12', 'header_regex', 'Header??????????????????', 'varchar(45)', 'String', 'headerRegex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 10:51:40');
INSERT INTO `gen_table_column` VALUES (103, '13', 'es_name', 'ES??????', 'varchar(255)', 'String', 'esName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 18:45:53');
INSERT INTO `gen_table_column` VALUES (104, '13', 'es_bean_name', 'ES Bean??????(?????????)', 'varchar(255)', 'String', 'esBeanName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 18:45:53');
INSERT INTO `gen_table_column` VALUES (105, '13', 'es_ip', 'ip', 'varchar(255)', 'String', 'esIp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 18:45:53');
INSERT INTO `gen_table_column` VALUES (106, '13', 'es_port', 'port', 'int(11)', 'Integer', 'esPort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-05 10:42:04', '', '2021-01-05 18:45:53');
INSERT INTO `gen_table_column` VALUES (107, '12', 'es_setting_id', NULL, 'int(11)', 'Long', 'esSettingId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2021-01-05 10:48:39', '', NULL);
INSERT INTO `gen_table_column` VALUES (108, '13', 'es_source_id', 'sourceid', 'int(11)', 'Integer', 'esSourceId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2021-01-05 10:48:41', '', '2021-01-05 18:45:53');
INSERT INTO `gen_table_column` VALUES (109, '14', 'id', '??????id', 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (110, '14', 'task_execution_id', '????????????id', 'int(11)', 'Integer', 'taskExecutionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (111, '14', 'record_id', '??????id', 'int(11)', 'Integer', 'recordId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (112, '14', 'operate_by', '?????????', 'int(11)', 'Integer', 'operateBy', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (113, '14', 'start_at', '????????????', 'datetime', 'Date', 'startAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (114, '14', 'end_at', '????????????', 'datetime', 'Date', 'endAt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (115, '14', 'success_rate', '?????????????????????', 'varchar(256)', 'String', 'successRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (116, '14', 'is_baseline', '0 ?????????replayId??? baseLine\n1 ?????????replayId??? baseLine', 'tinyint(1)', 'Integer', 'isBaseline', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (117, '14', 'replay_env', '????????????', 'varchar(255)', 'String', 'replayEnv', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'bss_replay_env', 9, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (118, '14', 'replay_type', '???????????????0-????????????,2-????????????,3-???????????????', 'int(11)', 'Integer', 'replayType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'bss_replay_type', 10, 'admin', '2021-01-05 11:56:31', '', '2021-01-05 15:20:11');
INSERT INTO `gen_table_column` VALUES (119, '2', 'sys_dept_id', '??????ID', 'int(11)', 'Long', 'sysDeptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, '', '2021-01-05 14:36:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (120, '2', 'es_source_id', '?????????ID', 'int(11)', 'Long', 'esSourceId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, '', '2021-01-05 14:36:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (121, '5', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, '', '2021-01-05 16:26:11', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (122, '5', 'create_by', NULL, 'int(255)', 'Integer', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, '', '2021-01-05 16:26:11', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (123, '5', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, '', '2021-01-05 16:26:11', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (124, '5', 'update_by', NULL, 'int(11)', 'Integer', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, '', '2021-01-05 16:26:11', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (125, '5', 'sys_dept_id', '??????Id', 'int(11)', 'Integer', 'sysDeptId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-01-05 16:32:49', '', '2021-01-05 16:33:30');
INSERT INTO `gen_table_column` VALUES (138, '16', 'schema_error_id', NULL, 'int(11)', 'Integer', 'schemaErrorId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (139, '16', 'replay_id', '??????ID', 'int(11)', 'Integer', 'replayId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (140, '16', 'api_id', NULL, 'int(11)', 'Integer', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (141, '16', 'requst', '????????????', 'longtext', 'String', 'requst', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (142, '16', 'header', '?????????', 'longtext', 'String', 'header', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (143, '16', 'response', '????????????', 'longtext', 'String', 'response', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (144, '16', 'error_desc', '????????????', 'longtext', 'String', 'errorDesc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-01-07 16:03:59', '', '2021-01-07 16:06:34');
INSERT INTO `gen_table_column` VALUES (145, '17', 'id', '??????id', 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (146, '17', 'task_execution_id', '????????????id', 'int(11)', 'Integer', 'taskExecutionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (147, '17', 'record_id', '??????id', 'int(11)', 'Integer', 'recordId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (148, '17', 'replay_id', '??????id', 'int(11)', 'Integer', 'replayId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (149, '17', 'create_by', '?????????', 'int(11)', 'Integer', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (150, '17', 'create_time', '????????????', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (151, '17', 'update_time', '??????/????????????', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 7, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (152, '17', 'success_rate', '???????????????', 'varchar(255)', 'String', 'successRate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (153, '17', 'diff_error_msg', NULL, 'text', 'String', 'diffErrorMsg', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:07:42');
INSERT INTO `gen_table_column` VALUES (154, '18', 'id', NULL, 'int(11)', 'Integer', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34');
INSERT INTO `gen_table_column` VALUES (155, '18', 'actual_count', NULL, 'int(11)', 'Integer', 'actualCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34');
INSERT INTO `gen_table_column` VALUES (156, '18', 'api_id', NULL, 'int(11)', 'Integer', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34');
INSERT INTO `gen_table_column` VALUES (157, '18', 'diff_id', NULL, 'int(11)', 'Integer', 'diffId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34');
INSERT INTO `gen_table_column` VALUES (158, '18', 'expect_count', NULL, 'int(11)', 'Integer', 'expectCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'dengkn', '2021-01-08 17:06:43', '', '2021-01-08 17:08:34');
INSERT INTO `gen_table_column` VALUES (159, '19', 'replay_detail_id', NULL, 'int(11)', 'Long', 'replayDetailId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-01-18 19:39:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, '19', 'actual_count', NULL, 'int(11)', 'Long', 'actualCount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-01-18 19:39:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (161, '19', 'api_id', NULL, 'int(11)', 'Long', 'apiId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-01-18 19:39:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (162, '19', 'expect_count', NULL, 'int(11)', 'Long', 'expectCount', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-01-18 19:39:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (163, '19', 'replay_id', NULL, 'int(11)', 'Long', 'replayId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-01-18 19:39:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (164, '20', 'execution_id', '??????id', 'int(11)', 'Long', 'executionId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (165, '20', 'task_id', '??????id', 'int(11)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (166, '20', 'status', 'RREDY(\"?????????\", 0),\n    RECORD(\"?????????\", 1),\n    RECORD_SUCCESS(\"????????????\", 2),\n    RECORD_FAIL(\"????????????\", 3),\n    REPLAY(\"?????????\", 4),\n    REPLAY_SUCCESS(\"????????????\", 5),\n    REPLAY_FAIL(\"????????????\", 6),\n    DIFF(\"?????????\", 7),\n    DIFF_SUCCESS(\"????????????\", 8),\n    DIFF_FAIL(\"????????????\", 9),\n    DOING(\"?????????\",10),\n    END(\"????????????\",11),\n    WRONG(\"????????????\",12);', 'int(11)', 'Long', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (167, '20', 'create_time', '????????????', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (168, '20', 'create_by', '?????????', 'int(11)', 'Long', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (169, '20', 'update_time', '????????????', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 6, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (170, '20', 'update_by', '?????????', 'int(11)', 'Long', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'huyaoguo', '2021-01-22 17:06:53', '', NULL);
INSERT INTO `gen_table_column` VALUES (179, '10', 'auth_id', NULL, 'int(11)', 'Integer', 'authId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (180, '10', 'curl_url', '??????URL', 'longtext', 'String', 'curlUrl', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (181, '10', 'response_get_cookie_key', '??????cookie???header??????key,Cookie\\Token', 'varchar(255)', 'String', 'responseGetCookieKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (182, '10', 'key_type', '??????cookie????????????1-body???jsonpath?????????2-header????????????', 'tinyint(1)', 'Integer', 'keyType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'bss_request_type', 4, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (183, '10', 'domain_id', '?????????domain_id', 'int(11)', 'Integer', 'domainId', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'input', '', 5, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (184, '10', 'update_time', '????????????', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 6, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
INSERT INTO `gen_table_column` VALUES (185, '10', 'cookie', 'cookie??????', 'longtext', 'String', 'cookie', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'input', '', 7, '', '2021-02-22 19:54:46', '', '2021-02-24 19:20:52');
COMMIT;

-- ----------------------------
-- Table structure for os_agent_node
-- ----------------------------
DROP TABLE IF EXISTS `os_agent_node`;
CREATE TABLE `os_agent_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '???????????????groupId',
  `name` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '????????????',
  `ip_address` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '??????IP??????',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '0-??????, 1-?????????2-??????',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
  `agent_id` varchar(9999) COLLATE utf8mb4_bin NOT NULL COMMENT 'agentId???????????????',
  `agent_env` varchar(255) COLLATE utf8mb4_bin NOT NULL COMMENT '??????????????????(??????agent??????????????????)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=344 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of os_agent_node
-- ----------------------------
BEGIN;
INSERT INTO `os_agent_node` VALUES (277, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-02-25 18:35:10', 'f88f2374-1e27-439f-abe2-7b38067237a4', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (319, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-02 16:50:00', '97752d91-dc41-4a0d-83b5-2746c7ab0a40', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (323, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-03 17:50:00', '3ce8eebf-04eb-4543-997f-4ae4d886cf7b', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (330, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-03 19:35:00', '7a2a9ffc-88df-4bdd-95c7-247f17784b93', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (331, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-04 14:55:00', 'af56e09a-8fb0-4649-b650-84cd419b1806', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (334, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-04 16:00:16', '7e88bf8e-2803-4461-9d38-115da134f3b6', 'ONLINE');
INSERT INTO `os_agent_node` VALUES (340, 'localhost', '127.0.0.1', 0, '2021-03-16 20:55:00', '641d7620-b2b1-4d96-92de-0666f98b0798', 'LOCAL');
INSERT INTO `os_agent_node` VALUES (343, 'bj-sjhl-conan-server-test-1', '10.90.72.128', 0, '2021-03-24 17:05:00', '73f32070-437b-4723-9e99-cd9e4fe50de3', 'ONLINE');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `config_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_key` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_value` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `config_type` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '????????????-????????????????????????', 'sys.index.skinName', 'skin-purple', 'Y', 'admin', '2020-12-08 10:25:28', 'admin', '2020-12-11 10:43:31', '?????? skin-blue????????? skin-green????????? skin-purple????????? skin-red????????? skin-yellow');
INSERT INTO `sys_config` VALUES (2, '????????????-??????????????????', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-12-08 10:25:28', 'admin', '2020-12-11 10:40:39', '??????????????? 123456');
INSERT INTO `sys_config` VALUES (3, '????????????-???????????????', 'sys.index.sideTheme', 'theme-light', 'Y', 'admin', '2020-12-08 10:25:28', 'admin', '2020-12-11 10:42:41', '????????????theme-dark???????????????theme-light');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '?????????id',
  `ancestors` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `order_num` int(4) DEFAULT '0' COMMENT '????????????',
  `leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '?????????',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=206 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='?????????';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '???????????????', 0, '?????????', '15888888888', 'zhangbx@qq.com', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:07:11');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '???????????????', 1, '???????????????', '15888888888', 'wx@qq.com', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:04:52');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '???????????????', 2, '???????????????', '15888888888', '', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:07:11');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', 'conan??????', 1, '????????????', '15888888888', '????????????@qq.com', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:04:42');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '?????????', 1, '?????????', '15888888888', '', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:01:29');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '????????????', 3, 'conan', '15888888888', 'conan@qq.com', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:04:52');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '????????????', 4, 'conan', '15888888888', 'conan@qq.com', '0', '2', 'admin', '2020-12-08 10:25:23', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '????????????', 5, 'conan', '15888888888', 'conan@qq.com', '0', '2', 'admin', '2020-12-08 10:25:23', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '????????????', 1, '', '15888888888', '', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:06:57');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '????????????', 2, '', '15888888888', '', '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-11 18:07:11');
INSERT INTO `sys_dept` VALUES (200, 103, '0,100,101,103', '?????????', 1, NULL, NULL, NULL, '0', '2', 'admin', '2020-12-11 18:00:23', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 104, '0,100,101,104', '??????APP', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-12-11 18:01:54', '', NULL);
INSERT INTO `sys_dept` VALUES (202, 104, '0,100,101,104', '????????????', 2, NULL, NULL, NULL, '0', '0', 'admin', '2020-12-11 18:02:13', '', NULL);
INSERT INTO `sys_dept` VALUES (203, 104, '0,100,101,104', '????????????', 3, NULL, NULL, NULL, '0', '0', 'admin', '2020-12-11 18:02:38', '', NULL);
INSERT INTO `sys_dept` VALUES (204, 105, '0,100,101,105', '?????????', 1, NULL, NULL, NULL, '0', '0', 'admin', '2020-12-11 18:05:08', '', NULL);
INSERT INTO `sys_dept` VALUES (205, 101, '0,100,101', '????????????', 1, '?????????', NULL, NULL, '0', '0', 'liujs', '2021-01-21 14:51:35', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_sort` int(4) DEFAULT '0' COMMENT '????????????',
  `dict_label` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_value` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `css_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????????????????????????????',
  `list_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '??????????????????',
  `is_default` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '???????????????Y??? N??????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '???', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '?????????');
INSERT INTO `sys_dict_data` VALUES (2, 2, '???', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '?????????');
INSERT INTO `sys_dict_data` VALUES (3, 3, '??????', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (4, 1, '??????', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (5, 2, '??????', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (6, 1, '??????', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (7, 2, '??????', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (8, 1, '??????', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (9, 2, '??????', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (10, 1, '??????', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (11, 2, '??????', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (12, 1, '???', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '???????????????');
INSERT INTO `sys_dict_data` VALUES (13, 2, '???', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '???????????????');
INSERT INTO `sys_dict_data` VALUES (14, 1, '??????', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '??????');
INSERT INTO `sys_dict_data` VALUES (15, 2, '??????', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '??????');
INSERT INTO `sys_dict_data` VALUES (16, 1, '??????', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (17, 2, '??????', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (18, 1, '??????', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (19, 2, '??????', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (20, 3, '??????', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (21, 4, '??????', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (22, 5, '??????', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (23, 6, '??????', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (24, 7, '??????', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (25, 8, '????????????', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (26, 9, '????????????', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (27, 1, '??????', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (28, 2, '??????', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-12-08 10:25:28', '', NULL, '????????????');
INSERT INTO `sys_dict_data` VALUES (100, 0, '?????????', '1', 'bss_online_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 10:51:09', 'admin', '2020-12-23 10:51:38', NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '?????????', '0', 'bss_online_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 10:51:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '???', '1', 'bss_authentication_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:02:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '???', '0', 'bss_authentication_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:02:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 0, '??????', '0', 'os_agent_work_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:06:00', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 0, '??????', '1', 'os_agent_work_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:06:10', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '??????', '0', 'os_agent_work_run_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:10:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '?????????', '1', 'os_agent_work_run_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 11:11:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, 'GET', '0', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:19:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, 'POST', '1', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:19:47', 'admin', '2020-12-23 18:19:52', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, 'PUT', '2', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:20:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 3, 'DELETE', '3', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:20:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 4, 'HEAD', '4', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:20:31', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 5, 'CONNECT', '5', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:20:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 6, 'OPTIONS', '6', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:20:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 7, 'TRACE', '7', 'bss_method_status', NULL, NULL, 'N', '0', 'admin', '2020-12-23 18:21:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 0, '??????', '0', 'bss_isEnable_status', NULL, NULL, 'N', '0', 'admin', '2020-12-24 11:44:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 1, '??????', '1', 'bss_isEnable_status', NULL, NULL, 'N', '0', 'admin', '2020-12-24 11:45:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 0, '????????????', '0', 'bss_task_type', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:00:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '???????????????', '1', 'bss_task_type', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:00:51', 'admin', '2020-12-28 15:01:33', NULL);
INSERT INTO `sys_dict_data` VALUES (120, 0, '?????????', '0', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:02:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 1, '?????????', '1', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:03:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 2, '????????????', '2', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:03:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 3, '????????????', '3', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:04:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 4, '?????????', '4', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:04:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 5, '????????????', '5', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:04:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 6, '????????????', '6', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:05:02', 'admin', '2020-12-28 15:05:15', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 7, '?????????', '7', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:05:29', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 8, '????????????', '8', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:05:46', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 9, '????????????', '9', 'bss_task_status', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:06:02', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 0, '???', '0', 'bss_task_is_demo', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:08:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 1, '???', '1', 'bss_task_is_demo', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:08:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, '????????????', '0', 'bss_task_is_force_lock', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:10:25', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 1, '????????????', '1', 'bss_task_is_force_lock', NULL, NULL, 'N', '0', 'admin', '2020-12-28 15:10:45', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (135, 0, '????????????', '1', 'bss_replay_type', NULL, NULL, 'N', '0', 'admin', '2021-01-05 14:40:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (136, 1, '????????????', '2', 'bss_replay_type', NULL, NULL, 'N', '0', 'admin', '2021-01-05 14:40:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (137, 2, 'openApi??????', '3', 'bss_replay_type', NULL, NULL, 'N', '0', 'admin', '2021-01-05 14:41:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (138, 1, '????????????', 'online', 'bss_replay_env', NULL, NULL, 'N', '0', 'admin', '2021-01-05 15:13:39', 'admin', '2021-01-05 15:14:27', NULL);
INSERT INTO `sys_dict_data` VALUES (139, 2, '????????????', 'gray', 'bss_replay_env', NULL, NULL, 'N', '0', 'admin', '2021-01-05 15:13:53', 'admin', '2021-01-05 15:14:19', NULL);
INSERT INTO `sys_dict_data` VALUES (140, 3, '????????????', 'test', 'bss_replay_env', NULL, NULL, 'N', '0', 'admin', '2021-01-05 15:14:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (141, 1, '??????', '1', 'bss_test_type', NULL, NULL, 'N', '0', 'admin', '2021-01-05 17:55:30', 'jiy', '2021-01-05 18:04:29', NULL);
INSERT INTO `sys_dict_data` VALUES (142, 0, '??????', '0', 'bss_test_type', NULL, NULL, 'N', '0', 'admin', '2021-01-05 17:55:42', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (143, 1, '??????', '1', 'bss_test_status', NULL, NULL, 'N', '0', 'jiy', '2021-01-05 18:10:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (144, 0, '??????', '0', 'bss_test_status', NULL, NULL, 'N', '0', 'jiy', '2021-01-05 18:10:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (145, 0, '????????????&??????????????????&??????????????????', '0', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:33:07', 'admin', '2021-01-15 14:22:01', NULL);
INSERT INTO `sys_dict_data` VALUES (146, 1, '????????????&????????????', '1', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:33:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (147, 2, '???????????????', '2', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:34:43', 'dengkn', '2021-01-06 15:35:02', NULL);
INSERT INTO `sys_dict_data` VALUES (148, 3, 'value??????', '3', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:35:56', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (149, 4, 'value??????&????????????', '4', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:36:19', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (150, 5, '????????????&??????????????????', '5', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:38:38', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (151, 6, '????????????&??????????????????&??????????????????', '6', 'bss_task_api_relation_diff_type', NULL, NULL, 'N', '0', 'dengkn', '2021-01-06 15:39:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (156, 0, 'body???jsonpath??????', '1', 'bss_cookie_info', NULL, NULL, 'N', '0', 'jiy', '2021-02-25 16:24:49', '', NULL, 'body???jsonpath??????');
INSERT INTO `sys_dict_data` VALUES (157, 1, 'header?????????', '2', 'bss_cookie_info', NULL, NULL, 'N', '0', 'jiy', '2021-02-25 16:25:07', '', NULL, 'header?????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `dict_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '????????????', 'sys_user_sex', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (2, '????????????', 'sys_show_hide', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (3, '????????????', 'sys_normal_disable', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (4, '????????????', 'sys_job_status', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (5, '????????????', 'sys_job_group', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (6, '????????????', 'sys_yes_no', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (7, '????????????', 'sys_notice_type', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (8, '????????????', 'sys_notice_status', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (9, '????????????', 'sys_oper_type', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (10, '????????????', 'sys_common_status', '0', 'admin', '2020-12-08 10:25:27', '', NULL, '??????????????????');
INSERT INTO `sys_dict_type` VALUES (100, '????????????', 'bss_online_status', '0', 'admin', '2020-12-23 10:46:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '??????', 'bss_authentication_status', '0', 'admin', '2020-12-23 11:02:30', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, 'work????????????', 'os_agent_work_status', '0', 'admin', '2020-12-23 11:04:29', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, 'work??????????????????', 'os_agent_work_run_status', '0', 'admin', '2020-12-23 11:04:58', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (104, 'method??????', 'bss_method_status', '0', 'admin', '2020-12-23 18:18:07', '', NULL, 'http????????????');
INSERT INTO `sys_dict_type` VALUES (105, '????????????', 'bss_isEnable_status', '0', 'admin', '2020-12-24 11:44:42', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (106, 'task????????????', 'bss_task_type', '0', 'admin', '2020-12-28 14:59:57', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, 'Task??????????????????', 'bss_task_status', '0', 'admin', '2020-12-28 15:02:34', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, 'task?????????????????????', 'bss_task_is_demo', '0', 'admin', '2020-12-28 15:07:49', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (109, 'Task?????????????????????', 'bss_task_is_force_lock', '0', 'admin', '2020-12-28 15:09:51', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '????????????', 'bss_replay_type', '0', 'admin', '2021-01-05 14:39:30', '', NULL, '?????????????????????');
INSERT INTO `sys_dict_type` VALUES (111, '????????????', 'bss_replay_env', '0', 'admin', '2021-01-05 14:42:45', 'admin', '2021-01-05 14:43:26', '?????????????????????');
INSERT INTO `sys_dict_type` VALUES (112, '????????????', 'bss_test_type', '0', 'admin', '2021-01-05 17:54:57', 'jiy', '2021-01-05 18:04:21', '???????????????????????????');
INSERT INTO `sys_dict_type` VALUES (113, '????????????', 'bss_test_status', '0', 'jiy', '2021-01-05 18:06:25', 'jiy', '2021-01-05 18:06:35', '???????????????????????????');
INSERT INTO `sys_dict_type` VALUES (114, 'diff ??????', 'bss_task_api_relation_diff_type', '0', 'dengkn', '2021-01-06 15:32:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (115, 'es??????cookie??????', 'bss_cookie_info', '0', 'admin', '2021-02-05 11:07:29', 'admin', '2021-02-05 11:09:20', 'es??????cookie??????');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '????????????',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '????????????',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `cron_expression` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'cron???????????????',
  `misfire_policy` varchar(20) COLLATE utf8_bin DEFAULT '3' COMMENT '???????????????????????????1???????????? 2???????????? 3???????????????',
  `concurrent` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '?????????????????????0?????? 1?????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='?????????????????????';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (4, 'test', 'DEFAULT', 'taskPipelineService.asyncTaskReplayPipeline(29,0,\"online\")', '1/20 * * * * ? *', '1', '1', '1', 'admin', '2021-02-08 17:03:19', 'admin', '2021-03-25 10:39:19', '');
INSERT INTO `sys_job` VALUES (6, '456', 'DEFAULT', 'taskPipelineService.asyncTaskReplayPipeline(36,0,\"online\")', '0 0 9 * * ? *', '1', '1', '1', 'admin', '2021-02-08 18:41:48', 'admin', '2021-02-08 18:45:02', '');
INSERT INTO `sys_job` VALUES (7, 'lallalala', 'DEFAULT', 'taskPipelineService.asyncTaskReplayPipeline(29,0,\"online\")', '0 0 9 * * ? *', '1', '1', '1', 'admin', '2021-02-08 18:57:27', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `job_message` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `exception_info` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????????????????';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` VALUES (1, '456', 'DEFAULT', 'taskPipelineService.asyncTaskReplayPipeline(29,0,\"online\")', '456 ???????????????1??????', '1', 'java.lang.NumberFormatException: For input string: \"\"onine\"\"\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\n	at java.lang.Long.parseLong(Long.java:578)\n	at java.lang.Long.valueOf(Long.java:803)\n	at com.tal.wangxiao.conan.sys.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:131)\n	at com.tal.wangxiao.conan.sys.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:28)\n	at com.tal.wangxiao.conan.sys.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.tal.wangxiao.conan.sys.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2021-02-08 18:42:07');
INSERT INTO `sys_job_log` VALUES (2, '456', 'DEFAULT', 'taskPipelineService.asyncTaskReplayPipeline(36,0,\"online\")', '456 ???????????????1??????', '1', 'java.lang.NumberFormatException: For input string: \"\"onine\"\"\n	at java.lang.NumberFormatException.forInputString(NumberFormatException.java:65)\n	at java.lang.Long.parseLong(Long.java:578)\n	at java.lang.Long.valueOf(Long.java:803)\n	at com.tal.wangxiao.conan.sys.quartz.util.JobInvokeUtil.getMethodParams(JobInvokeUtil.java:131)\n	at com.tal.wangxiao.conan.sys.quartz.util.JobInvokeUtil.invokeMethod(JobInvokeUtil.java:28)\n	at com.tal.wangxiao.conan.sys.quartz.util.QuartzDisallowConcurrentExecution.doExecute(QuartzDisallowConcurrentExecution.java:19)\n	at com.tal.wangxiao.conan.sys.quartz.util.AbstractQuartzJob.execute(AbstractQuartzJob.java:44)\n	at org.quartz.core.JobRunShell.run(JobRunShell.java:202)\n	at org.quartz.simpl.SimpleThreadPool$WorkerThread.run(SimpleThreadPool.java:573)\n', '2021-02-08 18:45:06');
INSERT INTO `sys_job_log` VALUES (3, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????5??????', '0', '', '2021-03-18 10:18:53');
INSERT INTO `sys_job_log` VALUES (4, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:53');
INSERT INTO `sys_job_log` VALUES (5, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:53');
INSERT INTO `sys_job_log` VALUES (6, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (7, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (8, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (9, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (10, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (11, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (12, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (13, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (14, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (15, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (16, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (17, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (18, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (19, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (20, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (21, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:54');
INSERT INTO `sys_job_log` VALUES (22, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (23, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (24, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (25, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????3??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (26, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (27, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (28, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (29, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (30, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (31, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (32, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (33, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (34, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (35, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:55');
INSERT INTO `sys_job_log` VALUES (36, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (37, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (38, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (39, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (40, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (41, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (42, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (43, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (44, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (45, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (46, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (47, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (48, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (49, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (50, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (51, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (52, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (53, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (54, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????1??????', '0', '', '2021-03-18 10:18:56');
INSERT INTO `sys_job_log` VALUES (55, 'test', 'DEFAULT', 'replayServiceImpl.findReplaysByTaskExecutionId(28)', 'test ???????????????2??????', '0', '', '2021-03-18 10:18:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `ipaddr` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '??????IP??????',
  `login_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `browser` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '???????????????',
  `os` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `msg` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `login_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '?????????ID',
  `order_num` int(4) DEFAULT '0' COMMENT '????????????',
  `path` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `component` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `is_frame` int(1) DEFAULT '1' COMMENT '??????????????????0??? 1??????',
  `is_cache` int(1) DEFAULT '0' COMMENT '???????????????0?????? 1????????????',
  `menu_type` char(1) COLLATE utf8_bin DEFAULT '' COMMENT '???????????????M?????? C?????? F?????????',
  `visible` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `perms` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '????????????',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT '#' COMMENT '????????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '??????',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '????????????', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (2, '????????????', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-30 15:27:54', '??????????????????');
INSERT INTO `sys_menu` VALUES (3, '????????????', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2020-12-08 10:25:23', 'admin', '2021-03-09 17:09:03', '??????????????????');
INSERT INTO `sys_menu` VALUES (4, 'Conan??????', 0, 10, 'http://conan.xesv5.com/', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2020-12-08 10:25:23', 'admin', '2020-12-30 15:27:45', '??????????????????');
INSERT INTO `sys_menu` VALUES (100, '????????????', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (101, '????????????', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (102, '????????????', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (103, '????????????', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (104, '????????????', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (105, '????????????', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (106, '????????????', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2020-12-08 10:25:23', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (107, '????????????', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (108, '????????????', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (109, '????????????', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (110, '????????????', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (111, '????????????', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (112, '????????????', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (113, '????????????', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (114, '????????????', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (115, '????????????', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (116, '????????????', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (500, '????????????', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (501, '????????????', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-12-08 10:25:24', '', NULL, '??????????????????');
INSERT INTO `sys_menu` VALUES (1001, '????????????', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '????????????', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '????????????', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '????????????', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '????????????', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '????????????', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '????????????', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '????????????', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '????????????', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '????????????', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '????????????', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '????????????', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '????????????', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '????????????', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '????????????', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '????????????', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '????????????', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '????????????', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '????????????', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '????????????', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '????????????', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '????????????', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '????????????', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '????????????', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '????????????', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '????????????', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '????????????', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '????????????', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '????????????', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '????????????', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2020-12-08 10:25:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '????????????', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '????????????', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '????????????', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '????????????', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '????????????', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '????????????', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '????????????', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '????????????', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '????????????', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '????????????', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '????????????', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '????????????', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '????????????', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '????????????', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '????????????', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '????????????', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '????????????', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '????????????', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '????????????', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '????????????', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '????????????', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '????????????', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '????????????', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '????????????', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '????????????', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '????????????', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '????????????', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '????????????', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '????????????', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '????????????', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-12-08 10:25:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '????????????', 0, 4, 'task', NULL, 1, 0, 'M', '0', '0', '', 'tree', 'admin', '2020-12-08 16:23:36', 'admin', '2021-03-09 17:09:45', '');
INSERT INTO `sys_menu` VALUES (2002, '????????????', 2001, 1, 'taskList', 'task/list', 1, 0, 'C', '0', '0', 'admin:task:list', '404', 'admin', '2020-12-08 16:24:07', 'admin', '2021-03-02 11:27:31', '');
INSERT INTO `sys_menu` VALUES (2003, '????????????', 2004, 1, 'executionList', 'execution/list', 1, 1, 'C', '0', '0', 'admin:execution:list', 'build', 'admin', '2020-12-08 18:52:39', 'admin', '2021-01-25 16:31:41', '');
INSERT INTO `sys_menu` VALUES (2004, '????????????', 0, 5, 'execution', NULL, 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-12-10 15:48:21', 'admin', '2021-03-09 17:12:20', '');
INSERT INTO `sys_menu` VALUES (2007, '????????????', 0, 6, 'conanApi', NULL, 1, 0, 'M', '0', '0', '', 'bug', 'admin', '2020-12-16 11:53:11', 'admin', '2021-03-09 17:10:58', '');
INSERT INTO `sys_menu` VALUES (2008, '????????????', 2007, 1, 'apiEdit', 'conanApi/edit', 1, 0, 'C', '0', '0', '', '404', 'admin', '2020-12-16 11:53:41', 'admin', '2021-01-25 16:39:15', '');
INSERT INTO `sys_menu` VALUES (2010, '????????????', 0, 7, 'conanConfig', NULL, 1, 0, 'M', '0', '0', '', 'skill', 'admin', '2020-12-16 14:48:39', 'admin', '2021-03-09 17:11:50', '');
INSERT INTO `sys_menu` VALUES (2012, '????????????', 2018, 1, 'doMainList', 'admin/domain/list', 1, 1, 'C', '0', '0', 'admin:domain:list', 'nested', 'admin', '2020-12-21 17:46:31', 'admin', '2021-01-25 17:14:12', '??????????????????');
INSERT INTO `sys_menu` VALUES (2013, '??????????????????', 2012, 1, '#', '', 1, 0, 'F', '0', '0', 'admin:domain:query', '#', 'admin', '2020-12-21 17:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '??????????????????', 2012, 2, '#', '', 1, 0, 'F', '0', '0', 'admin:domain:add', '#', 'admin', '2020-12-21 17:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '??????????????????', 2012, 3, '#', '', 1, 0, 'F', '0', '0', 'admin:domain:edit', '#', 'admin', '2020-12-21 17:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '??????????????????', 2012, 4, '#', '', 1, 0, 'F', '0', '0', 'admin:domain:remove', '#', 'admin', '2020-12-21 17:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '??????????????????', 2012, 5, '#', '', 1, 0, 'F', '0', '0', 'admin:domain:export', '#', 'admin', '2020-12-21 17:46:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '????????????', 0, 8, 'admin', NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2020-12-21 17:51:38', 'admin', '2021-03-09 17:12:04', '');
INSERT INTO `sys_menu` VALUES (2019, '????????????', 2018, 1, 'interface', 'admin/interface/index', 1, 1, 'C', '0', '0', 'admin:api:list', 'build', 'admin', '2020-12-21 18:03:14', 'admin', '2021-01-25 17:18:06', '??????????????????');
INSERT INTO `sys_menu` VALUES (2020, '??????????????????', 2019, 1, '#', '', 1, 0, 'F', '0', '0', 'admin:api:query', '#', 'admin', '2020-12-21 18:03:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '??????????????????', 2019, 2, '#', '', 1, 0, 'F', '0', '0', 'admin:api:add', '#', 'admin', '2020-12-21 18:03:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '??????????????????', 2019, 3, '#', '', 1, 0, 'F', '0', '0', 'admin:api:edit', '#', 'admin', '2020-12-21 18:03:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '??????????????????', 2019, 4, '#', '', 1, 0, 'F', '0', '0', 'admin:api:remove', '#', 'admin', '2020-12-21 18:03:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, '??????????????????', 2019, 5, '#', '', 1, 0, 'F', '0', '0', 'admin:api:export', '#', 'admin', '2020-12-21 18:03:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '??????Schema??????', 2010, 1, 'deptRule', 'admin/deptRule/index', 1, 1, 'C', '0', '0', 'admin:deptRule:list', 'checkbox', 'admin', '2020-12-22 16:34:13', 'admin', '2020-12-30 15:44:33', '??????Schema??????????????????');
INSERT INTO `sys_menu` VALUES (2032, '??????Schema??????????????????', 2031, 1, '#', '', 1, 0, 'F', '0', '0', 'admin:deptRule:query', '#', 'admin', '2020-12-22 16:34:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '??????Schema??????????????????', 2031, 2, '#', '', 1, 0, 'F', '0', '0', 'admin:deptRule:add', '#', 'admin', '2020-12-22 16:34:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '??????Schema??????????????????', 2031, 3, '#', '', 1, 0, 'F', '0', '0', 'admin:deptRule:edit', '#', 'admin', '2020-12-22 16:34:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '??????Schema??????????????????', 2031, 4, '#', '', 1, 0, 'F', '0', '0', 'admin:deptRule:remove', '#', 'admin', '2020-12-22 16:34:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '??????Schema??????????????????', 2031, 5, '#', '', 1, 0, 'F', '0', '0', 'admin:deptRule:export', '#', 'admin', '2020-12-22 16:34:13', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, 'work?????????', 2018, 1, 'agentConfig', 'common/agent_config/index', 1, 0, 'C', '1', '0', 'common:agent_config:list', 'color', 'admin', '2020-12-28 15:35:39', 'admin', '2021-02-04 17:38:01', 'work???????????????');
INSERT INTO `sys_menu` VALUES (2038, 'work???????????????', 2037, 1, '#', '', 1, 0, 'F', '0', '0', 'common:agent_config:query', '#', 'admin', '2020-12-28 15:35:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, 'work???????????????', 2037, 2, '#', '', 1, 0, 'F', '0', '0', 'common:agent_config:add', '#', 'admin', '2020-12-28 15:35:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, 'work???????????????', 2037, 3, '#', '', 1, 0, 'F', '0', '0', 'common:agent_config:edit', '#', 'admin', '2020-12-28 15:35:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, 'work???????????????', 2037, 4, '#', '', 1, 0, 'F', '0', '0', 'common:agent_config:remove', '#', 'admin', '2020-12-28 15:35:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, 'work???????????????', 2037, 5, '#', '', 1, 0, 'F', '0', '0', 'common:agent_config:export', '#', 'admin', '2020-12-28 15:35:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '??????????????????', 2018, 1, 'testUser', 'common/testUser/index', 1, 0, 'C', '0', '0', 'common:testUser:list', 'user', 'admin', '2020-12-30 14:49:42', 'admin', '2021-01-25 17:21:24', '????????????????????????');
INSERT INTO `sys_menu` VALUES (2044, '????????????????????????', 2043, 1, '#', '', 1, 0, 'F', '0', '0', 'common:testUser:query', '#', 'admin', '2020-12-30 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2045, '????????????????????????', 2043, 2, '#', '', 1, 0, 'F', '0', '0', 'common:testUser:add', '#', 'admin', '2020-12-30 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2046, '????????????????????????', 2043, 3, '#', '', 1, 0, 'F', '0', '0', 'common:testUser:edit', '#', 'admin', '2020-12-30 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '????????????????????????', 2043, 4, '#', '', 1, 0, 'F', '0', '0', 'common:testUser:remove', '#', 'admin', '2020-12-30 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2048, '????????????????????????', 2043, 5, '#', '', 1, 0, 'F', '0', '0', 'common:testUser:export', '#', 'admin', '2020-12-30 14:49:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '??????Schema??????', 2010, 1, 'apiRule', 'conanConfig/index', 1, 0, 'C', '0', '0', 'admin:api:list', 'component', 'admin', '2020-12-30 16:06:22', 'jiy', '2021-02-26 14:46:09', '');
INSERT INTO `sys_menu` VALUES (2061, 'ES???????????????', 2018, 1, 'esDataSource', 'common/esDataSource/index', 1, 0, 'C', '0', '0', 'common:esDataSource:list', 'druid', 'admin', '2021-01-05 11:11:29', 'admin', '2021-01-25 17:09:54', 'ES???????????????');
INSERT INTO `sys_menu` VALUES (2062, 'ES?????????????????????', 2061, 1, '#', '', 1, 0, 'F', '0', '0', 'common:esDataSource:query', '#', 'admin', '2021-01-05 11:11:29', 'admin', '2021-01-21 15:38:49', '');
INSERT INTO `sys_menu` VALUES (2063, 'ES???????????????add', 2061, 2, '#', '', 1, 0, 'F', '0', '0', 'common:esDataSource:add', '#', 'admin', '2021-01-05 11:11:29', 'admin', '2021-01-21 15:39:06', '');
INSERT INTO `sys_menu` VALUES (2064, 'ES?????????????????????', 2061, 3, '#', '', 1, 0, 'F', '0', '0', 'common:esDataSource:edit', '#', 'admin', '2021-01-05 11:11:29', 'admin', '2021-01-21 15:39:25', '');
INSERT INTO `sys_menu` VALUES (2065, 'ES?????????????????????', 2061, 4, '#', '', 1, 0, 'F', '0', '0', 'common:esDataSource:remove', '#', 'admin', '2021-01-05 11:11:29', 'admin', '2021-01-21 15:39:42', '');
INSERT INTO `sys_menu` VALUES (2066, 'ES???????????????', 2061, 5, '#', '', 1, 0, 'F', '0', '0', 'common:esDataSource:export', '#', 'admin', '2021-01-05 11:11:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2077, '??????????????????', 2002, 1, '#', '', 1, 0, 'F', '0', '0', 'admin:task:query', '#', 'admin', '2021-01-05 18:39:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2078, '??????????????????', 2002, 2, '#', '', 1, 0, 'F', '0', '0', 'admin:task:add', '#', 'admin', '2021-01-05 18:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2079, '??????????????????', 2002, 3, '#', '', 1, 0, 'F', '0', '0', 'admin:task:edit', '#', 'admin', '2021-01-05 18:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2080, '??????????????????', 2002, 4, '#', '', 1, 0, 'F', '0', '0', 'admin:task:remove', '#', 'admin', '2021-01-05 18:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2081, '??????????????????', 2002, 5, '#', '', 1, 0, 'F', '0', '0', 'admin:task:export', '#', 'admin', '2021-01-05 18:40:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2082, '??????????????????', 2003, 1, '', NULL, 1, 0, 'F', '0', '0', 'admin:execution:list', '#', 'huyaoguo', '2021-01-22 11:14:54', 'admin', '2021-01-26 15:00:01', '');
INSERT INTO `sys_menu` VALUES (2083, '??????????????????', 2003, 2, '', NULL, 1, 0, 'F', '0', '0', 'admin:execution:replay:list', '#', 'huyaoguo', '2021-01-22 11:16:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2084, '??????????????????', 2003, 3, '', NULL, 1, 0, 'F', '0', '0', 'admin:execution:record:log', '#', 'huyaoguo', '2021-01-22 11:17:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2085, '????????????', 2003, 4, '', NULL, 1, 0, 'F', '0', '0', 'admin:execution:replay', '#', 'admin', '2021-01-22 11:28:06', 'huyaoguo', '2021-02-24 18:17:35', '');
INSERT INTO `sys_menu` VALUES (2088, '??????????????????', 2083, 1, '', NULL, 1, 0, 'F', '0', '0', 'admin:replay:log', '#', 'admin', '2021-01-26 15:38:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2089, '??????????????????', 2083, 2, '', NULL, 1, 0, 'F', '0', '0', 'admin:replay:detail', '#', 'admin', '2021-01-28 10:53:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2090, '??????????????????', 2001, 3, 'taskScheduleNew', 'task/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'time-range', 'admin', '2021-02-08 18:12:22', 'admin', '2021-03-09 18:02:52', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_messages
-- ----------------------------
DROP TABLE IF EXISTS `sys_messages`;
CREATE TABLE `sys_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2048) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '??????',
  `create_by` int(11) NOT NULL COMMENT '?????????',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  `update_by` int(11) DEFAULT NULL COMMENT '?????????',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_messages
-- ----------------------------
BEGIN;
INSERT INTO `sys_messages` VALUES (1, '???', 1, '2021-02-02 17:39:43', NULL, NULL);
INSERT INTO `sys_messages` VALUES (2, '???', 1, '2021-02-02 17:40:08', NULL, NULL);
INSERT INTO `sys_messages` VALUES (3, '???', 1, '2021-02-02 17:44:11', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '???????????????1?????? 2?????????',
  `notice_content` longblob COMMENT '????????????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '???????????????2021-01-01 conan??????????????????', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2020-12-08 10:25:29', 'admin', '2020-12-29 18:55:03', '?????????');
INSERT INTO `sys_notice` VALUES (2, '???????????????2020-01-05 conan??????????????????', '1', 0x3C703EE7BBB4E68AA4E58685E5AEB93C2F703E, '0', 'admin', '2020-12-08 10:25:29', 'admin', '2020-12-29 18:55:22', '?????????');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '????????????',
  `title` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `business_type` int(2) DEFAULT '0' COMMENT '???????????????0?????? 1?????? 2?????? 3?????????',
  `method` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `request_method` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `operator_type` int(1) DEFAULT '0' COMMENT '???????????????0?????? 1???????????? 2??????????????????',
  `oper_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '??????URL',
  `oper_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_param` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `json_result` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `status` int(1) DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `error_msg` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `oper_time` datetime DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='??????????????????';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '????????????', 9, 'com.tal.wangxiao.conan.sys.api.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '210.12.105.21,10.90.70.102', '??????IP', '{}', '{\"msg\":\"????????????\",\"code\":200}', 0, NULL, '2021-03-25 10:19:13');
INSERT INTO `sys_oper_log` VALUES (2, '????????????', 9, 'com.tal.wangxiao.conan.sys.api.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/logininfor/clean', '210.12.105.21,10.90.70.102', '??????IP', '{}', '{\"msg\":\"????????????\",\"code\":200}', 0, NULL, '2021-03-25 10:19:20');
INSERT INTO `sys_oper_log` VALUES (3, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/37', '210.12.105.21,10.90.70.102', '??????IP', '{ids=37}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:19:49');
INSERT INTO `sys_oper_log` VALUES (4, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/38', '210.12.105.21,10.90.70.102', '??????IP', '{ids=38}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:19:52');
INSERT INTO `sys_oper_log` VALUES (5, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/36', '210.12.105.21,10.90.70.102', '??????IP', '{ids=36}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:19:56');
INSERT INTO `sys_oper_log` VALUES (6, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/39', '210.12.105.21,10.90.70.102', '??????IP', '{ids=39}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:19:59');
INSERT INTO `sys_oper_log` VALUES (7, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/40', '210.12.105.21,10.90.70.102', '??????IP', '{ids=40}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:20:02');
INSERT INTO `sys_oper_log` VALUES (8, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/41', '210.12.105.21,10.90.70.102', '??????IP', '{ids=41}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:20:06');
INSERT INTO `sys_oper_log` VALUES (9, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.DomainController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/domain/182', '210.12.105.21,10.90.70.102', '??????IP', '{ids=182}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:22:50');
INSERT INTO `sys_oper_log` VALUES (10, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.DomainController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/domain/183', '210.12.105.21,10.90.70.102', '??????IP', '{ids=183}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:22:52');
INSERT INTO `sys_oper_log` VALUES (11, '????????????', 2, 'com.tal.wangxiao.conan.sys.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '210.12.105.21,10.90.70.102', '??????IP', '{\"jobName\":\"test\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"1/20 * * * * ? *\",\"jobId\":4,\"createBy\":\"admin\",\"nextValidTime\":1616639621000,\"createTime\":1612774999000,\"updateBy\":\"admin\",\"invokeTarget\":\"taskPipelineService.asyncTaskReplayPipeline(29,0,\\\"online\\\")\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"????????????\",\"code\":200}', 0, NULL, '2021-03-25 10:33:32');
INSERT INTO `sys_oper_log` VALUES (12, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/44', '210.12.105.21,10.90.70.102', '??????IP', '{ids=44}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:35:24');
INSERT INTO `sys_oper_log` VALUES (13, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/43', '210.12.105.21,10.90.70.102', '??????IP', '{ids=43}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:35:27');
INSERT INTO `sys_oper_log` VALUES (14, '????????????', 3, 'com.tal.wangxiao.conan.admin.controller.TaskController.remove()', 'DELETE', 1, 'admin', NULL, '/api/1.0/admin/task/34', '210.12.105.21,10.90.70.102', '??????IP', '{ids=34}', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:35:34');
INSERT INTO `sys_oper_log` VALUES (15, 'taskApiRelation', 1, 'com.tal.wangxiao.conan.admin.controller.TaskApiRelationController.add()', 'POST', 1, 'admin', NULL, '/api/1.0/common/taskApiRelation', '210.12.105.21,10.90.70.102', '??????IP', '[{\"recordCount\":5,\"taskApiRelationId\":1131,\"params\":{},\"apiId\":158920,\"taskId\":29},{\"recordCount\":0,\"taskApiRelationId\":1132,\"params\":{},\"apiId\":158921,\"taskId\":29},{\"recordCount\":101,\"taskApiRelationId\":1133,\"params\":{},\"apiId\":158922,\"taskId\":29},{\"recordCount\":101,\"taskApiRelationId\":1134,\"params\":{},\"apiId\":158923,\"taskId\":29},{\"recordCount\":29,\"taskApiRelationId\":1135,\"params\":{},\"apiId\":158924,\"taskId\":29},{\"recordCount\":101,\"taskApiRelationId\":1136,\"params\":{},\"apiId\":158925,\"taskId\":29},{\"recordCount\":44,\"taskApiRelationId\":1137,\"params\":{},\"apiId\":158926,\"taskId\":29},{\"recordCount\":30,\"taskApiRelationId\":1138,\"params\":{},\"apiId\":158928,\"taskId\":29},{\"recordCount\":31,\"taskApiRelationId\":1139,\"params\":{},\"apiId\":158929,\"taskId\":29},{\"recordCount\":0,\"taskApiRelationId\":1140,\"params\":{},\"apiId\":158930,\"taskId\":29},{\"recordCount\":7,\"taskApiRelationId\":1141,\"params\":{},\"apiId\":158931,\"taskId\":29},{\"recordCount\":61,\"taskApiRelationId\":1142,\"params\":{},\"apiId\":158932,\"taskId\":29},{\"recordCount\":7,\"taskApiRelationId\":1143,\"params\":{},\"apiId\":158933,\"taskId\":29},{\"recordCount\":7,\"taskApiRelationId\":1144,\"params\":{},\"apiId\":158934,\"taskId\":29},{\"recordCount\":4,\"taskApiRelationId\":1145,\"params\":{},\"apiId\":158935,\"taskId\":29},{\"recordCount\":101,\"taskApiRelationId\":1146,\"params\":{},\"apiId\":158936,\"taskId\":29},{\"recordCount\":1,\"taskApiRelationId\":1147,\"params\":{},\"apiId\":158937,\"taskId\":29},{\"recordCount\":0,\"taskApiRelationId\":1148,\"params\":{},\"apiId\":158938,\"taskId\":29},{\"recordCount\":4,\"taskApiRelationId\":1149,\"params\":{},\"apiId\":158939,\"taskId\":29},{\"recordCount\":6,\"taskApiRelationId\":1150,\"params\":{},\"apiId\":158940,\"taskId\":29},{\"recordCount\":26,\"taskApiRelationId\":1151,\"params\":{},\"apiId\":158941,\"taskId\":29},{\"recordCount\":9,\"taskApiRelationId\":1152,\"params\":{},\"apiId\":158942,\"taskId\":29},{\"recordCount\":99,\"taskApiRelationId\":1153,\"params\":{},\"apiId\":158943,\"taskId\":29},{\"recordCount\":5,\"taskApiRelationId\":1154,\"params\":{},\"apiId\":158944,\"taskId\":29},{\"recordCount\":1', '{\"code\":200,\"msg\":\"????????????\"}', 0, NULL, '2021-03-25 10:38:25');
INSERT INTO `sys_oper_log` VALUES (16, '????????????', 2, 'com.tal.wangxiao.conan.sys.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '210.12.105.21,10.90.70.102', '??????IP', '{\"jobName\":\"test\",\"concurrent\":\"1\",\"remark\":\"\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"1/20 * * * * ? *\",\"jobId\":4,\"createBy\":\"admin\",\"nextValidTime\":1616639961000,\"createTime\":1612774999000,\"updateBy\":\"admin\",\"invokeTarget\":\"taskPipelineService.asyncTaskReplayPipeline(29,0,\\\"online\\\")\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"????????????\",\"code\":200}', 0, NULL, '2021-03-25 10:39:20');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `post_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `post_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `post_sort` int(4) NOT NULL COMMENT '????????????',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '?????????0?????? 1?????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '?????????', 1, '0', 'admin', '2020-12-08 10:25:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '????????????', 2, '0', 'admin', '2020-12-08 10:25:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '????????????', 3, '0', 'admin', '2020-12-08 10:25:23', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '????????????', 4, '0', 'admin', '2020-12-08 10:25:23', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `role_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `role_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '?????????????????????',
  `role_sort` int(4) NOT NULL COMMENT '????????????',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '???????????????1????????????????????? 2????????????????????? 3???????????????????????? 4????????????????????????????????????',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '????????????????????????????????????',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '????????????????????????????????????',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '???????????????', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-12-08 10:25:23', '', NULL, '???????????????');
INSERT INTO `sys_role` VALUES (2, '????????????', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2020-12-08 10:25:23', 'admin', '2021-03-09 17:19:14', '????????????');
INSERT INTO `sys_role` VALUES (100, '??????', 'yk', 3, '5', 1, 1, '0', '0', 'admin', '2020-12-11 17:15:00', 'admin', '2021-03-17 15:04:29', NULL);
INSERT INTO `sys_role` VALUES (101, '????????????', 'de', 0, '4', 1, 1, '0', '0', 'admin', '2020-12-11 17:48:49', 'admin', '2021-03-09 17:19:02', NULL);
INSERT INTO `sys_role` VALUES (102, '????????????', 'superadmin', 0, '1', 0, 1, '0', '0', 'admin', '2021-01-05 17:47:36', 'admin', '2021-03-09 17:19:27', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  `dept_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  `menu_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2077);
INSERT INTO `sys_role_menu` VALUES (2, 2078);
INSERT INTO `sys_role_menu` VALUES (2, 2079);
INSERT INTO `sys_role_menu` VALUES (2, 2080);
INSERT INTO `sys_role_menu` VALUES (2, 2081);
INSERT INTO `sys_role_menu` VALUES (2, 2090);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2007);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2077);
INSERT INTO `sys_role_menu` VALUES (100, 2078);
INSERT INTO `sys_role_menu` VALUES (100, 2079);
INSERT INTO `sys_role_menu` VALUES (100, 2080);
INSERT INTO `sys_role_menu` VALUES (100, 2081);
INSERT INTO `sys_role_menu` VALUES (100, 2090);
INSERT INTO `sys_role_menu` VALUES (101, 1);
INSERT INTO `sys_role_menu` VALUES (101, 100);
INSERT INTO `sys_role_menu` VALUES (101, 101);
INSERT INTO `sys_role_menu` VALUES (101, 102);
INSERT INTO `sys_role_menu` VALUES (101, 103);
INSERT INTO `sys_role_menu` VALUES (101, 104);
INSERT INTO `sys_role_menu` VALUES (101, 105);
INSERT INTO `sys_role_menu` VALUES (101, 106);
INSERT INTO `sys_role_menu` VALUES (101, 107);
INSERT INTO `sys_role_menu` VALUES (101, 108);
INSERT INTO `sys_role_menu` VALUES (101, 500);
INSERT INTO `sys_role_menu` VALUES (101, 501);
INSERT INTO `sys_role_menu` VALUES (101, 1001);
INSERT INTO `sys_role_menu` VALUES (101, 1002);
INSERT INTO `sys_role_menu` VALUES (101, 1003);
INSERT INTO `sys_role_menu` VALUES (101, 1004);
INSERT INTO `sys_role_menu` VALUES (101, 1005);
INSERT INTO `sys_role_menu` VALUES (101, 1006);
INSERT INTO `sys_role_menu` VALUES (101, 1007);
INSERT INTO `sys_role_menu` VALUES (101, 1008);
INSERT INTO `sys_role_menu` VALUES (101, 1009);
INSERT INTO `sys_role_menu` VALUES (101, 1010);
INSERT INTO `sys_role_menu` VALUES (101, 1011);
INSERT INTO `sys_role_menu` VALUES (101, 1012);
INSERT INTO `sys_role_menu` VALUES (101, 1013);
INSERT INTO `sys_role_menu` VALUES (101, 1014);
INSERT INTO `sys_role_menu` VALUES (101, 1015);
INSERT INTO `sys_role_menu` VALUES (101, 1016);
INSERT INTO `sys_role_menu` VALUES (101, 1017);
INSERT INTO `sys_role_menu` VALUES (101, 1018);
INSERT INTO `sys_role_menu` VALUES (101, 1019);
INSERT INTO `sys_role_menu` VALUES (101, 1020);
INSERT INTO `sys_role_menu` VALUES (101, 1021);
INSERT INTO `sys_role_menu` VALUES (101, 1022);
INSERT INTO `sys_role_menu` VALUES (101, 1023);
INSERT INTO `sys_role_menu` VALUES (101, 1024);
INSERT INTO `sys_role_menu` VALUES (101, 1025);
INSERT INTO `sys_role_menu` VALUES (101, 1026);
INSERT INTO `sys_role_menu` VALUES (101, 1027);
INSERT INTO `sys_role_menu` VALUES (101, 1028);
INSERT INTO `sys_role_menu` VALUES (101, 1029);
INSERT INTO `sys_role_menu` VALUES (101, 1030);
INSERT INTO `sys_role_menu` VALUES (101, 1031);
INSERT INTO `sys_role_menu` VALUES (101, 1032);
INSERT INTO `sys_role_menu` VALUES (101, 1033);
INSERT INTO `sys_role_menu` VALUES (101, 1034);
INSERT INTO `sys_role_menu` VALUES (101, 1035);
INSERT INTO `sys_role_menu` VALUES (101, 1036);
INSERT INTO `sys_role_menu` VALUES (101, 1037);
INSERT INTO `sys_role_menu` VALUES (101, 1038);
INSERT INTO `sys_role_menu` VALUES (101, 1039);
INSERT INTO `sys_role_menu` VALUES (101, 1040);
INSERT INTO `sys_role_menu` VALUES (101, 1041);
INSERT INTO `sys_role_menu` VALUES (101, 1042);
INSERT INTO `sys_role_menu` VALUES (101, 1043);
INSERT INTO `sys_role_menu` VALUES (101, 1044);
INSERT INTO `sys_role_menu` VALUES (101, 1045);
INSERT INTO `sys_role_menu` VALUES (101, 2001);
INSERT INTO `sys_role_menu` VALUES (101, 2002);
INSERT INTO `sys_role_menu` VALUES (101, 2003);
INSERT INTO `sys_role_menu` VALUES (101, 2004);
INSERT INTO `sys_role_menu` VALUES (101, 2010);
INSERT INTO `sys_role_menu` VALUES (101, 2012);
INSERT INTO `sys_role_menu` VALUES (101, 2013);
INSERT INTO `sys_role_menu` VALUES (101, 2014);
INSERT INTO `sys_role_menu` VALUES (101, 2015);
INSERT INTO `sys_role_menu` VALUES (101, 2016);
INSERT INTO `sys_role_menu` VALUES (101, 2017);
INSERT INTO `sys_role_menu` VALUES (101, 2018);
INSERT INTO `sys_role_menu` VALUES (101, 2019);
INSERT INTO `sys_role_menu` VALUES (101, 2020);
INSERT INTO `sys_role_menu` VALUES (101, 2021);
INSERT INTO `sys_role_menu` VALUES (101, 2022);
INSERT INTO `sys_role_menu` VALUES (101, 2023);
INSERT INTO `sys_role_menu` VALUES (101, 2024);
INSERT INTO `sys_role_menu` VALUES (101, 2031);
INSERT INTO `sys_role_menu` VALUES (101, 2032);
INSERT INTO `sys_role_menu` VALUES (101, 2033);
INSERT INTO `sys_role_menu` VALUES (101, 2034);
INSERT INTO `sys_role_menu` VALUES (101, 2035);
INSERT INTO `sys_role_menu` VALUES (101, 2036);
INSERT INTO `sys_role_menu` VALUES (101, 2037);
INSERT INTO `sys_role_menu` VALUES (101, 2038);
INSERT INTO `sys_role_menu` VALUES (101, 2039);
INSERT INTO `sys_role_menu` VALUES (101, 2040);
INSERT INTO `sys_role_menu` VALUES (101, 2041);
INSERT INTO `sys_role_menu` VALUES (101, 2042);
INSERT INTO `sys_role_menu` VALUES (101, 2043);
INSERT INTO `sys_role_menu` VALUES (101, 2044);
INSERT INTO `sys_role_menu` VALUES (101, 2045);
INSERT INTO `sys_role_menu` VALUES (101, 2046);
INSERT INTO `sys_role_menu` VALUES (101, 2047);
INSERT INTO `sys_role_menu` VALUES (101, 2048);
INSERT INTO `sys_role_menu` VALUES (101, 2060);
INSERT INTO `sys_role_menu` VALUES (101, 2061);
INSERT INTO `sys_role_menu` VALUES (101, 2062);
INSERT INTO `sys_role_menu` VALUES (101, 2063);
INSERT INTO `sys_role_menu` VALUES (101, 2064);
INSERT INTO `sys_role_menu` VALUES (101, 2065);
INSERT INTO `sys_role_menu` VALUES (101, 2066);
INSERT INTO `sys_role_menu` VALUES (101, 2077);
INSERT INTO `sys_role_menu` VALUES (101, 2078);
INSERT INTO `sys_role_menu` VALUES (101, 2079);
INSERT INTO `sys_role_menu` VALUES (101, 2080);
INSERT INTO `sys_role_menu` VALUES (101, 2081);
INSERT INTO `sys_role_menu` VALUES (101, 2082);
INSERT INTO `sys_role_menu` VALUES (101, 2083);
INSERT INTO `sys_role_menu` VALUES (101, 2084);
INSERT INTO `sys_role_menu` VALUES (101, 2085);
INSERT INTO `sys_role_menu` VALUES (101, 2088);
INSERT INTO `sys_role_menu` VALUES (101, 2089);
INSERT INTO `sys_role_menu` VALUES (101, 2090);
INSERT INTO `sys_role_menu` VALUES (102, 1);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 3);
INSERT INTO `sys_role_menu` VALUES (102, 4);
INSERT INTO `sys_role_menu` VALUES (102, 2001);
INSERT INTO `sys_role_menu` VALUES (102, 2004);
INSERT INTO `sys_role_menu` VALUES (102, 2007);
INSERT INTO `sys_role_menu` VALUES (102, 2010);
INSERT INTO `sys_role_menu` VALUES (102, 2018);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '??????ID',
  `user_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `nick_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '????????????',
  `user_type` varchar(2) COLLATE utf8_bin DEFAULT '00' COMMENT '???????????????00???????????????',
  `email` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `phonenumber` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `sex` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0??? 1??? 2?????????',
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '????????????',
  `password` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '??????',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0?????? 1?????????',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '???????????????0???????????? 2???????????????',
  `login_ip` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '????????????IP',
  `login_date` datetime DEFAULT NULL COMMENT '??????????????????',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `create_time` datetime DEFAULT NULL COMMENT '????????????',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '?????????',
  `update_time` datetime DEFAULT NULL COMMENT '????????????',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '??????',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='???????????????';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (0, 100, 'schedule', '?????????????????????', '00', '', '', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, '', NULL, '', NULL, '?????????????????????');
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '??????', '00', 'conan@163.com', '15888888889', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-12-08 10:25:23', 'admin', '2020-12-08 10:25:23', '', '2021-02-26 17:40:35', '?????????');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '??????1', '00', 'Conan@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2020-12-08 10:25:23', 'admin', '2020-12-08 10:25:23', 'admin', '2021-02-05 17:34:28', '?????????');
INSERT INTO `sys_user` VALUES (100, 101, 'test', 'test', '00', '804612791@qq.com', '13347114727', '0', '', '$2a$10$gybIzbDitC36qCCg5TVK/.MeZZXGsRyDey6oOhQkj8j6BPcUxPopW', '0', '0', '', NULL, 'admin', '2020-12-08 11:04:15', 'admin', '2020-12-11 18:11:33', NULL);
INSERT INTO `sys_user` VALUES (101, 103, 'test2', 'test2', '00', '80461279@qq.com', '18785196571', '0', '', '$2a$10$8aH.vew11nXa/5Q5ftWpJO24GQdKa3CEnb2VSaqkbbf4EZ5Rmo9Tq', '0', '0', '', NULL, 'admin', '2020-12-23 18:10:28', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 103, 'liujs', '?????????', '00', 'liujs@22.com', '13347118909', '0', '', '$2a$10$9tnrJFkKoExzq4fYEC/Sm.9pJqwPtW9OS9BPkIGLv6G7eeLKWJL22', '0', '0', '', NULL, 'admin', '2021-01-05 17:49:03', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 103, 'jiy', '??????', '00', 'jiy@qq.com', '13390890711', '1', '', '$2a$10$/1XNwPDVuvwOO7lp6j5Xa.TlzvokDsvJQbnEU210Ez6Os20Gz8bP.', '0', '0', '', NULL, 'admin', '2021-01-05 17:50:33', 'admin', '2021-03-17 15:04:46', NULL);
INSERT INTO `sys_user` VALUES (104, 103, 'huyaoguo', 'huyg', '00', 'huyg@qq.com', '13347116890', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '', NULL, 'admin', '2021-01-05 17:51:23', 'admin', '2021-01-22 11:23:48', NULL);
INSERT INTO `sys_user` VALUES (105, 103, 'dengkn', '?????????', '00', 'dengkn@qq.com', '13347114867', '0', '', '$2a$10$F/0z6UAm8aU2j0E9kQUyDOMc.ZpEj2d4XV8tcdFH3b2KCjZtW82xu', '0', '0', '', NULL, 'admin', '2021-01-06 11:44:25', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '??????ID',
  `post_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (102, 4);
INSERT INTO `sys_user_post` VALUES (103, 4);
INSERT INTO `sys_user_post` VALUES (104, 4);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '??????ID',
  `role_id` bigint(20) NOT NULL COMMENT '??????ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='????????????????????????';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 100);
INSERT INTO `sys_user_role` VALUES (100, 101);
INSERT INTO `sys_user_role` VALUES (101, 101);
INSERT INTO `sys_user_role` VALUES (102, 102);
INSERT INTO `sys_user_role` VALUES (103, 100);
INSERT INTO `sys_user_role` VALUES (104, 2);
INSERT INTO `sys_user_role` VALUES (104, 100);
INSERT INTO `sys_user_role` VALUES (104, 101);
INSERT INTO `sys_user_role` VALUES (104, 102);
INSERT INTO `sys_user_role` VALUES (105, 102);
COMMIT;

-- ----------------------------
-- Table structure for sys_version
-- ----------------------------
DROP TABLE IF EXISTS `sys_version`;
CREATE TABLE `sys_version` (
  `version_id` int(255) NOT NULL AUTO_INCREMENT COMMENT '??????',
  `version_num` varchar(1024) COLLATE utf8mb4_bin NOT NULL COMMENT '?????????',
  `pv_count` int(255) NOT NULL DEFAULT '0' COMMENT 'pv?????????',
  `current_info` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '??????????????????',
  `platform_info` varchar(1024) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '??????????????????',
  `create_by` int(255) DEFAULT NULL COMMENT '?????????',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  `update_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '????????????',
  `update_by` int(255) DEFAULT NULL COMMENT '????????????',
  PRIMARY KEY (`version_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_version
-- ----------------------------
BEGIN;
INSERT INTO `sys_version` VALUES (1, '1.0.0', 2213, '1.0.0???????????????', '????????????????????????', 0, '2021-01-14 19:55:40', '2021-01-14 19:55:42', 0);
COMMIT;

-- ----------------------------
-- 2021.06.09m, ???????????????????????????ID
-- ----------------------------
ALTER TABLE `bss_diff`
    ADD COLUMN `base_replay_id` int(10) NULL COMMENT '??????????????????ID' AFTER `diff_error_msg`;

SET FOREIGN_KEY_CHECKS = 1;

