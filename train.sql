CREATE TABLE `stations` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `types` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `max_seats` VARCHAR(20) NOT NULL,
    `fare_rate` INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `trains` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `type` INT NOT NULL,
    `source` INT NOT NULL,
    `destination` INT NOT NULL,
    `departure` TIME NOT NULL,
    `arrival` TIME NOT NULL,
    `distance` INT NOT NULL,
    FOREIGN KEY (`type`) REFERENCES `types`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`source`) REFERENCES `stations`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`destination`) REFERENCES `stations`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE `users` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE `tickets` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `train` INT NOT NULL,
    `user` INT NOT NULL,
    `seat_number` INT NOT NULL,
    FOREIGN KEY (`train`) REFERENCES `trains`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user`) REFERENCES `users`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB;

INSERT INTO `stations` VALUES (1,'Seoul'),(2,'Busan'),(3,'GwangjuSongjeong'),
(4,'Gangneung'),(5,'Suseo'),(6,'Yeosu EXPO');

INSERT INTO `types` VALUES (1,'KTX',8,15524),(2,'SRT',8,13712),(3,'KTX-Eum',7,14095),
(4,'ITX-Saemaeul',6,9645),(5,'Mugunghwa',5,6475);

INSERT INTO `trains` VALUES (1,4,6,1,'08:55','13:24',4299),
(2,1,1,2,'14:30','17:11',4174),(3,3,4,1,'18:40','20:51',2231),
(4,1,2,1,'08:20','11:32',4174),(5,2,3,5,'13:00','14:37',2905),
(6,3,1,4,'09:01','10:57',2231),(7,1,2,1,'16:38','19:12',4174),
(8,3,4,1,'12:25','14:27',2231),(9,1,1,2,'07:30','10:12',4174),
(10,5,3,2,'10:31','16:04',3253),(11,2,5,3,'09:40','11:26',2905),
(12,5,1,2,'09:56','15:32',4417),(13,2,3,5,'16:25','18:32',2905),
(14,5,2,3,'06:17','11:59',3253),(15,1,1,6,'07:05','10:17',3956),
(16,4,3,1,'11:26','15:06',3473),(17,2,2,5,'14:30','16:58',4001),
(18,1,1,3,'17:38','19:20',3078),(19,1,6,1,'18:05','21:18',4299),
(20,3,1,4,'19:01','21:06',2231);

INSERT INTO `users` VALUES (1,'Kelda'),(2,'Jaqueline'),(3,'Jaymes'),(4,'Elicia'),
(5,'Lenny'),(6,'Sissy'),(7,'Joni'),(8,'Axl'),(9,'Kenyon'),(10,'Marmaduke'),
(11,'Deanna'),(12,'Baldric'),(13,'Lorn'),(14,'Jayla'),(15,'Ellery'),(16,'Karen'),
(17,'Candis'),(18,'Charli'),(19,'Clint'),(20,'Phillip'),(21,'Glanville'),
(22,'Beauregard'),(23,'Azura'),(24,'Teale'),(25,'Esmond'),(26,'Mayme'),(27,'Lincoln'),
(28,'Arline'),(29,'Earleen'),(30,'Cher'),(31,'Alys'),(32,'Corbin'),(33,'Krista'),
(34,'Bill'),(35,'Jena'),(36,'Lola'),(37,'Journey'),(38,'Hylda'),(39,'Norah'),
(40,'Davy'),(41,'Trixie'),(42,'Alysia'),(43,'Karrie'),(44,'Dolph'),(45,'Wil'),
(46,'Roland'),(47,'Gayle'),(48,'Cindi'),(49,'Keila'),(50,'Asher');

INSERT INTO `tickets` VALUES (1,17,1,8),(2,14,2,4),(3,4,3,3),(4,2,3,5),(5,4,4,2),
(6,2,4,1),(7,19,5,3),(8,10,6,4),(9,3,7,5),(10,19,8,4),(11,8,9,1),(12,18,9,8),
(13,17,10,6),(14,11,11,3),(15,16,11,6),(16,18,11,5),(17,11,12,4),(18,16,12,4),
(19,18,12,6),(20,15,13,4),(21,4,14,8),(22,2,14,2),(23,11,15,1),(24,13,15,5),
(25,16,16,1),(26,18,16,3),(27,18,17,7),(28,11,18,2),(29,16,18,3),(30,1,19,5),
(31,18,19,1),(32,4,20,1),(33,9,21,5),(34,6,22,5),(35,8,22,4),(36,2,22,4),(37,6,23,3),
(38,8,23,7),(39,2,23,3),(40,4,24,6),(41,18,24,4),(42,12,25,1),(43,7,25,5),(44,10,26,2),
(45,6,27,6),(46,8,27,2),(47,18,27,2),(48,3,28,7),(49,19,29,6),(50,12,30,2),(51,11,31,8),
(52,16,31,2),(53,1,32,4),(54,2,32,6),(55,19,33,7),(56,5,34,4),(57,14,35,5),(58,16,36,5),
(59,9,37,1),(60,7,37,1),(61,11,38,5),(62,5,38,7),(63,7,39,8),(64,2,40,7),(65,9,41,6),
(66,7,41,2),(67,15,42,6),(68,10,43,3),(69,7,43,6),(70,14,44,2),(71,1,45,2),(72,9,46,7),
(73,17,46,4),(74,4,47,5),(75,2,47,8),(76,8,48,6),(77,14,49,3),(78,13,49,1),(79,10,50,1),
(80,7,50,7);
