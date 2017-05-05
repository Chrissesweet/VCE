
DROP DATABASE IF EXISTS VolvoCE;

CREATE DATABASE VolvoCE;

DROP TABLE IF EXISTS tag;

CREATE TABLE tag(
tagId int NOT NULL AUTO_INCREMENT,
orderId varchar(250),
longitude varchar(250),
latitude varchar(250),
attitude varchar(250),
ammountLeft varchar(250),
PRIMARY KEY(tagId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
`orderId` int NOT NULL AUTO_INCREMENT,
materialType varchar(250),
owner varchar(250),
PRIMARY KEY(orderId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `booking`;

CREATE TABLE booking (
bookingId int NOT NULL AUTO_INCREMENT,
longitude varchar(250),
latitude varchar(250),
startDateTime datetime,
endDateTime datetime,
PRIMARY KEY(bookingId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `tag` (`tagId`, `orderId`, `longitude`, `latitude`, `attitude`, `ammountLeft`) VALUES ('1', 'Stone 2tons 981232', '15.591162818', '56.182850383', '-', '1tons');
INSERT INTO `tag` (`tagId`, `orderId`, `longitude`, `latitude`, `attitude`, `ammountLeft`) VALUES ('2', 'Pipes 20 981232', '15.591162830', '56.182850390', '-', '10');
