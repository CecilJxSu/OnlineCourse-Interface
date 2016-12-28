CREATE TABLE `user` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '注册时间',

`status` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '正常：active；封号：lock；永久封号：dead',

`user_status` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '学生：student；老师：teacher；管理员：admin',

`lock_date` datetime NULL COMMENT '封号时间',

`lock_end_date` datetime NULL COMMENT '封号结束时间',

`username` varchar(24) CHARACTER SET utf8 NOT NULL COMMENT '登录用户名',

`password` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '密码',

PRIMARY KEY (`id`) ,

UNIQUE INDEX `Index_username` (`username` ASC)

);



CREATE TABLE `profile` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`user_id` int NOT NULL COMMENT '用户ID',

`university_id` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '学生号或教工号',

`nickname` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '昵称',

`realname` varchar(20) CHARACTER SET utf8 NULL COMMENT '真实姓名',

`gender` varchar(6) CHARACTER SET utf8 NULL COMMENT '性别',

`icon_url` varchar(255) CHARACTER SET utf8 NULL COMMENT '用户头像',

`phone` char(11) CHARACTER SET utf8 NULL COMMENT '手机号码',

`email` varchar(50) CHARACTER SET utf8 NULL COMMENT '邮箱',

`department` varchar(20) CHARACTER SET utf8 NULL COMMENT '用户所在系',

`major` varchar(20) CHARACTER SET utf8 NULL COMMENT '学生专业；如果是教师，可以为空',

`dormitory_address` varchar(20) CHARACTER SET utf8 NULL COMMENT '宿舍地址；如果是教师，可以为空，但教师也可以有',

PRIMARY KEY (`id`) 

);



CREATE TABLE `course` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`status` varchar(6) CHARACTER SET utf8 NOT NULL COMMENT '发布状态，public；草稿保存状态，draft；删除，delete',

`date` datetime NOT NULL COMMENT '创建日期',

`name` varchar(50) CHARACTER SET utf8 NULL COMMENT '课程名',

`introduction` varchar(255) CHARACTER SET utf8 NULL DEFAULT NULL COMMENT '课程介绍',

`user_id` int NOT NULL COMMENT '作者ID',

`department` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '系别：计算机系、外语系...',

`watch_count` int NULL DEFAULT 0 COMMENT '每次观看+1',

`like_count` int NULL DEFAULT 0 COMMENT '每次点赞+2',

`comment_count` int NULL DEFAULT 0 COMMENT '每次评论+3',

`favorite_count` int NULL DEFAULT 0 COMMENT '每次收藏+4',

PRIMARY KEY (`id`) 

);



CREATE TABLE `comment` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建时间',

`target_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '课程：course；话题：comment',

`target_id` int NOT NULL,

`user_id` int NOT NULL COMMENT '用户ID',

`content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '评论内容',

`picture_urls` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片，最多9张',

`like_count` int NULL DEFAULT 0 COMMENT '每次点赞+1',

`reply_count` int NULL DEFAULT 0 COMMENT '每次回复+2',

PRIMARY KEY (`id`) 

);



CREATE TABLE `chat` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建时间',

`title` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '话题标题',

`content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '话题内容',

`html` text CHARACTER SET utf8 NOT NULL COMMENT 'html格式的话题内容',

`user_id` int NOT NULL COMMENT '用户ID',

`picture_urls` varchar(255) CHARACTER SET utf8 NULL COMMENT '图片，最多9张',

`watch_count` int NULL DEFAULT 0 COMMENT '每次查看+1',

`like_count` int NULL DEFAULT 0 COMMENT '每次点赞+2',

`comment_count` int NULL DEFAULT 0 COMMENT '每次评论+3',

`favorite_count` int NULL DEFAULT 0 COMMENT '每次收藏+4',

PRIMARY KEY (`id`) 

);



CREATE TABLE `question` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL,

`catalog_id` int NOT NULL COMMENT '章节ID',

`questions` text CHARACTER SET utf8 NOT NULL COMMENT '题目',

`total` float NOT NULL COMMENT '题目总分',

PRIMARY KEY (`id`) 

);



CREATE TABLE `favorite` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '收藏时间',

`target_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '课程：course；话题：chat',

`target_id` int NOT NULL COMMENT '目标ID',

`user_id` int NOT NULL COMMENT '用户ID',

PRIMARY KEY (`id`) 

);



CREATE TABLE `like` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '点赞时间',

`target_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '课程：course；话题：chat；评论：comment',

`target_id` int NOT NULL COMMENT '目标ID',

`user_id` int NOT NULL COMMENT '用户ID',

PRIMARY KEY (`id`) 

);



CREATE TABLE `following` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '关注时间',

`target_id` int NOT NULL COMMENT '被关注用户ID',

`user_id` int NOT NULL COMMENT '关注用户ID',

PRIMARY KEY (`id`) 

);



CREATE TABLE `reply` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建时间',

`comment_id` int NOT NULL COMMENT '回复对应评论的评论ID',

`to_user_id` int NULL COMMENT '回复对应评论的作者ID',

`user_id` int NOT NULL COMMENT '回复创建的用户ID',

`content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '回复内容',

PRIMARY KEY (`id`) 

);



CREATE TABLE `message` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL,

`is_read` char(1) CHARACTER SET utf8 NOT NULL COMMENT '未读：N；已读：Y',

`type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '消息类型。课程：course；话题：chat；评论：comment；系统：system；用户：user',

`to_user_id` int NOT NULL COMMENT '接收者ID',

`from_user_id` int NULL COMMENT '发送方ID，如果是系统产生，可以为空',

`action_type` varchar(10) CHARACTER SET utf8 NULL COMMENT '消息产生的动作。点赞：like；收藏：favorite；关注：following；回复：reply；评论：comment',

`position_id` int NULL COMMENT '消息产生的对象ID，比如课程ID，话题ID',

`content` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '消息内容',

PRIMARY KEY (`id`) 

);



CREATE TABLE `catalog` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建时间',

`course_id` int NOT NULL COMMENT '课程ID',

`parent_id` int NULL COMMENT '章ID:0为章,!0为节',

`index` int NOT NULL COMMENT '章节号',

`name` varchar(50) CHARACTER SET utf8 NULL COMMENT '章节名称',

`introduction` varchar(255) CHARACTER SET utf8 NULL COMMENT '章节简介',

`url` varchar(255) CHARACTER SET utf8 NULL COMMENT '章节视频源',

`duration` int NULL COMMENT '视频时间长度，毫秒',

`previewImage` varchar(255) CHARACTER SET utf8 NULL COMMENT '预览图',

PRIMARY KEY (`id`) 

);



CREATE TABLE `document` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建日期',

`target_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程：course；章节：catalog',

`target_id` int NOT NULL COMMENT '章节ID或课程ID',

`url` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '文件url',

`type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '文件类型',

`size` int NOT NULL COMMENT '文件大小，单位（B）',

`name` varchar(255) NOT NULL COMMENT '文件名',

PRIMARY KEY (`id`) 

);



CREATE TABLE `watch` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '浏览时间',

`target_type` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '课程：course；话题：chat；文档：document',

`target_id` int NOT NULL COMMENT '目标ID',

`user_id` int NOT NULL COMMENT '观看用户ID',

PRIMARY KEY (`id`) 

);



CREATE TABLE `learn_record` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '创建时间',

`catalog_id` int NOT NULL COMMENT '章节ID',

`user_id` int NOT NULL COMMENT '用户ID',

`progress` double NOT NULL DEFAULT 0.0 COMMENT '观看进度，比如：10%，记录为0.1',

`last_date` datetime NOT NULL COMMENT '最后一次观看的时间',

`last_position` int NOT NULL DEFAULT 0 COMMENT '最后一次，观看视频的位置',

PRIMARY KEY (`id`) 

);



CREATE TABLE `answer` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`date` datetime NOT NULL COMMENT '答题时间',

`question_id` int NOT NULL COMMENT '问题ID',

`user_id` int NOT NULL COMMENT '用户ID',

`answer` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'JSON.toStringify()后的结果，答题数据，每题数组：结构 { index: 1, answer: A,B }',

`total` float NULL DEFAULT 0 COMMENT '总分',

PRIMARY KEY (`id`) 

);



CREATE TABLE `example` (

`id` int UNSIGNED NOT NULL AUTO_INCREMENT,

`name` varchar(255) NULL,

PRIMARY KEY (`id`) 

);





ALTER TABLE `comment` ADD CONSTRAINT `fk_comment_like_1` FOREIGN KEY (`id`) REFERENCES `like` (`target_id`);

ALTER TABLE `reply` ADD CONSTRAINT `fk_reply_comment_1` FOREIGN KEY (`comment_id`) REFERENCES `comment` (`id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_favorite_1` FOREIGN KEY (`id`) REFERENCES `favorite` (`target_id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_comment_1` FOREIGN KEY (`id`) REFERENCES `comment` (`target_id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_like_1` FOREIGN KEY (`id`) REFERENCES `like` (`target_id`);

ALTER TABLE `chat` ADD CONSTRAINT `fk_chat_favorite_1` FOREIGN KEY (`id`) REFERENCES `favorite` (`target_id`);

ALTER TABLE `chat` ADD CONSTRAINT `fk_chat_like_1` FOREIGN KEY (`id`) REFERENCES `like` (`target_id`);

ALTER TABLE `chat` ADD CONSTRAINT `fk_chat_comment_1` FOREIGN KEY (`id`) REFERENCES `comment` (`target_id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_catalog_1` FOREIGN KEY (`id`) REFERENCES `catalog` (`course_id`);

ALTER TABLE `catalog` ADD CONSTRAINT `fk_catalog_document_1` FOREIGN KEY (`id`) REFERENCES `document` (`target_id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_watch_1` FOREIGN KEY (`id`) REFERENCES `watch` (`target_id`);

ALTER TABLE `chat` ADD CONSTRAINT `fk_chat_watch_1` FOREIGN KEY (`id`) REFERENCES `watch` (`target_id`);

ALTER TABLE `document` ADD CONSTRAINT `fk_document_watch_1` FOREIGN KEY (`id`) REFERENCES `watch` (`target_id`);

ALTER TABLE `catalog` ADD CONSTRAINT `fk_catalog_learn_record_1` FOREIGN KEY (`id`) REFERENCES `learn_record` (`catalog_id`);

ALTER TABLE `user` ADD CONSTRAINT `fk_user_following_1` FOREIGN KEY (`id`) REFERENCES `following` (`user_id`);

ALTER TABLE `user` ADD CONSTRAINT `fk_user_profile_1` FOREIGN KEY (`id`) REFERENCES `profile` (`user_id`);

ALTER TABLE `catalog` ADD CONSTRAINT `fk_catalog_question_1` FOREIGN KEY (`id`) REFERENCES `question` (`catalog_id`);

ALTER TABLE `question` ADD CONSTRAINT `fk_question_answer_1` FOREIGN KEY (`id`) REFERENCES `answer` (`question_id`);

ALTER TABLE `user` ADD CONSTRAINT `fk_user_message_1` FOREIGN KEY (`id`) REFERENCES `message` (`to_user_id`);

ALTER TABLE `course` ADD CONSTRAINT `fk_course_document_1` FOREIGN KEY (`id`) REFERENCES `document` (`target_id`);



