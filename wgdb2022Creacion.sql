-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema wgdb2022
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema wgdb2022
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `wgdb2022` DEFAULT CHARACTER SET utf8mb3 ;
USE `wgdb2022` ;

-- -----------------------------------------------------
-- Table `wgdb2022`.`education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `startend` VARCHAR(45) NULL DEFAULT NULL,
  `descrip` VARCHAR(255) NULL DEFAULT NULL,
  `link` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`experience` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `startend` VARCHAR(45) NULL DEFAULT NULL,
  `link` VARCHAR(255) NULL DEFAULT NULL,
  `job` VARCHAR(255) NULL DEFAULT NULL,
  `descrip` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`hardsoft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`hardsoft` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `perc` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `about1` VARCHAR(255) NULL DEFAULT NULL,
  `about2` VARCHAR(255) NULL DEFAULT NULL,
  `tit1` VARCHAR(100) NULL DEFAULT NULL,
  `tit2` VARCHAR(100) NULL DEFAULT NULL,
  `banner` VARCHAR(255) NULL DEFAULT NULL,
  `link` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_education` (
  `Persona_idPersona` INT NOT NULL,
  `Education_idEducation` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Education_idEducation`),
  INDEX `fk_Persona_has_Education_Education1_idx` (`Education_idEducation` ASC) VISIBLE,
  INDEX `fk_Persona_has_Education_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Education_Education1`
    FOREIGN KEY (`Education_idEducation`)
    REFERENCES `wgdb2022`.`education` (`id`),
  CONSTRAINT `fk_Persona_has_Education_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_experience` (
  `Persona_idPersona` INT NOT NULL,
  `Experience_idExperience` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Experience_idExperience`),
  INDEX `fk_Persona_has_Experience_Experience1_idx` (`Experience_idExperience` ASC) VISIBLE,
  INDEX `fk_Persona_has_Experience_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Experience_Experience1`
    FOREIGN KEY (`Experience_idExperience`)
    REFERENCES `wgdb2022`.`experience` (`id`),
  CONSTRAINT `fk_Persona_has_Experience_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_hardsoft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_hardsoft` (
  `Persona_idPersona` INT NOT NULL,
  `Hard&Soft_idHard&Soft` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Hard&Soft_idHard&Soft`),
  INDEX `fk_Persona_has_Hard&Soft_Hard&Soft1_idx` (`Hard&Soft_idHard&Soft` ASC) VISIBLE,
  INDEX `fk_Persona_has_Hard&Soft_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Hard&Soft_Hard&Soft1`
    FOREIGN KEY (`Hard&Soft_idHard&Soft`)
    REFERENCES `wgdb2022`.`hardsoft` (`id`),
  CONSTRAINT `fk_Persona_has_Hard&Soft_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`proyect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`proyect` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `link` VARCHAR(255) NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `descrip` VARCHAR(255) NULL DEFAULT NULL,
  `linkproy` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_proyects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_proyects` (
  `Persona_idPersona` INT NOT NULL,
  `Proyects_idProyects` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Proyects_idProyects`),
  INDEX `fk_Persona_has_Proyects_Proyects1_idx` (`Proyects_idProyects` ASC) VISIBLE,
  INDEX `fk_Persona_has_Proyects_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Proyects_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`id`),
  CONSTRAINT `fk_Persona_has_Proyects_Proyects1`
    FOREIGN KEY (`Proyects_idProyects`)
    REFERENCES `wgdb2022`.`proyect` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`rol` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `rol_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UK_lqjrcobrh9jc8wpcar64q1bfh` (`user_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`user_rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`user_rol` (
  `user_id` INT NOT NULL,
  `rol_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `rol_id`),
  INDEX `FKpfraq7jod5w5xd3sxm3m6y1o` (`rol_id` ASC) VISIBLE,
  CONSTRAINT `FKkijwolbkui74em8ip1i6vniu4`
    FOREIGN KEY (`user_id`)
    REFERENCES `wgdb2022`.`user` (`id`),
  CONSTRAINT `FKpfraq7jod5w5xd3sxm3m6y1o`
    FOREIGN KEY (`rol_id`)
    REFERENCES `wgdb2022`.`rol` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
