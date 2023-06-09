#
# Core data for the Smart Home Interface
# 
# Copyright (c) 2023 Tom Sassor
#
#------------------------------------------------------------------
#

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `smart_home`;

#
# Dumping data for table 'permissions'
#

INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (1, 'View House', 'VIEW_HOUSE', '');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (2, 'View Living Room', 'VIEW_LIVING_ROOM', '');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (3, 'View Kitchen', 'VIEW_KITCHEN', '');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (4, 'View Bathroom', 'VIEW_BATHROOM', '');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (5, 'View Bedroom', 'VIEW_BEDROOM', '');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `name`, `identifier`, `description`) VALUES (6, 'View Corridor', 'VIEW_CORRIDOR', '');
# 6 records

#
# Optional: Adds an admin user
#
#------------------------------------------------------------------
#

#
# Dumping data for table 'users'
#

INSERT INTO `smart_home`.`users` (`user_id`, `username`, `display_name`, `active_directory_guid`, `email`, `password`, `salt`, `origin`, `last_login`) VALUES (NULL, 'admin', 'Administrator', NULL, 'Administration@tablebricks.com', 'AQAAAAIAAYagAAAAECDOJwBpi0sqraVzpbiMs47xjH/gr8+/QcCClDnZ2oHzn1xA1jmU50ym+jODGjAHiQ==', '5Vjt5j4785', 'local', '2023-05-23 12:00:00');
# 1 records

#
# Dumping data for table 'user_permissions'
#

INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 1);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 2);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 3);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 4);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 5);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 6);
# 6 records

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;