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

-- Dumping data for table public.job: -1 rows
DELETE FROM "job";
/*!40000 ALTER TABLE "job" DISABLE KEYS */;
INSERT INTO "job" ("id", "username", "jobname", "jobinfo", "jobrepport", "punchin", "punchout", "wo") VALUES
	(1, 'gfoisy', 'Maintenance', 'Maintenance:  changement huile + changement filtreur hydaulique', '', NULL, NULL, 1),
	(1, 'gfoisy', 'Maintenance', 'Maintenance:  changement huile + changement filtreur hydaulique', ' (gfoisy) testing', NULL, NULL, 1),
	(1, 'gfoisy', 'Maintenance', 'Maintenance:  changement huile + changement filtreur hydaulique', ' (gfoisy)dddddddddddddddddddddddd', NULL, NULL, 1),
	(2, NULL, 'asd', 'asd', NULL, NULL, NULL, 2),
	(1, 'elie', 'Maintenance', '', ' (elie) This is a test :D', NULL, NULL, 1),
	(1, 'charle', 'Maintenance', '', ' (charle) gggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggggg', NULL, NULL, 1);
/*!40000 ALTER TABLE "job" ENABLE KEYS */;

-- Dumping data for table public.note: -1 rows
DELETE FROM "note";
/*!40000 ALTER TABLE "note" DISABLE KEYS */;
INSERT INTO "note" ("id", "notename", "wo", "content", "serie") VALUES
	(1, 'test', 1, 'heya this is a test!!!', NULL);
/*!40000 ALTER TABLE "note" ENABLE KEYS */;

-- Dumping data for table public.punch: 11 rows
DELETE FROM "punch";
/*!40000 ALTER TABLE "punch" DISABLE KEYS */;
INSERT INTO "punch" ("id", "wo", "username", "punchin", "punchout", "pstatus", "jobname") VALUES
	('1', '1', 'gfoisy', '15/01/2024  03:05:42', '15/01/2024  03:09:15', '2', 'Maintenance'),
	('2', '2', 'gfoisy', '15/01/2024  03:09:39', '15/01/2024  03:09:48', '2', 'hgkjuj'),
	('2', '2', 'gfoisy', '15/01/2024  03:11:23', '15/01/2024  03:11:36', '2', 'hgkjuj'),
	('2', '2', 'elie', '15/01/2024  03:12:06', '15/01/2024  03:12:14', '2', 'hgkjuj'),
	('2', '2', 'charle', '15/01/2024  03:21:03', '15/01/2024  03:21:14', '2', 'hgkjuj'),
	('2', '2', 'charle', '15/01/2024  03:23:47', '15/01/2024  03:23:54', '2', 'hgkjuj'),
	('2', '2', 'charle', '15/01/2024  03:26:38', '15/01/2024  03:26:42', '2', 'hgkjuj'),
	('2', '2', 'elie', '15/01/2024  03:27:28', '15/01/2024  03:27:32', '2', 'hgkjuj'),
	('2', '2', 'charle', '15/01/2024  03:28:56', '15/01/2024  03:29:00', '2', 'hgkjuj'),
	('2', '2', 'gfoisy', '15/01/2024  03:31:04', '15/01/2024  03:31:08', '2', 'hgkjuj'),
	('1', '1', 'gfoisy', '15/01/2024  03:32:22', '15/01/2024  03:32:30', '2', 'Maintenance'),
	('1', '1', 'elie', '15/01/2024  03:56:47', '15/01/2024  03:56:59', '2', 'Maintenance'),
	('1', '1', 'charle', '15/01/2024  04:24:59', '15/01/2024  04:25:09', '2', 'Maintenance');
/*!40000 ALTER TABLE "punch" ENABLE KEYS */;

-- Dumping data for table public.username: -1 rows
DELETE FROM "username";
/*!40000 ALTER TABLE "username" DISABLE KEYS */;
INSERT INTO "username" ("id", "username") VALUES
	(1, 'gfoisy'),
	(2, 'elie'),
	(3, 'charle');
/*!40000 ALTER TABLE "username" ENABLE KEYS */;

-- Dumping data for table public.workorder: -1 rows
DELETE FROM "workorder";
/*!40000 ALTER TABLE "workorder" DISABLE KEYS */;
INSERT INTO "workorder" ("id", "wo", "user", "serie", "annee", "model", "unitee", "km", "hrs", "date", "maintn", "inspn", "garantie", "plate", "proprioname", "proprioadd", "vehadd", "ecm") VALUES
	(1, '1', 'GFoisy', 'test', '2002', 'ford', '5', '25000', '250', NULL, NULL, NULL, NULL, 'test', 'gui', '85 28', 'rue contrefait', '111'),
	(1, '2', 'GFoisy', 'test', '2005', 'kenworth', '10', '300000', '3500', NULL, NULL, NULL, NULL, 'test', 'elie', '171 27', 'rue cochon', '0000');
/*!40000 ALTER TABLE "workorder" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
