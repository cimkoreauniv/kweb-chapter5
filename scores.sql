CREATE TABLE `scores` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `student` VARCHAR(32) NOT NULL,
    `course` VARCHAR(32) NOT NULL,
    `midterm` INT NOT NULL,
    `final` INT NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `scores` VALUES (1,'Barack','Discrete Mathematics',61,87),
(2,'Joe','Discrete Mathematics',97,92),(3,'Barack','Machine Learning',73,61),
(4,'Donald','Operating Systems',58,98),(5,'Joe','Machine Learning',63,78),
(6,'Donald','Discrete Mathematics',91,58),(7,'Donald','Machine Learning',68,82),
(8,'Joe','Operating Systems',72,66);
