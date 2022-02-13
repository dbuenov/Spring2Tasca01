-- MySQL Workbench Synchronization
-- Generated: 2022-02-12 12:24
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Dani

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `youtube`.`usuari` (
  `id_usuari` INT(11) NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `data_naixement` DATE NULL DEFAULT NULL,
  `sexe` ENUM("H", "D") NULL DEFAULT NULL,
  `pais` VARCHAR(45) NULL DEFAULT NULL,
  `cp` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuari`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `id_video` INT(11) NOT NULL AUTO_INCREMENT,
  `titol` VARCHAR(45) NOT NULL,
  `descripcio` VARCHAR(45) NULL DEFAULT NULL,
  `grandaria` DECIMAL(10,2) NOT NULL,
  `nom_arxiu` VARCHAR(45) NOT NULL,
  `durada` TIME NOT NULL,
  `thumbnail` VARCHAR(255) NULL DEFAULT NULL,
  `reproduccions` INT(11) NOT NULL DEFAULT 0,
  `estat` ENUM("public", "ocult", "privat") NOT NULL,
  `data_publicacio` DATETIME NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  PRIMARY KEY (`id_video`, `id_usuari`),
  INDEX `fk_video_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_video_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta` (
  `id_etiqueta` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_etiqueta`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`canal` (
  `id_canal` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `descripció` VARCHAR(45) NULL DEFAULT NULL,
  `data_creació` DATE NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  PRIMARY KEY (`id_canal`, `id_usuari`),
  INDEX `fk_canal_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_canal_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`suscripcio` (
  `id_canal` INT(11) NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  PRIMARY KEY (`id_canal`, `id_usuari`),
  INDEX `fk_canal_has_usuari_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  INDEX `fk_canal_has_usuari_canal1_idx` (`id_canal` ASC) VISIBLE,
  CONSTRAINT `fk_canal_has_usuari_canal1`
    FOREIGN KEY (`id_canal`)
    REFERENCES `youtube`.`canal` (`id_canal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_canal_has_usuari_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`like_video` (
  `id_usuari` INT(11) NOT NULL,
  `id_video` INT(11) NOT NULL,
  `tipus` ENUM("like", "dislike") NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuari`, `id_video`),
  INDEX `fk_fer_like_video1_idx` (`id_video` ASC) VISIBLE,
  CONSTRAINT `fk_fer_like_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fer_like_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`etiqueta_video` (
  `id_video` INT(11) NOT NULL,
  `id_etiqueta` INT(11) NOT NULL,
  PRIMARY KEY (`id_video`, `id_etiqueta`),
  INDEX `fk_video_has_etiqueta_etiqueta1_idx` (`id_etiqueta` ASC) VISIBLE,
  INDEX `fk_video_has_etiqueta_video1_idx` (`id_video` ASC) VISIBLE,
  CONSTRAINT `fk_video_has_etiqueta_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_video_has_etiqueta_etiqueta1`
    FOREIGN KEY (`id_etiqueta`)
    REFERENCES `youtube`.`etiqueta` (`id_etiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `id_playlist` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  `data_creacio` DATE NOT NULL,
  `estat` ENUM("publica", "privada") NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_usuari`),
  INDEX `fk_playlist_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`video_playlist` (
  `id_playlist` INT(11) NOT NULL,
  `id_video` INT(11) NOT NULL,
  PRIMARY KEY (`id_playlist`, `id_video`),
  INDEX `fk_playlist_has_video_video1_idx` (`id_video` ASC) VISIBLE,
  INDEX `fk_playlist_has_video_playlist1_idx` (`id_playlist` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_has_video_playlist1`
    FOREIGN KEY (`id_playlist`)
    REFERENCES `youtube`.`playlist` (`id_playlist`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_playlist_has_video_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`comentari` (
  `id_comentari` INT(11) NOT NULL AUTO_INCREMENT,
  `text` LONGTEXT NOT NULL,
  `data` DATETIME NOT NULL,
  `id_usuari` INT(11) NOT NULL,
  `id_video` INT(11) NOT NULL,
  PRIMARY KEY (`id_comentari`, `id_usuari`, `id_video`),
  INDEX `fk_comentari_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  INDEX `fk_comentari_video1_idx` (`id_video` ASC) VISIBLE,
  CONSTRAINT `fk_comentari_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comentari_video1`
    FOREIGN KEY (`id_video`)
    REFERENCES `youtube`.`video` (`id_video`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `youtube`.`like_comentari` (
  `id_usuari` INT(11) NOT NULL,
  `id_comentari` INT(11) NOT NULL,
  `tipus` ENUM("like", "dislike") NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id_usuari`, `id_comentari`),
  INDEX `fk_usuari_has_comentari_comentari1_idx` (`id_comentari` ASC) VISIBLE,
  INDEX `fk_usuari_has_comentari_usuari1_idx` (`id_usuari` ASC) VISIBLE,
  CONSTRAINT `fk_usuari_has_comentari_usuari1`
    FOREIGN KEY (`id_usuari`)
    REFERENCES `youtube`.`usuari` (`id_usuari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuari_has_comentari_comentari1`
    FOREIGN KEY (`id_comentari`)
    REFERENCES `youtube`.`comentari` (`id_comentari`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
