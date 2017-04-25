CREATE DATABASE VolvoCE;

DROP TABLE IF EXISTS 'tag';

CREATE TABLE tag(
tagId int AUTO_INCREMENT,
orderId varchar(250),
longitude varchar(250),
latitude varchar(250),
attitude varchar(250),
ammountLeft varchar(250),
PRIMARY KEY(tagId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS 'order';

CREATE TABLE order (
orderId int AUTO_INCREMENT,
materialType varchar(250),
owner varchar(250),
PRIMARY KEY(orderId)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS booking;

CREATE TABLE booking (
bookingId int AUTO_INCREMENT,
longitude varchar(250),
latitude varchar(250),
startDateTime datetime,
endDateTime datetime,
PRIMARY KEY(cid)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

