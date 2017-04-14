


CREATE TABLE `configure` (
    `configure_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `value` varchar(255),
    PRIMARY KEY (`configure_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);
CREATE TABLE `user_type`(
    `user_type_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_type_name` varchar(255) NOT NULL,
      PRIMARY KEY (`user_type_id`),
    CONSTRAINT `uk_user_type_name` UNIQUE (`user_type_name`) 
);

CREATE TABLE `user` (
    `user_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `type_id` int(11) UNSIGNED NOT NULL,
    `firstname` varchar(255) NOT NULL,
    `lastname` varchar(255) NOT NULL,
    `email` varchar(255) NOT NULL,
    `password` varchar(255) NOT NULL,
    PRIMARY KEY (`user_id`)
 
);
CREATE TABLE `char_type` (
    `char_type_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    PRIMARY KEY (`char_type_id`)
);
INSERT INTO `char_type` (`name`) VALUES ('player');
CREATE TABLE `character` (
    `char_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `char_type_id` int(9) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `class` ENUM('Guardian','Mage','Diversionist','Facillitator','Medic','Warrior'),
    `HP` tinyint NOT NULL,
    `level` smallint NOT NULL,
    `XP` bigint NOT NULL,
    `coins` bigint NOT NULL,
    PRIMARY KEY (`char_id`)
  
);
CREATE TABLE `user_char`(
     `user_char_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
     `user_id` int(9) UNSIGNED NOT NULL,
     `char_id` int(9) UNSIGNED NOT NULL,
     PRIMARY KEY (`user_char_id`)
);
CREATE TABLE `stats`(
    `stats_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` varchar(255) NOT NULL,
    `info` varchar(255) NOT NULL,
     PRIMARY KEY (`stats_id`)
);
INSERT INTO `stats` (`name`, `info`) VALUES ('Strength', 'A measure of physical power higher strength = stroner physical attacks');
INSERT INTO `stats` (`name`, `info`) VALUES ('Magic', 'A measure of how powerful magic based attacks can be ');
INSERT INTO `stats` (`name`, `info`) VALUES ('Intelligence', 'A measure of how strategy ability');
INSERT INTO `stats` (`name`, `info`) VALUES ('Dexterity', 'A measure of how fast a character is');
INSERT INTO `stats` (`name`, `info`) VALUES ('Damage', 'A measure of how deadly the attacks are');
INSERT INTO `stats` (`name`, `info`) VALUES ('Vitality', 'A measure of how resilient a charcter is');
CREATE TABLE `char_stats`(
    `char_stats_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `char_id` int(9) UNSIGNED NOT NULL,
    `stats_id` int(9) UNSIGNED NOT NULL,
    PRIMARY KEY (`char_stats_id`)

);

CREATE TABLE `location`(
`location_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
`city_id` int(9) UNSIGNED NOT NULL,
`horiz` bigint NOT NULL,
`vert` bigint NOT NULL,
PRIMARY KEY (`location_id`),
CONSTRAINT `uk_horiz_vert` UNIQUE (`horiz`,`vert`)
);

CREATE TABLE `equip_slot`(
    `equip_slot_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT ,
    `name` varchar(255) NOT NULL ,
    PRIMARY KEY (`equip_slot_id`),
    CONSTRAINT `uk_name` UNIQUE (`name`)
);
INSERT INTO `equip_slot` (`name`) VALUES ('helmet');
INSERT INTO `equip_slot` (`name`) VALUES ('right_hand');
INSERT INTO `equip_slot` (`name`) VALUES ('left_hand');
INSERT INTO `equip_slot` (`name`) VALUES ('boots');
CREATE TABLE `char_equip`(
`char_equip_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
 `equip_slot_id` int(9) UNSIGNED NOT NULL,
  `char_id` int(9) UNSIGNED NOT NULL,
    `item_id` int(9) UNSIGNED NOT NULL,
    PRIMARY KEY (`char_equip_id`),
    CONSTRAINT `uk_char_id` UNIQUE ( `char_id`)
  
);
CREATE TABLE `item`(
    `item_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_type_id` int(9) UNSIGNED NOT NULL,
    `name` varchar(255) NOT NULL,
    `level_unlocked` smallint,
    PRIMARY KEY(`item_id`)

);

CREATE TABLE `item_stats`(
    `item_stats_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `item_id` int(9) UNSIGNED NOT NULL,
    `stats_id` int(9) UNSIGNED NOT NULL,
    `item_value` bigint NOT NULL,
    PRIMARY KEY (`item_stats_id`),
    CONSTRAINT `uk_item_id_stats_id` UNIQUE (`item_id`, `stats_id`)
  
);

CREATE TABLE `char_item`(
    `char_item_id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT,
    `char_id` int(9) UNSIGNED NOT NULL,
    `item_id` int(9) UNSIGNED NOT NULL,
    PRIMARY KEY (`char_item_id`),
    CONSTRAINT `uk_char_id_item_id` UNIQUE (`char_id`, `item_id`)
   
);



