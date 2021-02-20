create database salesmgt;
use salesmgt;

CREATE TABLE `user` (
  `username` varchar(30) NOT NULL,
  `password_hash` binary(64) NOT NULL,
  `full_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `is_active` bit(1) NOT NULL,
  `user_avatar` varchar(255) DEFAULT NULL,
  `user_gender` bit(1) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `user_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user_role` (
  `username` varchar(30) NOT NULL,
  `role_id` int(11) NOT NULL,
  KEY `role_id` (`role_id`),
  KEY `username` (`username`),
  CONSTRAINT `role_username` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `username_role` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `personal_activity` (
  `personal_activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activity_description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `is_completed` bit(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`personal_activity_id`),
  KEY `username` (`username`),
  CONSTRAINT `User_PersonalActivity` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(30) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `school` (
  `school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_name` varchar(50) NOT NULL,
  `school_addrerss` varchar(50) DEFAULT NULL,
  `district` varchar(50) NOT NULL,
  `school_phone` varchar(15) DEFAULT NULL,
  `school_type` varchar(30) DEFAULT NULL,
  `school_scale` varchar(30) DEFAULT NULL,
  `educational_level` varchar(30) NOT NULL,
  `school_status` varchar(30) NOT NULL,
  `school_description` varchar(250) DEFAULT NULL,
  `note` varchar(250) DEFAULT NULL,
  `is_active` bit(1) NOT NULL,
  `representative_name` varchar(50) DEFAULT NULL,
  `representative_phone` varchar(15) DEFAULT NULL,
  `representative_email` varchar(50) DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  `representative_gender` bit(1) DEFAULT NULL,
  `school_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `target_school` (
  `target_school_id` int(11) NOT NULL AUTO_INCREMENT,
  `school_id` int(11) NOT NULL,
  `purpose` varchar(30) NOT NULL,
  `target_school_status` varchar(30) NOT NULL,
  `school_year` varchar(10) NOT NULL,
  `username` varchar(30) DEFAULT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`target_school_id`),
  KEY `school_id` (`school_id`),
  KEY `username` (`username`),
  CONSTRAINT `school_id` FOREIGN KEY (`school_id`) REFERENCES `school` (`school_id`),
  CONSTRAINT `user_id` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `report` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `target_school_id` int(11) NOT NULL,
  `report_date` date NOT NULL,
  `result` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `report_description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `positivity` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `difficulty` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `future_plan` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `supervisor_comment` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_by` varchar(30) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `modified_by` varchar(30) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  KEY `report_target_id` (`target_school_id`),
  CONSTRAINT `report_target` FOREIGN KEY (`target_school_id`) REFERENCES `target_school` (`target_school_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
