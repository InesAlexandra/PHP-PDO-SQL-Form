-- MySQL Script generated by MySQL Workbench
-- Wed Feb  2 10:43:49 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `mail` VARCHAR(100) NOT NULL,
  `phone` INT NULL,
  `civility` INT NOT NULL,
  `sex` INT NOT NULL,
  PRIMARY KEY (`id_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`countries` (
  `id_countries` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_countries`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`addresses` (
  `id_addresses` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(60) NOT NULL,
  `postal_code` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `countries_id_countries` INT NOT NULL,
  PRIMARY KEY (`id_addresses`),
  INDEX `fk_addresses_countries_idx` (`countries_id_countries` ASC) VISIBLE,
  CONSTRAINT `fk_addresses_countries`
    FOREIGN KEY (`countries_id_countries`)
    REFERENCES `mydb`.`countries` (`id_countries`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_addresses` (
  `users_id_user` INT NOT NULL,
  `addresses_id_addresses` INT NOT NULL,
  PRIMARY KEY (`users_id_user`, `addresses_id_addresses`),
  INDEX `fk_users_has_addresses_addresses1_idx` (`addresses_id_addresses` ASC) VISIBLE,
  INDEX `fk_users_has_addresses_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_addresses_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `mydb`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_addresses_addresses1`
    FOREIGN KEY (`addresses_id_addresses`)
    REFERENCES `mydb`.`addresses` (`id_addresses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`events` (
  `id_events` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL,
  `date_start` DATETIME NOT NULL,
  `date_end` DATETIME NOT NULL,
  PRIMARY KEY (`id_events`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`users_has_events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`users_has_events` (
  `users_id_user` INT NOT NULL,
  `events_id_events` INT NOT NULL,
  `participant_type` VARCHAR(45) NULL,
  `participant_time` TIMESTAMP NULL,
  PRIMARY KEY (`users_id_user`, `events_id_events`),
  INDEX `fk_users_has_events_events1_idx` (`events_id_events` ASC) VISIBLE,
  INDEX `fk_users_has_events_users1_idx` (`users_id_user` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_events_users1`
    FOREIGN KEY (`users_id_user`)
    REFERENCES `mydb`.`users` (`id_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_events_events1`
    FOREIGN KEY (`events_id_events`)
    REFERENCES `mydb`.`events` (`id_events`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
