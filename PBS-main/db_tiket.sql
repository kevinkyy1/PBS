/*
SQLyog Ultimate v13.1.1 (32 bit)
MySQL - 10.4.28-MariaDB : Database - db_tiket
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_tiket` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;

USE `db_tiket`;

/*Table structure for table `passengers` */

DROP TABLE IF EXISTS `passengers`;

CREATE TABLE `passengers` (
  `passenger_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `umur` int(11) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `notelp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21312053 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `passengers` */

insert  into `passengers`(`passenger_id`,`nama`,`jenis_kelamin`,`umur`,`email`,`notelp`) values 
(21312050,'fajar','laki-laki',20,'fajar123@gmail.com','08912233524'),
(21312051,'farhan ','Laki-Laki',21,'putrafarhan121@gmail.co','081367357067'),
(21312052,'dhimas','Laki-Laki',21,'dimas123@gmail.com','08213243562');

/*Table structure for table `routes` */

DROP TABLE IF EXISTS `routes`;

CREATE TABLE `routes` (
  `route_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `asal` varchar(100) NOT NULL,
  `tujuan` varchar(100) NOT NULL,
  `tarif` decimal(10,0) NOT NULL,
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `routes` */

insert  into `routes`(`route_id`,`asal`,`tujuan`,`tarif`) values 
(1,'lampung','bandung',200000),
(2,'jakarta','lampung',175000),
(123,'lampung','jakarta',150000);

/*Table structure for table `tickets` */

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `ticket_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `passenger_id` int(11) DEFAULT NULL,
  `route_id` int(11) DEFAULT NULL,
  `tanggal_pembelian` date NOT NULL,
  `jumlah` int(11) NOT NULL,
  PRIMARY KEY (`ticket_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `tickets` */

insert  into `tickets`(`ticket_id`,`passenger_id`,`route_id`,`tanggal_pembelian`,`jumlah`) values 
(1,21312051,123,'2024-03-27',1),
(2,21312052,1,'2024-03-28',2),
(3,21312050,2,'2024-03-28',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
