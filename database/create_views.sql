SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oc_pizza
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oc_pizza` DEFAULT CHARACTER SET utf8 ;
USE `oc_pizza` ;
USE `oc_pizza` ;

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`client_informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`client_informations` (`user_id` INT, `command_id` INT, `first_name` INT, `last_name` INT, `email` INT, `password` INT, `phone_number` INT, `street` INT, `city` INT, `zip_code` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`command_informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`command_informations` (`command_id` INT, `establishment_id` INT, `name` INT, `duty_free_price` INT, `order_state` INT, `date` INT, `first_name` INT, `last_name` INT, `phone_number` INT, `street` INT, `city` INT, `zip_code` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`employee_informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`employee_informations` (`user_id` INT, `establishment_id` INT, `first_name` INT, `last_name` INT, `email` INT, `password` INT, `phone_number` INT, `street` INT, `city` INT, `zip_code` INT, `job_designation` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`establishment_informations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`establishment_informations` (`establishment_id` INT, `phone_number` INT, `street` INT, `city` INT, `zip_code` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`establishment_revenue`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`establishment_revenue` (`establishment_id` INT, `amount` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`product_recipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`product_recipe` (`product_id` INT, `product_name` INT, `ingredient_name` INT, `quantity` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`unavailable_ingredients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`unavailable_ingredients` (`stock_id` INT, `establishment_id` INT, `ingredient_name` INT, `unit` INT);

-- -----------------------------------------------------
-- Placeholder table for view `oc_pizza`.`unavailable_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oc_pizza`.`unavailable_products` (`stock_id` INT, `establishment_id` INT, `product_name` INT, `ingredient_name` INT, `unit` INT);

-- -----------------------------------------------------
-- View `oc_pizza`.`client_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`client_informations`;
DROP VIEW IF EXISTS `oc_pizza`.`client_informations` ;
USE `oc_pizza`;
CREATE VIEW `client_informations` AS
    SELECT 
        `user`.`id` AS `user_id`,
        `command`.`id` AS `command_id`,
        `user`.`first_name` AS `first_name`,
        `user`.`last_name` AS `last_name`,
        `user`.`email` AS `email`,
        `user`.`password` AS `password`,
        `user`.`phone_number` AS `phone_number`,
        `location`.`street` AS `street`,
        `location`.`city` AS `city`,
        `location`.`zip_code` AS `zip_code`
    FROM
        ((`user`
        JOIN `location` ON ((`location`.`id` = `user`.`id`)))
        JOIN `command` ON ((`command`.`user_id` = `user`.`id`)));

-- -----------------------------------------------------
-- View `oc_pizza`.`command_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`command_informations`;
DROP VIEW IF EXISTS `oc_pizza`.`command_informations` ;
USE `oc_pizza`;
CREATE VIEW `command_informations` AS
    SELECT 
        `command`.`id` AS `command_id`,
        `command`.`establishment_id` AS `establishment_id`,
        `product`.`name` AS `name`,
        `product`.`duty_free_price` AS `duty_free_price`,
        `command`.`order_state` AS `order_state`,
        `command`.`date` AS `date`,
        `user`.`first_name` AS `first_name`,
        `user`.`last_name` AS `last_name`,
        `user`.`phone_number` AS `phone_number`,
        `location`.`street` AS `street`,
        `location`.`city` AS `city`,
        `location`.`zip_code` AS `zip_code`
    FROM
        ((((`command`
        JOIN `command_has_product` ON ((`command_has_product`.`command_id` = `command`.`id`)))
        JOIN `product` ON ((`product`.`id` = `command_has_product`.`product_id`)))
        JOIN `user` ON ((`user`.`id` = `command`.`user_id`)))
        JOIN `location` ON ((`location`.`id` = `user`.`id`)))
    ORDER BY `command`.`id`;

-- -----------------------------------------------------
-- View `oc_pizza`.`employee_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`employee_informations`;
DROP VIEW IF EXISTS `oc_pizza`.`employee_informations` ;
USE `oc_pizza`;
CREATE VIEW `employee_informations` AS
    SELECT 
        `user`.`id` AS `user_id`,
        `establishment`.`id` AS `establishment_id`,
        `user`.`first_name` AS `first_name`,
        `user`.`last_name` AS `last_name`,
        `user`.`email` AS `email`,
        `user`.`password` AS `password`,
        `user`.`phone_number` AS `phone_number`,
        `location`.`street` AS `street`,
        `location`.`city` AS `city`,
        `location`.`zip_code` AS `zip_code`,
        `employee`.`job_designation` AS `job_designation`
    FROM
        ((((`user`
        JOIN `location` ON ((`location`.`id` = `user`.`id`)))
        JOIN `employee` ON ((`employee`.`user_id` = `user`.`id`)))
        JOIN `establishment_has_employee` ON ((`establishment_has_employee`.`employee_id` = `employee`.`id`)))
        JOIN `establishment` ON ((`establishment`.`id` = `establishment_has_employee`.`establishment_id`)));

-- -----------------------------------------------------
-- View `oc_pizza`.`establishment_informations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`establishment_informations`;
DROP VIEW IF EXISTS `oc_pizza`.`establishment_informations` ;
USE `oc_pizza`;
CREATE VIEW `establishment_informations` AS
    SELECT 
        `establishment`.`id` AS `establishment_id`,
        `establishment`.`phone_number` AS `phone_number`,
        `location`.`street` AS `street`,
        `location`.`city` AS `city`,
        `location`.`zip_code` AS `zip_code`
    FROM
        (`establishment`
        JOIN `location` ON ((`location`.`id` = `establishment`.`id`)));

-- -----------------------------------------------------
-- View `oc_pizza`.`establishment_revenue`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`establishment_revenue`;
DROP VIEW IF EXISTS `oc_pizza`.`establishment_revenue` ;
USE `oc_pizza`;
CREATE VIEW `establishment_revenue` AS
    SELECT 
        `command`.`establishment_id` AS `establishment_id`,
        SUM(`payment`.`payment_amount`) AS `amount`
    FROM
        (`command`
        JOIN `payment` ON ((`payment`.`id` = `command`.`payment_id`)))
    GROUP BY `command`.`establishment_id`;

-- -----------------------------------------------------
-- View `oc_pizza`.`product_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`product_recipe`;
DROP VIEW IF EXISTS `oc_pizza`.`product_recipe` ;
USE `oc_pizza`;
CREATE VIEW `product_recipe` AS
    SELECT 
        `product`.`id` AS `product_id`,
        `product`.`name` AS `product_name`,
        `ingredient`.`name` AS `ingredient_name`,
        `product_has_ingredient`.`quantity` AS `quantity`
    FROM
        ((`product`
        JOIN `product_has_ingredient` ON ((`product_has_ingredient`.`product_id` = `product`.`id`)))
        JOIN `ingredient` ON ((`ingredient`.`id` = `product_has_ingredient`.`ingredient_id`)))
    ORDER BY `product`.`id`;

-- -----------------------------------------------------
-- View `oc_pizza`.`unavailable_ingredients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`unavailable_ingredients`;
DROP VIEW IF EXISTS `oc_pizza`.`unavailable_ingredients` ;
USE `oc_pizza`;
CREATE VIEW `unavailable_ingredients` AS
    SELECT 
        `stock`.`id` AS `stock_id`,
        `stock`.`establishment_id` AS `establishment_id`,
        `ingredient`.`name` AS `ingredient_name`,
        `stock`.`unit` AS `unit`
    FROM
        (`stock`
        JOIN `ingredient` ON ((`ingredient`.`id` = `stock`.`ingredient_id`)))
    WHERE
        (`stock`.`unit` = 0)
    ORDER BY `stock`.`id`;

-- -----------------------------------------------------
-- View `oc_pizza`.`unavailable_products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `oc_pizza`.`unavailable_products`;
DROP VIEW IF EXISTS `oc_pizza`.`unavailable_products` ;
USE `oc_pizza`;
CREATE VIEW `unavailable_products` AS
    SELECT 
        `stock`.`id` AS `stock_id`,
        `stock`.`establishment_id` AS `establishment_id`,
        `product`.`name` AS `product_name`,
        `ingredient`.`name` AS `ingredient_name`,
        `stock`.`unit` AS `unit`
    FROM
        (((`stock`
        JOIN `ingredient` ON ((`ingredient`.`id` = `stock`.`ingredient_id`)))
        JOIN `product_has_ingredient` ON ((`product_has_ingredient`.`ingredient_id` = `ingredient`.`id`)))
        JOIN `product` ON ((`product`.`id` = `product_has_ingredient`.`product_id`)))
    WHERE
        (`stock`.`unit` < `product_has_ingredient`.`quantity`)
    ORDER BY `stock`.`id`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
