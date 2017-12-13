
CREATE TABLE IF NOT EXISTS `dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学院ID',
  `name` varchar(32) NOT NULL COMMENT '系名称',
  `tel` varchar(30) NOT NULL  COMMENT '系电话',
  `desc` text NULL COMMENT '系描述',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='系表';


CREATE TABLE IF NOT EXISTS `major` (
  `major_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `dept_id` bigint(20) NOT NULL  COMMENT '学院ID',
  `name` varchar(32) NOT NULL COMMENT '系名称',
  PRIMARY KEY (`major_id`),
  FOREIGN KEY (`dept_id`) REFERENCES dept(`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='专业表';


CREATE TABLE IF NOT EXISTS `user` (
    `id` INT(11) PRIMARY KEY auto_inement, 
    `username` VARCHAR(20) NOT null unique,
    `password` VARCHAR(50) NOT NULL ,
    `role` int(11) not NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `student` (
  `student_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '学生ID',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `department` varchar(30) NOT NULL COMMENT '系',  
  `major` varchar(30) NOT NULL COMMENT '专业',
  `classes` varchar(30) NOT NULL COMMENT '班级',
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `age` int(3) NULL COMMENT '年龄',
  `credit` bigint(20) NOT NULL COMMENT '身份证',
  `email` varchar(30) NULL COMMENT '邮箱',
  `phone` varchar(30) NOT NULL  COMMENT '电话',
  `school_year` datetime NOT NULL COMMENT '入学日期',
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='学生表';


CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '教师ID',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
  `name` varchar(32) NOT NULL COMMENT '姓名',
  `department` varchar(30) NOT NULL COMMENT '系',    
  `sex` varchar(10) NOT NULL COMMENT '性别',
  `age` int(3) NULL COMMENT '年龄',
  `credit` bigint(20) NOT NULL COMMENT '身份证',
  `email` varchar(30) NULL COMMENT '邮箱',
  `phone` varchar(30) NOT NULL  COMMENT '电话',
  `teacher_title` varchar(30) NOT NULL COMMENT '职称',
  `school_year` datetime NOT NULL COMMENT '入职日期',
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='教师表';



CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `pwd` varchar(100) NOT NULL COMMENT '密码',
   PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='管理员表';



CREATE TABLE IF NOT EXISTS `course` (
  `course_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `name` varchar(32) NOT NULL COMMENT '课程名',
  `credit` int(2) NOT NULL COMMENT '学分',
  `period` int(3) NOT NULL COMMENT '学时',
  `attribution` varchar(30) NOT NULL COMMENT '归属',
  `nature` varchar(30) NOT NULL COMMENT '性质',
  `dept_name` bigint(20) NOT NULL COMMENT '学院',
  `campus` varchar(20) NOT NULL COMMENT '校区',
  `desc` text  NULL COMMENT '课程描述',  
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='课程信息表';



CREATE TABLE IF NOT EXISTS `teach_course` (
  `teach_course_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `teacher_id` bigint(20) NOT NULL  COMMENT '教师ID',
  `course_id` bigint(20) NOT NULL  COMMENT '课程id',
  `start_week` int NOT NULL COMMENT '起始周',
  `end_week` int NOT NULL COMMENT '结束周',
  `start_take_time` datetime NOT NULL COMMENT '开始上课课的时间',
  `end_take_time` datetime NOT NULL COMMENT '结束上课的时间',
  `start_select_time` datetime NOT NULL COMMENT '开始选课的时间',
  `end_select_time` datetime NOT NULL COMMENT '结束选课的时间',
  `address` varchar(30) NOT NULL COMMENT '开课地点',
  `capacity` int(3) NOT NULL  COMMENT '容量',
  `margin` int(3) NOT NULL  COMMENT '余量',
  `status` int(1) DEFAULT 0 COMMENT '可选状态',
  FOREIGN KEY (`course_id`) REFERENCES course(`course_id`),
  FOREIGN KEY (`teacher_id`) REFERENCES teacher(`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='教师授课表';

CREATE TABLE IF NOT EXISTS `learn_course` (
  `learn_course_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL  COMMENT '学生ID',
  `teach_course_id` int(11) NOT NULL  COMMENT '授课条目id',
  `grade` smallint  NULL COMMENT '成绩',
  `ordinary_grade` smallint  NULL COMMENT '平时成绩',  
  `exam_grade` smallint  NULL COMMENT '考试成绩',  
  FOREIGN KEY (`student_id`) REFERENCES student(`student_id`),
  FOREIGN KEY (`teach_course_id`) REFERENCES teach_course(`teach_course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='学生选课表';

CREATE TABLE IF NOT EXISTS `course_resource` (
  `course_resource_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `teach_course_id` int(11) NOT NULL  COMMENT '授课ID',
  `name` varchar(30) NOT NULL  COMMENT '文件名',
  `upload_time` TIMESTAMP NOT NULL COMMENT '上传时间',
  `desc` text COMMENT '描述',
  `size` int(11) NOT NULL COMMENT '大小' ,
  `path` VARCHAR(100) NOT NULL  COMMENT '路径'
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='课件表';


CREATE TABLE IF NOT EXISTS `course_comment` (
  `course_comment_id` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `student_id` bigint(20) NOT NULL  COMMENT '学生ID',
  `teach_course_id` int(11) NOT NULL  COMMENT '授课条目id',
  `comment_time` TIMESTAMP NOT NULL COMMENT '评论时间',
  `content` text COMMENT '评论内容',
  `comment_id` int(11) COMMENT '回复留言时，父留言的ID', 
  FOREIGN KEY (`student_id`) REFERENCES student(`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='学生选课表';


CREATE TABLE IF NOT EXISTS `notification` (
  `notification_id` int(11) NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '公告ID',
  `teach_course_id` int(11)  COMMENT '授课条目id',
  `announce_time` TIMESTAMP NOT NULL COMMENT '发出时间',
  `content` text COMMENT '公告内容',
  `type`   int COMMENT '通知类型'
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='通知表';

CREATE TABLE IF NOT EXISTS `user_notification` (
  `user_notification_id` int(11) NOT NULL  PRIMARY KEY AUTO_INCREMENT COMMENT '用户公告ID',
  `notification_id` int(11) NOT NULL COMMENT '公告ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `read`   int COMMENT '已读情况',
    FOREIGN KEY (`notification_id`) REFERENCES notification(`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='用户通知表';


CREATE TABLE IF NOT EXISTS `control` (
   `if_comment_course` char(1) NOT NULL check(`if_comment_course` in ('0','1')) ,
   `if_select_course` char(1) NOT NULL check(`if_select_course` in ('0','1')),
   `if_record_results` char(1) NOT NULL check(`if_record_results` in ('0','1'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='控制表';
