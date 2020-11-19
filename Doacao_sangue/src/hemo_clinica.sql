CREATE DATABASE hemo_clinica;

USE hemo_clinica;

CREATE TABLE `usuario` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `telefone` varchar(20) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `dataNasc` date NOT NULL,
  `tipoSanguinio` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `agenda` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `idusuario` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_agenda_usuario` (`idusuario`),
  CONSTRAINT `fk_agenda_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `hemo_clinica`.`funcionario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `senha` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));