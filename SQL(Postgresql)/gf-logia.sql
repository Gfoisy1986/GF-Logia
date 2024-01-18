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

-- Dumping data for table public.client: -1 rows
DELETE FROM "client";
/*!40000 ALTER TABLE "client" DISABLE KEYS */;
/*!40000 ALTER TABLE "client" ENABLE KEYS */;

-- Dumping data for table public.job: 1 rows
DELETE FROM "job";
/*!40000 ALTER TABLE "job" DISABLE KEYS */;
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

-- Dumping data for table public.username: -1 rows
DELETE FROM "username";
/*!40000 ALTER TABLE "username" DISABLE KEYS */;
INSERT INTO "username" ("username", "nom", "prenom", "age", "tel", "cell", "add", "permis", "liscence", "pep", "saaq", "date", "embauche", "city", "province", "pays", "zip", "email1", "email2") VALUES
	('GFoisy', 'Foisy', 'Guillaume', '37', '455-455-4545', '544-455-4545', '80 25 Rue Timonier', 'test', 'test', 'test', 'test', '2024-01-16 16:36:24', '2024-01-16', 'Lune', 'QC', 'CANADA', 'TEST', 'Test@test.com', 'Test2@test.com');
/*!40000 ALTER TABLE "username" ENABLE KEYS */;

-- Dumping data for table public.workorder: -1 rows
DELETE FROM "workorder";
/*!40000 ALTER TABLE "workorder" DISABLE KEYS */;
INSERT INTO "workorder" ("id", "wo", "user", "serie", "annee", "model", "unitee", "km", "hrs", "date", "maintn", "inspn", "garantie", "plate", "proprioname", "proprioadd", "vehadd", "ecm", "status") VALUES
	(1, '1', 'GFoisy', 'test', '2002', 'ford', '5', '25000', '250', NULL, NULL, NULL, NULL, 'test', 'gui', '85 28', 'rue contrefait', '111', 1);
/*!40000 ALTER TABLE "workorder" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
