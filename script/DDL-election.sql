-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema election
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema election
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `election` DEFAULT CHARACTER SET utf8 ;
USE `election` ;

-- -----------------------------------------------------
-- Table `election`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`cities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `zip_code` INT NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`addresses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`addresses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_idx` (`city_id` ASC),
  CONSTRAINT `addresses_citiy_id_FK`
    FOREIGN KEY (`city_id`)
    REFERENCES `election`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`voting_offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`voting_offices` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `number` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `address_id_fk_idx` (`address_id` ASC),
  CONSTRAINT `voting_offices_address_id_FK`
    FOREIGN KEY (`address_id`)
    REFERENCES `election`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`identities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`identities` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `insurance_number` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `insurance_number_UNIQUE` (`insurance_number` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`electors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`electors` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identity_id` INT NOT NULL,
  `birth_date` DATE NOT NULL,
  `birth_place_id` INT NOT NULL,
  `elector_national_id` INT NOT NULL,
  `list_id` INT NOT NULL,
  `home_address_id` INT NOT NULL,
  `voting_office_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `address_id_idx` (`home_address_id` ASC),
  INDEX `city_id_idx` (`birth_place_id` ASC),
  INDEX `identity_id_idx` (`identity_id` ASC),
  INDEX `voting_office_id_FK_idx` (`voting_office_id` ASC),
  UNIQUE INDEX `list_id_UNIQUE` (`list_id` ASC),
  UNIQUE INDEX `elector_national_id_UNIQUE` (`elector_national_id` ASC),
  UNIQUE INDEX `identity_id_UNIQUE` (`identity_id` ASC),
  CONSTRAINT `electors_home_address_id_FK`
    FOREIGN KEY (`home_address_id`)
    REFERENCES `election`.`addresses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `electors_voting_office_id_FK`
    FOREIGN KEY (`voting_office_id`)
    REFERENCES `election`.`voting_offices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `electors_birth_place_id_FK`
    FOREIGN KEY (`birth_place_id`)
    REFERENCES `election`.`cities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `electors_identity_id_FK`
    FOREIGN KEY (`identity_id`)
    REFERENCES `election`.`identities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`candidates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`candidates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identity_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `identity_id_idx` (`identity_id` ASC),
  CONSTRAINT `candidates_identity_id_FK`
    FOREIGN KEY (`identity_id`)
    REFERENCES `election`.`identities` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`polls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`polls` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `round` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`votes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`votes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `elector_id` INT NOT NULL,
  `voting_office_id` INT NOT NULL,
  `candidate_id` INT NOT NULL,
  `poll_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `elector_id_FK_idx` (`elector_id` ASC),
  INDEX `voting_office_id_FK_idx` (`voting_office_id` ASC),
  INDEX `candidate_id_FK_idx` (`candidate_id` ASC),
  INDEX `polls_idx` (`poll_id` ASC),
  CONSTRAINT `votes_elector_id_FK`
    FOREIGN KEY (`elector_id`)
    REFERENCES `election`.`electors` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `votes_voting_office_id_FK`
    FOREIGN KEY (`voting_office_id`)
    REFERENCES `election`.`voting_offices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `votes_candidate_id_FK`
    FOREIGN KEY (`candidate_id`)
    REFERENCES `election`.`candidates` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `votes_poll_id_FK`
    FOREIGN KEY (`poll_id`)
    REFERENCES `election`.`polls` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `election`.`names`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `election`.`names` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
