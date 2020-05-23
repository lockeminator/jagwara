-- Die INSERT der Gruppe: Ernesto Cabrera Garcia, Jonas Wünsch, Stefan Riedl.

-- Kunde1
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

ALTER TABLE Kunde AUTO_INCREMENT=3001;
ALTER TABLE Kunstwerk AUTO_INCREMENT=3001;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Herr', 'Prof. Dr.', 'Paul', 'Coffey', 'Hauptstrasse 25', '85579', 'Neubiberg');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'KalterCoffey56', '78.12.345.203', SHA2('Passwort1234', 256));

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 3, "paul.coffey@gmail.com", NULL);

COMMIT;


-- Kunde2
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Frau', 'Dr.', 'Mona', 'Coffin', 'Genisenaustrasse 66', '10961', 'Berlin');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'mcMona', '99.123.345.203', SHA2('Passwort1234', 256));
			
INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 3, "monacoffin@gmail.com", NULL);
					
COMMIT;


-- Kunde 3
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Herr', NULL, 'Jarri', 'Kurri', 'Zum Michel 7', '20455', 'Hamburg');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'FlotterFlitzer*85', '77.22.705.244', SHA2('NAMbuzzy', 256));

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 2, "0151 12309854", "Jeden Tag ab 12 Uhr erreichbar.");

COMMIT;


-- Kuenstler1
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Frau', NULL, 'Maren', 'Valent', 'F4 12', '68159', 'Mannheim');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'myVALENT', '73.90.123.234', SHA2('Mannheim@Favorite!', 256));

INSERT INTO Kuenstler	(Kunden_ID, Kuenstlername, IBAN, BIC)
			VALUES 		(@Kunden_ID, '*Maren Valenti*', 'DE21200500000123456000', NULL);

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 1, "0621 86750830", "Zwischen 8 Uhr und 12 Uhr.");
					

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "MANNHEIM TO GO", 'Mannheim_to_go.jpg', '1000', '500', '499,99', '78.01.665.211', '5000', "Ein Tribut an die schönste Stadt der Bundesrepublik, Mannheim!", "10.10.1999");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 118);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum, Kauf_IP, Kauf_Zeitstempel)
			VALUES		(@Kunden_ID, @Kunden_ID, "Adler Mannheim", 'Adler_Mannheim.jpg', '1000', '500', '799,99', '74.01.665.311', '4500', "Der Beste Verein!", "10.02.1999", '78.21.665.989', "2020-08-20");	

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 118);
			
COMMIT;


-- Kuenstler2
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Herr', 'Dr.', 'Glenn', 'Anderson', 'Grünbergerstrasse 89c', '10361', 'Berlin');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'Bernsteinfarben', '77.13.916.453', SHA2('!@#MalenNachZahlen', 256));

INSERT INTO Kuenstler	(Kunden_ID, Kuenstlername, IBAN, BIC)
			VALUES 		(@Kunden_ID, 'MacGlenderson', 'DE76790200760326329540', NULL);

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 2, "0173 45691913", NULL);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "Whiskyflaschen", 'Whiskyflaschen.jpg', '2500', '2000', '2499,99', '77.33.246.100', '500', "Die farbliche Komposition erinnert an die Farbe des Whiskys, man schmeckt förmlich den elden Tropfen auf der Zunge", "02.04.2020");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 106);

INSERT INTO	Kunstwerk 	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum, Kauf_IP, Kauf_Zeitstempel)
			VALUES 		(@Kunden_ID, @Kunden_ID, "Whisky am Abend", 'Whisky_am_Abend.jpg', '1200', '900', '599,99', '77.33.246.100', '250', "Was gibt es schöneres? Die zwei besten Dinge im Leben vereint, eine Zigarre und der goldfarbene Tropfen.", "02.04.2020", '71.67.987.154', "2020-07-24");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 106);
			
COMMIT;