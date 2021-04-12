-- -----------------------------------------------------
-- Data for table `oc_pizza`.`command`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`command` (`id`, `establishment_id`, `user_id`, `payment_id`, `order_state`, `date`) VALUES (1, 1, 1, 1, 'livree', '2021-04-1');
INSERT INTO `oc_pizza`.`command` (`id`, `establishment_id`, `user_id`, `payment_id`, `order_state`, `date`) VALUES (2, 1, 1, 2, 'livree', '2021-04-2');
INSERT INTO `oc_pizza`.`command` (`id`, `establishment_id`, `user_id`, `payment_id`, `order_state`, `date`) VALUES (3, 2, 2, 3, 'preparation', '2021-04-3');
INSERT INTO `oc_pizza`.`command` (`id`, `establishment_id`, `user_id`, `payment_id`, `order_state`, `date`) VALUES (4, 2, 2, 4, 'livree', '2021-04-4');
INSERT INTO `oc_pizza`.`command` (`id`, `establishment_id`, `user_id`, `payment_id`, `order_state`, `date`) VALUES (5, 2, 2, 5, 'preparation', '2021-04-5');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`command_has_product`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (1, 3);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (1, 2);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (2, 5);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (3, 4);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (4, 3);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (5, 3);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (5, 3);
INSERT INTO `oc_pizza`.`command_has_product` (`command_id`, `product_id`) VALUES (5, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`employee` (`id`, `user_id`, `job_designation`) VALUES (1, 3, 'caissier');
INSERT INTO `oc_pizza`.`employee` (`id`, `user_id`, `job_designation`) VALUES (2, 4, 'livreur');
INSERT INTO `oc_pizza`.`employee` (`id`, `user_id`, `job_designation`) VALUES (3, 5, 'pizzaiolo');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`establishment`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`establishment` (`id`, `location_id`, `phone_number`) VALUES (1, 6, '0687435676');
INSERT INTO `oc_pizza`.`establishment` (`id`, `location_id`, `phone_number`) VALUES (2, 7, '0676654355');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`establishment_has_employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (1, 1);
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (1, 2);
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (1, 3);
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (2, 1);
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (2, 2);
INSERT INTO `oc_pizza`.`establishment_has_employee` (`establishment_id`, `employee_id`) VALUES (2, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`ingredient` (`id`, `name`) VALUES (1, 'pate');
INSERT INTO `oc_pizza`.`ingredient` (`id`, `name`) VALUES (2, 'chorizo');
INSERT INTO `oc_pizza`.`ingredient` (`id`, `name`) VALUES (3, 'fromage');
INSERT INTO `oc_pizza`.`ingredient` (`id`, `name`) VALUES (4, 'gruyere');
INSERT INTO `oc_pizza`.`ingredient` (`id`, `name`) VALUES (5, 'anchois');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`location`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (1, '2 avenue machin', 'perigueux', '24000');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (2, '4 impasse truc', 'perigueux', '24000');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (3, '8 rue du ragondin', 'perigueux', '24000');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (4, '23 impasse des tortues', 'perigueux', '24000');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (5, '1 rue des dauphins', 'perigueux', '24000');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (6, 'rue de la pizzera numero uno', 'boulazac', '24750');
INSERT INTO `oc_pizza`.`location` (`id`, `street`, `city`, `zip_code`) VALUES (7, 'rue de la pizzeria numero dos', 'trelissac', '24557');

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`payment`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`payment` (`id`, `payment_type`, `payment_amount`) VALUES (1, 'CB', 12.50);
INSERT INTO `oc_pizza`.`payment` (`id`, `payment_type`, `payment_amount`) VALUES (2, 'CASH', 11.00);
INSERT INTO `oc_pizza`.`payment` (`id`, `payment_type`, `payment_amount`) VALUES (3, 'CB', 12.00);
INSERT INTO `oc_pizza`.`payment` (`id`, `payment_type`, `payment_amount`) VALUES (4, 'CB', 10.00);
INSERT INTO `oc_pizza`.`payment` (`id`, `payment_type`, `payment_amount`) VALUES (5, 'CASH', 22.50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`product`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`product` (`id`, `name`, `description`, `duty_free_price`) VALUES (1, 'ice_tea', 'boisson non gazeuse', 2.00);
INSERT INTO `oc_pizza`.`product` (`id`, `name`, `description`, `duty_free_price`) VALUES (2, 'coca_cola', 'boisson gazeuse', 2.50);
INSERT INTO `oc_pizza`.`product` (`id`, `name`, `description`, `duty_free_price`) VALUES (3, 'pizza_chorizo', 'pizza avec du chorizo', 10.00);
INSERT INTO `oc_pizza`.`product` (`id`, `name`, `description`, `duty_free_price`) VALUES (4, 'pizza_quatre_fromages', 'pizza avec quatre fromages', 12.00);
INSERT INTO `oc_pizza`.`product` (`id`, `name`, `description`, `duty_free_price`) VALUES (5, 'pizza_anchois', 'pizza avec des anchois', 11.00);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`product_has_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (3, 1, 1);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (3, 2, 5);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (3, 4, 50);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (4, 1, 1);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (4, 3, 4);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (4, 4, 50);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (5, 1, 1);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (5, 5, 7);
INSERT INTO `oc_pizza`.`product_has_ingredient` (`product_id`, `ingredient_id`, `quantity`) VALUES (5, 4, 50);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`stock`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (1, 1, 1, NULL, 18);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (2, 1, 2, NULL, 15);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (3, 1, 3, 1, 12);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (4, 1, 3, 2, 32);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (5, 1, 3, 4, 14);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (6, 1, 4, 1, 45);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (7, 1, 4, 3, 34);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (8, 1, 4, 4, 55);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (9, 1, 5, 1, 34);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (10, 1, 5, 5, 76);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (11, 1, 5, 4, 23);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (12, 2, 1, NULL, 45);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (13, 2, 2, NULL, 43);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (14, 2, 3, 1, 43);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (15, 2, 3, 2, 54);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (16, 2, 3, 4, 65);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (17, 2, 4, 1, 34);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (18, 2, 4, 3, 23);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (19, 2, 4, 4, 65);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (20, 2, 5, 1, 43);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (21, 2, 5, 5, 54);
INSERT INTO `oc_pizza`.`stock` (`id`, `establishment_id`, `product_id`, `ingredient_id`, `unit`) VALUES (22, 2, 5, 4, 89);

COMMIT;


-- -----------------------------------------------------
-- Data for table `oc_pizza`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `oc_pizza`;
INSERT INTO `oc_pizza`.`user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `location_id`) VALUES (1, 'Jean', 'Ragnotti', 'jean@gmail.com', 'abcde4546', '0601010101', 1);
INSERT INTO `oc_pizza`.`user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `location_id`) VALUES (2, 'Mikael', 'Yukulele', 'mikael@gmail.com', 'azerty', '0602020202', 2);
INSERT INTO `oc_pizza`.`user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `location_id`) VALUES (3, 'Georges', 'Panzani', 'georges@gmail.com', 'ohayogozaimasu', '0603030303', 3);
INSERT INTO `oc_pizza`.`user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `location_id`) VALUES (4, 'Romain', 'Frugier', 'romain@gmail.com', 'abe14w67', '0604040404', 4);
INSERT INTO `oc_pizza`.`user` (`id`, `first_name`, `last_name`, `email`, `password`, `phone_number`, `location_id`) VALUES (5, 'Brice', 'Venere', 'brice@gmail.com', 'hontoninanithefuck', '0605050505', 5);

COMMIT;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;