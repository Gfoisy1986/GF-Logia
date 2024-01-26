# GF-Logia
Application de gestion d'atelier de mécanique.

Changement de nom du logiciel Meca_Logia vers GF-Logia.
Changement base de donnée pour le logiciel.

Application en dévelopment!

MySQL comme base de donnée.

À Venir!

Service hébergement base de donnée MySQL.

Service de Compilation du logiciel avec vos information de connexion base de donné personel ou hébergé.

Version prevue pour la release: Windows_X64 et Linux_X64 (En *V_1.0*) 
- aucune date n'est déterminer pour la premiere release!
- une version (RPI) est envisagé!

INSTALL:

- Pour installer le logiciel vous devez éditer les premieres lignes du code source "main.pb" et modifier la ligne de connection MySQL pour refléter les information de connexion a votre base de donné.

   : Modification de la ligne # "5".
  
-   If OpenDatabase(1, "host=localhost port=3306 dbname=gf-logia", "root", "")

-   host= ip or addresse.
-   
-   port= port de la base de donnée.
-   
-   dbname=  nom de la base de donnée.
-   
-   Where "root"  > entré votre username de la base de donnée.
-   
-   Where ""  > entré votre mot de passe de la base de donnée.


- Ensuite vous devez Compiler le programme avec Purebasic(V6.04) LTS, la version gratuite ne peu compiler le programme car il ya trop de ligne de code.

- Vous devez parametrer les information du compilleur avant de le construire.

- Le Code Source est Cross-Plateforme Windows 11(.exe) et Linux(.sh).

- Vous devez importer à partir de SQL(MySQL) la base de donnée.



- Version Admin  = Cadre de l'entreprise.
- Version User   = Mécanicien.

  
Guillaume Foisy
