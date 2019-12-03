CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `fName` VARCHAR(255) NOT NULL,
  `mName` VARCHAR(255) ,
  `lName` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `candidateCpf` VARCHAR(255),
  `companyCnpj` VARCHAR(255),
  PRIMARY KEY (`userId`));

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(255) NOT NULL,
  `numberOfQuestions` INT,
  PRIMARY KEY (`categoryId`)  
);

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
    `questionId` INT NOT NULL AUTO_INCREMENT,
    `answer` INT NOT NULL,
    `question` VARCHAR(500) NOT NULL,
    `alternativeA` VARCHAR(500) NOT NULL,
    `alternativeB` VARCHAR(500) NOT NULL,
    `alternativeC` VARCHAR(500) NOT NULL,
    `alternativeD` VARCHAR(500) NOT NULL,
    `categoryId` INT NOT NULL,
    `userId` INT NOT NULL,
    PRIMARY KEY (`questionId`),
    FOREIGN KEY (`categoryId`)
        REFERENCES `mydb`.`category` (`categoryId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)
        REFERENCES `mydb`.`user` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS `mydb`.`exam` (
  `userId` INT NOT NULL,
  `examId` INT NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(255) NOT NULL,
  `result` INT NOT NULL,
   PRIMARY KEY (`examId`),  
    FOREIGN KEY (`userId`)REFERENCES `mydb`.`user` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


CREATE TABLE IF NOT EXISTS `mydb`.`doneQuestions` (
  `examId` INT NOT NULL,
  `questionId` INT NOT NULL,
  `correctAnswer` BIT NOT NULL,
  PRIMARY KEY (`examId`,`questionid`) ,
     FOREIGN KEY (`examId`)REFERENCES `mydb`.`exam` (`examId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`questionId`)REFERENCES `mydb`.`question` (`questionId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);



