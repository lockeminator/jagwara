-- INSERT Tobias Buhn

/* allgemein 
 Stilrichtungen hier einfügen 
*/
START TRANSACTION;
USE tid4_kuenstlerdb_20ss;


INSERT INTO Kontaktart VALUES 
                            (1, 'E-Mail'),
                            (2, 'Privat-Telefon'),
                            (3, 'Dinst-Telefon'),
                            (4, 'Telefon'),
                            (5, 'Fax');

-- erster Kunde  
SET @lid = 4001;

INSERT INTO Kunde -- (Kunden_ID, Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT)
VALUES               ( @lid, 'Frau', 'Dr.', 'Sibille', 'Machmann', 'Waldstr. 23', 16255, 'Schorfheide OT. Eichhorst');

-- SET @lid = LAST_INSERT_ID();

INSERT Login ( Kunden_ID,        Login,     reg_IP,          Passwort)
VALUES       ( @lid, 'sibille', '154.33.55.180', SHA2('hartmann', 256) );

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              (4, @lid, '03336-28126', 'Bitte nur in den Normalen Geschäftszeiten anrufen, besser das Fax benutzen. Da mein Privat-Telefon auch mein Dinst-Telefon ist. Danke');

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              (5, @lid, '03336-28126', 'Hier immer zu erreichen');

-- zweiter Kunde  
SET @lid = 4002;

INSERT INTO Kunde (Kunden_ID, Anrede, Vorname, Nachname, Strasse, PLZ, ORT)
VALUES            ( @lid, 'Herr', 'Herbert', 'Schuster', 'Berliner Straße 45', 13358, 'Berlin - Machnow');

-- SET @lid = LAST_INSERT_ID();

INSERT Login (Kunden_ID, Login, reg_IP, Passwort)
VALUES        ( @lid, 'Torf42', '4F:2b81:64::57:ad:e', SHA2('55nase!!', 256) );

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              (1, @lid, 'herbert.Schuster@gmx.de', 'Ein bis zwei mal die Woche schau ich rein.');

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              (3, @lid, '030-894346', 'Monatg: 10-12 Uhr oder Donnerstag 8-16 Uhr');



-- dritter Kunde = Künstler 
SET @lid = 4003;
INSERT INTO Kunde -- (Kunden_ID, Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT)
VALUES               ( @lid, 'Herr', 'Professor', 'Achim', 'Stolz', 'Braserie 42', 18545, 'Potsdam');

-- SET @lid = LAST_INSERT_ID();

INSERT Login (Kunden_ID, Login, reg_IP, Passwort)
VALUES       ( @lid, 'AchimStolz', '148.24.78.64', SHA2('STOLZ42', 256) );

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              ( 1, @lid, 'Achimstolz@gmail.com', 'Deutsch und Englisch. Antworte so schnell ich kann.');

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              ( 2, @lid, '0340-29616', 'Nur im Notfall, Bitte.');

-- Kuenstler 
INSERT INTO Kuenstler (Kunden_ID, Kuenstlername, IBAN, BIC)
VALUES                ( @lid, 'Achim', 'DE3417200045645189546','D34B89WEL54' );

INSERT INTO Kunstwerk (Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
VALUES ( @lid, 4001, 'Dune', './img/Kunst_Buhn/alternativDune.png', (1194*3), (1701*3), 22.50, '148.24.78.64', 1500, 'inspiriert von den Dune Werken', '12.10.1998');

INSERT INTO eingeordnet -- (Kunstwerk_ID, Kategorie_ID)
                      VALUES ( 4001, 106 );

INSERT INTO Kunstwerk (Kunden_ID, Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Kauf_IP, Kauf_Zeitstempel, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
VALUES                (4001, @lid, 4002, 'Illuminatus', './img/Kunst_Buhn/Illuminatus.jpg', (350*3), (668*3), 11.50, '154.33.55.180', CURRENT_TIMESTAMP() ,'148.24.78.64', 750, 'inspiriert von den Illuminatus Werken', '6.05.1975');

INSERT INTO eingeordnet -- (Kunstwerk_ID, Kategorie_ID)
                      VALUES ( 4002, 106 );


-- Vierter Kunde = Künstler 
SET @lid = 4004;
INSERT INTO Kunde -- (Kunden_ID, Anrede, Titel, Vorname, Nachname, Strasse, PLZ, ORT)
VALUES               ( @lid, 'Frau', '', 'Marie', 'Curie', 'Düsseldorferstr. 86', 45158, 'Düsseldorf');

-- SET @lid = LAST_INSERT_ID();

INSERT Login (Kunden_ID, Login, reg_IP, Passwort)
VALUES       ( @lid, 'Reaction', 'b3::123:7b2a', SHA2('b4mm;', 256) );

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              ( 1, @lid, 'Marie@curie.fr', 'Frazösisch der alten Schule xP');

INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)
VALUES              ( 3, @lid, '0720-65846854', 'Büro: MO 7-12\n      DI 8-16\n      MI geschlossen\n      DO 8-16\n      FR geschlossen');

-- Kuenstler 
INSERT INTO Kuenstler (Kunden_ID, Kuenstlername, IBAN, BIC)
VALUES                ( @lid, 'Diebische Elster', 'DE43561516843516816813','J5LF2H3FI' );

INSERT INTO Kunstwerk (Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
VALUES ( @lid, 4003, 'Betend Hände', './img/Kunst_Buhn/Betende_Haende.jpg', (650*3), (575*3), 25.99, 'b3::123:7b2a', 3000, 'In Messing Gegossene Betende Hände von Alfred Dürer.', '15.02.2007');

INSERT INTO eingeordnet -- (Kunstwerk_ID, Kategorie_ID)
                      VALUES ( 4003, 119 );

INSERT INTO Kunstwerk (Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Einstell_IP, Gewicht, Beschreibung, Herstelldatum)
VALUES ( @lid, 4004, 'Da Vinci Panzer', './img/Kunst_Buhn/Davinci_panzer.jpg', 3550, 8900, 79.00, 'b3::123:7b2a', 9550, 'Nachbau des Da Vinci Panzers aus Pleixglass und Blech', '23.03.2018');

INSERT INTO eingeordnet -- (Kunstwerk_ID, Kategorie_ID)
                      VALUES ( 4004, 119 );

UPDATE Kunstwerk
SET Kunden_ID = 4001, Kauf_IP = '154.33.55.180', Kauf_Zeitstempel = CURRENT_TIMESTAMP
WHERE Kunstwerk.Kunstwerk_ID = 4004; 


COMMIT;