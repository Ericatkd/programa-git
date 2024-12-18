-- MySQL Script generated by MySQL Workbench
-- Sun Jul 28 18:34:59 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Rayos fit
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Rayos fit` ;

-- -----------------------------------------------------
-- Schema Rayos fit
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Rayos fit` DEFAULT CHARACTER SET utf8 ;
USE `Rayos fit` ;

-- -----------------------------------------------------
-- Table `Rayos fit`.`Membresia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`Membresia` (
  `ID membresia` INT NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `costo mensualidad` INT NULL,
  PRIMARY KEY (`ID membresia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Rayos fit`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`Administrador` (
  `ID administrador` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `Cedula` VARCHAR(45) NOT NULL,
  `Membresia_ID membresia` INT NOT NULL,
  PRIMARY KEY (`ID administrador`, `Membresia_ID membresia`),
  CONSTRAINT `fk_Administrador_Membresia1`
    FOREIGN KEY (`Membresia_ID membresia`)
    REFERENCES `Rayos fit`.`Membresia` (`ID membresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Administrador_Membresia1_idx` ON `Rayos fit`.`Administrador` (`Membresia_ID membresia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Rayos fit`.`Registro proceso`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`Registro proceso` (
  `idRegistro proceso` INT NOT NULL,
  `ID cliente` INT NOT NULL AUTO_INCREMENT,
  `Altura` INT UNSIGNED NULL,
  `Front squat` DECIMAL UNSIGNED NULL,
  `push press` DECIMAL UNSIGNED NULL,
  `push up` DECIMAL UNSIGNED NULL,
  `airsquat` DECIMAL UNSIGNED NULL,
  `Administrador_ID administrador` INT NOT NULL,
  `Administrador_Membresia_ID membresia` INT NOT NULL,
  PRIMARY KEY (`idRegistro proceso`),
  CONSTRAINT `fk_Registro proceso_Administrador1`
    FOREIGN KEY (`Administrador_ID administrador` , `Administrador_Membresia_ID membresia`)
    REFERENCES `Rayos fit`.`Administrador` (`ID administrador` , `Membresia_ID membresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Registro proceso_Administrador1_idx` ON `Rayos fit`.`Registro proceso` (`Administrador_ID administrador` ASC, `Administrador_Membresia_ID membresia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Rayos fit`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`cliente` (
  `ID cliente` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Correo` VARCHAR(45) NOT NULL,
  `Cedula` VARCHAR(45) NOT NULL,
  `Edad` INT NOT NULL,
  `Fecha de inscripcion` DATETIME NULL,
  `Membresia_ID membresia` INT NOT NULL,
  `Registro proceso_idRegistro proceso` INT NOT NULL,
  PRIMARY KEY (`ID cliente`),
  CONSTRAINT `fk_cliente_Membresia`
    FOREIGN KEY (`Membresia_ID membresia`)
    REFERENCES `Rayos fit`.`Membresia` (`ID membresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Registro proceso1`
    FOREIGN KEY (`Registro proceso_idRegistro proceso`)
    REFERENCES `Rayos fit`.`Registro proceso` (`idRegistro proceso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_cliente_Membresia_idx` ON `Rayos fit`.`cliente` (`Membresia_ID membresia` ASC) VISIBLE;

CREATE INDEX `fk_cliente_Registro proceso1_idx` ON `Rayos fit`.`cliente` (`Registro proceso_idRegistro proceso` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Rayos fit`.`Pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`Pago` (
  `ID pago` INT NOT NULL,
  `Tipo` VARCHAR(45) NULL,
  `fecha de pago` DATE NULL,
  `monto` INT NULL,
  `metodo de pago` VARCHAR(45) NULL,
  `cliente_ID cliente` INT NOT NULL,
  `Administrador_ID administrador` INT NOT NULL,
  `Administrador_Membresia_ID membresia` INT NOT NULL,
  PRIMARY KEY (`ID pago`, `cliente_ID cliente`),
  CONSTRAINT `fk_Pago_cliente1`
    FOREIGN KEY (`cliente_ID cliente`)
    REFERENCES `Rayos fit`.`cliente` (`ID cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pago_Administrador1`
    FOREIGN KEY (`Administrador_ID administrador` , `Administrador_Membresia_ID membresia`)
    REFERENCES `Rayos fit`.`Administrador` (`ID administrador` , `Membresia_ID membresia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_Pago_cliente1_idx` ON `Rayos fit`.`Pago` (`cliente_ID cliente` ASC) VISIBLE;

CREATE INDEX `fk_Pago_Administrador1_idx` ON `Rayos fit`.`Pago` (`Administrador_ID administrador` ASC, `Administrador_Membresia_ID membresia` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Rayos fit`.`table1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Rayos fit`.`table1` (
)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
