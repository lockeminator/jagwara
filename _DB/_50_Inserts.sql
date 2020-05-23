/* ================================================================================================
--
-- Projekt:		Kuenstler-Website
-- Funktion:	Befuellen der Datenbank-Tabelle mit Inhalten (INSERT INTO)
--				
-- Vorlage:		DD_KueWs_Update_V3.xlsx
-- 				ERM_fuer_Kuenstlerwebsite_V3.png
--					CREATE Table
--
--	Autor			C. vietzke
				
-- Team:			S. Friedel, C. Vitzke, T. Buhn
-- Abgabe:		05.04.2020
--
-- ================================================================================================ */

START TRANSACTION;

-- ID's vordefinieren

SET @lid1 = 5001;
SET @lid2 = 5002;
SET @lid3 = 5003;
SET @lid4 = 5004; -- SET @lid = LAST_INSERT_ID();


-- Kunden

INSERT INTO Kunde (Kunden_ID, Anrede, Titel, Vorname, Nachname, Strasse, PLZ, Ort) VALUES
	( @lid1, 'Frau', 'M.A.', 'Edna', 'Krabappel', 'Weit Weg 22', 10249, 'Berlin' ),				-- ab hier: Kunde
	( @lid2, 'Herr', 'Prof.', 'John', 'Frink', 'Wir Allee 23', 10247, 'Berlin' ),
	( @lid3, 'Frau', 'Mag. theol.', 'Whitney', 'Spuckler', 'Gasse 8942', 10555, 'Berlin'),		-- ab hier: Kuenstler
	( @lid4, 'Herr', '', 'Jeff', 'Albertson', 'Sunset Boulevard 246', 12, 'Berlin');


-- login

INSERT Login ( Kunden_ID, Login, reg_IP, Passwort) VALUES
	( @lid1, 'edna', '192.168.10.12', SHA2('edna', 256) ),
	( @lid2, 'jdna', '192.168.20.13', SHA2('john', 256) ),
	( @lid3, 'whitney', '192.168.30.14', SHA2('whitney', 256) ),
	( @lid4, 'jeff', '192.168.40.15', SHA2('jeff', 256) );


-- Kontakt

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung) VALUES
	(1, @lid1, '030-55555555', 'Tagsüber erreichbar'),					
	(3, @lid1, 'e.krabappel@springfield-elementary.school', 'Immer erreichbar'),
	(2, @lid2, '0178-55555555', 'Immer erreichbar, gern AB Nachricht'),					
	(3, @lid2, 'prof.frink@frink-corporation.com', 'keine'),
	(3, @lid3, 'blubberblue@gmail.com', 'Keine Werbung'),
	(3, @lid4, 'jeff.alb@gmx.com', 'keine'),
	(4, @lid4, '030-555454545', 'Wer Faxen will, soll es faxen');


-- Kuenstler 

INSERT INTO Kuenstler (Kunden_ID, Kuenstlername, IBAN, BIC) VALUES
	( @lid3, 'SpuckDesign', 'DE0123456789012345678901','ABCDEF99' ),
	( @lid4, 'Mr. Comic', 'DE0123456789012345678910','ABCDEF33' );
	

-- Kunstwerk
/* P.S.:  x lines inserted for correction 
Ist der Preis von SpuckDesign ernst gemeint?
*/
INSERT INTO Kunstwerk (Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite,
       Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum) VALUES
	( @lid3, 5098, 'Bavaria Blu', 'img-1_-_2020-04-05.jpg', 500, 300, 
       15244, '192.168.90.11', 1000, 'Das Bild ist farbig und bunt.', '22.11.2007'),
	( @lid4, 5099, 'Traumzauberbaum', 'img-5_-_2019-02-27.jpg', 2000, 1200,
       50, '192.168.92.11', 1000, 'Das Bild sieht toll aus.', '01.04.2020');


-- Eingeordnet
/* P.S.:  x lines inserted for correction 
  Ich habe mir die Freiheit genommen Ihre Einordnungen auf die Bilder zu beziehen.
  Sollte dieser Bezug falsch sein, korrigieren Sie diesen bitte!
INSERT INTO eingeordnet (Kunstwerk_ID, Kategorie_ID) VALUES
	( 1112, 107 ),
	( 1129, 117 );
*/
INSERT INTO eingeordnet (Kunstwerk_ID, Kategorie_ID) VALUES
	( 5098, 107 ),
	( 5099, 117 );

COMMIT;