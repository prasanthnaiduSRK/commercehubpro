-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: project
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adress`
--

DROP TABLE IF EXISTS `adress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adress` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) NOT NULL,
  `address_line2` varchar(255) DEFAULT NULL,
  `city` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9hfxe8b9rf4hduod0bg79wosq` (`user_id`),
  CONSTRAINT `FK9hfxe8b9rf4hduod0bg79wosq` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adress`
--

LOCK TABLES `adress` WRITE;
/*!40000 ALTER TABLE `adress` DISABLE KEYS */;
INSERT INTO `adress` VALUES (1,'gandiji colony','gunadala','vijayawada','India','2026-07-15 18:09:28.183046','Prasanth','+91 85009 66684','520004','Andhra Pradesh',1),(2,'gandiji colony','gunadala','vijayawada','India','2026-07-16 05:48:31.233338','Prasanth','+91 85009 66684','520004','Andhra Pradesh',1);
/*!40000 ALTER TABLE `adress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartitems`
--

DROP TABLE IF EXISTS `cartitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cartitems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` double NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKsimka2m5s211l25tbgasmqhyc` (`product_id`),
  KEY `FKrirsolfrodewyij44g4tdj7qm` (`user_id`),
  CONSTRAINT `FKrirsolfrodewyij44g4tdj7qm` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKsimka2m5s211l25tbgasmqhyc` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartitems`
--

LOCK TABLES `cartitems` WRITE;
/*!40000 ALTER TABLE `cartitems` DISABLE KEYS */;
INSERT INTO `cartitems` VALUES (11,'2026-07-15 18:47:36.503036',14999,1,14999,11,1),(12,'2026-07-16 18:25:17.204965',99999,1,99999,2,1);
/*!40000 ALTER TABLE `cartitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `Category name` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'mobiles.png','Mobiles','2026-07-12 00:31:46.000000','Smartphones and mobile accessories'),(2,'electronics.png','Electronics','2026-07-12 00:31:46.000000','Laptops, TVs and electronic gadgets'),(3,'fashion.png','Fashion','2026-07-12 00:31:46.000000','Men and women clothing'),(4,'shoes.png','Shoes','2026-07-12 00:31:46.000000','Casual, sports and formal shoes'),(5,'watches.png','Watches','2026-07-12 00:31:46.000000','Smartwatches and analog watches'),(6,'furniture.png','Furniture','2026-07-12 00:31:46.000000','Home and office furniture'),(7,'beauty.png','Beauty','2026-07-12 00:31:46.000000','Beauty and personal care products'),(8,'groceries.png','Groceries','2026-07-12 00:31:46.000000','Daily grocery essentials');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_seq`
--

DROP TABLE IF EXISTS `categories_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_seq`
--

LOCK TABLES `categories_seq` WRITE;
/*!40000 ALTER TABLE `categories_seq` DISABLE KEYS */;
INSERT INTO `categories_seq` VALUES (1);
/*!40000 ALTER TABLE `categories_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderitems` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `subtotal` double NOT NULL,
  `product_id` bigint NOT NULL,
  `shipping_address_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqu7dfdpbhltsgxfq2ahkdnyv5` (`product_id`),
  KEY `FK5cejmgkt6lex1vlunvp5kbdbc` (`shipping_address_id`),
  KEY `FKfe8e4w60ra6etlnro037hx8r3` (`user_id`),
  CONSTRAINT `FK5cejmgkt6lex1vlunvp5kbdbc` FOREIGN KEY (`shipping_address_id`) REFERENCES `adress` (`id`),
  CONSTRAINT `FKfe8e4w60ra6etlnro037hx8r3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKqu7dfdpbhltsgxfq2ahkdnyv5` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

LOCK TABLES `orderitems` WRITE;
/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
INSERT INTO `orderitems` VALUES (1,'2026-07-16 07:12:16.137504',99999,1,99999,2,2,1),(2,'2026-07-16 07:20:48.740560',99999,1,99999,2,2,1),(3,'2026-07-16 07:22:51.951113',99999,1,99999,2,2,1),(4,'2026-07-16 07:23:37.234441',99999,1,99999,2,2,1),(5,'2026-07-16 08:31:10.637123',29999,1,29999,3,2,1),(6,'2026-07-16 08:31:14.513177',29999,1,29999,3,2,1),(7,'2026-07-16 08:34:22.093738',29999,1,29999,3,2,1),(8,'2026-07-16 08:35:05.639316',99999,1,99999,2,2,1);
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `description` text,
  `image_url` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `stock` int NOT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Apple','2026-07-12 00:32:00.000000','Apple iPhone 15 128GB','iphone15.jpg',69999,'iPhone 15',25,1),(2,'Apple','2026-07-12 00:32:00.000000','Apple iPhone 17 256GB','iphone17.jpg',99999,'iPhone 17',20,1),(3,'OnePlus','2026-07-12 00:32:00.000000','OnePlus Nord 6 5G','oneplus Nord6.jpg',29999,'OnePlus Nord 6',30,1),(4,'OnePlus','2026-07-12 00:32:00.000000','OnePlus 15 Flagship','oneplus 15.jpg',64999,'OnePlus 15',18,1),(5,'OPPO','2026-07-12 00:32:00.000000','OPPO A6 Smartphone','oppo A6.jpg',15999,'OPPO A6',35,1),(6,'OPPO','2026-07-12 00:32:00.000000','OPPO A18 Smartphone','oppo A18.jpg',12999,'OPPO A18',40,1),(7,'OPPO','2026-07-12 00:32:00.000000','OPPO F25 5G','Oppo F25 5G.jpg',23999,'OPPO F25 5G',22,1),(8,'OPPO','2026-07-12 00:32:00.000000','OPPO F33 Smartphone','Oppo F33.jpg',26999,'OPPO F33',18,1),(9,'OPPO','2026-07-12 00:32:00.000000','OPPO K14 5G','oppo k14.jpg',21999,'OPPO K14',28,1),(10,'OPPO','2026-07-12 00:32:00.000000','OPPO Reno6 5G','oppo Reno6.jpg',32999,'OPPO Reno6',15,1),(11,'Realme','2026-07-12 00:32:00.000000','Realme C83 Smartphone','realme C83.jpg',14999,'Realme C83',32,1),(12,'Realme','2026-07-12 00:32:00.000000','Realme 15 5G','realme 15 5G.jpg',24999,'Realme 15 5G',20,1),(13,'Realme','2026-07-12 00:32:00.000000','Realme 16 Pro','realme 16pro.jpg',28999,'Realme 16 Pro',16,1),(14,'Samsung','2026-07-12 00:32:00.000000','Samsung Foldable Phone','samsung galaxy Z Fold6.jpg',169999,'Samsung Galaxy Z Fold 6',8,1),(15,'Samsung','2026-07-12 00:32:00.000000','Samsung M06 5G','samsung M06 5G.jpg',13999,'Samsung M06 5G',30,1),(16,'Samsung','2026-07-12 00:32:00.000000','Samsung Galaxy S22','Samsung S22.jpg',55999,'Samsung S22',14,1),(17,'Samsung','2026-07-12 00:32:00.000000','Samsung Galaxy S24 Ultra','Samsung s24 Ultra.jpg',124999,'Samsung S24 Ultra',10,1),(18,'Vivo','2026-07-12 00:32:00.000000','Vivo V70 Smartphone','vivo v70.jpg',31999,'Vivo V70',18,1),(19,'Vivo','2026-07-12 00:32:00.000000','Vivo X300 FE','vivo x300 Fe.jpg',45999,'Vivo X300 FE',12,1),(20,'Xiaomi','2026-07-12 00:32:00.000000','Xiaomi 17 Pro','Xiami 17pro.jpg',52999,'Xiaomi 17 Pro',15,1),(21,'Xiaomi','2026-07-12 00:32:00.000000','Xiaomi 17 Pro 5G','Xiami 17pro 5G.jpg',56999,'Xiaomi 17 Pro 5G',12,1),(24,'Apple','2026-07-17 16:01:13.000000','Apple MacBook Pro M4','MacBook Pro M4.jpg',179999,'MacBook Pro M4',6,2),(25,'Lenovo','2026-07-17 16:01:13.000000','Lenovo IdeaPad Slim 3 Intel i7 Laptop','Lenovo Ideapad Slim 3 Intel I7.jpg',62999,'Lenovo IdeaPad Slim 3',12,2),(28,'Vivo','2026-07-17 16:01:13.000000','Vivo X Flip Foldable Smartphone','New vivo x Flip.jpg',79999,'New Vivo X Flip',5,2),(29,'Generic','2026-07-17 16:01:13.000000','Gaming Over-Ear Headset with Mic','Gaming Headset.jpg',3999,'Gaming Headset',25,2),(30,'Boat','2026-07-17 16:01:13.000000','Boat Rockerz Wireless Headset','BoatRockerz Headset.jpg',2499,'Boat Rockerz Headset',30,2),(31,'Generic','2026-07-17 16:01:13.000000','RGB Gaming Headset','RGB headset.jpg',2999,'RGB Headset',20,2),(32,'Generic','2026-07-17 16:01:13.000000','Wireless Bluetooth Headset','Wireless Headset.jpg',1999,'Wireless Headset',35,2),(33,'Boat','2026-07-17 16:01:13.000000','Boat Airdopes Bluetooth Earbuds','Boat Earbuds.jpg',1499,'Boat Earbuds',40,2),(34,'Beats','2026-07-17 16:01:13.000000','Beats Studio Wireless Earbuds','Beats Studio Earbuds.jpg',9999,'Beats Studio Earbuds',15,2),(35,'Apple','2026-07-17 16:01:13.000000','Apple AirPods Pro 3','Airpods pro3.jpg',24999,'AirPods Pro 3',12,2),(36,'Noise','2026-07-17 16:01:13.000000','Noise Bluetooth Earbuds','Noise earbuds.jpg',1799,'Noise Earbuds',30,2),(37,'Noise','2026-07-17 16:01:13.000000','Noise AirWave Wireless Headset','NoiseAirWave Headset.jpg',3499,'Noise AirWave Headset',18,2),(38,'GoBoult','2026-07-17 16:01:13.000000','GoBoult True Wireless Earbuds','GoBoult Earbuds.jpg',1599,'GoBoult Earbuds',28,2),(43,'Lenovo','2026-07-17 22:56:51.000000','Lenovo Yoga 7i 13th Gen Laptop','Lenovo Yoga  7i 13th Gen.jpg',89999,'Lenovo Yoga 7i',9,2),(49,'Lenovo','2026-07-17 23:13:54.000000','Lenovo Touchscreen windows 11pr0','Lenovo Touchscreen windows 11pr0.jpg',74999,'Lenovo Touchscreen smart ',7,2),(50,'Apple','2026-07-17 23:16:24.000000','13-inch Apple MacBook Air M3 Laptop','Apple 13 MacBookAir.jpg',114999,'Apple MacBook Air M3 New',10,2),(51,'Generic','2026-07-17 23:48:21.000000','Classic Fit Cotton Shirt for Men','classic fit for men.jpg',999,'Classic Fit for Men',40,3),(52,'Generic','2026-07-17 23:48:21.000000','Premium Formal Dress for Men','Formal dress.jpg',1999,'Formal Dress',25,3),(53,'Fitoda','2026-07-17 23:48:21.000000','Fitoda Fashion Casual Shirt','fitoda fashion men shirt.jpg',899,'Fitoda Fashion Men Shirt',35,3),(54,'Leriya','2026-07-17 23:48:21.000000','Leriya Fashion Stylish Shirt','Leriya Fashion Men shirt.jpg',1099,'Leriya Fashion Men Shirt',30,3),(55,'Generic','2026-07-17 23:48:21.000000','Korean Style Casual Outfit for Men','korean style.jpg',1499,'Korean Style',20,3),(56,'Generic','2026-07-17 23:48:21.000000','Slim Fit Men Trouser','Men trouser.jpg',1299,'Men Trouser',28,3),(57,'Generic','2026-07-17 23:48:21.000000','Cotton Cargo Trouser for Men','Men Cargo trouser.jpg',1699,'Men Cargo Trouser',22,3),(58,'Generic','2026-07-17 23:48:21.000000','Business Formal Jacket','Spring Business jacket.jpg',2999,'Spring Business Jacket',15,3),(59,'Generic','2026-07-17 23:48:21.000000','Regular Casual Jacket','Regular Attire jacket.jpg',2499,'Regular Attire Jacket',18,3),(60,'Generic','2026-07-17 23:48:21.000000','Premium MenCloth Suit','Cloth suit.jpg',4999,'Cloth Suit',10,3),(61,'Generic','2026-07-17 23:48:21.000000','Comfortable Travel Outfit for Men','trip outfit.jpg',1899,'Trip Outfit',24,3),(62,'Generic','2026-07-17 23:48:21.000000','Beach Wear Outfit for Men','Mens Goa Outfit.jpg',1599,'Mens Goa Outfit',26,3),(63,'Generic','2026-07-17 23:48:21.000000','Casual Cotton Shirt','Casual Shirt.jpg',799,'Casual Shirt',45,3),(64,'Generic','2026-07-17 23:48:21.000000','Formal White Shirt for Men','Mens white shirt.jpg',999,'Mens White Shirt',38,3),(65,'Generic','2026-07-17 23:48:21.000000','Trendy Cotton Shirt','Trendy mens cotton shirt.jpg',1199,'Trendy Mens Cotton Shirt',32,3),(66,'Generic','2026-07-17 23:48:21.000000','Regular Fit Mens Shirt','Mens Shirt.jpg',899,'Mens Shirt',40,3),(67,'Generic','2026-07-17 23:48:21.000000','Lightweight Summer Outfit','Summer mens outfit.jpg',1799,'Summer Mens Outfit',20,3),(68,'Generic','2026-07-17 23:48:21.000000','Stylish Casual Shirt','Casual Shirt1.jpg',849,'Casual Shirt1',30,3),(69,'Nike','2026-07-18 00:22:05.000000','Comfortable lifestyle sneakers','Running Shoes (1).jpg',8999,'Nike Air Max 270',20,4),(70,'Adidas','2026-07-18 00:22:05.000000','Premium running shoes','Running Shoes (2).jpg',10999,'Adidas Ultraboost 22',15,4),(71,'Puma','2026-07-18 00:22:05.000000','Casual sneakers for men','Running Shoes (3).jpg',6999,'Puma RS-X',18,4),(72,'Reebok','2026-07-18 00:22:05.000000','Training and gym shoes','Running Shoes (4).jpg',7499,'Reebok Zig Kinetica',14,4),(73,'ASICS','2026-07-18 00:22:05.000000','Professional running shoes','Running Shoes (5).jpg',12999,'ASICS Gel Nimbus 26',10,4),(74,'Skechers','2026-07-18 00:22:05.000000','Walking shoes for everyday comfort','premium shoes for men.jpg',5999,'Skechers Go Walk 7',22,4),(75,'Woodland','2026-07-18 00:22:05.000000','Outdoor leather boots','premium shoes for men 2.jpg',4999,'Woodland Leather Boots',16,4),(76,'Bata','2026-07-18 00:22:05.000000','Sports running shoes','premium shoes for men3.jpg',2999,'Bata Power Runner',28,4),(77,'Red Tape','2026-07-18 00:22:05.000000','Casual sneakers for men','premium shoes for men4.jpg',3499,'Red Tape Casual Sneakers',20,4),(78,'Campus','2026-07-18 00:22:05.000000','Lightweight running shoes','premium shoes for men5.jpg',2499,'Campus North Plus',30,4),(79,'Sparx','2026-07-18 00:22:05.000000','Daily wear sports shoes','premium shoes for men6.jpg',1999,'Sparx SM-675',35,4),(80,'HRX','2026-07-18 00:22:05.000000','Training shoes for men','premium shoes for men7.jpg',2799,'HRX Active Runner',18,4),(81,'U.S. Polo','2026-07-18 00:22:05.000000','Classic white sneakers','premium shoes for men8.jpg',4299,'U.S. Polo Sneakers',15,4),(82,'Lee Cooper','2026-07-18 00:22:05.000000','Premium casual shoes','premium shoes for men9 (1).jpg',3799,'Lee Cooper Casual Shoes',17,4),(89,'Nike','2026-07-18 01:21:32.000000','Lightweight running shoes','premium looking shoes (1).jpg',7999,'Nike Air Zoom Pegasus 41',18,4),(90,'Adidas','2026-07-18 01:21:32.000000','Classic white casual sneakers','premium looking shoes (2).jpg',6499,'Adidas Grand Court 2.0',20,4),(91,'Puma','2026-07-18 01:21:32.000000','Stylish everyday sneakers','premium looking shoes (3).jpg',5999,'Puma Caven 2.0',22,4),(92,'Skechers','2026-07-18 01:21:32.000000','Memory foam comfort shoes','premium looking shoes (4).jpg',7499,'Skechers Arch Fit',15,4),(93,'Woodland','2026-07-18 01:21:32.000000','Durable outdoor casual shoes','premium looking shoes (5).jpg',5499,'Woodland Outdoor Trek',16,4),(94,'Red Tape','2026-07-18 01:21:32.000000','Premium sports casual shoes','premium looking shoes (6).jpg',4299,'Red Tape Urban Runner',19,4),(95,'ASICS','2026-07-18 01:21:32.000000','Professional running shoes','premium looking shoes (7).jpg',8999,'ASICS Gel Pulse 15',12,4),(156,'Wakefit','2026-07-18 02:03:47.000000','Premium wooden queen size bed with storage','Beds Furniture (1).jpg',28999,'Wooden Queen Size Bed',10,6),(157,'Home Centre','2026-07-18 02:03:47.000000','Elegant king size wooden bed','Beds Furniture (2).jpg',35999,'Modern King Size Bed',8,6),(158,'Durian','2026-07-18 02:03:47.000000','Soft upholstered double bed','Beds Furniture (3).jpg',42999,'Luxury Upholstered Bed',6,6),(159,'Wooden Street','2026-07-18 02:03:47.000000','Durable Sheesham wood bed','Beds Furniture (4).jpg',31999,'Solid Sheesham Bed',7,6),(160,'Nilkamal','2026-07-18 02:03:47.000000','Modern double bed with headboard','Beds Furniture (5).jpg',27999,'Classic Double Bed',9,6),(161,'IKEA','2026-07-18 02:03:47.000000','Minimalist platform bed','Beds Furniture (6).jpg',38999,'Designer Platform Bed',5,6),(162,'Pepperfry','2026-07-18 02:03:47.000000','King size storage bed','Beds Furniture (7).jpg',44999,'Premium Storage Bed',6,6),(163,'Urban Ladder','2026-07-18 02:03:47.000000','Engineered wood queen bed','Beds Furniture (8).jpg',24999,'Engineered Wood Bed',10,6),(164,'Godrej Interio','2026-07-18 02:03:47.000000','Stylish bed frame with premium finish','Beds Furniture (9).jpg',33999,'Contemporary Bed Frame',8,6),(165,'Durian','2026-07-18 02:03:47.000000','Premium wooden panel bed','Beds Furniture (10).jpg',46999,'Luxury Panel Bed',5,6),(166,'Wakefit','2026-07-18 02:03:47.000000','Simple wooden bed for modern homes','Beds Furniture (11).jpg',22999,'Minimal Wooden Bed',12,6),(167,'Home Centre','2026-07-18 02:03:47.000000','Luxury designer bedroom furniture','Beds Furniture (12).jpg',49999,'Premium Designer Bed',4,6),(168,'Wooden Street','2026-07-18 02:03:47.000000','Solid oak wood king size bed','Beds Furniture (13).jpg',53999,'Elegant Oak Bed',3,6),(169,'Pepperfry','2026-07-18 02:03:47.000000','Luxury royal style wooden bed','Beds Furniture (14).jpg',59999,'Royal Bedroom Bed',2,6),(170,'Wakefit','2026-07-18 02:05:47.000000','Premium wooden queen size bed with storage','Beds Furniture(1).jpg',28999,'Wooden Queen Size Bed',10,6),(171,'Wakefit','2026-07-18 02:18:59.000000','Premium wooden queen size bed with storage','classic Furniture(1).jpg',28999,'Wooden Queen Size Bed',10,6),(172,'Wakefit','2026-07-18 02:19:40.000000','Premium wooden queen size bed with storage','classic Furniture.jpg',28999,'Wooden Queen Size Bed',10,6),(173,'Wakefit','2026-07-18 02:21:06.000000','Premium wooden queen size bed with storage','classic furniture.jpg',28999,'Wooden Queen Size Bed',10,6),(174,'Rolex','2026-07-18 03:18:26.000000','Luxury diving watch with premium finish','premium watches (1).jpg',89999,'Rolex Submariner',10,5),(175,'Omega','2026-07-18 03:18:26.000000','Swiss automatic luxury watch','premium watches (2).jpg',82999,'Omega Seamaster',8,5),(176,'Tag Heuer','2026-07-18 03:18:26.000000','Premium chronograph watch','premium watches (3).jpg',76999,'Tag Heuer Carrera',12,5),(177,'Tissot','2026-07-18 03:18:26.000000','Elegant stainless steel watch','premium watches (4).jpg',42999,'Tissot PRX',15,5),(178,'Fossil','2026-07-18 03:18:26.000000','Premium smartwatch','premium watches (5).jpg',18999,'Fossil Gen 6',20,5),(179,'Casio','2026-07-18 03:18:26.000000','Sporty premium analog watch','premium watches (6).jpg',14999,'Casio Edifice',18,5),(180,'Citizen','2026-07-18 03:18:26.000000','Solar powered luxury watch','premium watches (7).jpg',25999,'Citizen Eco-Drive',10,5),(181,'Seiko','2026-07-18 03:18:26.000000','Automatic dress watch','premium watches (8).jpg',34999,'Seiko Presage',9,5),(182,'Michael Kors','2026-07-18 03:18:26.000000','Premium fashion watch','premium watches (9).jpg',17999,'Michael Kors Lexington',16,5),(183,'Emporio Armani','2026-07-18 03:18:26.000000','Luxury designer wristwatch','premium watches (10).jpg',22999,'Emporio Armani Classic',14,5),(184,'Titan','2026-07-18 03:18:26.000000','Ultra slim premium watch','premium watches (11).jpg',13999,'Titan Edge',20,5),(185,'Daniel Wellington','2026-07-18 03:18:26.000000','Minimalist luxury watch','premium watches (12).jpg',15999,'Daniel Wellington Classic',15,5),(186,'Rado','2026-07-18 03:18:26.000000','Swiss ceramic luxury watch','premium watches (13).jpg',99999,'Rado Centrix',5,5),(187,'Longines','2026-07-18 03:18:26.000000','Luxury sports watch','premium watches (14).jpg',86999,'Longines HydroConquest',7,5),(188,'Hublot','2026-07-18 03:18:26.000000','Premium Swiss luxury watch','premium watches (15).jpg',189999,'Hublot Classic Fusion',4,5),(189,'Breitling','2026-07-18 03:18:26.000000','Luxury aviation watch','premium watches (16).jpg',159999,'Breitling Navitimer',5,5),(190,'Patek Philippe','2026-07-18 03:18:26.000000','Exclusive premium watch','premium watches (17).jpg',299999,'Patek Philippe Nautilus',2,5),(191,'Audemars Piguet','2026-07-18 03:18:26.000000','Iconic luxury watch','premium watches (18).jpg',349999,'Audemars Piguet Royal Oak',2,5),(192,'Timex','2026-07-18 03:18:26.000000','Premium outdoor watch','premium watches (19).jpg',8999,'Timex Expedition',25,5),(193,'Guess','2026-07-18 03:18:26.000000','Stylish premium watch','premium watches (20).jpg',12999,'Guess Horizon',18,5),(194,'Police','2026-07-18 03:18:26.000000','Premium mens wristwatch','premium watches (21).jpg',14999,'Police Analog Watch',14,5),(195,'Diesel','2026-07-18 03:18:26.000000','Bold premium watch','premium watches (22).jpg',17999,'Diesel Mega Chief',12,5),(198,'Apple','2026-07-18 03:27:46.000000','Premium smartwatch with advanced features','apple watch.jpg',89999,'Apple Watch Ultra',10,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_seq`
--

DROP TABLE IF EXISTS `products_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_seq`
--

LOCK TABLES `products_seq` WRITE;
/*!40000 ALTER TABLE `products_seq` DISABLE KEYS */;
INSERT INTO `products_seq` VALUES (1);
/*!40000 ALTER TABLE `products_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `createdat` datetime(6) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2026-07-13 13:12:40.043672','prasanthyalavarthi26@gmail.com','Prasanth','prashu1234'),(2,'2026-07-13 13:39:53.614929','personal26032004@gmail.com','pandu','pandu');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_seq`
--

DROP TABLE IF EXISTS `users_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_seq`
--

LOCK TABLES `users_seq` WRITE;
/*!40000 ALTER TABLE `users_seq` DISABLE KEYS */;
INSERT INTO `users_seq` VALUES (1);
/*!40000 ALTER TABLE `users_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wishlist`
--

DROP TABLE IF EXISTS `wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wishlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6p7qhvy1bfkri13u29x6pu8au` (`product_id`),
  KEY `FKtrd6335blsefl2gxpb8lr0gr7` (`user_id`),
  CONSTRAINT `FK6p7qhvy1bfkri13u29x6pu8au` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKtrd6335blsefl2gxpb8lr0gr7` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wishlist`
--

LOCK TABLES `wishlist` WRITE;
/*!40000 ALTER TABLE `wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-18 10:58:02
