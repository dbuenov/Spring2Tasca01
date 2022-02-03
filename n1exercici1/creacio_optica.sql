-- MySQL Workbench Synchronization
-- Generated: 2022-01-31 12:06
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dani

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `optica`.`Ulleres` (
  `idUlleres` INT(11) NOT NULL AUTO_INCREMENT,
  `Montura` ENUM("Flotant", "Pasta", "Metalica") NOT NULL,
  `ColorMontura` VARCHAR(45) NOT NULL,
  `GraduacióD` DECIMAL(10,2) NOT NULL,
  `GraduacióE` DECIMAL(10,2) NOT NULL,
  `ColorVidreD` VARCHAR(45) NOT NULL,
  `ColorVidreE` VARCHAR(45) NOT NULL,
  `Preu` DECIMAL(10,2) NOT NULL,
  `DataVenta` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `idClient` INT(11) NOT NULL,
  `idMarca` INT(11) NOT NULL,
  `idVenedor` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idUlleres`),
  INDEX `fk_Ulleres_Clients1_idx` (`idClient` ASC) VISIBLE,
  INDEX `fk_Ulleres_Marca1_idx` (`idMarca` ASC) VISIBLE,
  INDEX `fk_Ulleres_Venedor1_idx` (`idVenedor` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Clients1`
    FOREIGN KEY (`idClient`)
    REFERENCES `optica`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres_Marca1`
    FOREIGN KEY (`idMarca`)
    REFERENCES `optica`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ulleres_Venedor1`
    FOREIGN KEY (`idVenedor`)
    REFERENCES `optica`.`Venedor` (`idVenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Proveidor` (
  `idProveidor` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Teléfon` VARCHAR(9) NULL DEFAULT NULL,
  `Fax` VARCHAR(9) NULL DEFAULT NULL,
  `NIF` VARCHAR(10) NULL DEFAULT NULL,
  `idAdreça` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idProveidor`),
  INDEX `fk_Proveidor_Adreça1_idx` (`idAdreça` ASC) VISIBLE,
  CONSTRAINT `fk_Proveidor_Adreça1`
    FOREIGN KEY (`idAdreça`)
    REFERENCES `optica`.`Adreça` (`idAdreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Marca` (
  `idMarca` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `idProveidor` INT(11) NOT NULL,
  PRIMARY KEY (`idMarca`),
  INDEX `fk_Marca_Proveidor_idx` (`idProveidor` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Proveidor`
    FOREIGN KEY (`idProveidor`)
    REFERENCES `optica`.`Proveidor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Client` (
  `idClient` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognom` VARCHAR(45) NULL DEFAULT NULL,
  `idAdreça` INT(11) NULL DEFAULT NULL,
  `Teléfon` VARCHAR(9) NOT NULL,
  `Email` VARCHAR(255) NULL DEFAULT NULL,
  `Dataregistre` DATE NULL DEFAULT NULL,
  `RecomanatPer` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Clients_Clients1_idx` (`RecomanatPer` ASC) VISIBLE,
  INDEX `fk_Clients_Adreça1_idx` (`idAdreça` ASC) VISIBLE,
  CONSTRAINT `fk_Clients_Clients1`
    FOREIGN KEY (`RecomanatPer`)
    REFERENCES `optica`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Clients_Adreça1`
    FOREIGN KEY (`idAdreça`)
    REFERENCES `optica`.`Adreça` (`idAdreça`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Adreça` (
  `idAdreça` INT(11) NOT NULL AUTO_INCREMENT,
  `Carrer` VARCHAR(45) NULL DEFAULT NULL,
  `nº` VARCHAR(45) NULL DEFAULT NULL,
  `Pis` VARCHAR(45) NULL DEFAULT NULL,
  `Porta` VARCHAR(45) NULL DEFAULT NULL,
  `Ciutat` VARCHAR(45) NULL DEFAULT NULL,
  `CP` VARCHAR(5) NULL DEFAULT NULL,
  `Pais` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idAdreça`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `optica`.`Venedor` (
  `idVenedor` INT(11) NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVenedor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
