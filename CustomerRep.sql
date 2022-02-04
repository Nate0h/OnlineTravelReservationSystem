CREATE DATABASE  IF NOT EXISTS `CustomerRep` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `CustomerRep`;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) not null,
  `password` varchar(50) not null,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
select* from `users`;

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
`cid` varchar(6) not null,
primary key (`cid`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('jre738'),('tom173'), ('pom019'), ('abc123');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;



DROP TABLE IF EXISTS `airline`;
CREATE TABLE `airline` (
`airline_id` varchar(2) not null,
primary key (`airline_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `airports`;
CREATE TABLE `airports` (
`airport_id` varchar(3) not null,
primary key (`airport_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `airports` WRITE;
/*!40000 ALTER TABLE `airports` DISABLE KEYS */;
INSERT INTO `airports` VALUES ('LAX'),('DET'), ('MIN'), ('JFK'),('MIA'),('LGA'),('SFO'),('BOS'),('DAL'),('LAS'),('DEN'),('ORD'),('ATL'),('DTW'),('SEA'),('LIH'),('STL'),('PHL'),('MSY'),('MCI');
/*!40000 ALTER TABLE `airports` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `flight_schedule`;
CREATE TABLE `flight_schedule` (
`flight_id` varchar(4) not null,
`airline_id` varchar(2) not null,
`dep_airport` varchar(3) not null,
`arr_airport` varchar(3) not null,
`dep_time` time,
`arr_time` time,
`date` date,
`fare` int,
primary key (`flight_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


LOCK TABLES `flight_schedule` WRITE;
/*!40000 ALTER TABLE `flight_schedule` DISABLE KEYS */;
INSERT INTO `flight_schedule` VALUES ('1001','AA','JFK','LAX','06:30:00','12:30:00','2021-12-10', 600),('1002','UA','LGA','MIA','07:45:00','10:15:00','2021-12-10',400),('1003','SW','BOS','SFO','12:23:00','18:53:00','2021-12-10',450),('1004','JB','DAL','LAS','04:10:00','07:10:10','2021-12-10',200),('1005','NK','DEN','ORD','16:20:00','18:50:00','2021-12-10', 280),('1006','JB','ATL','DTW','04:55:00','08:55:00','2021-12-10', 100),('1007','AA','LAX','SEA','11:20:00', '14:50:00','2021-12-10',250),('1008','HA','LIH','STL','03:30:00','18:30:00','2021-12-10', 350),('1009','JB','MCI','MSP','06:15:00','10:35:00','2021-12-10',220),('1010','UA','PHL','MSY','14:05:00','19:15:00','2021-12-10', 300);
/*!40000 ALTER TABLE `flight_schedule` ENABLE KEYS */;
UNLOCK TABLES;


DROP TABLE IF EXISTS `reservation_portfolio`;
CREATE TABLE `reservation_portfolio`(
`rid` int not null,
`cid` varchar(6) not null,
`flight_id` varchar(4) not null,
`flight_type` varchar(50) not null,
`trip_type` varchar(50) not null,
`airline_id` varchar(2) not null,
`dep_airport` varchar(3) not null,
`arr_airport` varchar(3) not null,
`dep_time` time,
`arr_time` time,
`date` varchar(50),
`booking_date` varchar(50),
`price` int,
`booking_fee` int not null,
primary key(rid),
constraint `fk_cid` foreign key (`cid`) references `customers`(`cid`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `waitinglist`;
CREATE TABLE `waitinglist`(
`flight_id` varchar(4) not null,
`cid` varchar(6) not null
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



LOCK TABLES `waitinglist` WRITE;
/*!40000 ALTER TABLE `waitinglist` DISABLE KEYS */;
INSERT INTO `waitinglist` VALUES ('1001','jre738'),('1001','pom173'), ('1001','pom019'), ('1002','abc123');
/*!40000 ALTER TABLE `waitinglist` ENABLE KEYS */;
UNLOCK TABLES;

DROP TABLE IF EXISTS `aircrafts`;
CREATE TABLE `aircrafts` (
`aircraft_id` varchar(5) not null,
`seats` int not null, 
primary key (`aircraft_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `aircrafts` WRITE;
/*!40000 ALTER TABLE `aircrafts` DISABLE KEYS */;
INSERT INTO `aircrafts` VALUES ('xron3',200),('lsor1',85), ('uraz4',130),('ptra9',155);
/*!40000 ALTER TABLE `aircrafts` ENABLE KEYS */;
UNLOCK TABLES;

select* from `aircrafts`;

Update `aircrafts` set `aircraft_id` = 'lsor1',`seats` = 201 where `aircraft_id` = 'colt4';


