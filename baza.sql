/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.18 : Database - domzdravlja
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`domzdravlja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `domzdravlja`;

/*Table structure for table `pruzalac` */

DROP TABLE IF EXISTS `pruzalac`;

CREATE TABLE `pruzalac` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `imePrezime` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pruzalac` */

insert  into `pruzalac`(`id`,`imePrezime`) values 
(1,'Aleksa Aleksic'),
(2,'Petra Petrovic'),
(3,'Ivana Ivanovic'),
(4,'Nikola Nikolic');

/*Table structure for table `termin` */

DROP TABLE IF EXISTS `termin`;

CREATE TABLE `termin` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `usluga` bigint(20) NOT NULL,
  `klijent` varchar(50) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `prostorija` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`,`usluga`),
  KEY `usluga` (`usluga`),
  CONSTRAINT `termin_usluga_fk` FOREIGN KEY (`usluga`) REFERENCES `usluga` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `termin` */

insert  into `termin`(`id`,`usluga`,`klijent`,`datum`,`prostorija`) values 
(1,2,'Andrea Stojkov','2022-02-14',19),
(2,3,'Mia Stojkov','2022-01-16',3),
(3,5,'Luka Lukic','2022-02-22',16),
(4,4,'Tijana Tijanic','2022-01-30',2),
(5,3,'Nemanja Nemanjic','2022-03-15',2);

/*Table structure for table `usluga` */

DROP TABLE IF EXISTS `usluga`;

CREATE TABLE `usluga` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  `pruzalac` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pruzalac` (`pruzalac`),
  CONSTRAINT `usluga_pruzalac_fk` FOREIGN KEY (`pruzalac`) REFERENCES `pruzalac` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `usluga` */

insert  into `usluga`(`id`,`naziv`,`pruzalac`) values 
(1,'Očni pregled',1),
(2,'Kompletan sistematski pregled',3),
(3,'Otorinolaringološki pregled',3),
(4,'Sportski pregled',2),
(5,'Analiza krvne slike',4),
(6,'Testiranje na COVID',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;