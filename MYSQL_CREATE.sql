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
	`active_directory_guid` VARCHAR(36),
	`email` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL,
	`salt` VARCHAR(255) NOT NULL,
	`origin` VARCHAR(5) NOT NULL,
    `last_login` DATETIME NOT NULL,

	PRIMARY KEY(`user_id`)
);

-- -----------------------------------------------------
-- Table `smart_home`.`permissons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`permissions` (
	`permission_id` INTEGER NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`identifier` VARCHAR(50) NOT NULL,
	`description` TEXT NOT NULL,

	PRIMARY KEY (`permission_id`)
);

-- -----------------------------------------------------
-- Table `smart_home`.`user_permissons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `smart_home`.`user_permissions` (
	`user_id` INTEGER NOT NULL,
	`permission_id` INTEGER NOT NULL,

	PRIMARY KEY(`user_id`, `permission_id`),
	FOREIGN KEY (`user_id`) REFERENCES `smart_home`.`users`(`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (`permission_id`) REFERENCES `smart_home`.`permissions`(`permission_id`) ON DELETE CASCADE ON UPDATE CASCADE
);