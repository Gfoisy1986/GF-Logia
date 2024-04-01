-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               11.4.1-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for gf-logia
CREATE DATABASE IF NOT EXISTS `gf-logia` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_bin */;
USE `gf-logia`;

-- Dumping structure for table gf-logia.client
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomsent` text DEFAULT NULL,
  `nomres` text DEFAULT NULL,
  `emailp` text DEFAULT NULL,
  `emailres` text DEFAULT NULL,
  `faxres` text DEFAULT NULL,
  `faxent` text DEFAULT NULL,
  `_prenoms` text DEFAULT NULL,
  `_noms` text DEFAULT NULL,
  `cellp` text DEFAULT NULL,
  `cellresp` text DEFAULT NULL,
  `telent` text DEFAULT NULL,
  `telresp` text DEFAULT NULL,
  `datesc` text DEFAULT NULL,
  `addent` text DEFAULT NULL,
  `villeent` text DEFAULT NULL,
  `provent` text DEFAULT NULL,
  `paysent` text DEFAULT NULL,
  `zipent` text DEFAULT NULL,
  `addp` text DEFAULT NULL,
  `villep` text DEFAULT NULL,
  `provp` text DEFAULT NULL,
  `paysp` text DEFAULT NULL,
  `zipp` text DEFAULT NULL,
  `tauxhc` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.client: ~1 rows (approximately)
INSERT IGNORE INTO `client` (`id`, `nomsent`, `nomres`, `emailp`, `emailres`, `faxres`, `faxent`, `_prenoms`, `_noms`, `cellp`, `cellresp`, `telent`, `telresp`, `datesc`, `addent`, `villeent`, `provent`, `paysent`, `zipent`, `addp`, `villep`, `provp`, `paysp`, `zipp`, `tauxhc`) VALUES
	(1, 'GuillaumeFoisy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table gf-logia.comptable
CREATE TABLE IF NOT EXISTS `comptable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` text DEFAULT NULL,
  `no` int(11) DEFAULT NULL,
  `depot` int(11) DEFAULT NULL,
  `chequemis` int(11) DEFAULT NULL,
  `soldebank` int(11) DEFAULT NULL,
  `montantrepporter` int(11) DEFAULT NULL,
  `diffdebitcredit` int(11) DEFAULT NULL,
  `tpspercu` int(11) DEFAULT NULL,
  `tvqpercu` int(11) DEFAULT NULL,
  `tpspaye` int(11) DEFAULT NULL,
  `tvqpaye` int(11) DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `compterecevoir` int(11) DEFAULT NULL,
  `compteapayer` int(11) DEFAULT NULL,
  `totaldepense` int(11) DEFAULT NULL,
  `timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `totalrevenue` int(11) DEFAULT NULL,
  `montamorr` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.comptable: ~3 rows (approximately)
INSERT IGNORE INTO `comptable` (`id`, `description`, `no`, `depot`, `chequemis`, `soldebank`, `montantrepporter`, `diffdebitcredit`, `tpspercu`, `tvqpercu`, `tpspaye`, `tvqpaye`, `revenue`, `compterecevoir`, `compteapayer`, `totaldepense`, `timestamp`, `totalrevenue`, `montamorr`, `total`) VALUES
	(1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 30, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table gf-logia.comptavariable
CREATE TABLE IF NOT EXISTS `comptavariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taux_tps` int(11) DEFAULT NULL,
  `taux_tvq` int(11) DEFAULT NULL,
  `nomcomm` text DEFAULT NULL,
  `totaltpspaye` int(11) DEFAULT NULL,
  `totaltvqpaye` int(11) DEFAULT NULL,
  `totaltpsarec` int(11) DEFAULT NULL,
  `totaltvqarec` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.comptavariable: ~1 rows (approximately)
INSERT IGNORE INTO `comptavariable` (`id`, `taux_tps`, `taux_tvq`, `nomcomm`, `totaltpspaye`, `totaltvqpaye`, `totaltpsarec`, `totaltvqarec`) VALUES
	(1, NULL, NULL, NULL, 45, NULL, NULL, NULL);

-- Dumping structure for table gf-logia.flotte
CREATE TABLE IF NOT EXISTS `flotte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serie` text DEFAULT NULL,
  `annee` text DEFAULT NULL,
  `make` text DEFAULT NULL,
  `model` text DEFAULT NULL,
  `km` text DEFAULT NULL,
  `hrs` text DEFAULT NULL,
  `date` text DEFAULT NULL,
  `ecm` text DEFAULT NULL,
  `imatri` text DEFAULT NULL,
  `fing` text DEFAULT NULL,
  `nexinspq` text DEFAULT NULL,
  `nexmai` text DEFAULT NULL,
  `noment` text DEFAULT NULL,
  `unit` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.flotte: ~2 rows (approximately)
INSERT IGNORE INTO `flotte` (`id`, `serie`, `annee`, `make`, `model`, `km`, `hrs`, `date`, `ecm`, `imatri`, `fing`, `nexinspq`, `nexmai`, `noment`, `unit`) VALUES
	(1, 'Fake1', '2002', 'Ford', 'F-250', '56000', '3500', '31/03/2024', '111', 'FAKE', NULL, '31/03/2024', '31/03/2024', 'GuillaumeFoisy', '6'),
	(2, 'Fake2', '2003', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '8');

-- Dumping structure for table gf-logia.inventaire
CREATE TABLE IF NOT EXISTS `inventaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nopiece` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `quantiter` int(11) DEFAULT NULL,
  `quantiterstock` text DEFAULT NULL,
  `buyprice1` text DEFAULT NULL,
  `fourn1` text DEFAULT NULL,
  `buyprice2` text DEFAULT NULL,
  `fourn2` text DEFAULT NULL,
  `sellprice` text DEFAULT NULL,
  `nolocation` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.inventaire: ~1 rows (approximately)
INSERT IGNORE INTO `inventaire` (`id`, `nopiece`, `description`, `quantiter`, `quantiterstock`, `buyprice1`, `fourn1`, `buyprice2`, `fourn2`, `sellprice`, `nolocation`) VALUES
	(1, 350, 'Bolt 1/2x2inch  NF grade8 ', 0, '40', '100', 'FAKE1', '105', 'FAKE2', '250', 'a/4 - 1/2');

-- Dumping structure for table gf-logia.invwo
CREATE TABLE IF NOT EXISTS `invwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quant` int(11) DEFAULT NULL,
  `nopic` text DEFAULT NULL,
  `descp` text DEFAULT NULL,
  `wo` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.invwo: ~13 rows (approximately)
INSERT IGNORE INTO `invwo` (`id`, `quant`, `nopic`, `descp`, `wo`) VALUES
	(1, 10, '25', 'petit tyrap', 'engine'),
	(238, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(239, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(240, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(241, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(242, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(243, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(244, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(245, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(246, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(247, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(248, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine'),
	(249, 8, '350', 'Bolt 1/2x2inch  NF grade8 ', 'engine');

-- Dumping structure for table gf-logia.job
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text DEFAULT NULL,
  `jobname` text DEFAULT NULL,
  `jobinfo` text DEFAULT NULL,
  `jobrepport` text DEFAULT NULL,
  `wo` text DEFAULT NULL,
  `inspectionsheet` text DEFAULT NULL,
  `pstatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.job: ~6 rows (approximately)
INSERT IGNORE INTO `job` (`id`, `username`, `jobname`, `jobinfo`, `jobrepport`, `wo`, `inspectionsheet`, `pstatus`) VALUES
	(13, 'gfoisy', 'engine swap', 'testing one thirty two', 'ZZZZZZZZZZZZZZZZZZZZZZZZZZZZ', 'engine', NULL, 0),
	(16, 'gfoisy', 'engine swap', '', 'testing 2', 'engine', NULL, 1),
	(17, 'gfoisy', 'engine swap', '', 'testing 3', 'engine', NULL, 1),
	(18, 'gfoisy', 'engine swap', '', 'testing4', 'engine', NULL, 1),
	(19, 'gfoisy', 'engine swap', '', 'testing 5', 'engine', NULL, 1),
	(20, 'gfoisy', 'engine swap', '', 'testing 6', 'engine', NULL, 1);

-- Dumping structure for table gf-logia.note
CREATE TABLE IF NOT EXISTS `note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notename` text DEFAULT NULL,
  `wo` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `serie` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.note: ~1 rows (approximately)
INSERT IGNORE INTO `note` (`id`, `notename`, `wo`, `content`, `serie`) VALUES
	(1, 'test', 'engine', 'heya this is a test!', 'Fake1');

-- Dumping structure for table gf-logia.punch
CREATE TABLE IF NOT EXISTS `punch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wo` text DEFAULT NULL,
  `jobname` text DEFAULT NULL,
  `username` text DEFAULT NULL,
  `punchin` text DEFAULT NULL,
  `punchout` text DEFAULT NULL,
  `pstatus` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.punch: ~8 rows (approximately)
INSERT IGNORE INTO `punch` (`id`, `wo`, `jobname`, `username`, `punchin`, `punchout`, `pstatus`) VALUES
	(1, 'engine', 'engine swap', 'gfoisy', '31/03/2024  09:40:00', '31/03/2024  10:05:33', '2'),
	(3, 'engine', 'engine swap', 'gfoisy', '31/03/2024  09:45:33', '31/03/2024  10:05:33', '2'),
	(4, 'engine', 'engine swap', 'gfoisy', '31/03/2024  10:24:44', '31/03/2024  10:24:58', '2'),
	(5, 'engine', 'engine swap', 'gfoisy', '31/03/2024  10:27:24', '31/03/2024  10:27:56', '2'),
	(6, 'engine', 'engine swap', 'gfoisy', '31/03/2024  10:28:02', '31/03/2024  10:29:02', '2'),
	(7, 'engine', 'engine swap', 'gfoisy', '31/03/2024  10:29:16', '31/03/2024  10:29:30', '2'),
	(8, 'engine', 'engine swap', 'gfoisy', '31/03/2024  10:33:25', '31/03/2024  10:33:36', '2'),
	(9, 'engine', 'engine swap', 'gfoisy', '01/04/2024  02:45:47', NULL, '1');

-- Dumping structure for table gf-logia.username
CREATE TABLE IF NOT EXISTS `username` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text DEFAULT NULL,
  `nom` text DEFAULT NULL,
  `prenom` text DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `tel` text DEFAULT NULL,
  `cell` text DEFAULT NULL,
  `addc` text DEFAULT NULL,
  `permis` text DEFAULT NULL,
  `liscence` text DEFAULT NULL,
  `pep` text DEFAULT NULL,
  `saaq` text DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `embauche` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `city` text DEFAULT NULL,
  `province` int(11) DEFAULT NULL,
  `pays` text DEFAULT NULL,
  `zip` text DEFAULT NULL,
  `email1` text DEFAULT NULL,
  `email2` text DEFAULT NULL,
  `tauxhr` int(11) DEFAULT NULL,
  `datesortie` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.username: ~1 rows (approximately)
INSERT IGNORE INTO `username` (`id`, `username`, `nom`, `prenom`, `age`, `tel`, `cell`, `addc`, `permis`, `liscence`, `pep`, `saaq`, `date`, `embauche`, `city`, `province`, `pays`, `zip`, `email1`, `email2`, `tauxhr`, `datesortie`) VALUES
	(1, 'gfoisy', 'Foisy', 'Guillaume', 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping structure for table gf-logia.workorder
CREATE TABLE IF NOT EXISTS `workorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wo` text DEFAULT NULL,
  `serie` text DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table gf-logia.workorder: ~4 rows (approximately)
INSERT IGNORE INTO `workorder` (`id`, `wo`, `serie`, `status`) VALUES
	(12, 'engine', 'Fake1', 1),
	(13, 'brake', 'Fake1', 1),
	(14, 'haha', 'Fake2', 1),
	(15, 'test1', 'Fake2', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
