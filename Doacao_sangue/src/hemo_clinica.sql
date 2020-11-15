-- MySQL Script generated by MySQL Workbench
-- sáb 14 nov 2020 14:53:26 -03
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hemo_clinica
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hemo_clinica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hemo_clinica` DEFAULT CHARACTER SET utf8 ;
USE `hemo_clinica` ;

-- -----------------------------------------------------
-- Table `hemo_clinica`.`conta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hemo_clinica`.`conta` ;

CREATE TABLE IF NOT EXISTS `hemo_clinica`.`conta` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hemo_clinica`.`usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hemo_clinica`.`usuario` ;

CREATE TABLE IF NOT EXISTS `hemo_clinica`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `telefone` VARCHAR(15) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `tipoSanguinio` VARCHAR(45) NOT NULL,
  `dataNasc` VARCHAR(45) NOT NULL,
  `conta_id` INT NOT NULL,
  PRIMARY KEY (`id`, `conta_id`),
  INDEX `fk_usuario_conta1_idx` (`conta_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuario_conta1`
    FOREIGN KEY (`conta_id`)
    REFERENCES `hemo_clinica`.`conta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hemo_clinica`.`agenda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hemo_clinica`.`agenda` ;

CREATE TABLE IF NOT EXISTS `hemo_clinica`.`agenda` (
  `id_agenda` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`id_agenda`),
  INDEX `fk_agenda_usuario_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_agenda_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `hemo_clinica`.`usuario` (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
