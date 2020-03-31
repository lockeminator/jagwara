# Erstellen der Küstler Daten Bank
# Sebatian Friedel, Christian Vitzke, Tobias Buhn


DROP DATABASE IF EXISTS tid4_kuenstlerdb_20ss;
CREATE DATABASE IF NOT EXISTS tid4_kuenstlerdb_20ss
DEFAULT CHARACTER SET "utf8";

USE tid4_kuenstlerdb_20ss;

CREATE TABLE Kunde (
Kunden_ID       BIGINT                          UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Anrede          ENUM('Herr', 'Frau', 'Divers')  NOT NULL DEFAULT 'Divers',
Titel           VARCHAR(20)                     DEFAULT NULL,
Vorname         VARCHAR(40)                     NOT NULL,
Nachname        VARCHAR(60)                     NOT NULL,
Strasse         VARCHAR(60)                     NOT NULL,  
PLZ             INT                             NOT NULL,
Ort             VARCHAR(60)                     NOT NULL
);


CREATE TABLE Kuenstler (
Kunden_ID             BIGINT                    UNSIGNED PRIMARY KEY NOT NULL,
Kuenstlername         VARCHAR(20)               DEFAULT NULL,
IBAN                  VARCHAR(34)               NOT NULL,
BIC                   VARCHAR(11)               NOT NULL,
Kontoauszug           VARCHAR(60)               DEFAULT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
);

CREATE TABLE Kunstwerk (
Kunden_ID             BIGINT                    UNSIGNED NOT NULL,
#Kuenstler_ID          INT                       NOT NULL 
Kunstwerk_ID          BIGINT                    UNSIGNED PRIMARY KEY NOT NULL,
Titel                 VARCHAR(120)              NOT NULL,
Image                 VARCHAR(120)              NOT NULL,
Hoehe                 INT                       NOT NULL,
Breite                INT                       NOT NULL,
Preis                 VARCHAR(20)               NOT NULL,
Kauf_IP               VARCHAR(16)               DEFAULT NULL,
Kauf_Zeitstempel      DATETIME                  DEFAULT NULL,
Einstell_IP           VARCHAR(16)               NOT NULL,
Einstell_Zeitstempel  TIMESTAMP                 NOT NULL DEFAULT CURRENT_TIMESTAMP(),
Gewicht               VARCHAR(20)               NOT NULL,
Beschreibung          VARCHAR(255)              DEFAULT NULL,
Herstelldatum         VARCHAR(11)               DEFAULT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
);

CREATE TABLE Kontaktart (
Art_ID          INT                             UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Bezeichnung     VARCHAR(60)                     NOT NULL
);

CREATE TABLE Kontakt (
Art_ID          INT                             UNSIGNED NOT NULL,
Kunden_ID       BIGINT                          UNSIGNED NOT NULL,
Kontakt_ID      INT                             UNSIGNED PRIMARY KEY NOT NULL,
Kontakt         VARCHAR(255)                    NOT NULL,
Bemerkung       VARCHAR(255)                    DEFAULT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
FOREIGN KEY ( Art_ID )      REFERENCES Kontaktart ( Art_ID )
);

CREATE TABLE Kategorie (
Kategorie_ID    SMALLINT                             UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Beschreibung    VARCHAR(2000)	                  DEFAULT NULL,
Stilrichtung    VARCHAR(30)	                    NOT NULL
);

CREATE TABLE Login (
Kunden_ID       BIGINT                          UNSIGNED PRIMARY KEY NOT NULL,
Login           VARCHAR(20)                     NOT NULL,
reg_Timestamp	  TIMESTAMP                       NOT NULL DEFAULT CURRENT_TIMESTAMP,
#reg_Timestamp   VARCHAR(40)                     NOT NULL,
reg_IP          VARCHAR(16)                     NOT NULL,
Passwort        VARCHAR(200)	                  NOT NULL,
FOREIGN KEY (Kunden_ID)     REFERENCES Kunde (Kunden_ID)
);

CREATE TABLE eingeordnet (
Kunstwerk_ID          BIGINT                    UNSIGNED NOT NULL,
Kategorie_ID          SMALLINT                       UNSIGNED NOT NULL,
PRIMARY KEY	(Kunstwerk_ID, Kategorie_ID),	
	CONSTRAINT	FrKey_eingeordnet_Kunstwerk_ID 
		FOREIGN KEY (Kunstwerk_ID) REFERENCES Kunstwerk (Kunstwerk_ID),
	CONSTRAINT	FrKey_eingeordnet_Kategorie_ID 
		FOREIGN KEY (Kategorie_ID) REFERENCES Kategorie (Kategorie_ID)
);

