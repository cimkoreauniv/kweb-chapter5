CREATE TABLE `colleges` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `code` INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `departments` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `college` INT NOT NULL,
    FOREIGN KEY (`college`) REFERENCES `colleges`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `courses` (
    `id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `department` INT NOT NULL,
    `code` VARCHAR(8) NOT NULL,
    `is_major` TINYINT(1) NOT NULL,
    `is_required` TINYINT(1) NOT NULL,
    `credit` INT NOT NULL,
    `period` INT NOT NULL,
    FOREIGN KEY (`department`) REFERENCES `departments`(`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `colleges` VALUES (1,'Liberal Arts',13),(2,'Science',16),
(3,'Informatics',32);

INSERT INTO `departments` VALUES (1,'Computer Science and Engineering',3),
(2,'Chemistry',2),(3,'Physics',2),(4,'Linguistics',1);

INSERT INTO `courses` VALUES (1,'Python for Everybody',1,'COSE156',0,0,3,4),
(2,'Discrete Mathematics',1,'COSE211',1,0,3,3),
(3,'Operating Systems',1,'COSE341',1,1,3,3),
(4,'Machine Learning',1,'COSE362',1,0,3,3),(5,'Capstone Design',1,'COSE489',1,0,3,6),
(6,'Organic Chemistry Laboratory',2,'CHEM214',1,1,2,4),
(7,'Solid State Physics',3,'PHYS482',1,0,3,3),
(8,'Inorganic Chemistry II',2,'CHEM308',1,1,3,3);
