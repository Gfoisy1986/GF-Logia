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

-- Dumping data for table public.client: 1 rows
DELETE FROM "client";
/*!40000 ALTER TABLE "client" DISABLE KEYS */;
INSERT INTO "client" ("nomsent", "nomres", "emailp", "emailres", "faxres", "faxent", "_prenoms", "_noms", "cellp", "cellresp", "telent", "telresp", "datesc", "addent", "villeent", "provent", "paysent", "zipent", "addp", "villep", "provp", "paysp", "zipp", "tauxhc") VALUES
	('gfoisy', 'drg', 'dg', 'dg', 'dg', 'dg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE "client" ENABLE KEYS */;

-- Dumping data for table public.comptable: 2 rows
DELETE FROM "comptable";
/*!40000 ALTER TABLE "comptable" DISABLE KEYS */;
INSERT INTO "comptable" ("description", "no", "depot", "chequemis", "soldebank", "montantrepporter", "diffdebitcredit", "tpspercu", "tvqpercu", "tpspaye", "tvqpaye", "revenue", "compterecevoir", "compteapayer", "totaldepense", "timestamp", "totalrevenue") VALUES
	('depot GG', 1, 600, NULL, 600, 522, 0, 26, 52, NULL, NULL, 522, 600, NULL, NULL, '2024-01-25 10:09:43-05', 600),
	('emission cheque GG', 2, NULL, 500, 100, 435, 0, NULL, NULL, 22, 43, 0, 0, 500, 435, '2024-01-25 10:09:45-05', -500);
/*!40000 ALTER TABLE "comptable" ENABLE KEYS */;

-- Dumping data for table public.comptavariable: -1 rows
DELETE FROM "comptavariable";
/*!40000 ALTER TABLE "comptavariable" DISABLE KEYS */;
INSERT INTO "comptavariable" ("taux_tps", "taux_tvq", "nomcomm") VALUES
	(5, 10, 'Gui');
/*!40000 ALTER TABLE "comptavariable" ENABLE KEYS */;

-- Dumping data for table public.flotte: -1 rows
DELETE FROM "flotte";
/*!40000 ALTER TABLE "flotte" DISABLE KEYS */;
INSERT INTO "flotte" ("serie", "annee", "make", "model", "km", "hrs", "date", "ecm", "imatri", "fing", "nexinspq", "nexmai", "noment", "unit") VALUES
	('Fake', 'Fake', 'gmc', 'canyon', '', '', '', '', '', '', '', '', 'efoisy', '10');
/*!40000 ALTER TABLE "flotte" ENABLE KEYS */;

-- Dumping data for table public.job: 1 rows
DELETE FROM "job";
/*!40000 ALTER TABLE "job" DISABLE KEYS */;
INSERT INTO "job" ("id", "username", "jobname", "jobinfo", "jobrepport", "punchin", "punchout", "wo", "inpectionsheet") VALUES
	(1, 'Garage', 'PM 500 Heures', 'Maintenance 500 heure unit #5', NULL, NULL, NULL, 1, NULL),
	(1, '', 'Liste des travaux', '', '() : PM Done', NULL, NULL, 1, NULL),
	(1, 'GFoisy', 'PM 500 Heures', '', '(GFoisy) : fdg', NULL, NULL, 1, NULL);
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
INSERT INTO "punch" ("id", "wo", "username", "punchin", "punchout", "pstatus", "jobname") VALUES
	('1', '1', 'GFoisy', '19/01/2024  17:05:38', '19/01/2024  17:21:20', '2', 'PM 500 Heures');
/*!40000 ALTER TABLE "punch" ENABLE KEYS */;

-- Dumping data for table public.username: 0 rows
DELETE FROM "username";
/*!40000 ALTER TABLE "username" DISABLE KEYS */;
INSERT INTO "username" ("username", "nom", "prenom", "age", "tel", "cell", "add", "permis", "liscence", "pep", "saaq", "date", "embauche", "city", "province", "pays", "zip", "email1", "email2", "tauxhr") VALUES
	('gfoisy', 'Foisy', 'Guillaume', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE "username" ENABLE KEYS */;

-- Dumping data for table public.workorder: 2 rows
DELETE FROM "workorder";
/*!40000 ALTER TABLE "workorder" DISABLE KEYS */;
INSERT INTO "workorder" ("id", "wo", "user", "serie", "annee", "model", "unitee", "km", "hrs", "date", "maintn", "inspn", "garantie", "plate", "proprioname", "proprioadd", "vehadd", "ecm", "status") VALUES
	(1, '2', 'GFoisy', 'test', '2002', 'ford', '5', '25000', '250', NULL, NULL, NULL, NULL, 'test', 'gui', '85 28', 'rue contrefait', '111', 1),
	(1, '1', 'GFoisy', 'test', '2002', 'ford', '5', '25000', '250', NULL, NULL, NULL, NULL, 'test', 'gui', '85 28', 'rue contrefait', '111', 2);
/*!40000 ALTER TABLE "workorder" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
