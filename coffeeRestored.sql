-- MySQL dump 10.13  Distrib 8.0.45, for macos15 (arm64)
--
-- Host: localhost    Database: coffee
-- ------------------------------------------------------
-- Server version	8.4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int NOT NULL AUTO_INCREMENT,
  `client_name` varchar(64) NOT NULL,
  `ship_address` varchar(256) NOT NULL,
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `uq_clients_client_name` (`client_name`),
  UNIQUE KEY `uq_clients_ship_address` (`ship_address`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'5 Stones Coffee Co.','8102 161st Avenue Northeast, Redmond, WA 98052'),(2,'Rose Hill Café','12633 NE 85th St, Kirkland, WA 98033'),(3,'Downpour Coffee and Sandwich Bar','13200 Old Redmond Rd #150, Redmond, WA 98052'),(4,'Kirkland Roasters','11720 100th Ave NE, Kirkland, WA 98034'),(5,'Redmond Bean Lab','16705 Redmond Way, Redmond, WA 98052'),(6,'Totem Lake Espresso','12520 120th Ave NE, Kirkland, WA 98034'),(7,'Lakeview Coffee Stand','15 Lake St S, Kirkland, WA 98033'),(8,'Cedar Park Café','12300 NE 8th St, Bellevue, WA 98005'),(9,'Downtown Pourhouse','7525 166th Ave NE, Redmond, WA 98052'),(10,'Union Hill Coffee','21405 NE Union Hill Rd, Redmond, WA 98053');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `farms`
--

DROP TABLE IF EXISTS `farms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `farms` (
  `farm_id` int NOT NULL AUTO_INCREMENT,
  `farm_name` varchar(64) NOT NULL,
  `address` varchar(256) NOT NULL,
  `country` varchar(32) NOT NULL,
  PRIMARY KEY (`farm_id`),
  UNIQUE KEY `uq_farms_farm_name` (`farm_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `farms`
--

LOCK TABLES `farms` WRITE;
/*!40000 ALTER TABLE `farms` DISABLE KEYS */;
INSERT INTO `farms` VALUES (1,'Fazenda Sol do Cerrado','Rodovia MG-188, Km 42, Zona Rural, Patrocínio, Minas Gerais, Brazil, 38740-000','Brazil'),(2,'Santa Aurora Coffee Estate','Estrada da Serra Azul, s/n, Distrito de São Pedro, Carmo de Minas, Minas Gerais, Brazil, 37472-000','Brazil'),(3,'Vale Verde do Sul Café','Linha Boa Esperança, 2150, Interior, Venda Nova do Imigrante, Espírito Santo, Brazil, 29375-000','Brazil'),(4,'Abeba Highlands Coffee Garden','Kebele 04, Gedeb Road, Gedeo Zone, Yirgacheffe, Ethiopia, 00100','Ethiopia'),(5,'Finca Sierra de Bruma','Camino El Naranjal, Km 6, Sierra Maestra, Buey Arriba, Granma Province, Cuba','Cuba'),(6,'Kilimani Ridge Cooperative','Kiambu County, Gatundu South, Kenya','Kenya'),(7,'Sumatra Highlands Mill','Lintong Nihuta, Humbang Hasundutan, North Sumatra, Indonesia','Indonesia'),(8,'Antigua Valley Estate','Antigua Guatemala, Sacatepéquez, Guatemala','Guatemala'),(9,'Blue Mountain Terrace','Portland Parish, Blue Mountains, Jamaica','Jamaica'),(10,'Huehuetenango Cloud Farm','La Democracia, Huehuetenango, Guatemala','Guatemala');
/*!40000 ALTER TABLE `farms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flavors`
--

DROP TABLE IF EXISTS `flavors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `flavors` (
  `flavor_id` int NOT NULL AUTO_INCREMENT,
  `flavor_name` varchar(32) NOT NULL,
  `price_per_lb` decimal(5,2) NOT NULL,
  PRIMARY KEY (`flavor_id`),
  UNIQUE KEY `uq_flavors_flavor_name` (`flavor_name`),
  KEY `idx_flavors_price_per_lb` (`price_per_lb`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flavors`
--

LOCK TABLES `flavors` WRITE;
/*!40000 ALTER TABLE `flavors` DISABLE KEYS */;
INSERT INTO `flavors` VALUES (1,'Original Roast',8.99),(2,'Light Roast',9.49),(3,'Arabian Blend',11.99),(4,'Cuban Dark Roast',10.99),(5,'Kenyan Bright',13.49),(6,'Sumatra Earthy',11.49),(7,'Guatemala Cocoa',10.49),(8,'Blue Mountain',13.99),(9,'Morning Decaf',9.99),(10,'Holiday Spice',12.99);
/*!40000 ALTER TABLE `flavors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `flavor_id` int NOT NULL,
  `farm_id` int NOT NULL,
  `lbs_available` decimal(10,2) NOT NULL,
  PRIMARY KEY (`inventory_id`),
  UNIQUE KEY `uq_inventory` (`flavor_id`,`farm_id`),
  KEY `fk_inventory_farms` (`farm_id`),
  CONSTRAINT `fk_inventory_farms` FOREIGN KEY (`farm_id`) REFERENCES `farms` (`farm_id`),
  CONSTRAINT `fk_inventory_flavors` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`flavor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,1,1,250.00),(2,1,2,180.00),(3,2,3,140.00),(4,3,4,120.00),(5,4,5,90.00),(6,5,6,110.00),(7,6,7,160.00),(8,7,8,130.00),(9,8,9,75.00),(10,9,1,200.00),(11,10,2,95.00),(12,7,10,105.00);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `order_date` datetime NOT NULL,
  `ship_date` datetime DEFAULT NULL,
  `received` tinyint(1) NOT NULL DEFAULT '0',
  `amount` decimal(10,2) NOT NULL,
  `tax_percent` decimal(5,2) DEFAULT NULL,
  `item_count` int NOT NULL DEFAULT '1',
  `client_id` int NOT NULL,
  `product_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_products` (`product_id`),
  KEY `idx_orders_client_id` (`client_id`),
  KEY `idx_orders_received` (`received`),
  CONSTRAINT `fk_orders_clients` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_orders_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `ck_orders_dates` CHECK (((`ship_date` is null) or (`order_date` < `ship_date`))),
  CONSTRAINT `ck_orders_received_ship_date` CHECK (((0 = `received`) or (`ship_date` is not null)))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2026-01-10 10:00:00','2026-01-12 10:00:00',1,17.98,9.50,2,1,1),(2,'2026-01-11 11:30:00','2026-01-13 11:30:00',1,47.45,9.50,5,2,5),(3,'2026-01-12 09:15:00','2026-01-14 09:15:00',0,59.95,9.50,5,3,9),(4,'2026-01-13 14:20:00','2026-01-16 14:20:00',1,54.95,9.50,5,4,11),(5,'2026-01-14 08:05:00','2026-01-16 08:05:00',0,24.98,9.50,2,5,12),(6,'2026-01-15 12:45:00','2026-01-18 12:45:00',1,22.98,9.50,2,6,15),(7,'2026-01-16 16:10:00','2026-01-19 16:10:00',0,20.98,9.50,2,7,18),(8,'2026-01-17 10:55:00','2026-01-20 10:55:00',1,27.98,9.50,2,8,21),(9,'2026-01-18 09:40:00','2026-01-21 09:40:00',0,19.98,9.50,2,9,24),(10,'2026-01-19 13:25:00','2026-01-22 13:25:00',1,25.98,9.50,2,10,27),(11,'2026-01-20 15:00:00',NULL,0,12.49,9.50,1,1,12);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `item_weight` decimal(4,2) NOT NULL,
  `flavor_id` int NOT NULL,
  PRIMARY KEY (`product_id`),
  KEY `fk_products_flavors` (`flavor_id`),
  CONSTRAINT `fk_products_flavors` FOREIGN KEY (`flavor_id`) REFERENCES `flavors` (`flavor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1.00,1),(2,2.00,1),(3,5.00,1),(4,10.00,1),(5,2.00,2),(6,5.00,2),(7,10.00,2),(8,1.00,3),(9,5.00,3),(10,10.00,3),(11,5.00,4),(12,1.00,5),(13,2.00,5),(14,5.00,5),(15,1.00,6),(16,2.00,6),(17,5.00,6),(18,1.00,7),(19,2.00,7),(20,5.00,7),(21,1.00,8),(22,2.00,8),(23,5.00,8),(24,1.00,9),(25,2.00,9),(26,5.00,9),(27,1.00,10),(28,2.00,10),(29,5.00,10);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_premium_flavors`
--

DROP TABLE IF EXISTS `vw_premium_flavors`;
/*!50001 DROP VIEW IF EXISTS `vw_premium_flavors`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_premium_flavors` AS SELECT 
 1 AS `flavor_id`,
 1 AS `flavor_name`,
 1 AS `price_per_lb`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_products_readable`
--

DROP TABLE IF EXISTS `vw_products_readable`;
/*!50001 DROP VIEW IF EXISTS `vw_products_readable`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_products_readable` AS SELECT 
 1 AS `product_id`,
 1 AS `product_name`,
 1 AS `item_weight`,
 1 AS `flavor_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'coffee'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_calculate_order_total` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_calculate_order_total`(p_order_id int) RETURNS decimal(10,2)
    READS SQL DATA
    DETERMINISTIC
begin
    declare v_amount decimal(10,2);
    declare v_tax_percent decimal(5,2);
    declare v_total decimal(10,2);

    select amount, tax_percent
      into v_amount, v_tax_percent
      from orders
     where order_id = p_order_id;

    if v_tax_percent is null then
        set v_total = v_amount;
    else
        set v_total = v_amount + round(v_amount * v_tax_percent / 100, 2);
    end if;

    return v_total;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_calculate_client_revenue` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calculate_client_revenue`()
begin
    declare v_client_name varchar(64);
    declare v_revenue decimal(10,2);
    declare v_total_revenue decimal(10,2) default 0.00;
    declare v_result text default '';
    declare v_tier varchar(20);
    declare v_done int default false;

    declare revenue_cursor cursor for
        select c.client_name, sum(o.amount) as revenue
          from clients c
          join orders o on c.client_id = o.client_id
         where o.received = true
         group by c.client_name
         order by revenue desc;

    declare continue handler for not found set v_done = true;

    open revenue_cursor;

    read_loop: loop
        fetch revenue_cursor into v_client_name, v_revenue;
        if v_done then
            leave read_loop;
        end if;

        set v_total_revenue = v_total_revenue + v_revenue;

        if v_revenue >= 40 then
            set v_tier = 'High Value';
        else
            set v_tier = 'Standard';
        end if;

        if v_result != '' then
            set v_result = concat(v_result, ' | ');
        end if;
        set v_result = concat(v_result, v_client_name, ': $', v_revenue, ' (', v_tier, ')');
    end loop;

    close revenue_cursor;

    select v_result as client_revenue_breakdown;
    select concat('Total revenue from received orders: $', v_total_revenue) as total_revenue;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_premium_flavors`
--

/*!50001 DROP VIEW IF EXISTS `vw_premium_flavors`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_premium_flavors` AS select `flavors`.`flavor_id` AS `flavor_id`,`flavors`.`flavor_name` AS `flavor_name`,`flavors`.`price_per_lb` AS `price_per_lb` from `flavors` where (`flavors`.`price_per_lb` >= 10) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_products_readable`
--

/*!50001 DROP VIEW IF EXISTS `vw_products_readable`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_products_readable` AS select `products`.`product_id` AS `product_id`,concat(`flavors`.`flavor_name`,' (',`products`.`item_weight`,'lbs)') AS `product_name`,`products`.`item_weight` AS `item_weight`,`products`.`flavor_id` AS `flavor_id` from (`products` join `flavors` on((`flavors`.`flavor_id` = `products`.`flavor_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-18 20:52:51
