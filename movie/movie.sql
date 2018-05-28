/*
 Navicat MySQL Data Transfer

 Source Server         : ubuntu
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 192.168.1.104:3306
 Source Schema         : movie

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 28/05/2018 16:27:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (6, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (7, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (8, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (11, 'Can view group', 2, 'view_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view permission', 3, 'view_permission');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add Bookmark', 6, 'add_bookmark');
INSERT INTO `auth_permission` VALUES (22, 'Can change Bookmark', 6, 'change_bookmark');
INSERT INTO `auth_permission` VALUES (23, 'Can delete Bookmark', 6, 'delete_bookmark');
INSERT INTO `auth_permission` VALUES (24, 'Can add User Setting', 7, 'add_usersettings');
INSERT INTO `auth_permission` VALUES (25, 'Can change User Setting', 7, 'change_usersettings');
INSERT INTO `auth_permission` VALUES (26, 'Can delete User Setting', 7, 'delete_usersettings');
INSERT INTO `auth_permission` VALUES (27, 'Can add User Widget', 8, 'add_userwidget');
INSERT INTO `auth_permission` VALUES (28, 'Can change User Widget', 8, 'change_userwidget');
INSERT INTO `auth_permission` VALUES (29, 'Can delete User Widget', 8, 'delete_userwidget');
INSERT INTO `auth_permission` VALUES (30, 'Can add log entry', 9, 'add_log');
INSERT INTO `auth_permission` VALUES (31, 'Can change log entry', 9, 'change_log');
INSERT INTO `auth_permission` VALUES (32, 'Can delete log entry', 9, 'delete_log');
INSERT INTO `auth_permission` VALUES (33, 'Can view Bookmark', 6, 'view_bookmark');
INSERT INTO `auth_permission` VALUES (34, 'Can view log entry', 9, 'view_log');
INSERT INTO `auth_permission` VALUES (35, 'Can view User Setting', 7, 'view_usersettings');
INSERT INTO `auth_permission` VALUES (36, 'Can view User Widget', 8, 'view_userwidget');
INSERT INTO `auth_permission` VALUES (37, 'Can add 用户信息', 10, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (38, 'Can change 用户信息', 10, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (39, 'Can delete 用户信息', 10, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (40, 'Can add 登录日志', 11, 'add_userlog');
INSERT INTO `auth_permission` VALUES (41, 'Can change 登录日志', 11, 'change_userlog');
INSERT INTO `auth_permission` VALUES (42, 'Can delete 登录日志', 11, 'delete_userlog');
INSERT INTO `auth_permission` VALUES (43, 'Can view 登录日志', 11, 'view_userlog');
INSERT INTO `auth_permission` VALUES (44, 'Can view 用户信息', 10, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (45, 'Can add 上映预告', 12, 'add_preview');
INSERT INTO `auth_permission` VALUES (46, 'Can change 上映预告', 12, 'change_preview');
INSERT INTO `auth_permission` VALUES (47, 'Can delete 上映预告', 12, 'delete_preview');
INSERT INTO `auth_permission` VALUES (48, 'Can add 用户评论', 13, 'add_comment');
INSERT INTO `auth_permission` VALUES (49, 'Can change 用户评论', 13, 'change_comment');
INSERT INTO `auth_permission` VALUES (50, 'Can delete 用户评论', 13, 'delete_comment');
INSERT INTO `auth_permission` VALUES (51, 'Can add 电影信息', 14, 'add_movie');
INSERT INTO `auth_permission` VALUES (52, 'Can change 电影信息', 14, 'change_movie');
INSERT INTO `auth_permission` VALUES (53, 'Can delete 电影信息', 14, 'delete_movie');
INSERT INTO `auth_permission` VALUES (54, 'Can add 标签', 15, 'add_tag');
INSERT INTO `auth_permission` VALUES (55, 'Can change 标签', 15, 'change_tag');
INSERT INTO `auth_permission` VALUES (56, 'Can delete 标签', 15, 'delete_tag');
INSERT INTO `auth_permission` VALUES (57, 'Can add 用户收藏', 16, 'add_moviecol');
INSERT INTO `auth_permission` VALUES (58, 'Can change 用户收藏', 16, 'change_moviecol');
INSERT INTO `auth_permission` VALUES (59, 'Can delete 用户收藏', 16, 'delete_moviecol');
INSERT INTO `auth_permission` VALUES (60, 'Can view 用户评论', 13, 'view_comment');
INSERT INTO `auth_permission` VALUES (61, 'Can view 电影信息', 14, 'view_movie');
INSERT INTO `auth_permission` VALUES (62, 'Can view 用户收藏', 16, 'view_moviecol');
INSERT INTO `auth_permission` VALUES (63, 'Can view 上映预告', 12, 'view_preview');
INSERT INTO `auth_permission` VALUES (64, 'Can view 标签', 15, 'view_tag');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (13, 'film', 'comment');
INSERT INTO `django_content_type` VALUES (14, 'film', 'movie');
INSERT INTO `django_content_type` VALUES (16, 'film', 'moviecol');
INSERT INTO `django_content_type` VALUES (12, 'film', 'preview');
INSERT INTO `django_content_type` VALUES (15, 'film', 'tag');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (11, 'users', 'userlog');
INSERT INTO `django_content_type` VALUES (10, 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES (6, 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES (9, 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES (7, 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES (8, 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-05-26 09:55:29.481198');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-05-26 09:55:29.511787');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-05-26 09:55:29.598084');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-05-26 09:55:29.626531');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-05-26 09:55:29.638130');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-05-26 09:55:29.656322');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-05-26 09:55:29.674111');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-05-26 09:55:29.676787');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-05-26 09:55:29.697067');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-05-26 09:55:29.713228');
INSERT INTO `django_migrations` VALUES (11, 'users', '0001_initial', '2018-05-26 09:55:29.850234');
INSERT INTO `django_migrations` VALUES (12, 'admin', '0001_initial', '2018-05-26 09:55:29.916026');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0002_logentry_remove_auto_add', '2018-05-26 09:55:29.932643');
INSERT INTO `django_migrations` VALUES (14, 'film', '0001_initial', '2018-05-26 09:55:29.986084');
INSERT INTO `django_migrations` VALUES (15, 'film', '0002_auto_20180526_0955', '2018-05-26 09:55:30.119739');
INSERT INTO `django_migrations` VALUES (16, 'sessions', '0001_initial', '2018-05-26 09:55:30.152713');
INSERT INTO `django_migrations` VALUES (17, 'xadmin', '0001_initial', '2018-05-26 09:55:30.276726');
INSERT INTO `django_migrations` VALUES (18, 'xadmin', '0002_log', '2018-05-26 09:55:30.327497');
INSERT INTO `django_migrations` VALUES (19, 'xadmin', '0003_auto_20160715_0100', '2018-05-26 09:55:30.363504');
INSERT INTO `django_migrations` VALUES (20, 'film', '0003_auto_20180526_1452', '2018-05-26 14:52:41.017965');
INSERT INTO `django_migrations` VALUES (21, 'users', '0002_auto_20180526_1506', '2018-05-26 15:06:52.878808');
INSERT INTO `django_migrations` VALUES (22, 'film', '0004_auto_20180526_1702', '2018-05-26 17:02:31.102707');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('bd25qqb17fydjnooz0z0bja3x3bwwyfb', 'NTEzNTY2Y2IzOGVmMjFiMTAzNDk4NWQ0MGVmYzU0OGJjMGVjYzljODp7Il9hdXRoX3VzZXJfaGFzaCI6IjkxMjBmYmU4N2Y2Yjg4NGE4YWI0MjQxNDA3ZDlhMDQ2ZTAwZmQzMDciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJ1c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjIifQ==', '2018-06-10 10:18:03.688090');
INSERT INTO `django_session` VALUES ('xs2c0lu5mxb469ale56k78cjn7rdzdzy', 'MTI4OTYyMjYyYWFhMzdlMjAwZjBhZTMwNjcwZTAwZGNlYmQ2YmQ3NTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6InVzZXJzLnZpZXdzLkN1c3RvbUJhY2tlbmQiLCJMSVNUX1FVRVJZIjpbWyJmaWxtIiwibW92aWUiXSwiIl0sIm5hdl9tZW51IjoiW3tcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIvYWRtaW4vZmlsbS90YWcvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDgsIFwidGl0bGVcIjogXCJcdTY4MDdcdTdiN2VcIn0sIHtcInVybFwiOiBcIi9hZG1pbi9maWxtL21vdmllL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA5LCBcInRpdGxlXCI6IFwiXHU3NTM1XHU1ZjcxXHU0ZmUxXHU2MDZmXCJ9LCB7XCJ1cmxcIjogXCIvYWRtaW4vZmlsbS9wcmV2aWV3L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMCwgXCJ0aXRsZVwiOiBcIlx1NGUwYVx1NjYyMFx1OTg4NFx1NTQ0YVwifSwge1widXJsXCI6IFwiL2FkbWluL2ZpbG0vbW92aWVjb2wvXCIsIFwiaWNvblwiOiBudWxsLCBcIm9yZGVyXCI6IDExLCBcInRpdGxlXCI6IFwiXHU3NTI4XHU2MjM3XHU2NTM2XHU4NWNmXCJ9LCB7XCJ1cmxcIjogXCIvYWRtaW4vZmlsbS9jb21tZW50L1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiAxMiwgXCJ0aXRsZVwiOiBcIlx1NzUyOFx1NjIzN1x1OGJjNFx1OGJiYVwifV0sIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2ZpbG0vdGFnL1wiLCBcInRpdGxlXCI6IFwiRmlsbVwifSwge1wibWVudXNcIjogW3tcInVybFwiOiBcIi9hZG1pbi91c2Vycy91c2VycHJvZmlsZS9cIiwgXCJpY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcIm9yZGVyXCI6IDMsIFwidGl0bGVcIjogXCJcdTc1MjhcdTYyMzdcdTRmZTFcdTYwNmZcIn0sIHtcInVybFwiOiBcIi9hZG1pbi91c2Vycy91c2VybG9nL1wiLCBcImljb25cIjogbnVsbCwgXCJvcmRlclwiOiA3LCBcInRpdGxlXCI6IFwiXHU3NjdiXHU1ZjU1XHU2NWU1XHU1ZmQ3XCJ9XSwgXCJmaXJzdF9pY29uXCI6IFwiZmEgZmEtdXNlclwiLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi91c2Vycy91c2VybG9nL1wiLCBcInRpdGxlXCI6IFwiVXNlcnNcIn0sIHtcIm1lbnVzXCI6IFt7XCJ1cmxcIjogXCIvYWRtaW4veGFkbWluL2xvZy9cIiwgXCJpY29uXCI6IFwiZmEgZmEtY29nXCIsIFwib3JkZXJcIjogNiwgXCJ0aXRsZVwiOiBcIlx1NjVlNVx1NWZkN1x1OGJiMFx1NWY1NVwifV0sIFwiZmlyc3RfaWNvblwiOiBcImZhIGZhLWNvZ1wiLCBcImZpcnN0X3VybFwiOiBcIi9hZG1pbi94YWRtaW4vbG9nL1wiLCBcInRpdGxlXCI6IFwiXHU3YmExXHU3NDA2XCJ9LCB7XCJtZW51c1wiOiBbe1widXJsXCI6IFwiL2FkbWluL2F1dGgvZ3JvdXAvXCIsIFwiaWNvblwiOiBcImZhIGZhLWdyb3VwXCIsIFwib3JkZXJcIjogMiwgXCJ0aXRsZVwiOiBcIlx1N2VjNFwifSwge1widXJsXCI6IFwiL2FkbWluL2F1dGgvcGVybWlzc2lvbi9cIiwgXCJpY29uXCI6IFwiZmEgZmEtbG9ja1wiLCBcIm9yZGVyXCI6IDQsIFwidGl0bGVcIjogXCJcdTY3NDNcdTk2NTBcIn1dLCBcImZpcnN0X2ljb25cIjogXCJmYSBmYS1sb2NrXCIsIFwiZmlyc3RfdXJsXCI6IFwiL2FkbWluL2F1dGgvcGVybWlzc2lvbi9cIiwgXCJ0aXRsZVwiOiBcIlx1OGJhNFx1OGJjMVx1NTQ4Y1x1NjM4OFx1Njc0M1wifV0iLCJfYXV0aF91c2VyX2hhc2giOiJlMjQ0ZjAyZDcxMWZkNjM3YTQwMjJjMDNmMTkwODQxZTEzMGNhOTQwIiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==', '2018-06-11 16:24:40.341772');

-- ----------------------------
-- Table structure for film_comment
-- ----------------------------
DROP TABLE IF EXISTS `film_comment`;
CREATE TABLE `film_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `film_comment_movie_id_cc865705_fk_film_movie_id`(`movie_id`) USING BTREE,
  INDEX `film_comment_user_id_ed9ff55a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `film_comment_movie_id_cc865705_fk_film_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `film_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `film_comment_user_id_ed9ff55a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film_comment
-- ----------------------------
INSERT INTO `film_comment` VALUES (1, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">复仇者联盟</span></p>', '2018-05-27 13:10:51.344691', 1, 1);
INSERT INTO `film_comment` VALUES (2, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">复仇者联盟</span></p>', '2018-05-27 13:11:24.017319', 1, 1);
INSERT INTO `film_comment` VALUES (3, '<p><span style=\"color: rgb(51, 51, 51); font-family: &quot;Microsoft YaHei&quot;, sans-serif; font-size: 14px; background-color: rgb(255, 255, 255);\">美国队长</span></p>', '2018-05-27 13:16:33.943223', 1, 1);

-- ----------------------------
-- Table structure for film_movie
-- ----------------------------
DROP TABLE IF EXISTS `film_movie`;
CREATE TABLE `film_movie`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `star` int(11) NOT NULL,
  `play_nums` int(11) NOT NULL,
  `comment_nums` int(11) NOT NULL,
  `area` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `release_time` date NOT NULL,
  `length` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `download_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `movie_file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `film_movie_tag_id_6e40566f_fk_film_tag_id`(`tag_id`) USING BTREE,
  CONSTRAINT `film_movie_tag_id_6e40566f_fk_film_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `film_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film_movie
-- ----------------------------
INSERT INTO `film_movie` VALUES (1, '美国队长3', '美国队长史蒂夫·罗杰斯带领着全新组建的复仇者联盟，继续维护世界和平。然而，一次执行任务时联盟成员不小心造成大量平民伤亡，从而激发政治压力，政府决定通过一套监管系统来管理和领导复仇者联盟。', 'banner/2018/05/duiz.jpg', 4, 130, 102, '美国/中国', '2016-05-06', '02:36:12', '2018-05-26 20:13:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (2, '复仇者联盟', '一股突如其来的强大邪恶势力对地球造成致命威胁，没有任何一个超级英雄能够单独抵挡。长期致力于保护全球安危的神盾局（SHIELD）感到措手不及，其指挥官“独眼侠”尼克·弗瑞……', 'banner/2018/05/meng_FgQ2vtG.jpg', 5, 11, 12, '美国/中国', '2015-08-06', '02:50:11', '2018-05-26 21:12:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/01.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (3, '蝙蝠侠：黑暗骑士', '从亲眼目睹父母被人杀死的阴影中走出来的“蝙蝠侠”，经历了成长之后，已经不再是那个桀骜不的孤单英雄了。', 'banner/2018/05/111_Ce8QdWY.jpg', 3, 2, 2, '美国/中国', '2010-02-02', '03:02:13', '2018-05-26 21:15:00.000000', 5, 'http://p9fggg4wd.bkt.clouddn.com/shan.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (4, '肖申克的救赎', '20世纪40年代末，小有成就的青年银行家安迪因涉嫌杀害妻子及她的情人而锒铛入狱。在这座名为肖申克的监狱内，希望似乎虚无缥缈，终身监禁的惩罚无疑注定了安迪接下来灰暗绝望的人生。', 'banner/2018/05/xiao_VNDmNFw.jpg', 5, 3, 2, '美国/中国', '1994-06-14', '032:48:47', '2018-05-26 21:16:00.000000', 2, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (5, '活着', '富少福贵嗜赌成性，妻子家珍屡劝无果后带着女儿凤霞离开了他，当夜，福贵输光所有家产气死父亲，被迫靠变卖母亲首饰租间破屋过活。一年后，家珍手拉凤霞怀抱刚出世的儿子有庆回到家中，福贵痛改前非，开始靠演皮影戏过起安份守己的日子。', 'banner/2018/05/huo_MLs1cBg.jpg', 5, 10, 12, '美国/中国', '1995-01-31', '02:34:13', '2018-05-26 21:18:00.000000', 2, 'http://p9fggg4wd.bkt.clouddn.com/shan.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (6, '盗梦空间', '道姆·柯布与同事阿瑟和纳什在一次针对日本能源大亨齐藤的盗梦行动中失败，反被齐藤利用。齐藤威逼利诱因遭通缉而流亡海外的柯布帮他拆分他竞争对手的公司，采取极端措施在其唯一继承人罗伯特·费希尔的深层潜意识中种下放弃家族公司、自立门户的想法。', 'banner/2018/05/daom_m2wcA2y.jpg', 2, 10, 11, '美国/中国', '2012-04-06', '03:12:03', '2018-05-26 21:19:00.000000', 3, 'http://p9fggg4wd.bkt.clouddn.com/01.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (7, '钢铁侠', '斯塔克军火公司是美军在全球范围内第一大军火供应商，其新任掌门人托尼•斯塔克风流倜傥，天资聪颖。', 'banner/2018/05/tie_69MCYwU.jpg', 5, 10, 2, '美国/中国', '2010-02-02', '02:12:11', '2018-05-26 21:20:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/shan.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (8, '杀破狼', '刘国忠是一个身患绝症的警察，他的前途暗淡无光，他接到任务要保护一个证人的女儿。督察马军是身手了得的武术家，一心要接替忠的位置。', 'banner/2018/05/sa_2KZbADE.jpg', 1, 11, 2, '美国/中国', '2010-06-22', '01:58:26', '2018-05-26 21:21:00.000000', 4, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (9, '拯救大兵瑞恩', '瑞恩是二战期间的美国伞兵，被困在了敌人后方。更不幸的是，他的三个兄弟全部在战争中死亡，如果他也遇难，家中的老母亲将无依无靠。', 'banner/2018/05/da_zHzkuop.jpg', 3, 11, 2, '美国/中国', '2010-06-09', '03:23:12', '2018-05-26 21:22:00.000000', 6, 'http://p9fggg4wd.bkt.clouddn.com/shan.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (10, '战马', '为了还债，泰德亲自上阵犁地，功夫不负有心人，辛苦换来了收成，但是一场大雨毁了一切。德军来袭，父亲被迫将马变卖给骑兵军，换了30几尼。', 'banner/2018/05/ma_cAxGUJo.jpg', 4, 10, 100, '美国/中国', '2011-06-14', '02:45:23', '2018-05-26 21:23:00.000000', 6, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (11, '蝴蝶效应', '命中注定的事情，释然去面对吧，放下过去，才有未来…即便你握着人生遥控器，也未必能遥出一个完美的人生。', 'banner/2018/05/die_Kjb3G1R.jpg', 1, 14, 13, '美国/中国', '2013-06-11', '02:10:01', '2018-05-26 21:26:00.000000', 3, 'http://p9fggg4wd.bkt.clouddn.com/01.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (12, '叶问', '一代宗师，谦谦君子，温润如玉。', 'banner/2018/05/ye_8OnJdHZ.jpg', 2, 111, 21, '美国/中国', '2010-02-02', '01:40:34', '2018-05-26 21:27:00.000000', 4, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (13, '赤道', '韩国秘密核武器神秘失踪，同时载着军方手提装置的飞机在中国境内坠毁。', 'banner/2018/05/ci_14ytYx8.jpg', 3, 111, 23, '美国/中国', '2014-11-19', '01:45:28', '2018-05-26 21:29:00.000000', 5, 'http://p9fggg4wd.bkt.clouddn.com/shan.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (14, '星际穿越', '你应该敬畏时间，因为那是一切的密码；但不要滥用爱意，因为那不是一切的钥匙。', 'banner/2018/05/timg_VPJwayF.jpg', 4, 10, 100, '美国/中国', '2015-11-19', '02:40:20', '2018-05-26 21:30:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/01.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (15, '美国队长1', '上世纪40年代，纳粹及其邪恶轴心的战火烧遍世界各个角落。居住在布鲁克林的小个子史蒂夫·罗格斯心系国家，一心上阵杀敌，可是糟糕的体格让他始终被征兵办拒之门外。', 'banner/2018/05/01_PdwYgbj.jpg', 2, 2, 3, '美国', '2012-04-06', '02:35:37', '2018-05-28 16:19:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/00.mp4', 'videos/2018/05/01.mp4');
INSERT INTO `film_movie` VALUES (16, '美国队长2', '渐渐习惯了现代生活的美国队长史蒂夫·罗杰斯，在一次行动后隐隐嗅到神盾局内部所弥漫出来的凶险气味。而当得知神盾局正秘密进行的“洞察计划”后，他更为此感到愤怒。', 'banner/2018/05/02.jpg', 4, 3, 1, '美国', '2014-07-16', '02:45:23', '2018-05-28 16:22:00.000000', 1, 'http://p9fggg4wd.bkt.clouddn.com/01.mp4', 'videos/2018/05/01.mp4');

-- ----------------------------
-- Table structure for film_moviecol
-- ----------------------------
DROP TABLE IF EXISTS `film_moviecol`;
CREATE TABLE `film_moviecol`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `film_moviecol_movie_id_2abd3122_fk_film_movie_id`(`movie_id`) USING BTREE,
  INDEX `film_moviecol_user_id_d67549ed_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `film_moviecol_movie_id_2abd3122_fk_film_movie_id` FOREIGN KEY (`movie_id`) REFERENCES `film_movie` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `film_moviecol_user_id_d67549ed_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film_moviecol
-- ----------------------------
INSERT INTO `film_moviecol` VALUES (1, '2018-05-27 13:33:37.275243', 1, 1);

-- ----------------------------
-- Table structure for film_preview
-- ----------------------------
DROP TABLE IF EXISTS `film_preview`;
CREATE TABLE `film_preview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film_preview
-- ----------------------------
INSERT INTO `film_preview` VALUES (6, '蝙蝠侠：黑暗骑士', 'banner/2018/05/banner01.jpg', '2018-05-26 17:02:00.000000');
INSERT INTO `film_preview` VALUES (7, '暮光之城', 'banner/2018/05/banner02.jpg', '2018-05-26 17:03:00.000000');
INSERT INTO `film_preview` VALUES (8, '蜘蛛侠：英雄归来', 'banner/2018/05/banner03.jpg', '2018-05-26 17:03:00.000000');
INSERT INTO `film_preview` VALUES (9, '银河护卫队', 'banner/2018/05/banner04.jpg', '2018-05-26 17:03:00.000000');
INSERT INTO `film_preview` VALUES (10, '复仇者联盟：奥创纪元', 'banner/2018/05/banner05.jpg', '2018-05-26 17:03:00.000000');

-- ----------------------------
-- Table structure for film_tag
-- ----------------------------
DROP TABLE IF EXISTS `film_tag`;
CREATE TABLE `film_tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of film_tag
-- ----------------------------
INSERT INTO `film_tag` VALUES (1, '科幻', '2018-05-26 14:32:00.000000');
INSERT INTO `film_tag` VALUES (2, '剧情', '2018-05-26 14:32:00.000000');
INSERT INTO `film_tag` VALUES (3, '悬疑', '2018-05-26 14:32:00.000000');
INSERT INTO `film_tag` VALUES (4, '动作', '2018-05-26 14:32:00.000000');
INSERT INTO `film_tag` VALUES (5, '犯罪', '2018-05-26 14:33:00.000000');
INSERT INTO `film_tag` VALUES (6, '战争', '2018-05-26 20:48:00.000000');
INSERT INTO `film_tag` VALUES (7, '武侠', '2018-05-27 15:39:00.000000');

-- ----------------------------
-- Table structure for users_userlog
-- ----------------------------
DROP TABLE IF EXISTS `users_userlog`;
CREATE TABLE `users_userlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `users_userlog_user_id_e0a11949_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `users_userlog_user_id_e0a11949_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userlog
-- ----------------------------
INSERT INTO `users_userlog` VALUES (1, '127.0.0.1', '2018-05-27 07:09:43.259718', 1);
INSERT INTO `users_userlog` VALUES (2, '127.0.0.1', '2018-05-27 07:11:51.161457', 1);
INSERT INTO `users_userlog` VALUES (3, '127.0.0.1', '2018-05-27 07:36:55.974301', 1);

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birthday` date NULL DEFAULT NULL,
  `gender` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `uuid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES (1, 'pbkdf2_sha256$36000$gaZXGhuxWl7U$zM9qMFtAme6mI2PdLt4idxGdTjpwioTG4SVFx1aKKXs=', '2018-05-27 15:36:55.971597', 1, 'sky', '', '', '123@qq.com', 1, 1, '2018-05-26 10:12:00.000000', 'Black Widow', '1984-06-13', 'female', 'Get busy living or get busy dying', 'image/2018/05/zi02.jpg', '2018-05-26 10:12:00.000000', '091a55ce3b7b4a2d98b0ea210986bf59', '66666666');
INSERT INTO `users_userprofile` VALUES (2, 'pbkdf2_sha256$36000$7DdhFnjJIMFk$StAQiSbvKXYnhNlzfJLOdxAFEB+9dGvmCdvnvnafkws=', '2018-05-27 10:18:00.000000', 0, 'blue', '', '', '112345@qq.com', 0, 0, '2018-05-27 09:43:00.000000', 'daisy', NULL, 'female', '出来混，迟早要还', 'image/2018/05/zi.png', '2018-05-27 09:43:00.000000', '77c118173cd94799936113780dd5a3bb', '18753376263');
INSERT INTO `users_userprofile` VALUES (5, 'pbkdf2_sha256$36000$tfNW9JEQmjP7$bAU7ft01Oz6UW4SuonYbpysqcDHQJK52e5fMvOzdChg=', NULL, 0, '', '', '', 'asd@qq.com', 0, 0, '2018-05-27 15:16:05.982416', 'haha', NULL, 'female', '', 'image/default.png', '2018-05-27 15:16:05.982439', '3a679f2b68934945ad7bf5b25d4d810e', '2222233333');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq`(`userprofile_id`, `group_id`) USING BTREE,
  INDEX `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq`(`userprofile_id`, `permission_id`) USING BTREE,
  INDEX `users_userprofile_us_permission_id_393136b6_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `query` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_bookmark_content_type_id_60941679_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id`(`content_type_id`) USING BTREE,
  INDEX `xadmin_log_user_id_bb16a176_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES (1, '2018-05-26 14:32:24.912647', '127.0.0.1', '1', '科幻', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (2, '2018-05-26 14:32:33.968458', '127.0.0.1', '2', '剧情', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (3, '2018-05-26 14:32:46.764253', '127.0.0.1', '3', '悬疑', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (4, '2018-05-26 14:33:05.993503', '127.0.0.1', '4', '动作', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (5, '2018-05-26 14:33:18.579247', '127.0.0.1', '5', '犯罪', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (6, '2018-05-26 16:41:25.880728', '127.0.0.1', '1', '蝙蝠侠：黑暗骑士', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (7, '2018-05-26 16:42:18.591369', '127.0.0.1', '2', '暮光之城', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (8, '2018-05-26 16:42:48.258107', '127.0.0.1', '3', '蜘蛛侠：英雄归来', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (9, '2018-05-26 16:43:20.533637', '127.0.0.1', '4', '银河护卫队', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (10, '2018-05-26 16:44:04.144482', '127.0.0.1', '5', '复仇者联盟：奥创纪元', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (11, '2018-05-26 17:03:04.077925', '127.0.0.1', '6', '蝙蝠侠：黑暗骑士', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (12, '2018-05-26 17:03:24.904202', '127.0.0.1', '7', '暮光之城', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (13, '2018-05-26 17:03:41.906986', '127.0.0.1', '8', '蜘蛛侠：英雄归来', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (14, '2018-05-26 17:03:54.717323', '127.0.0.1', '9', '银河护卫队', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (15, '2018-05-26 17:04:06.214384', '127.0.0.1', '10', '复仇者联盟：奥创纪元', 'create', '已添加。', 12, 1);
INSERT INTO `xadmin_log` VALUES (16, '2018-05-26 20:20:15.712584', '127.0.0.1', '1', '美国队长3', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (17, '2018-05-26 20:29:59.584120', '127.0.0.1', '1', '美国队长3', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (18, '2018-05-26 20:32:10.483328', '127.0.0.1', '1', '美国队长3', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (19, '2018-05-26 20:48:38.531278', '127.0.0.1', '6', '战争', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (20, '2018-05-26 21:15:29.642535', '127.0.0.1', '2', '复仇者联盟', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (21, '2018-05-26 21:16:44.291232', '127.0.0.1', '3', '蝙蝠侠：黑暗骑士', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (22, '2018-05-26 21:18:03.389381', '127.0.0.1', '4', '肖申克的救赎', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (23, '2018-05-26 21:19:00.765474', '127.0.0.1', '5', '活着', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (24, '2018-05-26 21:20:00.214162', '127.0.0.1', '6', '盗梦空间', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (25, '2018-05-26 21:21:31.236110', '127.0.0.1', '7', '钢铁侠', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (26, '2018-05-26 21:22:47.421990', '127.0.0.1', '8', '杀破狼', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (27, '2018-05-26 21:23:58.870036', '127.0.0.1', '9', '拯救大兵瑞恩', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (28, '2018-05-26 21:26:36.648635', '127.0.0.1', '10', '战马', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (29, '2018-05-26 21:27:54.266059', '127.0.0.1', '11', '蝴蝶效应', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (30, '2018-05-26 21:29:01.038178', '127.0.0.1', '12', '叶问', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (31, '2018-05-26 21:30:42.269827', '127.0.0.1', '13', '赤道', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (32, '2018-05-26 21:31:28.606585', '127.0.0.1', '14', '星际穿越', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (33, '2018-05-27 10:32:39.497160', '127.0.0.1', '1', 'sky', 'change', '修改 last_login，name，birthday，phone，info，image 和 uuid', 10, 1);
INSERT INTO `xadmin_log` VALUES (34, '2018-05-27 10:37:36.292769', '127.0.0.1', '2', 'blue', 'change', '修改 last_login，info 和 image', 10, 1);
INSERT INTO `xadmin_log` VALUES (35, '2018-05-27 15:39:28.237712', '127.0.0.1', '7', '武侠', 'create', '已添加。', 15, 1);
INSERT INTO `xadmin_log` VALUES (36, '2018-05-27 16:08:26.067323', '127.0.0.1', '14', '星际穿越', 'change', '修改 movie_file，info 和 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (37, '2018-05-27 16:09:43.167941', '127.0.0.1', '14', '星际穿越', 'change', '修改 logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (38, '2018-05-27 16:11:26.704559', '127.0.0.1', '13', '赤道', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (39, '2018-05-27 16:13:38.322053', '127.0.0.1', '12', '叶问', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (40, '2018-05-27 16:14:54.930322', '127.0.0.1', '11', '蝴蝶效应', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (41, '2018-05-27 16:17:10.042311', '127.0.0.1', '10', '战马', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (42, '2018-05-27 16:18:42.256206', '127.0.0.1', '9', '拯救大兵瑞恩', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (43, '2018-05-27 16:20:03.969157', '127.0.0.1', '8', '杀破狼', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (44, '2018-05-27 16:21:19.333118', '127.0.0.1', '7', '钢铁侠', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (45, '2018-05-27 16:23:43.474021', '127.0.0.1', '6', '盗梦空间', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (46, '2018-05-27 16:24:45.691693', '127.0.0.1', '5', '活着', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (47, '2018-05-27 16:25:44.382890', '127.0.0.1', '4', '肖申克的救赎', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (48, '2018-05-27 16:27:32.641781', '127.0.0.1', '2', '复仇者联盟', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (49, '2018-05-27 16:28:38.314854', '127.0.0.1', '1', '美国队长3', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (50, '2018-05-27 16:32:31.275742', '127.0.0.1', '3', '蝙蝠侠：黑暗骑士', 'change', '修改 info，logo 和 length', 14, 1);
INSERT INTO `xadmin_log` VALUES (51, '2018-05-27 16:42:33.000643', '127.0.0.1', '5', '活着', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (52, '2018-05-27 16:44:47.426204', '127.0.0.1', '4', '肖申克的救赎', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (53, '2018-05-27 16:45:01.154384', '127.0.0.1', '3', '蝙蝠侠：黑暗骑士', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (54, '2018-05-27 16:53:11.238211', '127.0.0.1', '14', '星际穿越', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (55, '2018-05-27 16:53:33.325197', '127.0.0.1', '13', '赤道', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (56, '2018-05-27 16:53:44.190800', '127.0.0.1', '14', '星际穿越', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (57, '2018-05-27 16:53:56.340978', '127.0.0.1', '12', '叶问', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (58, '2018-05-27 16:54:08.836382', '127.0.0.1', '11', '蝴蝶效应', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (59, '2018-05-27 16:54:20.614760', '127.0.0.1', '10', '战马', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (60, '2018-05-27 16:54:31.658489', '127.0.0.1', '9', '拯救大兵瑞恩', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (61, '2018-05-27 16:54:43.715219', '127.0.0.1', '8', '杀破狼', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (62, '2018-05-27 16:54:52.000061', '127.0.0.1', '7', '钢铁侠', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (63, '2018-05-27 16:55:00.003695', '127.0.0.1', '6', '盗梦空间', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (64, '2018-05-27 16:55:08.310303', '127.0.0.1', '5', '活着', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (65, '2018-05-27 16:55:16.972654', '127.0.0.1', '4', '肖申克的救赎', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (66, '2018-05-27 16:55:24.596016', '127.0.0.1', '3', '蝙蝠侠：黑暗骑士', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (67, '2018-05-27 16:55:47.276685', '127.0.0.1', '2', '复仇者联盟', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (68, '2018-05-27 16:55:55.602431', '127.0.0.1', '1', '美国队长3', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (69, '2018-05-27 17:29:26.190973', '127.0.0.1', '14', '星际穿越', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (70, '2018-05-27 17:29:37.077481', '127.0.0.1', '13', '赤道', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (71, '2018-05-27 17:29:45.604353', '127.0.0.1', '12', '叶问', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (72, '2018-05-27 17:29:57.020250', '127.0.0.1', '11', '蝴蝶效应', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (73, '2018-05-27 17:30:05.640222', '127.0.0.1', '10', '战马', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (74, '2018-05-27 17:30:15.988957', '127.0.0.1', '9', '拯救大兵瑞恩', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (75, '2018-05-27 17:30:24.811601', '127.0.0.1', '8', '杀破狼', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (76, '2018-05-27 17:30:36.278934', '127.0.0.1', '7', '钢铁侠', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (77, '2018-05-27 17:30:47.172709', '127.0.0.1', '6', '盗梦空间', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (78, '2018-05-27 17:30:56.610450', '127.0.0.1', '5', '活着', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (79, '2018-05-27 17:31:07.849887', '127.0.0.1', '4', '肖申克的救赎', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (80, '2018-05-27 17:31:16.519649', '127.0.0.1', '3', '蝙蝠侠：黑暗骑士', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (81, '2018-05-27 17:31:25.843680', '127.0.0.1', '2', '复仇者联盟', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (82, '2018-05-27 17:31:39.127759', '127.0.0.1', '1', '美国队长3', 'change', '修改 logo', 14, 1);
INSERT INTO `xadmin_log` VALUES (83, '2018-05-28 16:22:39.212208', '127.0.0.1', '15', '美国队长1', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (84, '2018-05-28 16:24:09.228065', '127.0.0.1', '16', '美国队长2', 'create', '已添加。', 14, 1);
INSERT INTO `xadmin_log` VALUES (85, '2018-05-28 16:24:40.197311', '127.0.0.1', '15', '美国队长1', 'change', '修改 info 和 logo', 14, 1);

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES (1, 'dashboard:home:pos', '', 1);

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `widget_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id`(`user_id`) USING BTREE,
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
