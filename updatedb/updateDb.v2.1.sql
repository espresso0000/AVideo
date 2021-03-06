-- MySQL Workbench Synchronization
-- Generated: 2017-04-27 13:27
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Daniel

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `comments` 
DROP FOREIGN KEY `fk_comments_users1`;

ALTER TABLE `configurations` 
ADD COLUMN `ffmpegPath` VARCHAR(255) NULL DEFAULT NULL AFTER `youtubeDl`,
ADD COLUMN `youtubeDlPath` VARCHAR(255) NULL DEFAULT NULL AFTER `ffmpegPath`;

ALTER TABLE `comments` 
ADD CONSTRAINT `fk_comments_users1`
  FOREIGN KEY (`users_id`)
  REFERENCES `users` (`id`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

UPDATE configurations SET  version = '2.1', modified = now() WHERE id = 1;