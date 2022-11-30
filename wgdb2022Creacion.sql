-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

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
  `idEducation` INT NOT NULL,
  `NameEd` VARCHAR(100) NULL DEFAULT NULL,
  `StartEndEd` VARCHAR(45) NULL DEFAULT NULL,
  `DescriptionEd` VARCHAR(255) NULL DEFAULT NULL,
  `Linked` VARCHAR(255) NULL DEFAULT NULL,
  `Puesto` VARCHAR(255) NULL,
  PRIMARY KEY (`idEducation`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`experience` (
  `idExperience` INT NOT NULL,
  `NameExp` VARCHAR(100) NULL DEFAULT NULL,
  `StartEndEx` VARCHAR(45) NULL DEFAULT NULL,
  `LinkEx` VARCHAR(255) NULL DEFAULT NULL,
  `Puesto` VARCHAR(255) NULL DEFAULT NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`idExperience`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`hard&soft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`hard&soft` (
  `idHard&Soft` INT NOT NULL,
  `NameH&S` VARCHAR(100) NULL DEFAULT NULL,
  `PercentH&S` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idHard&Soft`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona` (
  `idPersona` INT NOT NULL,
  `NamePersona` VARCHAR(45) NOT NULL,
  `LastnPersona` VARCHAR(45) NOT NULL,
  `AboutMe` VARCHAR(255) NULL DEFAULT NULL,
  `AboutMe2` VARCHAR(255) NULL DEFAULT NULL,
  `Tit1` VARCHAR(100) NULL DEFAULT NULL,
  `Tit2` VARCHAR(100) NULL DEFAULT NULL,
  `banner` VARCHAR(255) NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB
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
    REFERENCES `wgdb2022`.`education` (`idEducation`),
  CONSTRAINT `fk_Persona_has_Education_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`idPersona`))
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
    REFERENCES `wgdb2022`.`experience` (`idExperience`),
  CONSTRAINT `fk_Persona_has_Experience_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`idPersona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_hard&soft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_hard&soft` (
  `Persona_idPersona` INT NOT NULL,
  `Hard&Soft_idHard&Soft` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Hard&Soft_idHard&Soft`),
  INDEX `fk_Persona_has_Hard&Soft_Hard&Soft1_idx` (`Hard&Soft_idHard&Soft` ASC) VISIBLE,
  INDEX `fk_Persona_has_Hard&Soft_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Hard&Soft_Hard&Soft1`
    FOREIGN KEY (`Hard&Soft_idHard&Soft`)
    REFERENCES `wgdb2022`.`hard&soft` (`idHard&Soft`),
  CONSTRAINT `fk_Persona_has_Hard&Soft_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`idPersona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`proyects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`proyects` (
  `idProyects` INT NOT NULL,
  `NameP` VARCHAR(100) NULL DEFAULT NULL,
  `DescritionP` VARCHAR(255) NULL DEFAULT NULL,
  `LinkP` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idProyects`))
ENGINE = InnoDB
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
    REFERENCES `wgdb2022`.`persona` (`idPersona`),
  CONSTRAINT `fk_Persona_has_Proyects_Proyects1`
    FOREIGN KEY (`Proyects_idProyects`)
    REFERENCES `wgdb2022`.`proyects` (`idProyects`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`redes` (
  `idRedes` INT NOT NULL,
  `FotoRedes` VARCHAR(255) NULL DEFAULT NULL,
  `LinkRedes` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idRedes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `wgdb2022`.`persona_has_redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`persona_has_redes` (
  `Persona_idPersona` INT NOT NULL,
  `Redes_idRedes` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Redes_idRedes`),
  INDEX `fk_Persona_has_Redes_Redes1_idx` (`Redes_idRedes` ASC) VISIBLE,
  INDEX `fk_Persona_has_Redes_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Redes_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`persona` (`idPersona`),
  CONSTRAINT `fk_Persona_has_Redes_Redes1`
    FOREIGN KEY (`Redes_idRedes`)
    REFERENCES `wgdb2022`.`redes` (`idRedes`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
