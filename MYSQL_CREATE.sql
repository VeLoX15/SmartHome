#
# Installation script for the Tablebricks Automation Interface
# 
# Copyright (c) 2023 Tablebricks
#
#------------------------------------------------------------------
#

DROP SCHEMA IF EXISTS `smart_home` ;
CREATE SCHEMA IF NOT EXISTS `smart_home` DEFAULT CHARACTER SET utf8;
USE `smart_home`;

-- -----------------------------------------------------
-- Table `smart_home`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`users` (
	`user_id` INTEGER NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(50) NOT NULL,
	`display_name` VARCHAR(100) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`salt` VARCHAR(255) NOT NULL,
    `last_login` DATETIME,

	PRIMARY KEY(`user_id`)
);

-- -----------------------------------------------------
-- Table `smart_home`.`permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`permissions` (
	`permission_id` INTEGER NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL,

	PRIMARY KEY (`permission_id`)
);

-- -----------------------------------------------------
-- Table `smart_home`.`permission_description`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`permission_description` (
	`permission_id` INTEGER NOT NULL,
	`code` VARCHAR(5) NOT NULL DEFAULT '',
	`name` VARCHAR(50) NOT NULL,
	`description` TEXT NULL,

	PRIMARY KEY (`permission_id`, `code`),
	FOREIGN KEY (`permission_id`) REFERENCES `smart_home`.`permissions`(`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- Table `smart_home`.`user_permissions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`user_permissions` (
	`user_id` INTEGER NOT NULL,
	`permission_id` INTEGER NOT NULL,

	PRIMARY KEY(`user_id`, `permission_id`),
	FOREIGN KEY (`user_id`) REFERENCES `smart_home`.`users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`permission_id`) REFERENCES `smart_home`.`permissions`(`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
);