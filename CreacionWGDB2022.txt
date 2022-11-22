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
CREATE SCHEMA IF NOT EXISTS `wgdb2022` DEFAULT CHARACTER SET utf8 ;
USE `wgdb2022` ;

-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona` (
  `idPersona` INT NOT NULL,
  `NamePersona` VARCHAR(45) NOT NULL,
  `LastnPersona` VARCHAR(45) NOT NULL,
  `AboutMe` VARCHAR(255) NULL,
  `AboutMe2` VARCHAR(255) NULL,
  PRIMARY KEY (`idPersona`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Redes` (
  `idRedes` INT NOT NULL,
  `NameRedes` VARCHAR(100) NULL,
  `LinkRedes` VARCHAR(255) NULL,
  PRIMARY KEY (`idRedes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Experience` (
  `idExperience` INT NOT NULL,
  `NameExp` VARCHAR(100) NULL,
  `StartEndEx` VARCHAR(45) NULL,
  `LinkEx` VARCHAR(255) NULL,
  `Puesto` VARCHAR(255) NULL,
  PRIMARY KEY (`idExperience`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Education` (
  `idEducation` INT NOT NULL,
  `NameEd` VARCHAR(100) NULL,
  `StartEndEd` VARCHAR(10) NULL,
  `DescriptionEd` VARCHAR(255) NULL,
  `Linked` VARCHAR(255) NULL,
  PRIMARY KEY (`idEducation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Hard&Soft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Hard&Soft` (
  `idHard&Soft` INT NOT NULL,
  `NameH&S` VARCHAR(100) NULL,
  `PercentH&S` INT NULL,
  PRIMARY KEY (`idHard&Soft`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Proyects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Proyects` (
  `idProyects` INT NOT NULL,
  `NameP` VARCHAR(100) NULL,
  `DescritionP` VARCHAR(255) NULL,
  `LinkP` VARCHAR(255) NULL,
  PRIMARY KEY (`idProyects`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`OtherPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`OtherPersona` (
  `idOtherPersona` INT NOT NULL,
  `LinkOther` VARCHAR(255) NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idOtherPersona`, `Persona_idPersona`),
  INDEX `fk_OtherPersona_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_OtherPersona_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona_has_Redes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona_has_Redes` (
  `Persona_idPersona` INT NOT NULL,
  `Redes_idRedes` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Redes_idRedes`),
  INDEX `fk_Persona_has_Redes_Redes1_idx` (`Redes_idRedes` ASC) VISIBLE,
  INDEX `fk_Persona_has_Redes_Persona_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Redes_Persona`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Redes_Redes1`
    FOREIGN KEY (`Redes_idRedes`)
    REFERENCES `wgdb2022`.`Redes` (`idRedes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona_has_Education`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona_has_Education` (
  `Persona_idPersona` INT NOT NULL,
  `Education_idEducation` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Education_idEducation`),
  INDEX `fk_Persona_has_Education_Education1_idx` (`Education_idEducation` ASC) VISIBLE,
  INDEX `fk_Persona_has_Education_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Education_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Education_Education1`
    FOREIGN KEY (`Education_idEducation`)
    REFERENCES `wgdb2022`.`Education` (`idEducation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona_has_Experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona_has_Experience` (
  `Persona_idPersona` INT NOT NULL,
  `Experience_idExperience` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Experience_idExperience`),
  INDEX `fk_Persona_has_Experience_Experience1_idx` (`Experience_idExperience` ASC) VISIBLE,
  INDEX `fk_Persona_has_Experience_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Experience_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Experience_Experience1`
    FOREIGN KEY (`Experience_idExperience`)
    REFERENCES `wgdb2022`.`Experience` (`idExperience`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona_has_Proyects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona_has_Proyects` (
  `Persona_idPersona` INT NOT NULL,
  `Proyects_idProyects` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Proyects_idProyects`),
  INDEX `fk_Persona_has_Proyects_Proyects1_idx` (`Proyects_idProyects` ASC) VISIBLE,
  INDEX `fk_Persona_has_Proyects_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Proyects_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Proyects_Proyects1`
    FOREIGN KEY (`Proyects_idProyects`)
    REFERENCES `wgdb2022`.`Proyects` (`idProyects`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wgdb2022`.`Persona_has_Hard&Soft`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wgdb2022`.`Persona_has_Hard&Soft` (
  `Persona_idPersona` INT NOT NULL,
  `Hard&Soft_idHard&Soft` INT NOT NULL,
  PRIMARY KEY (`Persona_idPersona`, `Hard&Soft_idHard&Soft`),
  INDEX `fk_Persona_has_Hard&Soft_Hard&Soft1_idx` (`Hard&Soft_idHard&Soft` ASC) VISIBLE,
  INDEX `fk_Persona_has_Hard&Soft_Persona1_idx` (`Persona_idPersona` ASC) VISIBLE,
  CONSTRAINT `fk_Persona_has_Hard&Soft_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `wgdb2022`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Persona_has_Hard&Soft_Hard&Soft1`
    FOREIGN KEY (`Hard&Soft_idHard&Soft`)
    REFERENCES `wgdb2022`.`Hard&Soft` (`idHard&Soft`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
