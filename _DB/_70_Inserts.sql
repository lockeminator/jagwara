USE 20ss_tid4_kuenstlerdb;
SET NAMES utf8;


START TRANSACTION;

/* Erst einmal aufräumen:
   Dubletten vermeiden !    */
DELETE FROM eingeordnet WHERE Kunstwerk_ID  BETWEEN 7000 AND 7099;
DELETE FROM kategorie   WHERE Kategorie_ID  =135;
DELETE FROM kunstwerk   WHERE Kunstwerk_ID  BETWEEN 7000 AND 7099;
DELETE FROM kuenstler   WHERE Kunden_ID     BETWEEN 7000 AND 7099;
DELETE FROM login       WHERE Kunden_ID     BETWEEN 7000 AND 7099;
DELETE FROM kontakt     WHERE Kunden_ID     BETWEEN 7000 AND 7099;
DELETE FROM kunde       WHERE Kunden_ID     BETWEEN 7000 AND 7099;

INSERT INTO kunde (`Kunden_ID`, `Anrede`, `Vorname`, `Nachname`,
                      `Strasse`, `Ort`, `PLZ` ) VALUES
(7001, 'Herr', 'Fred',    'Pinsel', 'Infoweg 9',      'Datenhausen',   9999),
(7002, 'Frau', 'Natascha','Schulze','Gerade Str. 14', 'Rehburg-Loccum',31547),
(7003, 'Herr', 'Gunnar',  'Schmidt','Hoepnerstr. 4',  'Berlin',        10123),
(7004, '',     'Charles', 'Boyz',   'Alt-Lankwitz 98','Berlin',        12247);
      
INSERT INTO kontakt ( Art_ID, Kunden_ID, Kontakt_ID, Kontakt, Bemerkung ) VALUES
(3, 7001, 7001, 'maler1@meister.de', NULL),
(2, 7001, 7002, '0151 151 262 373', NULL),
(3, 7002, 7003, 'nasch@gmx.de', NULL),
(2, 7002, 7004, '0172 2 88 35 35', NULL),
(3, 7003, 7005, 'guschmidt@web.de', NULL),
(1, 7003, 7006, '030 9 02 99 92', NULL),
(3, 7004, 7007, 'badboynele@web.de', NULL),
(1, 7004, 7008, '030 80 20 28 59', NULL),
(2, 7004, 7009, '0155 5555 5555', NULL);

INSERT INTO `login` (`Kunden_ID`, `Login`, `Passwort`, `Reg_IP`, `Reg_Timestamp`) VALUES
(7001, 'PiFre',         SHA2('PinselFredsPasswort', 256),'99.102.37.55',  '2019-11-06 10:05:30'),
(7002, 'NataschaKatze', SHA2('!P4$$w0rt!', 256),         '121.66.103.124','2019-12-18 06:06:05'),
(7003, 'Aquarellmaler', SHA2('12247_Hoepner4', 256),     '217.81.113.1',  '2020-01-02 20:22:23'),
(7004, 'badboynele',    SHA2('BaBoNe_Geheim', 256),      '201.88.107.123','2019-12-29 11:33:54');


INSERT INTO `kuenstler` (`Kunden_ID`, `Vita`, `Kuenstlername`, `IBAN`, `BIC`) VALUES
(7001, 'Ich bin der Pinselfred und seit 8 Jahren der ungeschlagene King auf allen Berliner Flomärckten. Jetz könnt ihr zum ersten mal meine begerten Bilder auch online kaufen. Aber achtung: was hier nich in 2 wochen weg geht ist dann garantiert auf einem Flohmarkt verkauft. Also zugreifen!', 
       'PinselFred', 'DE25 3601 0043 0988 7766 55', 'PBNKDEFF360'),
(7002, 'Ich bin neu hier und weiß nicht so recht, was ich hier schreiben soll, außer meiner Begeisterung fürs Malen. Vielleicht kommt hier später mal mehr.', 
       'Nasch', 'DE58 1001 0010 0022 7864 57', 'PBNKDEFFXXX'),
(7003, 'Ich male seit 30 Jahren Aquarelle und bin jetzt neu hier. Ich weiß nicht so recht, was ich schreiben soll. Aber wenn Ihr mehr über mich wissen wollt, besucht doch meine Webseite: "http://www.guensch_aquarelle.berlin"', 
       'Günsch', 'DE18 1209 6597 0101 0101 01', 'GENODEF1S10'),
(7004, 'Abschluss an der UdK VIII 2011 - Preise in Holland und Old Britain für innovative Kunst - 12 Ausstellungen in 3 Jahren - Ausgezeichnet in Finnland als "Innovative Artist 2012". Alles weitere und Weiteres unter www.badboynele.art', 
       'badboynele', 'DE21 1209 6597 1234 4400 12', 'GENODEF1S10');


INSERT INTO kategorie VALUES 
(135, "Kindermimikry", 
      "2010 maßgeblich vom innovativen Künstler badboynele geprägte Stilrichtung der Malerei. Durch Übertreibung des Aspektes der kindlichen Malerei wird der handwerkliche Anspruch von Kunst als Voraussetzung für künstlerische Arbeiten, wie es vor allme bis ins Ende des 20. Jahrhunderts von ewig Gestrigen gefordert wird, ad absurdum geführt. Nicht zu verwechseln mit naiver Malerei, ist ein Anspruch an den Kindermimikry, dass Kunstwerke dieser Richtung nicht von Bildern solcher Kinder zu unterscheiden sind, die noch nicht vom verheerenden Einfluss des Kunstunterrichts herkömmlicher sogenannter Kunstlehrer verdorben wurden. In Holland wurde diese Kunstrichtung 2012 mit dem hochdotiertem Kunstpreis 'vernieuwende kunststromingen 2012' ausgezeichnet. Mehr zu diesem Malstil unter: www.badboynele.art/kindermimikry");


INSERT INTO kunstwerk 
(`Kunstwerk_ID`, `Titel`, `Preis`, `Hoehe`, `Breite`, `Gewicht`,
       `Beschreibung`, 
       `Herstelldatum`, `Image`, `Einstell_IP`, `Einstell_Zeitstempel`,
       `Kauf_IP`, `Kauf_Zeitstempel`, `Kunden_ID`, `Kuenstler_ID`) VALUES
(7001, 'Walfamilie',      '250.00', 1200, 1590, 2420,
       'Gemälde - verschiedene - Eine Walfamilie in Ölpastellfarben auf Karton gemalt und auf einen Aquarellhintergrund gesetzt.', 
       2020, "7001.jpg",  '217.84.133.127', '2020-02-28 17:26:15', 
       NULL, NULL, NULL, 7002),
(7002, 'Blumen',          '150.00', 420,  594,  720, 
       'Gemälde - Aquarell - Blumen - Aquarell', 
       2020, "7002.jpg", '217.81.33.12', '2020-02-12 11:12:43',
       NULL, NULL, NULL, 7003),
(7003, 'Blumen',          '150.00', 594,  420,  720,  
       'Gemälde - Aquarell - Blumen am Seeufer - Aquarell', 
       2020, "7003.jpg", '217.81.43.12', '2020-03-03 11:42:41',
       NULL, NULL, NULL, 7003),
(7004, 'Lietzensee',      '150.00', 420,  594,  720, 
       'Gemälde - Aquarell - Café am Lietzensee, Hinteransicht - Aquarell',
       2020, "7004.jpg", '217.81.55.61', '2020-03-28 14:40:05',
       NULL, NULL, NULL, 7003),
(7005, 'Lietzensee',      '150.00', 594,  420,  720,
       'Gemälde - Aquarell - Café am Lietzensee - Aquarell', 
       2020, "7005.jpg", '217.81.12.21', '2020-04-11 13:21:16',
       NULL, NULL, NULL, 7003),
(7006, 'Selbstportrait',  '120.00', 210,  297,  315,  
       'Zeichnung - Filzstift/Marker - Selbstportrait', 
       2020, "7006.jpg", '201.88.107.123', '2020-01-03 04:21:16',
       NULL, NULL, NULL, 7004),
(7007, 'Spiegelapfel',    '120.00', 210,  297,  310,
       'Zeichnung - Filzstift/Marker - Baum, Apfel, erste Schreibversuche - nicht alle gelungen', 
       2020, "7007.jpg", '201.88.107.123', '2020-01-15 03:11:21',
       NULL, NULL, NULL, 7004),
(7008, 'Gummibären',      '175.00', 148,  210,  280, 
       'Zeichnung - Filzstift/Marker - Drei Tüten Gummibären auf einer Unterlage angeordnet', 
       2020, "7008.jpg", '201.88.107.123', '2020-01-15 03:15:17',
       NULL, NULL, NULL, 7004),
(7009, 'Tieraltar',       '175.00', 148,  210,  275,
       'Zeichnung - Filzstift/Marker - Tiere als Pentychon - 4 kleine Zeichnungen um eine große angeordnet', 
       2020, "7009.jpg", '201.88.107.123', '2020-01-15 03:19:08',
       NULL, NULL, NULL, 7004);

INSERT INTO `eingeordnet` (`Kunstwerk_ID`, Kategorie_ID) VALUES
(7001, 109),
(7002, 109),
(7003, 109),
(7004, 109),
(7005, 109),
(7006, 135),
(7007, 135),
(7008, 135),
(7009, 135);

COMMIT;