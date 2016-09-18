/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50624
Source Host           : 127.0.0.1:3306
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-09-18 23:21:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '答题时间',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `answer` varchar(255) NOT NULL COMMENT 'JSON.toStringify()后的结果，答题数据，每题数组：结构 { index: 1, answer: A,B }',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for catalog
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建时间',
  `course_id` int(11) NOT NULL COMMENT '课程ID',
  `index` int(11) NOT NULL COMMENT '章节号',
  `name` varchar(50) DEFAULT NULL COMMENT '章节名称',
  `introduction` varchar(255) DEFAULT NULL COMMENT '章节简介',
  `key_point` varchar(255) DEFAULT NULL COMMENT '重点、难点',
  `url` varchar(255) DEFAULT NULL COMMENT '章节视频源',
  `duration` int(11) DEFAULT NULL COMMENT '视频时间长度，毫秒',
  `previewImage` varchar(255) DEFAULT NULL COMMENT '预览图',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建时间',
  `title` varchar(50) NOT NULL COMMENT '话题标题',
  `content` varchar(255) NOT NULL COMMENT '话题内容',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `picture_urls` varchar(255) DEFAULT NULL COMMENT '图片，最多9张',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建时间',
  `target_type` varchar(10) NOT NULL COMMENT '课程：course；话题：comment',
  `target_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建日期',
  `name` varchar(50) DEFAULT NULL COMMENT '课程名',
  `introduction` varchar(255) DEFAULT NULL COMMENT '课程介绍',
  `user_id` int(11) NOT NULL COMMENT '作者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS `document`;
CREATE TABLE `document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建日期',
  `catalog_id` int(11) NOT NULL COMMENT '章节ID',
  `url` varchar(255) NOT NULL COMMENT '文件url',
  `type` varchar(20) NOT NULL COMMENT '文件类型',
  `size` int(11) NOT NULL COMMENT '文件大小，单位（B）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for example
-- ----------------------------
DROP TABLE IF EXISTS `example`;
CREATE TABLE `example` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '收藏时间',
  `target_type` varchar(10) NOT NULL COMMENT '课程：course；话题：chat',
  `target_id` int(11) NOT NULL COMMENT '目标ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for following
-- ----------------------------
DROP TABLE IF EXISTS `following`;
CREATE TABLE `following` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '关注时间',
  `target_id` int(11) NOT NULL COMMENT '被关注用户ID',
  `user_id` int(11) NOT NULL COMMENT '关注用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for learn_record
-- ----------------------------
DROP TABLE IF EXISTS `learn_record`;
CREATE TABLE `learn_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建时间',
  `catalog_id` int(11) NOT NULL COMMENT '章节ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `progress` varchar(255) NOT NULL DEFAULT '0.0' COMMENT '观看进度，比如：10%，记录为0.1',
  `last_date` datetime NOT NULL COMMENT '最后一次观看的时间',
  `last_position` int(11) NOT NULL DEFAULT '0' COMMENT '最后一次，观看视频的位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for like
-- ----------------------------
DROP TABLE IF EXISTS `like`;
CREATE TABLE `like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '点赞时间',
  `target_type` varchar(10) NOT NULL COMMENT '课程：course；话题：chat；评论：comment',
  `target_id` int(11) NOT NULL COMMENT '目标ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `is_read` char(1) NOT NULL COMMENT '未读：N；已读：Y',
  `type` varchar(10) NOT NULL COMMENT '消息类型。课程：course；话题：chat；评论：comment；系统：system；用户：user',
  `to_user_id` int(11) NOT NULL COMMENT '接收者ID',
  `from_user_id` int(11) DEFAULT NULL COMMENT '发送方ID，如果是系统产生，可以为空',
  `action_type` varchar(10) DEFAULT NULL COMMENT '消息产生的动作。点赞：like；收藏：favorite；关注：following；回复：reply',
  `position_id` int(11) DEFAULT NULL COMMENT '消息产生的对象ID，比如课程ID，话题ID',
  `content` varchar(255) NOT NULL COMMENT '消息内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `university_id` varchar(20) NOT NULL COMMENT '学生号或教工号',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `realname` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `gender` varchar(6) DEFAULT NULL COMMENT '性别',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '用户头像',
  `phone` char(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `department` varchar(20) DEFAULT NULL COMMENT '用户所在系',
  `major` varchar(20) DEFAULT NULL COMMENT '学生专业；如果是教师，可以为空',
  `dormitory_address` varchar(20) DEFAULT NULL COMMENT '宿舍地址；如果是教师，可以为空，但教师也可以有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `catalog_id` int(11) NOT NULL COMMENT '章节ID',
  `index` int(11) NOT NULL COMMENT '题号',
  `type` varchar(10) NOT NULL COMMENT '试题类型；判断题：1；单选：2；多选：3',
  `question` varchar(255) NOT NULL COMMENT '题目',
  `answer` varchar(255) NOT NULL COMMENT '答案，多个答案用英文逗号分开',
  `itemA` varchar(50) DEFAULT NULL COMMENT '选项A',
  `itemB` varchar(50) DEFAULT NULL COMMENT '选项B',
  `itemC` varchar(50) DEFAULT NULL COMMENT '选项C',
  `itemD` varchar(50) DEFAULT NULL COMMENT '选项D',
  `itemE` varchar(50) DEFAULT NULL COMMENT '选项E',
  `itemF` varchar(50) DEFAULT NULL COMMENT '选项F',
  `explains` varchar(255) DEFAULT NULL COMMENT '题目解释',
  `url` varchar(255) DEFAULT NULL COMMENT '试题图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '创建时间',
  `type` varchar(10) NOT NULL COMMENT '课程评论回复：course；话题评论回复：chat',
  `comment_id` int(11) NOT NULL COMMENT '回复对应评论的评论ID',
  `to_user_id` int(11) DEFAULT NULL COMMENT '回复对应评论的作者ID',
  `user_id` int(11) NOT NULL COMMENT '回复创建的用户ID',
  `content` varchar(255) NOT NULL COMMENT '回复内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '注册时间',
  `status` varchar(10) NOT NULL COMMENT '正常：active；封号：lock；永久封号：dead',
  `user_status` varchar(10) NOT NULL COMMENT '学生：student；老师：teacher；管理员：admin',
  `lock_date` datetime DEFAULT NULL COMMENT '封号时间',
  `lock_end_date` datetime DEFAULT NULL COMMENT '封号结束时间',
  `username` varchar(24) NOT NULL COMMENT '登录用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for watch
-- ----------------------------
DROP TABLE IF EXISTS `watch`;
CREATE TABLE `watch` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL COMMENT '浏览时间',
  `target_type` varchar(10) NOT NULL COMMENT '课程：course；话题：chat；文档：document',
  `target_id` int(11) NOT NULL COMMENT '目标ID',
  `user_id` int(11) NOT NULL COMMENT '观看用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
