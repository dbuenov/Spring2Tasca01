-- MySQL Workbench Synchronization
-- Generated: 2022-02-03 09:23
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dani

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `pizzeria` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `pizzeria`.`client` (
  `id_client` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NOT NULL,
  `adreça` VARCHAR(45) NULL DEFAULT NULL,
  `cp` VARCHAR(45) NULL DEFAULT NULL,
  `telèfon` VARCHAR(45) NULL DEFAULT NULL,
  `id_localitat` INT(11) NOT NULL,
  `id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id_client`),
  INDEX `fk_client_localitat1_idx` (`id_localitat` ASC, `id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_client_localitat1`
    FOREIGN KEY (`id_localitat` , `id_provincia`)
    REFERENCES `pizzeria`.`localitat` (`id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`localitat` (
  `id_localitat` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id_localitat`, `id_provincia`),
  INDEX `fk_localitat_provincia1_idx` (`id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_localitat_provincia1`
    FOREIGN KEY (`id_provincia`)
    REFERENCES `pizzeria`.`provincia` (`id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`provincia` (
  `id_provincia` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_provincia`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`comanda` (
  `id_comanda` INT(11) NOT NULL AUTO_INCREMENT,
  `data_comanda` DATETIME NOT NULL,
  `tipus_entrega` ENUM("Domicili", "Botiga") NOT NULL,
  `id_client` INT(11) NOT NULL,
  `preu_total` INT(11) NULL DEFAULT NULL,
  `id_empleat` INT(11) NULL DEFAULT NULL,
  `hora_entrega` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id_comanda`),
  INDEX `fk_comanda_client1_idx` (`id_client` ASC) VISIBLE,
  INDEX `fk_comanda_empleat1_idx` (`id_empleat` ASC) VISIBLE,
  CONSTRAINT `fk_comanda_client1`
    FOREIGN KEY (`id_client`)
    REFERENCES `pizzeria`.`client` (`id_client`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comanda_empleat1`
    FOREIGN KEY (`id_empleat`)
    REFERENCES `pizzeria`.`empleat` (`id_empleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`producte` (
  `id_producte` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `descripció` ENUM("Pizza", "Hamburguesa", "Beguda") NOT NULL,
  `imatge` VARCHAR(45) NULL DEFAULT NULL,
  `preu` DECIMAL(10,2) NOT NULL,
  `id_categoria_pizza` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producte`),
  INDEX `fk_pizza_categoria_pizza1_idx` (`id_categoria_pizza` ASC) VISIBLE,
  CONSTRAINT `fk_pizza_categoria_pizza1`
    FOREIGN KEY (`id_categoria_pizza`)
    REFERENCES `pizzeria`.`categoria_pizza` (`id_categoria_pizza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`categoria_pizza` (
  `id_categoria_pizza` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria_pizza`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`producte_comanda` (
  `id_producte_comanda` INT(11) NOT NULL AUTO_INCREMENT,
  `id_comanda` INT(11) NOT NULL,
  `cuantitat` INT(11) NOT NULL,
  `id_producte` INT(11) NOT NULL,
  `preu_producte_comanda` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_producte_comanda`),
  INDEX `fk_producte_comanda_comanda1_idx` (`id_comanda` ASC) VISIBLE,
  INDEX `fk_producte_comanda_producte1_idx` (`id_producte` ASC) VISIBLE,
  CONSTRAINT `fk_producte_comanda_comanda1`
    FOREIGN KEY (`id_comanda`)
    REFERENCES `pizzeria`.`comanda` (`id_comanda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_producte_comanda_producte1`
    FOREIGN KEY (`id_producte`)
    REFERENCES `pizzeria`.`producte` (`id_producte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`botiga` (
  `id_botiga` INT(11) NOT NULL AUTO_INCREMENT,
  `adreça` VARCHAR(45) NULL DEFAULT NULL,
  `cp` VARCHAR(45) NULL DEFAULT NULL,
  `id_localitat` INT(11) NOT NULL,
  `id_provincia` INT(11) NOT NULL,
  PRIMARY KEY (`id_botiga`),
  INDEX `fk_botiga_localitat1_idx` (`id_localitat` ASC, `id_provincia` ASC) VISIBLE,
  CONSTRAINT `fk_botiga_localitat1`
    FOREIGN KEY (`id_localitat` , `id_provincia`)
    REFERENCES `pizzeria`.`localitat` (`id_localitat` , `id_provincia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `pizzeria`.`empleat` (
  `id_empleat` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `cognom` VARCHAR(45) NULL DEFAULT NULL,
  `nif` VARCHAR(45) NULL DEFAULT NULL,
  `telèfon` VARCHAR(45) NULL DEFAULT NULL,
  `carrec` ENUM("Cuiner", "Repartidor") NOT NULL,
  `id_botiga` INT(11) NOT NULL,
  PRIMARY KEY (`id_empleat`),
  INDEX `fk_empleat_botiga1_idx` (`id_botiga` ASC) VISIBLE,
  CONSTRAINT `fk_empleat_botiga1`
    FOREIGN KEY (`id_botiga`)
    REFERENCES `pizzeria`.`botiga` (`id_botiga`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
