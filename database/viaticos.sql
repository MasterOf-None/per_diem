-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema viaticos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema viaticos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `viaticos` DEFAULT CHARACTER SET utf8 ;
USE `viaticos` ;

-- -----------------------------------------------------
-- Table `viaticos`.`TarifasAutomovilTrayecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`TarifasAutomovilTrayecto` (
  `idTarifasAutomovilTrayecto` INT NOT NULL AUTO_INCREMENT,
  `origenOficina` VARCHAR(50) NOT NULL,
  `destinoMunicipio` VARCHAR(50) NOT NULL,
  `distancia` INT NOT NULL,
  `tiempo` INT NOT NULL,
  `costoGasolina` INT NOT NULL,
  `fortin_CdMendoza_Cordoba` INT NULL,
  `fortin_CdMendoza_Fortin` INT NULL,
  `cuitlahuac_Cuitlahuac_LaTinaja` INT NULL,
  `pasoDelToro_LaTinaja_Veracruz` INT NULL,
  `laAntigua_Cardel_Veracruz` INT NULL,
  `planDelRio` INT NULL,
  `libramientoDeXalapa` INT NULL,
  `puenteNautla` INT NULL,
  `totomoxtle` INT NULL,
  `tuxpan_Tihuatlan_Tuxpan` INT NULL,
  `alamo_PuenteJoseLopezPortillo` INT NULL,
  `naranjos_Tuxpan_Naranjos` INT NULL,
  `huayacocotla_CasetaGeneral` INT NULL,
  `cosamaloapan_Cosamaloapan_Isla` INT NULL,
  `cosamaloapan_LaTinaja_Isla` INT NULL,
  `acayucan_Acayucan_Cosoleacaque` INT NULL,
  `acayucan_Isla_Cosoleacaque` INT NULL,
  `puenteDovaliJaime` INT NULL,
  `lasChoapas_EntLasChoapas_EntLasChoapasII` INT NULL,
  `lasChoapas_EntLasChoapas_EntNuevoSacrificio` INT NULL,
  PRIMARY KEY (`idTarifasAutomovilTrayecto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `viaticos`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`Departamento` (
  `idDepartamento` INT(11) NOT NULL AUTO_INCREMENT,
  `clave` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDepartamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`Empleado` (
  `idEmpleado` INT(11) NOT NULL AUTO_INCREMENT,
  `numEmpleado` INT(11) NULL,
  `nombre` VARCHAR(45) NULL,
  `apPaterno` VARCHAR(45) NULL,
  `apMaterno` VARCHAR(45) NULL,
  `puesto` VARCHAR(45) NULL,
  `idDepartamento` INT(11) NULL,
  PRIMARY KEY (`idEmpleado`),
  INDEX `fk_Empleado_Departamento1_idx` (`idDepartamento` ASC),
  CONSTRAINT `fk_Empleado_Departamento1`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `viaticos`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`OficioComision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`OficioComision` (
  `idOficioComision` INT(11) NOT NULL AUTO_INCREMENT,
  `numeroOficio` VARCHAR(45) NOT NULL,
  `fecha` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idOficioComision`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`Comision`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`Comision` (
  `idComision` INT(11) NOT NULL AUTO_INCREMENT,
  `fechaSalida` DATE NOT NULL,
  `fechaVencimiento` DATE NULL,
  `diasComision` INT(11) NOT NULL,
  `horaSalida` TIME NOT NULL,
  `numeroPersonas` INT(11) NULL,
  `objetivo` VARCHAR(100) NOT NULL,
  `idTarifasAutomovilTrayecto` INT NULL,
  `idEmpleado` INT(11) NULL,
  `idOficioComision` INT(11) NULL,
  PRIMARY KEY (`idComision`),
  INDEX `fk_Comision_TarifasAutomovilTrayecto1_idx` (`idTarifasAutomovilTrayecto` ASC),
  INDEX `fk_Comision_Empleado1_idx` (`idEmpleado` ASC),
  INDEX `fk_Comision_OficioComision1_idx` (`idOficioComision` ASC),
  CONSTRAINT `fk_Comision_TarifasAutomovilTrayecto1`
    FOREIGN KEY (`idTarifasAutomovilTrayecto`)
    REFERENCES `viaticos`.`TarifasAutomovilTrayecto` (`idTarifasAutomovilTrayecto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comision_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `viaticos`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comision_OficioComision1`
    FOREIGN KEY (`idOficioComision`)
    REFERENCES `viaticos`.`OficioComision` (`idOficioComision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`AutomovilTrayecto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`AutomovilTrayecto` (
  `idAutomovilTrayecto` INT(11) NOT NULL AUTO_INCREMENT,
  `origenOficina` VARCHAR(50) NOT NULL,
  `destinoOficina` VARCHAR(50) NOT NULL,
  `distancia` INT(11) NOT NULL,
  `tiempo` INT(11) NOT NULL,
  `costoGasolina` INT(11) NOT NULL,
  `idComision` INT(11) NOT NULL,
  PRIMARY KEY (`idAutomovilTrayecto`),
  INDEX `fk_AutomovilTrayecto_Comision1_idx` (`idComision` ASC),
  CONSTRAINT `fk_AutomovilTrayecto_Comision1`
    FOREIGN KEY (`idComision`)
    REFERENCES `viaticos`.`Comision` (`idComision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`TarifasHospedaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`TarifasHospedaje` (
  `idTarifasHospedaje` INT(11) NOT NULL AUTO_INCREMENT,
  `tarifasHospedaje` INT NOT NULL,
  `area` VARCHAR(15) NOT NULL,
  `nivel` VARCHAR(10) NOT NULL,
  `puesto` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idTarifasHospedaje`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`DetallesHospedaje`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`DetallesHospedaje` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `dias` INT NOT NULL,
  `totalHospedaje` FLOAT NOT NULL,
  `idComision` INT(11) NOT NULL,
  `idTarifasHospedaje` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_DetallesHospedaje_Comision1_idx` (`idComision` ASC),
  INDEX `fk_DetallesHospedaje_TarifasHospedaje1_idx` (`idTarifasHospedaje` ASC),
  CONSTRAINT `fk_DetallesHospedaje_Comision1`
    FOREIGN KEY (`idComision`)
    REFERENCES `viaticos`.`Comision` (`idComision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetallesHospedaje_TarifasHospedaje1`
    FOREIGN KEY (`idTarifasHospedaje`)
    REFERENCES `viaticos`.`TarifasHospedaje` (`idTarifasHospedaje`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`OtrosGastos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`OtrosGastos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` INT NOT NULL,
  `concepto` VARCHAR(45) NOT NULL,
  `total` FLOAT NOT NULL,
  `idComision` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_OtrosGastos_Comision1_idx` (`idComision` ASC),
  CONSTRAINT `fk_OtrosGastos_Comision1`
    FOREIGN KEY (`idComision`)
    REFERENCES `viaticos`.`Comision` (`idComision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`TarifasAlimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`TarifasAlimentos` (
  `idTarifasAlimentos` INT(11) NOT NULL AUTO_INCREMENT,
  `tarifaDesayuno` INT(11) NULL,
  `tarifaAlmuerzo` INT NULL,
  `tarifaCena` INT NULL,
  `area` VARCHAR(15) NOT NULL,
  `nivel` VARCHAR(10) NOT NULL,
  `puesto` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idTarifasAlimentos`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`Usuarios` (
  `idUsuarios` INT(11) NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `user` VARCHAR(45) NOT NULL,
  `pass` VARCHAR(50) NOT NULL,
  `idEmpleado` INT(11) NOT NULL,
  PRIMARY KEY (`idUsuarios`),
  INDEX `fk_Usuarios_Empleado1_idx` (`idEmpleado` ASC),
  CONSTRAINT `fk_Usuarios_Empleado1`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `viaticos`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `viaticos`.`DetalleAlimentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `viaticos`.`DetalleAlimentos` (
  `idDetalleAlimentos` INT NOT NULL AUTO_INCREMENT,
  `tipoAlimentos` INT NOT NULL,
  `cantidadAlimentos` INT NOT NULL,
  `totalAlimentos` INT NOT NULL,
  `idTarifasAlimentos` INT(11) NOT NULL,
  `idComision` INT(11) NOT NULL,
  PRIMARY KEY (`idDetalleAlimentos`),
  INDEX `fk_DetalleAlimentos_TarifasAlimentos1_idx` (`idTarifasAlimentos` ASC),
  INDEX `fk_DetalleAlimentos_Comision1_idx` (`idComision` ASC),
  CONSTRAINT `fk_DetalleAlimentos_TarifasAlimentos1`
    FOREIGN KEY (`idTarifasAlimentos`)
    REFERENCES `viaticos`.`TarifasAlimentos` (`idTarifasAlimentos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DetalleAlimentos_Comision1`
    FOREIGN KEY (`idComision`)
    REFERENCES `viaticos`.`Comision` (`idComision`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;