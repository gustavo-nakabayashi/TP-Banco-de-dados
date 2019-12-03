CREATE SCHEMA IF NOT EXISTS `mydb` ;
USE `mydb` ;

CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `userId` INT NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(255) NOT NULL,
  `mname` VARCHAR(255) ,
  `lname` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`userId`));

CREATE TABLE IF NOT EXISTS `mydb`.`question` (
    `questionId` INT NOT NULL AUTO_INCREMENT,
    `answer` INT NOT NULL,
    `question` VARCHAR(500) NOT NULL,
    `alternativeA` VARCHAR(500) NOT NULL,
    `alternativeB` VARCHAR(500) NOT NULL,
    `alternativeC` VARCHAR(500) NOT NULL,
    `alternativeD` VARCHAR(500) NOT NULL,
    `categoryId` INT,
    `userId` INT,
    PRIMARY KEY (`questionId`),
    FOREIGN KEY (`categoryId`)
        REFERENCES `mydb`.`category` (`categoryId`)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)
        REFERENCES `mydb`.`user` (`userId`)
        ON DELETE CASCADE ON UPDATE CASCADE
);



CREATE TABLE IF NOT EXISTS `mydb`.`doneQuestions` (
  `examId` INT NOT NULL,
  `questionid` VARCHAR(255) NOT NULL,
  `correctAnswer` BIT NOT NULL,
  PRIMARY KEY (`examId`,`questionid`) ,
     FOREIGN KEY (examId)REFERENCES `mydb`.`do exam` (`examId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`questionid`)REFERENCES `mydb`.`question` (`questionid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
);

CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `examId` INT NOT NULL,
  `questionid` VARCHAR(255) NOT NULL,
  `correctAnswer` BIT NOT NULL,
  PRIMARY KEY (`examId`,`questionid`) ,
     FOREIGN KEY (examId)REFERENCES `mydb`.`do exam` (`examId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`questionid`)REFERENCES `mydb`.`question` (`questionid`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);
);

CREATE TABLE IF NOT EXISTS `mydb`.`doneQuestions` (
  `categoryId` INT NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(255) NOT NULL,
  `numberOfQuestions` INT,
  PRIMARY KEY (`categoryId`)  
);


CREATE TABLE IF NOT EXISTS `mydb`.`exam` (
  `userId` VARCHAR(255) NOT NULL,
  `examId` INT NOT NULL,
  `date` VARCHAR(255) NOT NULL,
  `result` INT NOT NULL,
   PRIMARY KEY (`userId`,`examId`),  
   FOREIGN KEY (categoryId)REFERENCES `mydb`.`category` (`categoryId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY (`userId`)REFERENCES `mydb`.`user` (`userId`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

