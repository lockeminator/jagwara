-- Erstellen der Küstler Daten Bank

-- Sebatian Friedel, Christian Vitzke, Tobias Buhn

-- diese Datenbank ist enstanden aufgrund des Data-Dictionary (DD_KueWs_Update_V3.xlsx)

DROP DATABASE IF EXISTS tid4_kuenstlerdb_20ss;
CREATE DATABASE IF NOT EXISTS tid4_kuenstlerdb_20ss
DEFAULT CHARACTER SET "utf8";

START TRANSACTION;

USE tid4_kuenstlerdb_20ss;

CREATE TABLE Kunde (
Kunden_ID             INT                          UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Anrede                ENUM('Herr', 'Frau', 'Divers')  NOT NULL DEFAULT 'Divers',
Titel                 VARCHAR(20)                     DEFAULT NULL,
Vorname               VARCHAR(40)                     NOT NULL,
Nachname              VARCHAR(60)                     NOT NULL,
Strasse               TINYTEXT                        NOT NULL,  
PLZ                   SMALLINT                             NOT NULL,
Ort                   TINYTEXT                        NOT NULL
);

CREATE TABLE Kuenstler (
Kunden_ID             INT                    UNSIGNED PRIMARY KEY NOT NULL,
Kuenstlername         VARCHAR(20)               DEFAULT NULL,
IBAN                  VARCHAR(34)               NOT NULL,
BIC                   VARCHAR(11)               NOT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
);

CREATE TABLE Kunstwerk (
Kunden_ID             INT                       UNSIGNED NOT NULL,
Kuenstler_ID          INT                       UNSIGNED NOT NULL,
Kunstwerk_ID          INT                       UNSIGNED PRIMARY KEY NOT NULL,
Titel                 VARCHAR(120)              NOT NULL,
Image                 TINYTEXT                  NOT NULL,
Hoehe                 SMALLINT                  NOT NULL,
Breite                SMALLINT                  NOT NULL,
Preis                 INT                       NOT NULL,
Kauf_IP               VARCHAR(22)               DEFAULT NULL,
Kauf_Zeitstempel      DATETIME                  DEFAULT NULL,
Einstell_IP           VARCHAR(22)               NOT NULL,
Einstell_Zeitstempel  TIMESTAMP                 NOT NULL DEFAULT CURRENT_TIMESTAMP(),
Gewicht               SMALLINT                  NOT NULL,
Beschreibung          TEXT                      DEFAULT NULL,
Herstelldatum         VARCHAR(10)               DEFAULT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
FOREIGN KEY ( Kuenstler_ID )   REFERENCES Kuenstler ( Kunden_ID )
);

CREATE TABLE Kontaktart (
Art_ID                SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Bezeichnung           TEXT                     NOT NULL
);

CREATE TABLE Kontakt (
Art_ID                SMALLINT                 UNSIGNED NOT NULL,
Kunden_ID             INT                      UNSIGNED NOT NULL,
Kontakt_ID            SMALLINT                 UNSIGNED PRIMARY KEY NOT NULL,
Kontakt               TINYTEXT                 NOT NULL,
Bemerkung             TEXT                     DEFAULT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
FOREIGN KEY ( Art_ID )      REFERENCES Kontaktart ( Art_ID )
);

CREATE TABLE Kategorie (
Kategorie_ID          SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Beschreibung          VARCHAR(2048)	           DEFAULT NULL,
Stilrichtung          VARCHAR(60)	             NOT NULL
);

CREATE TABLE Login (
Kunden_ID             INT                      UNSIGNED PRIMARY KEY NOT NULL,
Login                 TINYTEXT                 NOT NULL,
reg_Timestamp	        TIMESTAMP                NOT NULL DEFAULT CURRENT_TIMESTAMP,
reg_IP                VARCHAR(22)              NOT NULL,
Passwort              CHAR(64)	               NOT NULL,
FOREIGN KEY (Kunden_ID)     REFERENCES Kunde (Kunden_ID)
);

CREATE TABLE eingeordnet (
Kunstwerk_ID          INT                      UNSIGNED NOT NULL,
Kategorie_ID          SMALLINT                 UNSIGNED NOT NULL,
PRIMARY KEY	(Kunstwerk_ID, Kategorie_ID),	
	CONSTRAINT	FrKey_eingeordnet_Kunstwerk_ID 
		FOREIGN KEY (Kunstwerk_ID) REFERENCES Kunstwerk (Kunstwerk_ID),
	CONSTRAINT	FrKey_eingeordnet_Kategorie_ID 
		FOREIGN KEY (Kategorie_ID) REFERENCES Kategorie (Kategorie_ID)
);

-- DROP USER Kunstadmin;
GRANT USAGE ON tid4_kuenstlerdb_20ss.* TO Kunstadmin@'%' IDENTIFIED BY 'B0SSM4N$J4;&0N';
GRANT USAGE ON tid4_kuenstlerdb_20ss.* TO Kunstadmin@'localhost' IDENTIFIED BY 'B0SSM4N';
GRANT ALL ON tid4_kuenstlerdb_20ss.* TO Kunstadmin@'%' WITH GRANT OPTION;
GRANT ALL ON tid4_kuenstlerdb_20ss.* TO Kunstadmin@'localhost' WITH GRANT OPTION;




-- DROP USER KunstGAST;
GRANT USAGE ON tid4_kuenstlerdb_20ss.* TO KunstGast@'%' IDENTIFIED BY 'gast';
GRANT USAGE ON tid4_kuenstlerdb_20ss.* TO KunstGast@'localhost' IDENTIFIED BY 'gast';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kategorie                     TO KunstGast@'%';
GRANT SELECT ON tid4_kuenstlerdb_20ss.eingeordnet                   TO KunstGast@'%';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kuenstler                     TO KunstGast@'%';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kunstwerk                     TO KunstGast@'%';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kategorie                     TO KunstGast@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.eingeordnet                   TO KunstGast@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kuenstler                     TO KunstGast@'localhost';
GRANT SELECT ON tid4_kuenstlerdb_20ss.Kunstwerk                     TO KunstGast@'localhost';


-- DROP USER KunstKUNDE;
GRANT USAGE ON *.* TO KunstKunde@'%' IDENTIFIED BY '$4zahlenderKunde$4';
GRANT USAGE ON *.* TO KunstKunde@'localhost' IDENTIFIED BY '$4zahlenderKunde$4';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kuenstler             TO KunstGast@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kunstwerk             TO KunstGast@'%';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kontakt               TO KunstGast@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kontaktart            TO KunstGast@'%';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstGast@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kategorie             TO KunstGast@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.eingeordnet           TO KunstGast@'%';

GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kuenstler             TO KunstGast@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kunstwerk             TO KunstGast@'localhost';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kontakt               TO KunstGast@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kontaktart            TO KunstGast@'localhost';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstGast@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kategorie             TO KunstGast@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.eingeordnet           TO KunstGast@'localhost';


-- DROP USER KunstKuenster;
GRANT USAGE ON *.* TO KunstKuenstler@'%' IDENTIFIED BY '$4zahlender$4Kuenstler$4';
GRANT USAGE ON *.* TO KunstKuenstler@'localhost' IDENTIFIED BY '$4zahlender$4Kuenstler$4';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kuenstler             TO KunstKuenstler@'%';
GRANT ALL             ON tid4_kuenstlerdb_20ss.Kunstwerk             TO KunstKuenstler@'%';
GRANT ALL             ON tid4_kuenstlerdb_20ss.Kontakt               TO KunstKuenstler@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kontaktart            TO KunstKuenstler@'%';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstKuenstler@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kategorie             TO KunstKuenstler@'%';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.eingeordnet           TO KunstKuenstler@'%';

GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kuenstler             TO KunstKuenstler@'localhost';
GRANT ALL             ON tid4_kuenstlerdb_20ss.Kunstwerk             TO KunstKuenstler@'localhost';
GRANT ALL             ON tid4_kuenstlerdb_20ss.Kontakt               TO KunstKuenstler@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kontaktart            TO KunstKuenstler@'localhost';
GRANT SELECT, UPDATE  ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstKuenstler@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.Kategorie             TO KunstKuenstler@'localhost';
GRANT SELECT          ON tid4_kuenstlerdb_20ss.eingeordnet           TO KunstKuenstler@'localhost';

-- DROP USER KunstLOGIN;
GRANT USAGE ON *.* TO KunstLogin@'%' IDENTIFIED BY 'neuer$4zahlender$4Kunde$4';
GRANT USAGE ON *.* TO KunstLogin@'localhost' IDENTIFIED BY 'neuer$4zahlender$4Kunde$4';
GRANT INSERT          ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstLogin@'%';
GRANT SELECT, UPDATE, INSERT ON tid4_kuenstlerdb_20ss.Login          TO KunstLogin@'%';

GRANT INSERT          ON tid4_kuenstlerdb_20ss.Kunde                 TO KunstLogin@'localhost';
GRANT SELECT, UPDATE, INSERT ON tid4_kuenstlerdb_20ss.Login          TO KunstLogin@'localhost';


COMMIT;