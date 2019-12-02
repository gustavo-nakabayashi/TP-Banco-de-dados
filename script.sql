CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `fname` VARCHAR(255) NOT NULL,
  `mname` VARCHAR(255) ,
  `lname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`email`));

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
    `questionId` INT NOT NULL AUTO_INCREMENT,
    `answer` INT NOT NULL,
    `question` VARCHAR(255) NOT NULL,
    `alternativeA` VARCHAR(255) NOT NULL,
    `alternativeB` VARCHAR(255) NOT NULL,
    `alternativeC` VARCHAR(255) NOT NULL,
    `alternativeD` VARCHAR(255) NOT NULL,
    `categoryId` INT,
    `email` VARCHAR(255),
    PRIMARY KEY (`questionId`),
    FOREIGN KEY (`categoryId`)
        REFERENCES `mydb`.`category` (`categoryId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`email`)
        REFERENCES `mydb`.`user` (`email`)
        ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(255) NOT NULL,
  `numberOfQuestions` INT NOT NULL,
  PRIMARY KEY (`categoryId`)  
);


CREATE TABLE IF NOT EXISTS `mydb`.`do exam` (
  `email` VARCHAR(255) NOT NULL,
  `questionId` INT NOT NULL,
  `date` VARCHAR(255) NOT NULL,
  `result` INT NOT NULL,
   PRIMARY KEY (`email`,`categoryId`),  
   FOREIGN KEY (categoryId)REFERENCES `mydb`.`category` (`categoryId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`email`)REFERENCES `mydb`.`user` (`email`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
