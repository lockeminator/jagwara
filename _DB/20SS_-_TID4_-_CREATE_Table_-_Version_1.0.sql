/*
-- Erstellen der Küstler Daten Bank

-- Sebatian Friedel, Christian Vitzke, Tobias Buhn

-- diese Datenbank ist enstanden aufgrund des Data-Dictionary (DD_KueWs_Update_V3.xlsx)
*/
DROP DATABASE IF EXISTS tid4_kuenstlerdb_20ss;
CREATE DATABASE IF NOT EXISTS tid4_kuenstlerdb_20ss
DEFAULT CHARACTER SET "utf8";



USE tid4_kuenstlerdb_20ss;

CREATE TABLE Kunde (
Kunden_ID             INT                             UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Anrede                ENUM('Herr', 'Frau', 'Divers')  NOT NULL DEFAULT 'Divers',
Titel                 VARCHAR(20)                     DEFAULT NULL,
Vorname               VARCHAR(40)                     NOT NULL,
Nachname              VARCHAR(60)                     NOT NULL,
Strasse               TINYTEXT                        NOT NULL,  
PLZ                   SMALLINT                        NOT NULL,
Ort                   TINYTEXT                        NOT NULL
);

CREATE TABLE Kuenstler (
Kunden_ID             INT                       UNSIGNED PRIMARY KEY NOT NULL,
Kuenstlername         VARCHAR(20)               DEFAULT NULL,
IBAN                  VARCHAR(34)               NOT NULL,
BIC                   VARCHAR(11)               NOT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
);

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
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID ),
FOREIGN KEY ( Kuenstler_ID )   REFERENCES Kuenstler ( Kunden_ID )
);

CREATE TABLE Kontaktart (
Art_ID                SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
Bezeichnung           TINYTEXT                 NOT NULL
);

CREATE TABLE Kontakt (
Art_ID                SMALLINT                 UNSIGNED NOT NULL,
Kunden_ID             INT                      UNSIGNED NOT NULL,
Kontakt_ID            SMALLINT                 UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
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
reg_Timestamp	        TIMESTAMP                NOT NULL DEFAULT CURRENT_TIMESTAMP(),
reg_IP                VARCHAR(39)              NOT NULL,
Passwort              CHAR(64)	               NOT NULL,
FOREIGN KEY ( Kunden_ID )   REFERENCES Kunde ( Kunden_ID )
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




INSERT INTO Kontaktart VALUES 
                            (1, 'E-Mail'),
                            (2, 'Privat-Telefon'),
                            (3, 'Dinst-Telefon'),
                            (4, 'Telefon'),
                            (5, 'Fax');

INSERT INTO Kategorie ( Kategorie_ID, Stilrichtung, Beschreibung ) VALUES 
  ( 101, 'Abstrakte Malerei', 'Unter abstrakter Malerei versteht man Bilder, die keine Erinnerung hervorrufen und keinen Hinweis auf die sichtbare Wirklichkeit enthalten. Die Bilder lösen sich vom Gegenständlichen ab und geben die Realität auf. 1911 gründete Wassily Kandinsky mit Franz Marc die Künstlergemeinschaft "Der blaue Reiter", der später auch August Macke, Paul Klee und andere Künstler angehörten. Ziel dieser Gruppe war es, die bisherigen Grenzen des künstlerischen Ausdrucksvermögens zu erweitern. Auf diese Weise wurde die Grundlage der abstrakten Malerei geschaffen. Wer den Schritt zur reinen Abstraktion als erster vollzog, ist nicht geklärt. Alle Bilder der abstrakten Malerei erhalten Sie bei uns als Gemälde-Reproduktion Kunstdrucke und Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 102, 'Amerikanische Malerei', 'Im traditionellen Zivilisationsverständnis war die Malerei ein wesentliches Kriterium für den Entwicklungsstand einer Gesellschaft. Wenn wundert es, dass die ersten amerikanischen Maler, die ihre Gemälde der Weltöffentlichkeit auf der Weltausstellung in Paris präsentierten, nur Spott und Hohn ernteten. Während die Amerikaner die Landschaftsmalerei gerade für sich entdeckt hatten, war Europa längst dem Historismus verfallen. Zu Unrecht wähnte sich Europa an der Spitze der internationalen Avantgarde: Während 1920 die ersten französischen Impressionisten in die Wälder am Stadtrand von Paris ziehen, um die Freilichtmalerei zu erfinden, war diese Technik bei amerikanischen Malern der Hudson River School, wie z.B. Frederic Edwin Church oder Albert Bierstadt, schon lange uzo. Trotz all dieser Alleinstellungsmerkmale, gelang es Amerika erst viele Jahre später mit dem Aufkommen des Abstrakten Expressionismus und der Popart, aus dem künstlerischen Schatten Europas herauszutreten.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 103, 'Barock Malerei', 'Begründer des Barock, der gegen Ende des 16. Jahrhunderts den Manierismus ablöste, war der Italiener Caravaggio, dessen realistische Helldunkelbilder in ganz Europa bahnbrechend wirkte. Neben der religiösen Malerei traten mit dem Barock weltliche Darstellungen wie Genrebilder und Landschaftsbilder stärker hervor. Stilistisch lehnte man sich an die Malerei der Hochrenaissance an, übersteigerte jedoch deutlich ins Theatralische. Im Mittelpunkt der flämischen Barockmalerei steht Peter Paul Rubens, in der holländischen vor allem Rembrandt. Weitere bekannte Vertreter der Barockmalerei sind Vermeer, José de Ribera, Jan van Delft und Diego Velázquez. Alle Barock-Bilder erhalten Sie bei uns als Gemälde-Reproduktionen Kunstdrucke und Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 104, 'Biedermeier', 'Ursprünglich wurde der Name Biedermeier in der Zeitschrift "Münchner Fliegende Blätter" für die von ihm geschaffenen Philisterkarikaturen verwendet. Philister war der Name für zufriedene Personen, die nicht an Politik interessiert waren und immer im kleinen Kreis blieben. Heute wird das Wort Biedermeier als Stilbezeichnung für die Kunst- und Literaturströmung in dem Zeitraum von etwa 1815 bis etwa 1848 verwendet.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 105, 'Dadaismus', 'Der Begriff kommt von dem kindlichen Stammellaut ?dada?, der ?Holzpferdchen? bedeutet. Der Dadaismus legt sich nicht auf einen Stil fest, sondern ?hatte das Programm, keins zu haben?. Als Protest gegen die Institutionalisierung der Kultur, die Zweckgebundenheit der Kunst und die Perfektion der Technik fordert der Dadaismus eine Hinwendung zum scheinbar sinnlosen. Der Dadaismus erlangte Bedeutung für die weitere Entwicklung der modernen Kunst und Literatur und entwickelte sich in Frankreich zum Surrealismus weiter. Bekannte Vertreter des Dadaismus sind Johannes Theodor Baargeld, Theo van Doesburg und Viking Eggeling.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 106, 'Digitale Kunstbilder', 'Der Begriff Digitale Bildkunst - kurz Digitale Kunst wurde erst in 1990er Jahren gebräuchlich und fällt weitgehend unter computergenerierte Kunst die vorwiegend auf zweidimensionale Medien (Web, Print, Projektion) ausgegeben wird. Die Digitale Kunst entsteht entweder als Nachempfindung und Weiterführung traditioneller Kunststile (z. B. digital-impressionistisch, neo-pop, digital-abstrakt) oder als völlig neue Kunst-Komposition mit dem Computer als weiterführendes Werkzeug (z.B. 3D-Kunst: Darstellungen virtueller Räume mittels 3D-Software; Mathematische Kunst: Fraktale und Vektordarstellungen etc.). Der Beginn der Digitalen Kunst ist in mehrfacher Hinsicht mit elektronischer Musik verbunden. Zu den Pionieren zählen Personen, die von der Informationsästhetik beeinflusst sind, vielfach auch aus der Informatik- und Grafikdesignszene verwurzelt sind.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 107, 'Expressionismus', 'Der Expressionismus im engeren Sinne ging von der Künstlergemeinschaft Die Brücke aus, die unter anderem aus den Künstlern Kirchner, Heckel, Schmidt-Rottluff und Bleyl bestand und 1905 gegründet wurde. Im Gegensatz zu den Bildern des Impressionismus, erstrebte der Expressionismus eine Kunst des seelischen Ausdrucks, die als Merkmale kräftige Konturen, Ausdruckskraft der Linien und eine abstrahierende Vereinfachung des Gegenständlichen aufweist. 1911 gründete Wassily Kandinsky mit Franz Marc die Künstlergemeinschaft Der blaue Reiter, der später auch August Macke, Paul Klee und andere Künstler angehörten. Ziel dieser Gruppe war es, die bisherigen Grenzen des künstlerischen Ausdrucksvermögens zu erweitern; auf diese Weise wurde die Grundlage der abstrakten Malerei geschaffen. Im dritten Reich wurde der deutsche Expressionismus zur entarteten Kunst erklärt. Alle Bilder des Expressionismus erhalten Sie bei uns als Gemälde-Reproduktion, Kunstdruck oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 108, 'Futurismus', 'Dabei handelt es sich um eine italienische Kunstbewegung am Anfang des 20. Jahrhunderts, der bekannte italienische Maler wie Boccioni, Carrà, Russolo, Balla, SantElia, Azari und Severini angehörten. Ziel dieser Bewegung war es, das Dynamische der Zeit in der Kunst wiederzugeben, so dass zentrale Themen die Erscheinung der Massengesellschaft, die Großstadt und das Tempo des Verkehrs waren. Dieses Ziel sollte mit Techniken wie dem Divisionismus (Zerlegung des Farbauftrages in kleine, nebeneinandergesetzte Tupfen) und dem Kubismus erreicht werden.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 109, 'Impressionismus', 'Der Impressionismus entwickelte sich 1860/70 in Frankreich und breitete sich über ganz Europa aus. Es handelt sich um eine neue und revolutionär wirkende Malweise, bei der die Farbe der Bilder im Vordergrund steht. In diesem Zusammenhang kam auch die Freilichtmalerei auf, bei der die Wirkung des Lichteinfalls eine entscheidende Rolle für die Bilder spielte. Bekannte impressionistische Künstler waren unter anderem Manet, Monet, Pissarro, Sisley, Degas oder Renoir. Cézanne und van Gogh gehören ebenfalls zu den impressionistischen Künstlern. In Deutschland traten als impressionistische Maler vor allen Dingen Liebermann, Slevogt und Corinth hervor. Alle Bilder des Impressionismus erhalten Sie bei uns als Gemälde-Reproduktion, Kunstdruck oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 110, 'Jugendstil', 'Die Hauptperiode des Jungendstils umfasst die Zeit vom letzten Jahrzehnt des 19. Jahrhunderts bis zum Jahr 1914. Charakteristisch für Jungendstil Bilder sind lineare, oft asymmetrische Ornamente floralen oder geometrischen Ursprungs mit deutlicher Neigung zu Verfremdungseffekten, so dass Phantasie und Sinnlichkeit in den Vordergrund gerückt wurden. Hauptvertreter des Jugendstils sind Gustav Klimt, Ferdinand Hodler, Charles Rennie, Mackintosh und Albert von Keller. Alle Bilder erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 111, 'Klassische Moderne', 'Die klassische Moderne ist schwer als eine eigene Stilrichtung zu bezeichnen. Man versteht heute unter der klassischen Moderne künstlerische Neuerungen im Übergang vom 19. Zum 20. Jahrhundert, die als "bleibende Werte" in die Kunstgeschichte eingegangen sind. Zur Klassischen Moderne werden insbesondere Bilder des Expressionismus (August Macke, Franz Marc, Amadeo Modigliani, Egon Schiele, Richard Gerstl) sowie Bilder des Kubismus und Futurismus (Pablo Picasso, Juan Gris, Fernand Leger, Giacomo Balla) sowie die Kunstwerke aus den Bereichen Dada und Surrealismus gezählt. Alle Bilder der klassische Moderne erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 112, 'Klassizismus', 'Die Klassizismus verbreitete sich zwischen 1750 bis in den frühen Jahren um 1800 in Europa und Nordamerika und zeichnet sich durch das Nacheifern von Greco-römischen Formen aus. Neoklassizistische Künstler versuchten das, was sie als die Trivialität der Rokoko Bilder ansahen mit einem Stil der logisch, ernst und moralisierend im Charakter war, zu ersetzen. Bekannte Vertreter des Klassizismus sind Christian Gottlieb Schick, Ferdinand Kobell, Josef Grassi und Anselm Feuerbach. Alle Bilder des Klassizismus erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 113, 'Kubismus', 'Der Kubismus beruht auf Formprinzipien des späten Cézannes, der als gestalterisches Ziel die Erfassung der Natur durch Zylinder, Kugel und Kegel erstrebte. Picasso machte im Jahre 1907 mit seinem Bild Les Demoiselles d`Avignon den Anfang. Bei der Stilrichtung des Kubismus verlor die natürliche Gegenständlichkeit ihre Bedeutung. Die Farbskala der Bilder wurde verkleinert und die Formen in kantige Facetten aufgesplittert. Bekannte Vertreter des Kubismus sind neben Picasso auch Umberto Boccioni und Juan Gris. Alle Bilder des Kubismus erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 114, 'Manierismus', 'Bei dem Manierismus handelt es sich um eine ca. 1520 bis 30 einsetzende künstlerische Strömung, die sich von den klassischen Idealen der Renaissance abwendete. Charakteristisch für diese Stilrichtung sind Bilder mit einer irrealen Farbgebung und einer übersteigerten Raumkonstruktion. Der Stil ist vom Hang zum Absonderlichen und bewussten Verrätselungen geprägt, die oftmals als Ausdruck der Angst und Zwiespältigkeit einer die mittelalterliche Glaubenswelt verlassenden Gesellschaft verstanden wird. Bekannte Vertreter des Manierismus sind El Greco, Angelo Bronzino, Domenico Beccafumi, Jacopo Pontormo und Jacopo Tintoretto. Alle Bilder des Manierismus erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 115, 'Moderne Kunst', 'Im Unterschied zu den Bildern der "alten Meister", stellen wir in dieser Rubrik die Werke von jungen, talentierten Künstlern. Die hier vorgestellten Kunstbilder sind entweder als Nachempfindung und Weiterführung traditioneller Kunststile entstanden, oder der als völlig neue Kunst-Komposition zu verstehen. Viele der Künstlerinnen und Künstler, die Ihre Werke hier einem breitem Publikum präsentieren, wurden über unser Artist-Publisher-Programm rekrutiert.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 116, 'Naive Malerei', '"Naive Malerei wird die Malerei von Laien genannt, die nicht intellektuell reflektiert ist, jedoch oftmals unterbewusst symbolhaften Charakter hat. Bekanntester Vertreter ist hier Henri-Julien-Félix Rousseau; aber auch Künstler wie Pablo Picasso, Joan Miró oder Paul Klee nahmen teilweise Elemente der Naiven Malerei in ihre Werke auf.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 117, 'Pointillismus', 'Der Pointillismus als "Nachimpressionismus" ist eine Stilrichtung der französischen Malerei um 1885. Die Hauptvertreter Georges Seurat und Camille Pissarro kreierten eine neue Maltechnik: Sie zerlegten jeden Farbton in kleine Punkte aus Komplementärfarben. Blau neben Orange, Rot neben Grün und Gelb neben Violett: Mit diesen Kontrasten erzeugten sie ein vibrierendes Licht und verstärkten die strahlende Wirkung. Deswegen wird der Pointillismus manchmal auch als Divisionismus bezeichnet.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 118, 'Pop Art Kunst', 'Bei der Pop Art handelt es sich um eine neorealistische Kunstrichtung, die in den 50er Jahren in den USA und in England geprägt wurde. Im Rahmen dieser Stilrichtung wurden Objekte des Massenkonsums zusammengestellt, um die Grenze zwischen Kunst und Alltagsrealität aufzuheben. Banales wurde zur Kunst erhoben und an das Auge des Betrachters herangebracht. Zu den Künstlern der Popart zählen Andy Warhol, Robert Rauschenberg, Jasper Johns und Roy Lichtenstein. Alle Bilder erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 119, 'Realismus', 'Realismus ist die von der Beobachtung der Erscheinungswelt ausgehende Art der Darstellung und wird zumeist im gleichen Sinn wie der Begriff `Naturalismus´ gebraucht, jedoch mit dem Unterschied, dass ein gesteigerter Realismus, der sich auf ins Einzelne gehende Wiedergabe eines Naturvorbildes beschränkt, als Naturalismus bezeichnet wird. In der Geschichte der Kunst hat es immer wieder Epochen des Realismus gegeben. Bekannte Vertreter des Realismus sind Menzel, Courbet, Corot und Fattori. Alle Bilder erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 120, 'Renaissance', 'Das Zeitalter der Renaissance löste in der Kunst die Gotik ab, indem es zuerst in Italien einsetzt und mit dem Ende des 15. Jahrhunderts alle europäischen Länder erfasste. Diese Epoche lässt sich in die Frührenaissance um 1420, die Hochrenaissance am Anfang des 16. Jahrhunderts und die Spätrenaissance einteilen, die bis 1520/30 andauerte und vom Manierismus gefolgt wurde. Das entscheidende bei den Bildern dieser Epoche war die Wiedererweckung des klassischen Altertums mit seiner antiken Gestalten- und Formenwelt und der im Mittelalter verpönten Aktmalerei. Dennoch blieben die religiösen Aufgaben der Kunst übergeordnet. Michelangelo, Leonardo da Vinci, Botticelli, Tizian, Albrecht Dürer und Raffael sind sicher die bekanntesten Vertreter der Renaissance. Alle Bilder erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 121, 'Rokoko', 'Im Rokoko wandelten sich die schweren, prunkvoll pathetischen Bilder des Barock ins Leichte, Aufgelöste, Zarte und Zierliche. In der Malerei überwogen weltliche Themen wie Feste oder Schäferszenen, so dass die religiöse Malerei noch stärker als bereits im Barock zurückgedrängt wurde. Bekannte Vertreter des Rokoko sind François Boucher, Thomas Gainsborough und Antoine Watteau. Alle Bilder des Rokoko erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 122, 'Romantik', 'Die Romantik löste um die Wende zum 19. Jahrhundert Aufklärung und Klassizismus ab. Die Romantik hatte ihren Mittelpunkt in Deutschland mit Caspar David Friedrich. In England hat sich u. a. Joseph Mallord William Turner diesem Malstil verschrieben. Der Begriff `romantisch´ wurde zum Sinnbild für das Ahnungsreiche und Gefühlvolle, das den Gegensatz zum Verstandesmäßigen darstellen sollte. Weitere bekannte Vertreter der Romantik sind George Stubbs, Carl Spitzweg und John Constable. Alle Bilder der Romantik erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 123, 'Suprematismus', 'Um 1913 von Malewitsch geprägte Bezeichnung für eine von allem Gegenständlichen gereinigte Kunst, die sich in geometrischen Formen und Farben ausdrückt. Malewitsch propagierte diese Kunstauffassung in zahlreichen Schriften, wie in der Broschüre "Vom Kubismus und Futurismus zum Suprematismus". Malewitsch postulierte in theoretischen Arbeiten die absolut notwendige Gegenstandslosigkeit des Kunstwerks, unabhängig von jeglichen Inhalten und materiellen Zielsetzungen. Die erste künstlerische Manifestation des Suprematismus war Malewitschs Komposition "Schwarzes Quadrat auf weißem Grund" (1915).<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 124, 'Surrealismus', 'Der Surrealismus wurde erstmals 1917 von dem Schriftsteller Apollinaire für eine künstlerische Richtung, die das ´Überwirkliche´ erstrebte, benutzt. Die von Breton seit 1921 in Paris geführte Bewegung suchte, im Anschluss an die Psychoanalyse Freuds, die eigene Wirklichkeit des Menschen im Unterbewussten und verwertete Rausch- und Traumerlebnisse als Quell der künstlerischen Eingebung. Als bekannteste Künstler des Surrealismus sind Dali, Chagall und Miró zu nennen. Die Bewegung verbreitete sich weltweit, verlor jedoch nach 1945 an Bedeutung, so daß Techniken und Methoden des Surrealismus in andere Strömungen eingingen. Alle Bilder erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 125, 'Symbolismus', 'Beim Symbolismus handelt es sich um eine künstlerische Haltung, deren Charakteristikum der Widerspruch zu der jeweils anerkannten Kunstauffassung, wie dem Rationalismus, Realismus oder Naturalismus, ist. Symbole dienten als Ausdrucksmittel und schafften in den Bildern mystische und religiöse Zusammenhänge, so dass Inhalte wie Tod und Eros zu Hauptthemen der Symbolisten wurden. Hauptvertreter des Symbolismus waren unter anderem Arnold Böcklin, Ferdinand Hodler, Odilon Redon und Franz von Stuck. Alle Bilder des Symbolismus erhalten Sie in unserer Galerie als hochwertige Gemälde-Reproduktion, Kunstdruck bzw. Leinwandbild oder Poster.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 126, 'Viktorianische Malerei', 'Als viktorianische Malerei wird die englische Malerei zwischen 1837 - 1901, der Regierungszeit Königin Victorias, bezeichnet. Während des ?Viktorianischen Zeitalters? florierte Großbritanniens Wirtschaft, es begann die britische ?Ära des Imperialismus?, Wohlstand und Sicherheit erreichte erstmals weite Teile der Mittelschicht. Zu den bekanntesten Malern der viktorianische Malerei gehören Frederic Leighton und Sir Lawrence Alma-Tadema, die hauptsächlich antike Szenen malten. Die viktorianische Malerei wurde mit dem Aufkommen des deutschen Expressionismus und der klassischen Moderne zunehmend ignoriert und gewann erst ab den 1970er Jahren wieder an Popularität, als Gemälde von Sir Lawrence Alma-Tadema Rekordergebnisse bei Versteigerungen erziehlten.<a href="http://http://de.wikipedia.org/wiki/Fotorealismus">Quelle: kunstbilder-galerie.de</a> ' ),
  ( 130, 'Fotorealismus', 'Fotorealismus ist ein nach der Pop Art vor allem in den USA entwickelter Stil extrem naturalistischer Malerei.Er entstand in den späten 1960er und frühen 70er Jahren. Als erster öffentlicher Auftritt kann die documenta 5 1972 in Kassel angesehen werden. Die Bilder und Plastiken des „US-Amerikanischen Fotorealismus“ brachen langjährige Tabus, die vor allem in Deutschland gegenüber einem abbildenden Realismus existierten und in Abgrenzung gegen die Kunst in der Zeit des Nationalsozialismus und gegen den Sozialistischen Realismus entstanden waren.<br />Die Irritationen entstanden nicht zuletzt aus der Verkennung der künstlerischen Intention des Fotorealismus, dessen Künstler weniger an bestimmten Ausschnitten der Realität interessiert waren als vielmehr an der möglichst exakten Umsetzung der Darstellungsweise von Fotografie in Malerei und den sich daraus ergebenden Wirkungen und Möglichkeiten. Die als Reproduktion von Reproduktionen aufgefassten und gemalten Bilder erscheinen, wenn sie – wie auch hier – nur abgebildet werden, in erneuter Reproduktion und somit reduziert auf das, wovon sie ausgingen, als Foto. Kennzeichnend ist der bis zur Augentäuschung gehende Detailnaturalismus. Solch fatale Realitätsverwechslung und Bildunsicherheit verfestigte den Vorwurf, diese Kunst sei bloße Kopistenvirtuosität, schierer Foto- und Wirklichkeitsabklatsch. Was indes in der Abbildung wie ein Foto wirkt, lässt im Original die entscheidenden Züge einer Wirklichkeitsinterpretation, einer eigenen Bildrealität erkennen.<br />Als Vorlage benutzten die Fotorealisten meistens ein Diapositiv oder mehrere mit alltäglichen Motiven aus ihrem Umfeld. Ihr Verhältnis gegenüber dem Inhalt ihrer Bilder sollte neutral und möglichst objektiv sein. Sie bevorzugten Motive mit detailreichen, spezifischen, oft spiegelnden Oberflächen.<a href="http://www.kunstbilder-galerie.de/kunststile.html">Quelle: wikipedia.de</a>'),
  ( 131, 'Tonalismus', 'Tonalismus (1880 bis 1915) ist eine Stilrichtung in der Malerei, die entstand, als amerikanische Künstler begannen, Landschaften in einem übergreifenden Ton farbiger Atmosphäre oder Dunst zu malen.' ), 
  ( 132, 'Intimismus', 'Der Intimismus wurde geprägt von André Gide. Er sah in den Gemälden von Édouard Vuillard, welche in den 1890er Jahren entstanden, eine intime und in gedämpften Farbwerten gehaltene Malerei.Kennzeichnend für die Bildwerke ist eine detailgenaue Schilderung der häuslichen Privatsphäre'),
  ( 133, 'Paysage intime', 'Die Paysage intime (französisch für „vertraute Landschaft“) war eine Stilrichtung der Malerei, welche sich mit schlichten, einfachen Landschaftsbilder befasste und Mitte des 19. Jahrhunderts entstand. Er war der Vorgänger der Stilrichtung Impressionismus'),
  ( 134, 'Fauvismus', 'In den fauvistischen Bildern sollte die Farbgebung nicht mehr der illusionistischen Darstellung eines Gegenstandes dienen. Die malerische Aussage entstand aus dem Zusammenklang der Farbflächen. Typisch für die meisten Werke sind ihre leuchtenden Farben.')
;


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

-- (Kunden_ID, Kuenstler_ID, Kunstwerk_ID, Titel, Image, Hoehe, Breite, Preis, Kauf_IP, Kauf_Zeitstempel, Einstell_IP, Einstell_Zeitstempel, Gewicht, Beschreibung, Herstelldatum)
-- NULL        4003          4001          Dune   .png   131     5515   54,54  NULL     NULL              16.5.16.195  CURRENT_TIMESTAMP     3000      LOL          30101998
