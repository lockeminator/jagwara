-- Die INSERT der Gruppe: Ernesto Cabrera Garcia, Jonas Wünsch, Stefan Riedl.

-- Kunde 1
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

ALTER TABLE Kunde AUTO_INCREMENT=2001;
ALTER TABLE Kunstwerk AUTO_INCREMENT=2001;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Frau', NULL, 'Jutta', 'Juckich', 'Bahnhofstrasse 4', '04158', 'Leipzig');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'JUJU', '77.48.405.245', SHA2('NAOR1345', 256));

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 3, "JuJu@freenet.de", NULL);

COMMIT;


-- Kunde 2
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Frau', NULL, 'Janette', 'Kette', 'Bahnhofstrasse 52', '12555', 'Berlin');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'Jacke', '77.48.205.201', SHA2('uwelilisad85', 256));

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 3, "Jacke@hotmail.com", NULL);

COMMIT;


-- Kuenstler1
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Herr', 'Dr.', 'Glenn', 'Quagmire', 'Am Zwingerteich 1', '01067', 'Dresden');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'MrShlong', '77.23.916.223', SHA2('lklkj//hlen', 256));

INSERT INTO Kuenstler	(Kunden_ID, Kuenstlername, IBAN, BIC)
			VALUES 		(@Kunden_ID, 'SirFuggalot', 'DE76790200760326329540', NULL);

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 2, "0173 99991913", NULL);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "DixnChixx", 'DixnChixx.jpg', '8000', '2000', '2,99', '77.33.246.111', '500', "Gigidi Gigidi Gigidi", "03.05.1990");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 132);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "DixnChixx2", 'DixnChixx2.jpg', '8000', '2000', '2,99', '77.33.246.111', '500', "Gagada Gagada Gagada", "03.05.1990");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 133);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum, Kauf_IP, Kauf_Zeitstempel)
			VALUES		(@Kunden_ID, @Kunden_ID, "DixnChixx3", 'DixnChixx3.jpg', '8000', '2000', '2,99', '77.33.246.111', '500', "Gogodo Gogodo Gogodo", "03.05.1990", '71.00.111.222', "2020-07-04");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 134);
			
COMMIT;


-- Kuenstler2
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Frau', '', 'Luis', 'Griffin', 'Königstrasse 1', '50676', 'Koeln');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'KillPete', '77.22.222.223', SHA2('IIIiii888//hlen', 256));

INSERT INTO Kuenstler	(Kunden_ID, Kuenstlername, IBAN, BIC)
			VALUES 		(@Kunden_ID, 'LickitLuis', 'DE76790200788326329540', NULL);

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 2, "0173 99888884", "egal");

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "KillJohnny", 'KillJohnny.jpg', '4000', '4000', '12,89', '77.33.146.222', '10', "Gigidi Gigidi Gigidi", "18.05.1999");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 115);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
			VALUES		(@Kunden_ID, @Kunden_ID, "100DeathsOfJohnny", '100DeathsOfJohnny.jpg', '4000', '4000', '24,89', '77.35.146.221', '10', "Gegadi Gigidi Gigidi", "24.05.1999");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 115);
			
COMMIT;


-- Kuenstler3
START TRANSACTION;

USE 20ss_tid4_kuenstlerdb;

INSERT INTO Kunde	(Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT) 
			VALUES	('Herr', '', 'Jürgen', 'Jakidalikmikikipi', 'Kottbusser Damm 33', '10967', 'Berlin');

SET @Kunden_ID 	= LAST_INSERT_ID();
INSERT INTO Login 	(Kunden_ID, Login, reg_IP, Passwort)
			VALUES	(@Kunden_ID, 'Juerg', '73.23.232.242', SHA2('Iouoiuiouoilen', 256));

INSERT INTO Kuenstler	(Kunden_ID, Kuenstlername, IBAN, BIC)
			VALUES 		(@Kunden_ID, 'J2theUerGen', 'DE66790255552226329110', NULL);

INSERT INTO	Kontakt (Kunden_ID, Art_ID, Kontakt, Bemerkung)
			VALUES	(@Kunden_ID, 3, "Juergen@web.de", NULL);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum, Kauf_IP, Kauf_Zeitstempel)
			VALUES		(@Kunden_ID, @Kunden_ID, "rinjeschmantet", 'rinjeschmantet.jpg', '12', '12', '777,99', '71.31.116.111', '888', "fein gepinselt mit kantonesischen sclhitzdrueck Pinseln", "20.09.2020", '71.71.717.717', "2020-09-21");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 119);

INSERT INTO Kunstwerk	(Kunden_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum, Kauf_IP, Kauf_Zeitstempel)
			VALUES		(@Kunden_ID, @Kunden_ID, "rinjeschmantet-again", 'rinjeschmantet_again.jpg', '12', '12', '1777,99', '71.31.116.111', '888', "fein gepinselt mit kantonesischen sclhitzdrueck Pinseln-Reloaded", "20.09.2020", '72.72.727.727', "2020-09-21");

SET @Kunstwerk_ID = LAST_INSERT_ID();
INSERT INTO eingeordnet VALUES (@Kunstwerk_ID, 119);
			
COMMIT;