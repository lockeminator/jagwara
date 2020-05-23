/* ===========================================================================
--
-- Projekt:		Kuenstler-Website
-- Funktion:	Erstellung von Datenbank-Tabellen (CREATE)
--				
-- Vorlage:		DD_KueWs_Update_V3.xlsx
-- 				ERM_fuer_Kuenstlerwebsite_V3.png
--
-- Team:		für alle die Final-Version
-- Stand:		06.04.2020
--
-- ======================================================================== */
DROP DATABASE IF EXISTS       `20ss_tid4_kuenstlerdb`;
CREATE DATABASE IF NOT EXISTS `20ss_tid4_kuenstlerdb` 
  DEFAULT CHARACTER SET "utf8";

USE `20ss_tid4_kuenstlerdb`;

CREATE TABLE Kunde (
	Kunden_ID         INT           UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Anrede            ENUM('Herr', 'Frau', 'Divers')  NOT NULL DEFAULT 'Divers',
	Titel             VARCHAR(20)   DEFAULT NULL,
	Vorname           VARCHAR(40)   NOT NULL,
	Nachname          VARCHAR(60)   NOT NULL,
	Strasse           VARCHAR(60)   NOT NULL,  
	PLZ               INT           UNSIGNED NOT NULL,
	Ort               VARCHAR(60)   NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Kuenstler (
	Kunden_ID         INT           UNSIGNED PRIMARY KEY NOT NULL,
	Kuenstlername     VARCHAR(20)   DEFAULT NULL,
    Vita              TEXT          DEFAULT NULL,
	IBAN              VARCHAR(34)   NOT NULL,
	BIC               VARCHAR(11)   NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
) ENGINE = InnoDB;

CREATE TABLE Kunstwerk (
	Kunstwerk_ID      INT           UNSIGNED PRIMARY KEY AUTO_INCREMENT NOT NULL,
	Kunden_ID         INT           UNSIGNED DEFAULT NULL,
	Kuenstler_ID      INT           UNSIGNED NOT NULL,	
	Titel             VARCHAR(120)  NOT NULL,	
	Image             TINYTEXT      NOT NULL,
	Hoehe             SMALLINT      NOT NULL,
	Breite            SMALLINT      NOT NULL,	
	Preis             FLOAT         NOT NULL,
	Kauf_IP           VARCHAR(39)   DEFAULT NULL,
	Kauf_Zeitstempel  DATETIME      DEFAULT NULL,
	Einstell_IP       VARCHAR(39)   NOT NULL,
	Einstell_Zeitstempel TIMESTAMP  NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	Gewicht           SMALLINT      NOT NULL,
	Beschreibung      TEXT          DEFAULT NULL,
	Herstelldatum     VARCHAR(10)   DEFAULT NULL,
	FOREIGN KEY ( Kunden_ID )    REFERENCES Kunde( Kunden_ID ),
	FOREIGN KEY ( Kuenstler_ID ) REFERENCES Kuenstler( Kunden_ID )
) ENGINE = InnoDB;

CREATE TABLE Kontaktart (
	Art_ID            SMALLINT      UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Bezeichnung       VARCHAR(20)   NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Kontakt (
	Art_ID            SMALLINT      UNSIGNED NOT NULL,
	Kunden_ID         INT           UNSIGNED NOT NULL,
	Kontakt_ID        SMALLINT      UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Kontakt           TINYTEXT      NOT NULL,	
	Bemerkung         TEXT          DEFAULT NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
	FOREIGN KEY ( Art_ID )      REFERENCES Kontaktart ( Art_ID )
) ENGINE = InnoDB;

CREATE TABLE Kategorie (
	Kategorie_ID      SMALLINT      UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
	Beschreibung      VARCHAR(2048)	DEFAULT NULL,
	Stilrichtung      VARCHAR(60)	NOT NULL
) ENGINE = InnoDB;

CREATE TABLE Login (
	Kunden_ID         INT           UNSIGNED PRIMARY KEY NOT NULL,
	Login             TINYTEXT      NOT NULL,
	reg_Timestamp	  TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	reg_IP            VARCHAR(39)   NOT NULL,
	Passwort          CHAR(64)	    NOT NULL,
	FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
) ENGINE = InnoDB;

CREATE TABLE eingeordnet (
	Kunstwerk_ID      INT           UNSIGNED NOT NULL,
	Kategorie_ID      SMALLINT      UNSIGNED NOT NULL,
	PRIMARY KEY	(Kunstwerk_ID, Kategorie_ID),	
	FOREIGN KEY (Kunstwerk_ID) REFERENCES Kunstwerk (Kunstwerk_ID),
	FOREIGN KEY (Kategorie_ID) REFERENCES Kategorie (Kategorie_ID)
) ENGINE = InnoDB;