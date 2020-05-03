
/* ================================================================================================
--
-- Projekt:		Kuenstler-Website
-- Funktion:	Erstellung von Datenbank-Tabellen (CREATE)
--					Vergeben von Berechtigungen (GRANT)
--				
-- Vorlage:		DD_KueWs_Update_V3.xlsx
-- 				ERM_fuer_Kuenstlerwebsite_V3.png
--
-- Team:			S. Friedel, C. Vitzke, T. Buhn
-- Abgabe:		05.04.2020
--
-- ================================================================================================ */





# ####################################################################################################
# >>>>>>>>>>>>>>>>>>>>>> Datenbank-Tabellen (CREATE)
# ####################################################################################################

DROP 		DATABASE 	IF EXISTS 		tid4_kuenstlerdb_20ss;
CREATE 	DATABASE 	IF NOT EXISTS 	tid4_kuenstlerdb_20ss DEFAULT 	CHARACTER SET "utf8";

USE tid4_kuenstlerdb_20ss;

CREATE TABLE Kunde (
	Kunden_ID             INT                             UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Anrede                ENUM('Herr', 'Frau', 'Divers')  NOT NULL DEFAULT 'Divers',
	Titel                 VARCHAR(20)                     DEFAULT NULL,
	Vorname               VARCHAR(40)                     NOT NULL,
	Nachname              VARCHAR(60)                     NOT NULL,
	Strasse               TINYTEXT                        NOT NULL,  
	PLZ                   INT              	              UNSIGNED NOT NULL,
	Ort                   TINYTEXT                        NOT NULL
) ENGINE = MyISAM;
-- INNODB - ist eher fuer grosse Systeme
--		 - ist aber nötig, um "on update cascade", "on delete cascade" und "begin transaction" nutzen zu können

CREATE TABLE Kuenstler (
	Kunden_ID             INT                       UNSIGNED PRIMARY KEY NOT NULL,
	Kuenstlername         VARCHAR(20)               DEFAULT NULL,
	IBAN                  VARCHAR(34)               NOT NULL,
	BIC                   VARCHAR(11)               NOT NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
) ENGINE = MyISAM;

CREATE TABLE Kunstwerk (
	Kunden_ID             INT                       UNSIGNED DEFAULT NULL,
	Kuenstler_ID          INT                       UNSIGNED NOT NULL,
	Kunstwerk_ID          INT                       UNSIGNED PRIMARY KEY NOT NULL,	
	Titel                 VARCHAR(120)              NOT NULL,	
	Image                 TINYTEXT                  NOT NULL,
	Hoehe                 SMALLINT                  NOT NULL,
	Breite                SMALLINT                  NOT NULL,	
	Preis                 FLOAT                     NOT NULL,
	Kauf_IP               VARCHAR(39)               DEFAULT NULL,
	Kauf_Zeitstempel      DATETIME                  DEFAULT NULL,
	Einstell_IP           VARCHAR(39)               NOT NULL,	
	Einstell_Zeitstempel  TIMESTAMP                 NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Gewicht               SMALLINT                  NOT NULL,
	Beschreibung          TEXT                      DEFAULT NULL,
	Herstelldatum         VARCHAR(10)               DEFAULT NULL,
	FOREIGN KEY ( Kunden_ID )   	REFERENCES Kunde 		( Kunden_ID ),
	FOREIGN KEY ( Kuenstler_ID )	REFERENCES Kuenstler ( Kunden_ID )
) ENGINE = MyISAM;

CREATE TABLE Kontaktart (
	Art_ID                SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Bezeichnung           VARCHAR(20)              NOT NULL
) ENGINE = MyISAM;

CREATE TABLE Kontakt (
	Art_ID                SMALLINT                 UNSIGNED NOT NULL,
	Kunden_ID             INT                      UNSIGNED NOT NULL,
	Kontakt_ID            SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Kontakt               TINYTEXT                 NOT NULL,	
	Bemerkung             TEXT                     DEFAULT NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
	FOREIGN KEY ( Art_ID )      REFERENCES Kontaktart ( Art_ID )
) ENGINE = MyISAM;

CREATE TABLE Kategorie (
	Kategorie_ID          SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Beschreibung          VARCHAR(2048)	           DEFAULT NULL,
	Stilrichtung          VARCHAR(60)	             NOT NULL
) ENGINE = MyISAM;

CREATE TABLE Login (
	Kunden_ID             INT                      UNSIGNED PRIMARY KEY NOT NULL,
	Login                 TINYTEXT                 NOT NULL,
	reg_Timestamp	       TIMESTAMP                NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	reg_IP                VARCHAR(39)              NOT NULL,
	Passwort              CHAR(64)	               NOT NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
) ENGINE = MyISAM;

CREATE TABLE eingeordnet (
	Kunstwerk_ID          INT                      UNSIGNED NOT NULL,
	Kategorie_ID          SMALLINT                 UNSIGNED NOT NULL,
	PRIMARY KEY	(Kunstwerk_ID, Kategorie_ID),
	
	CONSTRAINT	FrKey_eingeordnet_Kunstwerk_ID 
					FOREIGN KEY (Kunstwerk_ID) REFERENCES Kunstwerk (Kunstwerk_ID) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT	FrKey_eingeordnet_Kategorie_ID 
					FOREIGN KEY (Kategorie_ID) REFERENCES Kategorie (Kategorie_ID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = MyISAM;


# ####################################################################################################
# >>>>>>>>>>>>>>>>>>>>>> Berechtigungen (GRANT)
# ####################################################################################################

DROP USER IF EXISTS Kunst_admin;
 				
CREATE USER IF NOT EXISTS 'Kunst_admin'@'%' 						IDENTIFIED BY 'B0SSM4N$J4;&0N';
CREATE USER IF NOT EXISTS 'Kunst_admin'@'localhost' 		IDENTIFIED BY 'B0SSM4N';
GRANT ALL 							ON tid4_kuenstlerdb_20ss.* 				TO Kunst_admin@'%' 				WITH GRANT OPTION;
GRANT ALL 							ON tid4_kuenstlerdb_20ss.* 				TO Kunst_admin@'localhost' 		WITH GRANT OPTION;

DROP USER IF EXISTS Kunst_GAST;
CREATE USER IF NOT EXISTS 'Kunst_Gast'@'%' 					IDENTIFIED BY 'gast';
CREATE USER IF NOT EXISTS 'Kunst_Gast'@'localhost' 		IDENTIFIED BY 'gast';

GRANT SELECT (Kunden_ID, Kuenstlername) ON tid4_kuenstlerdb_20ss.Kuenstler
      TO Kunst_Gast@'%', Kunst_Gast@'localhost';

GRANT SELECT (Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung, Herstelldatum) ON tid4_kuenstlerdb_20ss.Kunstwerk
      TO Kunst_Gast@'%', Kunst_Gast@'localhost';

GRANT SELECT ON tid4_kuenstlerdb_20ss.Kategorie
      TO Kunst_Gast@'%', Kunst_Gast@'localhost';

GRANT SELECT ON tid4_kuenstlerdb_20ss.eingeordnet
      TO Kunst_Gast@'%', Kunst_Gast@'localhost';



DROP USER IF EXISTS Kunst_Kunde;
CREATE USER IF NOT EXISTS 'Kunst_Kunde'@'%' 						IDENTIFIED BY '$$zahlender$$Kunde$$';
CREATE USER IF NOT EXISTS 'Kunst_Kunde'@'localhost' 		IDENTIFIED BY '$$zahlender§§Kunde$$';

GRANT SELECT (Kunden_ID, Kuenstlername) ON tid4_kuenstlerdb_20ss.Kuenstler
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT (Kunden_ID, Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung, Herstelldatum) ON tid4_kuenstlerdb_20ss.Kunstwerk
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT, INSERT, DELETE ON tid4_kuenstlerdb_20ss.Kontakt
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT UPDATE (Art_ID, Kontakt, Bemerkung ) ON tid4_kuenstlerdb_20ss.Kontakt
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kontaktart
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT, UPDATE ON tid4_kuenstlerdb_20ss.Kunde
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kategorie
			TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.eingeordnet
      TO Kunst_Kunde@'%', Kunst_Kunde@'localhost';


DROP USER IF EXISTS Kunst_Kunstler;
CREATE USER IF NOT EXISTS 'Kunst_Kuenstler'@'%' 						IDENTIFIED BY '$$zahlender$$Kunde$$';
CREATE USER IF NOT EXISTS 'Kunst_Kuenstler'@'localhost' 		IDENTIFIED BY '$$zahlender§§Kunde$$';

GRANT SELECT ON tid4_kuenstlerdb_20ss.Kuenstler
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT UPDATE (Kuenstlername, IBAN, BIC) ON tid4_kuenstlerdb_20ss.Kuenstler
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT, INSERT, DELETE ON tid4_kuenstlerdb_20ss.Kunstwerk
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT UPDATE ( Titel, Image, Hoehe, Breite, Preis, Gewicht, Beschreibung, Herstelldatum) ON tid4_kuenstlerdb_20ss.Kunstwerk
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT, INSERT, DELETE ON tid4_kuenstlerdb_20ss.Kontakt
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT UPDATE (Art_ID, Kontakt, Bemerkung ) ON tid4_kuenstlerdb_20ss.Kontakt
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT ON tid4_kuenstlerdb_20ss.Kontaktart
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT, UPDATE ON tid4_kuenstlerdb_20ss.Kunde
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT ON tid4_kuenstlerdb_20ss.Kategorie
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';

GRANT SELECT ON tid4_kuenstlerdb_20ss.eingeordnet
      TO Kunst_Kuenstler@'%', Kunst_Kuenstler@'localhost';


DROP USER IF EXISTS Kunst_Login;
CREATE USER IF NOT EXISTS 'Kunst_Login'@'%' 						IDENTIFIED BY '$$zahlender$$Kunde$$';
CREATE USER IF NOT EXISTS 'Kunst_Login'@'localhost' 		IDENTIFIED BY '$$zahlender§§Kunde$$';

GRANT INSERT ON tid4_kuenstlerdb_20ss.Kunde
      TO Kunst_Login@'%', Kunst_Login@'localhost';

GRANT SELECT, INSERT ON tid4_kuenstlerdb_20ss.Login
      TO Kunst_Login@'%', Kunst_Login@'localhost';

GRANT UPDATE (Login, Passwort) ON tid4_kuenstlerdb_20ss.Login
      TO Kunst_Login@'%', Kunst_Login@'localhost';





