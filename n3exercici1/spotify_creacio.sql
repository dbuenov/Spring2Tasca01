-- MySQL Workbench Synchronization
-- Generated: 2022-02-14 11:56
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dani

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `spotify` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `spotify`.`usuari` (
  `id_usuari` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `data_naixement` DATE NULL DEFAULT NULL,
  `sexe` ENUM("home", "dona") NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `cp` VARCHAR(45) NULL DEFAULT NULL,
  `id_suscripció` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuari`),
  INDEX `fk_usuari_suscripció1_idx` (`id_suscripció` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_suscripció1`
    FOREIGN KEY (`id_suscripció`)
    REFERENCES `spotify`.`suscripció` (`id_suscripció`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`suscripció` (
  `id_suscripció` INT(11) NOT NULL AUTO_INCREMENT,
  `data_inici` DATE NOT NULL,
  `data_renovació` DATE NOT NULL,
  `id_paypal` INT(11) NULL DEFAULT NULL,
  `id_targeta` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_suscripció`),
  INDEX `fk_suscripció_paypal1_idx` (`id_paypal` ASC) VISIBLE,
  INDEX `fk_suscripció_targeta1_idx` (`id_targeta` ASC) VISIBLE,
  CONSTRAINT `fk_suscripció_paypal1`
    FOREIGN KEY (`id_paypal`)
    REFERENCES `spotify`.`paypal` (`id_paypal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscripció_targeta1`
    FOREIGN KEY (`id_targeta`)
    REFERENCES `spotify`.`targeta` (`id_targeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`targeta` (
  `id_targeta` INT(11) NOT NULL AUTO_INCREMENT,
  `numero_targeta` BIGINT(16) NOT NULL,
  `mes` VARCHAR(45) NOT NULL,
  `any` VARCHAR(45) NOT NULL,
  `codi_seguretat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_targeta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`paypal` (
  `id_paypal` INT(11) NOT NULL AUTO_INCREMENT,
  `nom_usuari` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_paypal`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`pagament` (
  `id_pagament` INT(11) NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `id_suscripció` INT(11) NOT NULL,
  PRIMARY KEY (`id_pagament`, `id_suscripció`),
  INDEX `fk_pagament_suscripció1_idx` (`id_suscripció` ASC) VISIBLE,
  CONSTRAINT `fk_pagament_suscripció1`
    FOREIGN KEY (`id_suscripció`)
    REFERENCES `spotify`.`suscripció` (`id_suscripció`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`playlist` (
  `id_playlist` INT(11) NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NOT NULL,
  `data_creació` DATE NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  `esborrada` TINYINT(4) NOT NULL,
  `compartida` TINYINT(4) NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_usuari`),
  INDEX `fk_playlist_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `spotify`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`canço` (
  `id_canço` INT(11) NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NOT NULL,
  `durada` TIME NOT NULL,
  `reproduccions` INT(11) NOT NULL,
  `id_album` INT(11) NOT NULL,
  PRIMARY KEY (`id_canço`, `id_album`),
  INDEX `fk_canço_album1_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_canço_album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `spotify`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`llista_cançons` (
  `id_playlist` INT(11) NOT NULL,
  `id_canço` INT(11) NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_canço`),
  INDEX `fk_playlist_has_canço_canço1_idx` (`id_canço` ASC) VISIBLE,
  INDEX `fk_playlist_has_canço_playlist1_idx` (`id_playlist` ASC) VISIBLE,
  INDEX `fk_llista_cançons_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_canço_playlist1`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_canço_canço1`
    FOREIGN KEY (`id_canço`)
    REFERENCES `spotify`.`canço` (`id_canço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_llista_cançons_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `spotify`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`album` (
  `id_album` INT(11) NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NOT NULL,
  `anyo` VARCHAR(45) NOT NULL,
  `imatge` VARCHAR(255) NULL DEFAULT NULL,
  `id_artista` INT(11) NOT NULL,
  PRIMARY KEY (`id_album`, `id_artista`),
  INDEX `fk_album_artista1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_album_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `spotify`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`artista` (
  `id_artista` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `imatge` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id_artista`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`segueix` (
  `id_usuari` INT(11) NOT NULL,
  `id_artista` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuari`, `id_artista`),
  INDEX `fk_usuari_has_artista_artista1_idx` (`id_artista` ASC) VISIBLE,
  INDEX `fk_usuari_has_artista_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_artista_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `spotify`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_artista_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `spotify`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`agrada_canço` (
  `id_usuari` INT(11) NOT NULL,
  `id_canço` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuari`, `id_canço`),
  INDEX `fk_usuari_has_canço_canço1_idx` (`id_canço` ASC) VISIBLE,
  INDEX `fk_usuari_has_canço_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_canço_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `spotify`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_canço_canço1`
    FOREIGN KEY (`id_canço`)
    REFERENCES `spotify`.`canço` (`id_canço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`agrada_album` (
  `id_usuari` INT(11) NOT NULL,
  `id_album` INT(11) NOT NULL,
  PRIMARY KEY (`id_usuari`, `id_album`),
  INDEX `fk_usuari_has_album_album1_idx` (`id_album` ASC) VISIBLE,
  INDEX `fk_usuari_has_album_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_album_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `spotify`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_album_album1`
    FOREIGN KEY (`id_album`)
    REFERENCES `spotify`.`album` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`esborrada` (
  `data` DATE NOT NULL,
  `id_playlist` INT(11) NOT NULL,
  PRIMARY KEY (`id_playlist`),
  CONSTRAINT `fk_esborrada_playlist1`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `spotify`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `spotify`.`relacionat` (
  `id_artista` INT(11) NOT NULL,
  `id_artista1` INT(11) NOT NULL,
  PRIMARY KEY (`id_artista`, `id_artista1`),
  INDEX `fk_artista_has_artista_artista2_idx` (`id_artista1` ASC) VISIBLE,
  INDEX `fk_artista_has_artista_artista1_idx` (`id_artista` ASC) VISIBLE,
  CONSTRAINT `fk_artista_has_artista_artista1`
    FOREIGN KEY (`id_artista`)
    REFERENCES `spotify`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artista_has_artista_artista2`
    FOREIGN KEY (`id_artista1`)
    REFERENCES `spotify`.`artista` (`id_artista`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
