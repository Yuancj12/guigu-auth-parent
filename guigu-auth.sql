/*
 Navicat Premium Data Transfer

 Source Server         : mysql8.0.26
 Source Server Type    : MySQL
 Source Server Version : 80026
 Source Host           : localhost:3306
 Source Schema         : guigu-auth

 Target Server Type    : MySQL
 Target Server Version : 80026
 File Encoding         : 65001

 Date: 02/06/2023 18:34:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '上级部门id',
  `tree_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT ',' COMMENT '树结构',
  `sort_value` int NULL DEFAULT 1 COMMENT '排序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2018 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '组织机构' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (1, '硅谷集团有限公司', 0, ',1,', 1, '张老师', '15659090912', 1, '2022-05-24 16:13:13', '2022-05-24 16:13:13', 0);
INSERT INTO `sys_dept` VALUES (10, '北京校区', 1, ',1,10,', 1, '李老师', '18790007789', 1, '2022-05-24 16:13:15', '2022-05-24 16:13:15', 0);
INSERT INTO `sys_dept` VALUES (20, '上海校区', 1, ',1,20,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:25', '2022-05-25 14:02:25', 0);
INSERT INTO `sys_dept` VALUES (30, '深圳校区', 1, ',1,30,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1010, '教学部分', 10, ',1,10,1010,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:24', '2022-05-25 14:02:24', 0);
INSERT INTO `sys_dept` VALUES (1020, '运营部门', 10, ',1,10,1020,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:29', '2022-05-25 14:02:29', 0);
INSERT INTO `sys_dept` VALUES (1021, 'Java学科', 1010, ',1,10,1010,1021,', 1, '王老师', '15090987678', 1, '2022-05-24 16:13:31', '2022-05-24 16:13:31', 0);
INSERT INTO `sys_dept` VALUES (1022, '大数据学科', 1010, ',1,10,1010,1022,', 1, '王老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1024, '前端学科', 1010, ',1,10,1010,1024,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:22', '2022-05-25 14:02:22', 0);
INSERT INTO `sys_dept` VALUES (1025, '客服', 1020, ',1,10,1020,1025,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:23', '2022-05-25 14:02:23', 0);
INSERT INTO `sys_dept` VALUES (1026, '网站推广', 1020, ',1,10,1020,1026,', 1, '30.607366', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1027, '线下运营', 1020, ',1,10,1020,1027,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:26', '2022-05-25 14:02:26', 0);
INSERT INTO `sys_dept` VALUES (1028, '设计', 1020, ',1,10,1020,1028,', 1, '李老师', '15090987678', 1, '2022-05-25 14:02:27', '2022-05-25 14:02:27', 0);
INSERT INTO `sys_dept` VALUES (2012, '教学部门', 20, ',1,20,2012,', 1, '王老师', '18909890765', 1, '2022-05-24 16:13:51', '2022-05-24 16:13:51', 0);
INSERT INTO `sys_dept` VALUES (2013, '教学部门', 30, ',1,30,2013,', 1, '李老师', '18567867895', 1, '2022-05-24 16:13:50', '2022-05-24 16:13:50', 0);
INSERT INTO `sys_dept` VALUES (2016, 'Java学科', 2012, ',1,20,2012,2012,', 1, '张老师', '15090909909', 1, '2022-05-25 10:51:12', '2022-05-25 10:51:12', 0);
INSERT INTO `sys_dept` VALUES (2017, '大数据学科', 2012, ',1,20,2012,2012,', 1, '李老师', '15090980989', 1, '2022-05-27 09:11:54', NULL, 0);

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1664570537441079298 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (1662421253383868417, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2023-05-27 19:31:27', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1662422021579034625, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2023-05-27 19:34:30', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1663358951586025474, 'admin', '0:0:0:0:0:0:0:1', 1, '登录成功', NULL, '2023-05-30 09:37:32', NULL, 0);
INSERT INTO `sys_login_log` VALUES (1664570537441079297, 'admin', '127.0.0.1', 1, '登录成功', NULL, '2023-06-02 17:51:57', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `parent_id` bigint NOT NULL DEFAULT 0 COMMENT '所属上级',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(0:目录,1:菜单,2:按钮)',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `sort_value` int NULL DEFAULT NULL COMMENT '排序',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态(0:禁止,1:正常)',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1660634659219886083 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (2, 0, '系统管理', 0, 'system', 'Layout', NULL, 'el-icon-s-tools', 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:23:24', 0);
INSERT INTO `sys_menu` VALUES (3, 2, '用户管理', 1, 'sysUser', 'system/sysUser/list', '', 'el-icon-s-custom', 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:47', 0);
INSERT INTO `sys_menu` VALUES (4, 2, '角色管理', 1, 'sysRole', 'system/sysRole/list', '', 'el-icon-user-solid', 2, 1, '2021-05-31 18:05:37', '2022-06-09 09:37:18', 0);
INSERT INTO `sys_menu` VALUES (5, 2, '菜单管理', 1, 'sysMenu', 'system/sysMenu/list', '', 'el-icon-s-unfold', 3, 1, '2021-05-31 18:05:37', '2022-06-09 09:37:21', 0);
INSERT INTO `sys_menu` VALUES (6, 3, '查看', 2, NULL, NULL, 'bnt.sysUser.list', NULL, 1, 1, '2021-05-31 18:05:37', '2023-05-22 18:48:07', 0);
INSERT INTO `sys_menu` VALUES (7, 3, '添加', 2, NULL, NULL, 'bnt.sysUser.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (8, 3, '修改', 2, NULL, NULL, 'bnt.sysUser.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (9, 3, '删除', 2, NULL, NULL, 'bnt.sysUser.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (10, 4, '查看', 2, NULL, NULL, 'bnt.sysRole.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (11, 4, '添加', 2, NULL, NULL, 'bnt.sysRole.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (12, 4, '修改', 2, NULL, NULL, 'bnt.sysRole.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (13, 4, '删除', 2, NULL, NULL, 'bnt.sysRole.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (14, 5, '查看', 2, NULL, NULL, 'bnt.sysMenu.list', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (15, 5, '添加', 2, NULL, NULL, 'bnt.sysMenu.add', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (16, 5, '修改', 2, NULL, NULL, 'bnt.sysMenu.update', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (17, 5, '删除', 2, NULL, NULL, 'bnt.sysMenu.remove', NULL, 1, 1, '2021-05-31 18:05:37', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (18, 3, '分配角色', 2, NULL, NULL, 'bnt.sysUser.assignRole', NULL, 1, 1, '2022-05-23 17:14:32', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (19, 4, '分配权限', 2, 'assignAuth', 'system/sysRole/assignAuth', 'bnt.sysRole.assignAuth', NULL, 1, 1, '2022-05-23 17:18:14', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (20, 2, '部门管理', 1, 'sysDept', 'system/sysDept/list', '', 'el-icon-s-operation', 4, 1, '2022-05-24 10:07:05', '2022-06-09 09:38:12', 0);
INSERT INTO `sys_menu` VALUES (21, 20, '查看', 2, NULL, NULL, 'bnt.sysDept.list', NULL, 1, 1, '2022-05-24 10:07:44', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (22, 2, '岗位管理', 1, 'sysPost', 'system/sysPost/list', '', 'el-icon-more-outline', 5, 1, '2022-05-24 10:25:30', '2022-06-09 09:38:13', 0);
INSERT INTO `sys_menu` VALUES (23, 22, '查看', 2, NULL, NULL, 'bnt.sysPost.list', NULL, 1, 1, '2022-05-24 10:25:45', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (24, 20, '添加', 2, NULL, NULL, 'bnt.sysDept.add', NULL, 1, 1, '2022-05-25 15:31:27', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (25, 20, '修改', 2, NULL, NULL, 'bnt.sysDept.update', NULL, 1, 1, '2022-05-25 15:31:41', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (26, 20, '删除', 2, NULL, NULL, 'bnt.sysDept.remove', NULL, 1, 1, '2022-05-25 15:31:59', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (27, 22, '添加', 2, NULL, NULL, 'bnt.sysPost.add', NULL, 1, 1, '2022-05-25 15:32:44', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (28, 22, '修改', 2, NULL, NULL, 'bnt.sysPost.update', NULL, 1, 1, '2022-05-25 15:32:58', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (29, 22, '删除', 2, NULL, NULL, 'bnt.sysPost.remove', NULL, 1, 1, '2022-05-25 15:33:11', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (30, 34, '操作日志', 1, 'sysOperLog', 'system/sysOperLog/list', '', 'el-icon-document-remove', 1, 1, '2022-05-26 16:09:59', '2022-06-09 09:39:23', 0);
INSERT INTO `sys_menu` VALUES (31, 30, '查看', 2, NULL, NULL, 'bnt.sysOperLog.list', NULL, 1, 1, '2022-05-26 16:10:17', '2022-06-09 09:22:38', 0);
INSERT INTO `sys_menu` VALUES (32, 34, '登录日志', 1, 'sysLoginLog', 'system/sysLoginLog/list', '', 'el-icon-s-goods', 2, 1, '2022-05-26 16:36:13', '2022-06-09 09:39:24', 0);
INSERT INTO `sys_menu` VALUES (33, 32, '查看', 2, NULL, NULL, 'bnt.sysLoginLog.list', NULL, 1, 1, '2022-05-26 16:36:31', '2022-06-09 09:36:36', 0);
INSERT INTO `sys_menu` VALUES (34, 2, '日志管理', 0, 'log', 'ParentView', '', 'el-icon-tickets', 6, 1, '2022-05-31 13:23:07', '2022-06-09 09:39:22', 0);
INSERT INTO `sys_menu` VALUES (1660599157691359234, 7, 'test1', 0, '', '', '', '', 0, 0, '2023-05-22 18:51:06', '2023-05-22 18:52:05', 0);
INSERT INTO `sys_menu` VALUES (1660634515497865217, 34, 'test', 1, '', '', '', 'el-icon-phone', 2, 1, '2023-05-22 21:11:36', '2023-05-22 21:12:30', 1);
INSERT INTO `sys_menu` VALUES (1660634659219886082, 1660634515497865217, 'test1', 2, '', '', '', '', 1, 1, '2023-05-22 21:12:10', '2023-05-22 21:12:27', 1);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '岗位名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1正常 0停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (5, 'dsz', '董事长', '1', 1, '2022-05-24 10:33:53', NULL, 0);
INSERT INTO `sys_post` VALUES (6, 'zjl', '总经理', '2', 1, '2022-05-24 10:34:08', NULL, 0);
INSERT INTO `sys_post` VALUES (7, 'wz', '网咨', '', 1, '2022-05-27 08:56:41', '2022-05-27 08:56:41', 1);
INSERT INTO `sys_post` VALUES (8, 'yyzj', '运营总监', '', 1, '2022-06-08 17:14:21', NULL, 0);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编码',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661234827531141123 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '系统管理员', 'SYSTEM', '系统管理员', '2021-05-31 18:09:18', '2023-04-26 21:29:14', 0);
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'COMMON', '普通管理员', '2021-06-01 08:38:40', '2023-04-26 21:29:08', 0);
INSERT INTO `sys_role` VALUES (8, '用户管理员', 'yhgly', '无', '2022-06-08 17:39:04', '2023-05-15 19:29:28', 0);
INSERT INTO `sys_role` VALUES (1650809173614641153, '员工', 'testManager2', '测试角色2', '2023-04-25 18:29:12', '2023-05-22 13:08:22', 0);
INSERT INTO `sys_role` VALUES (1660887026343407617, 'test', 'test', NULL, '2023-05-23 13:54:59', '2023-05-23 13:54:59', 0);
INSERT INTO `sys_role` VALUES (1661234827531141122, '测试人员一', 'test1', NULL, '2023-05-24 12:57:01', '2023-05-24 12:57:01', 0);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NOT NULL DEFAULT 0,
  `menu_id` bigint NOT NULL DEFAULT 0,
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_menu_id`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661238395243872261 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 2, 2, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (2, 2, 3, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (3, 2, 6, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (4, 2, 7, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (5, 2, 8, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (6, 2, 9, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (7, 2, 18, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (8, 2, 4, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (9, 2, 10, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (10, 2, 11, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (11, 2, 12, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (12, 2, 13, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (13, 2, 19, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (14, 2, 5, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (15, 2, 14, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (16, 2, 15, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (17, 2, 16, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (18, 2, 17, '2022-06-02 16:11:27', '2022-06-02 16:16:10', 1);
INSERT INTO `sys_role_menu` VALUES (19, 2, 2, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (20, 2, 3, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (21, 2, 6, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (22, 2, 7, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (23, 2, 8, '2022-06-02 16:16:10', '2022-06-09 09:26:34', 1);
INSERT INTO `sys_role_menu` VALUES (24, 2, 2, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (25, 2, 3, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (26, 2, 6, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (27, 2, 7, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (28, 2, 8, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (29, 2, 5, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (30, 2, 14, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (31, 2, 20, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (32, 2, 21, '2022-06-09 09:26:34', '2023-05-24 12:54:34', 1);
INSERT INTO `sys_role_menu` VALUES (1660883348538585090, 3, 2, '2023-05-23 13:40:22', '2023-05-23 13:40:22', 0);
INSERT INTO `sys_role_menu` VALUES (1660883348567945218, 3, 3, '2023-05-23 13:40:22', '2023-05-23 13:40:22', 0);
INSERT INTO `sys_role_menu` VALUES (1660883348635054081, 3, 4, '2023-05-23 13:40:22', '2023-05-23 13:40:22', 0);
INSERT INTO `sys_role_menu` VALUES (1660883348635054082, 3, 5, '2023-05-23 13:40:22', '2023-05-23 13:40:22', 0);
INSERT INTO `sys_role_menu` VALUES (1660887065132331009, 1660887026343407617, 2, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065132331010, 1660887026343407617, 4, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065132331011, 1660887026343407617, 10, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065132331012, 1660887026343407617, 11, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065132331013, 1660887026343407617, 12, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065199439874, 1660887026343407617, 13, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887065199439875, 1660887026343407617, 19, '2023-05-23 13:55:08', '2023-05-23 13:55:18', 1);
INSERT INTO `sys_role_menu` VALUES (1660887106207150082, 1660887026343407617, 2, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106274258945, 1660887026343407617, 3, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106274258946, 1660887026343407617, 6, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106274258947, 1660887026343407617, 7, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106274258948, 1660887026343407617, 8, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106274258949, 1660887026343407617, 9, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1660887106341367809, 1660887026343407617, 18, '2023-05-23 13:55:18', '2023-05-23 13:55:18', 0);
INSERT INTO `sys_role_menu` VALUES (1661234208955187202, 2, 2, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209022296066, 2, 4, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209022296067, 2, 10, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209022296068, 2, 12, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209022296069, 2, 13, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209089404930, 2, 19, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209089404931, 2, 5, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209089404932, 2, 14, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209089404933, 2, 15, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209156513793, 2, 16, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661234209156513794, 2, 17, '2023-05-24 12:54:34', '2023-05-24 13:05:29', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956224307202, 2, 2, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956291416065, 2, 4, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956291416066, 2, 10, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956291416067, 2, 11, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956291416068, 2, 12, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956291416069, 2, 13, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524929, 2, 19, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524930, 2, 5, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524931, 2, 14, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524932, 2, 15, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524933, 2, 16, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661236956358524934, 2, 17, '2023-05-24 13:05:29', '2023-05-24 13:11:12', 1);
INSERT INTO `sys_role_menu` VALUES (1661238395109654530, 2, 2, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763394, 2, 4, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763395, 2, 10, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763396, 2, 12, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763397, 2, 13, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763398, 2, 19, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395176763399, 2, 5, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395243872257, 2, 14, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395243872258, 2, 15, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395243872259, 2, 16, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);
INSERT INTO `sys_role_menu` VALUES (1661238395243872260, 2, 17, '2023-05-24 13:11:12', '2023-05-24 13:11:12', 0);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机',
  `head_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像地址',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门id',
  `post_id` bigint NULL DEFAULT NULL COMMENT '岗位id',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `status` tinyint UNSIGNED NULL DEFAULT 1 COMMENT '状态（1：正常 0：停用）',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661224806026051586 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '96e79218965eb72c92a549dd5a330112', 'admin', '15099901254', 'http://r61cnlsfq.hn-bkt.clouddn.com/7daa4595-dfde-45da-8513-c5c2b81d20cc', 1021, 5, NULL, 1, '2021-05-31 18:08:43', '2023-05-24 12:18:56', 0);
INSERT INTO `sys_user` VALUES (2, 'wangqq', '96e79218965eb72c92a549dd5a330112', '王倩倩', '15010546381', 'http://r61cnlsfq.hn-bkt.clouddn.com/b09b3467-3d99-437a-bd2e-dd8c9be92bb8', 1022, 6, NULL, 1, '2022-02-08 10:35:38', '2022-05-25 15:58:31', 0);
INSERT INTO `sys_user` VALUES (3, 'wanggang', '96e79218965eb72c92a549dd5a330112', '王刚', '18909098909', NULL, 1024, 5, NULL, 0, '2022-05-24 11:05:40', '2023-05-20 18:01:08', 0);
INSERT INTO `sys_user` VALUES (1659866246222454785, 'wangwei', 'wangwei123456', '王维', '15346581235', '', 1025, 7, '', 0, '2023-05-20 18:18:46', '2023-05-20 18:21:46', 0);
INSERT INTO `sys_user` VALUES (1660154387714072577, 'liguang', '96e79218965eb72c92a454da5b514862', '李广', '15656548123', '', 1025, 6, '', 0, '2023-05-21 13:23:44', '2023-05-21 13:51:13', 1);
INSERT INTO `sys_user` VALUES (1660158427533529090, 'dongming', '123456', '董明', '15465238452', NULL, NULL, NULL, NULL, 1, '2023-05-21 13:39:48', '2023-05-21 13:39:48', 0);
INSERT INTO `sys_user` VALUES (1661224806026051585, 'test1', 'e10adc3949ba59abbe56e057f20f883e', '测试', '15656548462', '', 1026, 6, '', 1, '2023-05-24 12:17:12', '2023-05-24 12:55:37', 0);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '删除标记（0:可用 1:已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_admin_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661234010208092163 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1660498013585420289, 2, 1, '2023-05-22 12:09:11', '2023-05-23 20:08:50', 0);
INSERT INTO `sys_user_role` VALUES (1660498889037443074, 1, 6, '2023-05-22 12:12:40', '2023-05-22 12:12:40', 0);
INSERT INTO `sys_user_role` VALUES (1660498889037443075, 2, 6, '2023-05-22 12:12:40', '2023-05-22 12:12:40', 0);
INSERT INTO `sys_user_role` VALUES (1660498889037443076, 3, 6, '2023-05-22 12:12:40', '2023-05-22 12:12:40', 0);
INSERT INTO `sys_user_role` VALUES (1660499437056815106, 8, 1, '2023-05-22 12:14:51', '2023-05-22 13:05:37', 1);
INSERT INTO `sys_user_role` VALUES (1660511560289849345, 1, 7, '2023-05-22 13:03:01', '2023-05-22 13:03:01', 0);
INSERT INTO `sys_user_role` VALUES (1660511560352763906, 2, 7, '2023-05-22 13:03:01', '2023-05-22 13:03:01', 0);
INSERT INTO `sys_user_role` VALUES (1660511560352763907, 3, 7, '2023-05-22 13:03:01', '2023-05-22 13:03:01', 0);
INSERT INTO `sys_user_role` VALUES (1660512214521581569, 1, 1, '2023-05-22 13:05:37', '2023-05-22 13:05:37', 0);
INSERT INTO `sys_user_role` VALUES (1661234010208092162, 2, 1661224806026051585, '2023-05-24 12:53:46', '2023-05-24 12:53:46', 0);

SET FOREIGN_KEY_CHECKS = 1;
