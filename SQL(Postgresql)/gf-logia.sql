-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
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

-- Dumping data for table gf-logia.client: ~1 rows (approximately)
DELETE FROM `client`;
INSERT INTO `client` (`id`, `nomsent`, `nomres`, `emailp`, `emailres`, `faxres`, `faxent`, `_prenoms`, `_noms`, `cellp`, `cellresp`, `telent`, `telresp`, `datesc`, `addent`, `villeent`, `provent`, `paysent`, `zipent`, `addp`, `villep`, `provp`, `paysp`, `zipp`, `tauxhc`) VALUES
	(1, 'GuillaumeFoisy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping data for table gf-logia.comptable: ~2 rows (approximately)
DELETE FROM `comptable`;
INSERT INTO `comptable` (`id`, `description`, `no`, `depot`, `chequemis`, `soldebank`, `montantrepporter`, `diffdebitcredit`, `tpspercu`, `tvqpercu`, `tpspaye`, `tvqpaye`, `revenue`, `compterecevoir`, `compteapayer`, `totaldepense`, `timestamp`, `totalrevenue`, `montamorr`, `total`) VALUES
	(1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(2, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(3, NULL, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping data for table gf-logia.comptavariable: ~0 rows (approximately)
DELETE FROM `comptavariable`;
INSERT INTO `comptavariable` (`id`, `taux_tps`, `taux_tvq`, `nomcomm`, `totaltpspaye`, `totaltvqpaye`, `totaltpsarec`, `totaltvqarec`) VALUES
	(1, NULL, NULL, NULL, '45', NULL, NULL, NULL);

-- Dumping data for table gf-logia.flotte: ~1 rows (approximately)
DELETE FROM `flotte`;
INSERT INTO `flotte` (`id`, `serie`, `annee`, `make`, `model`, `km`, `hrs`, `date`, `ecm`, `imatri`, `fing`, `nexinspq`, `nexmai`, `noment`, `unit`) VALUES
	(1, 'Fake1', '2002', 'Ford', 'F-250', '20000', '2500', '10/10/2022', '111', 'FAKE', NULL, NULL, NULL, 'GuillaumeFoisy', 6);

-- Dumping data for table gf-logia.inventaire: ~1 rows (approximately)
DELETE FROM `inventaire`;
INSERT INTO `inventaire` (`id`, `nopiece`, `description`, `quantiter`, `buyprice1`, `fourn1`, `buyprice2`, `fourn2`, `sellprice`, `nolocation`) VALUES
	(1, '25623', 'Bolt 1/2x2inch  NF grade8 ', 30, 100, 'FAKE1', 105, 'FAKE2', 125, 'a/4 - 1/2');

-- Dumping data for table gf-logia.job: ~0 rows (approximately)
DELETE FROM `job`;

-- Dumping data for table gf-logia.note: ~0 rows (approximately)
DELETE FROM `note`;
INSERT INTO `note` (`id`, `notename`, `wo`, `content`, `serie`) VALUES
	(1, 'test', '1', 'heya this is a test!', 'Fake');

-- Dumping data for table gf-logia.punch: ~0 rows (approximately)
DELETE FROM `punch`;

-- Dumping data for table gf-logia.username: ~1 rows (approximately)
DELETE FROM `username`;
INSERT INTO `username` (`id`, `username`, `nom`, `prenom`, `age`, `tel`, `cell`, `add`, `permis`, `liscence`, `pep`, `saaq`, `date`, `embauche`, `city`, `province`, `pays`, `zip`, `email1`, `email2`, `tauxhr`, `datesortie`) VALUES
	(1, 'gfoisy', 'Foisy', 'Guillaume', '37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Dumping data for table gf-logia.workorder: ~0 rows (approximately)
DELETE FROM `workorder`;
INSERT INTO `workorder` (`id`, `wo`, `user`, `serie`, `annee`, `model`, `unitee`, `km`, `hrs`, `date`, `maintn`, `inspn`, `garantie`, `plate`, `proprioname`, `proprioadd`, `vehadd`, `ecm`, `status`, `make`) VALUES
	(1, '1', 'gfoisy', 'fake', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
