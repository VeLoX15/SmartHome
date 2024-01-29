#
# Core data for the Tablebricks Automation Interface
# 
# Copyright (c) 2023 Tablebricks
#
#------------------------------------------------------------------
#

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;

USE `smart_home`;

#
# Dumping data for table 'smart_home'.'permissions'
#

INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (1, 'VIEW_APARTMENT');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (2, 'VIEW_LIVING_ROOM');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (3, 'VIEW_BEDROOM');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (4, 'VIEW_KITCHEN');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (5, 'VIEW_BATHROOM');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (6, 'VIEW_STORAGE_ROOM');
INSERT INTO `smart_home`.`permissions` (`permission_id`, `identifier`) VALUES (7, 'VIEW_HALLWAY');
# 7 records

#
# Dumping data for table 'smart_home'.'permission_description'
#

INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (1, 'en', 'View Apartment', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (1, 'de', 'Wohnung einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (2, 'en', 'View Living Room', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (2, 'de', 'Wohnzimmer einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (3, 'en', 'View Bed Room', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (3, 'de', 'Schlafzimmer einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (4, 'en', 'View Kitchen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (4, 'de', 'Küche einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (5, 'en', 'View Bath Room', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (5, 'de', 'Badezimmer einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (6, 'en', 'View Storage Room', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (6, 'de', 'Abstellraum einsehen', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (7, 'en', 'View Hallway', '');
INSERT INTO `smart_home`.`permission_description` (`permission_id`, `code`, `name`, `description`) VALUES (7, 'de', 'Diele einsehen', '');
# 14 records

#
# Optional: Adds an admin user
#
#------------------------------------------------------------------
#

#
# Dumping data for table 'smart_home'.'users'
#

INSERT INTO `smart_home`.`users` (`user_id`, `username`, `display_name`, `password`, `salt`, `last_login`) VALUES (1, 'admin', 'Administrator', 'AQAAAAIAAYagAAAAECDOJwBpi0sqraVzpbiMs47xjH/gr8+/QcCClDnZ2oHzn1xA1jmU50ym+jODGjAHiQ==', '5Vjt5j4785', '2023-05-23 12:00:00');
# 1 records

#
# Dumping data for table 'smart_home'.'user_permissions'
#

INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 1);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 2);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 3);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 4);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 5);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 6);
INSERT INTO `smart_home`.`user_permissions` (`user_id`, `permission_id`) VALUES (1, 7);
# 7 records

SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;