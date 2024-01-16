-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               PostgreSQL 16.1, compiled by Visual C++ build 1937, 64-bit
-- Server OS:                    
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping data for table public.job: 1 rows
DELETE FROM "job";
/*!40000 ALTER TABLE "job" DISABLE KEYS */;
INSERT INTO "job" ("id", "username", "jobname", "jobinfo", "jobrepport", "punchin", "punchout", "wo", "inpectionsheet") VALUES
	(1, 'Garage', 'fghfgh', 'fghfgh', NULL, NULL, NULL, 1, NULL),
	(1, 'Garage', 'ytutyuy', 'tyutyu', NULL, NULL, NULL, 1, NULL),
	(1, 'gfoisy', 'fghfgh', '', '(gfoisy) : tyutyutyu', NULL, NULL, 1, NULL),
	(1, 'gfoisy', 'fghfgh', '', '(gfoisy) : heya this is a test', NULL, NULL, 1, NULL),
	(2, 'Garage', 'hgjhgjhgjhgj', 'ghjhgjfghj', NULL, NULL, NULL, 2, NULL);
/*!40000 ALTER TABLE "job" ENABLE KEYS */;

-- Dumping data for table public.note: -1 rows
DELETE FROM "note";
/*!40000 ALTER TABLE "note" DISABLE KEYS */;
INSERT INTO "note" ("id", "notename", "wo", "content", "serie") VALUES
	(1, 'test', 1, 'heya this is a test!!!', NULL);
/*!40000 ALTER TABLE "note" ENABLE KEYS */;

-- Dumping data for table public.punch: 0 rows
DELETE FROM "punch";
/*!40000 ALTER TABLE "punch" DISABLE KEYS */;
/*!40000 ALTER TABLE "punch" ENABLE KEYS */;

-- Dumping data for table public.username: 0 rows
DELETE FROM "username";
/*!40000 ALTER TABLE "username" DISABLE KEYS */;
INSERT INTO "username" ("username", "nom", "prenom") VALUES
	('GFoisy', 'Foisy', 'Guillaume');
/*!40000 ALTER TABLE "username" ENABLE KEYS */;

-- Dumping data for table public.workorder: -1 rows
DELETE FROM "workorder";
/*!40000 ALTER TABLE "workorder" DISABLE KEYS */;
INSERT INTO "workorder" ("id", "wo", "user", "serie", "annee", "model", "unitee", "km", "hrs", "date", "maintn", "inspn", "garantie", "plate", "proprioname", "proprioadd", "vehadd", "ecm") VALUES
	(1, '1', 'GFoisy', 'test', '2002', 'ford', '5', '25000', '250', NULL, NULL, NULL, NULL, 'test', 'gui', '85 28', 'rue contrefait', '111'),
	(1, '2', 'GFoisy', 'test1', '2005', 'kenworth', '10', '300000', '3500', NULL, NULL, NULL, NULL, 'test', 'elie', '171 27', 'rue cochon', '0000');
/*!40000 ALTER TABLE "workorder" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
