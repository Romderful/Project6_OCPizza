SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oc_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oc_pizza` DEFAULT CHARACTER SET utf8 ;
USE `oc_pizza` ;

-- -----------------------------------------------------
-- Table `oc_pizza`.`command`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`command` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`command` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `payment_id` INT NOT NULL,
  `establishment_id` INT NOT NULL,
  `order_state` VARCHAR(15) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_command_payment1`
    FOREIGN KEY (`payment_id`)
    REFERENCES `oc_pizza`.`payment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_command_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_command_establishment1`
    FOREIGN KEY (`establishment_id`)
    REFERENCES `oc_pizza`.`establishment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_command_payment1_idx` ON `oc_pizza`.`command` (`payment_id` ASC) VISIBLE;

CREATE INDEX `fk_command_user1_idx` ON `oc_pizza`.`command` (`user_id` ASC) VISIBLE;

CREATE INDEX `fk_command_establishment1_idx` ON `oc_pizza`.`command` (`establishment_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`command_has_product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`command_has_product` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`command_has_product` (
  `command_id` INT NOT NULL,
  `product_id` INT NOT NULL,
  CONSTRAINT `fk_command_has_product_command1`
    FOREIGN KEY (`command_id`)
    REFERENCES `oc_pizza`.`command` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_command_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `oc_pizza`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_command_has_product_command1_idx` ON `oc_pizza`.`command_has_product` (`command_id` ASC) VISIBLE;

CREATE INDEX `fk_command_has_product_product1_idx` ON `oc_pizza`.`command_has_product` (`product_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`employee` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `job_designation` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_employee_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `oc_pizza`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_employee_user1_idx` ON `oc_pizza`.`employee` (`user_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`establishment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`establishment` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`establishment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `location_id` INT NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_establishment_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `oc_pizza`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_establishment_location1_idx` ON `oc_pizza`.`establishment` (`location_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`establishment_has_employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`establishment_has_employee` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`establishment_has_employee` (
  `establishment_id` INT NOT NULL,
  `employee_id` INT NOT NULL,
  CONSTRAINT `fk_establishment_has_employee_establishment1`
    FOREIGN KEY (`establishment_id`)
    REFERENCES `oc_pizza`.`establishment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_establishment_has_employee_employee1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `oc_pizza`.`employee` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_establishment_has_employee_employee1_idx` ON `oc_pizza`.`establishment_has_employee` (`employee_id` ASC) VISIBLE;

CREATE INDEX `fk_establishment_has_employee_establishment1_idx` ON `oc_pizza`.`establishment_has_employee` (`establishment_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`ingredient` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`location`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`location` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`location` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zip_code` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`payment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`payment` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`payment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `payment_type` VARCHAR(5) NOT NULL,
  `payment_amount` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`product` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `duty_free_price` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oc_pizza`.`product_has_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`product_has_ingredient` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`product_has_ingredient` (
  `product_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `quantity` INT NOT NULL,
  CONSTRAINT `fk_product_has_ingredient_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `oc_pizza`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_product_has_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_product_has_ingredient_product1_idx` ON `oc_pizza`.`product_has_ingredient` (`product_id` ASC) VISIBLE;

CREATE INDEX `fk_product_has_ingredient_ingredient1_idx` ON `oc_pizza`.`product_has_ingredient` (`ingredient_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`stock`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`stock` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`stock` (
  `id` INT NOT NULL,
  `establishment_id` INT NOT NULL,
  `ingredient_id` INT NULL,
  `unit` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_stock_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `oc_pizza`.`ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock_establishment1`
    FOREIGN KEY (`establishment_id`)
    REFERENCES `oc_pizza`.`establishment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_stock_ingredient1_idx` ON `oc_pizza`.`stock` (`ingredient_id` ASC) VISIBLE;

CREATE INDEX `fk_stock_establishment1_idx` ON `oc_pizza`.`stock` (`establishment_id` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `oc_pizza`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`user` ;

CREATE TABLE IF NOT EXISTS `oc_pizza`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(10) NOT NULL,
  `location_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_user_location1`
    FOREIGN KEY (`location_id`)
    REFERENCES `oc_pizza`.`location` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_user_location1_idx` ON `oc_pizza`.`user` (`location_id` ASC) VISIBLE;
