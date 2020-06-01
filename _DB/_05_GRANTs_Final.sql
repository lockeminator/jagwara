/* ===========================================================================
--
-- Projekt:		Kuenstler-Website
-- Funktion:	Erstellung von Usern und deren Berechtigungen
--				
-- Vorlage:		DD_KueWs_Update_V3.xlsx
-- 				ERM_fuer_Kuenstlerwebsite_V3.png
--
-- Team:		für alle die finale Final-Version
-- Stand:		25.04.2020
--
-- ======================================================================== 

# ####################################################################################################
# >>>>>>>>>>>>>>>>>>>>>> Berechtigungen (GRANT)
# ####################################################################################################
*/
DROP USER ss20tid4_Admin@'%';     
DROP USER ss20tid4_Gast@'%';            
DROP USER ss20tid4_Kunde@'%';           
DROP USER ss20tid4_Kuenst@'%';          
DROP USER ss20tid4_Login@'%'; 
DROP USER ss20tid4_Admin@'localhost';     
DROP USER ss20tid4_Gast@'localhost';            
DROP USER ss20tid4_Kunde@'localhost';           
DROP USER ss20tid4_Kuenst@'localhost';          
DROP USER ss20tid4_Kuenst@'localhost';            


CREATE USER ss20tid4_Admin@'%'            IDENTIFIED BY 'B0SSM4N';
CREATE USER ss20tid4_Gast@'%'             IDENTIFIED BY 'gast';
CREATE USER ss20tid4_Kunde@'%'            IDENTIFIED BY '$4zahlenderKunde$4';
CREATE USER ss20tid4_Kuenst@'%'           IDENTIFIED BY '$4zahlender$4Kuenstler$4';
CREATE USER ss20tid4_Login@'%'            IDENTIFIED BY 'neuer$4zahlender$4Kunde$4';
CREATE USER ss20tid4_Admin@'localhost'    IDENTIFIED BY 'B0SSM4N';
CREATE USER ss20tid4_Gast@'localhost'     IDENTIFIED BY 'gast';
CREATE USER ss20tid4_Kunde@'localhost'    IDENTIFIED BY '$4zahlenderKunde$4';
CREATE USER ss20tid4_Kuenst@'localhost'   IDENTIFIED BY '$4zahlender$4Kuenstler$4';
CREATE USER ss20tid4_Login@'localhost'    IDENTIFIED BY 'neuer$4zahlender$4Kunde$4';

-- DROP USER ss20tid4_Admin;
/*
GRANT USAGE     
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Admin@'%';
GRANT USAGE 	
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Admin@'localhost';
*/
GRANT ALL 		
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Admin@'%' 				WITH GRANT OPTION;
GRANT ALL 		
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Admin@'localhost' 		WITH GRANT OPTION;

-- DROP USER ss20tid4_Gast;
GRANT USAGE 	
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Gast@'%';
GRANT USAGE 	
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Gast@'localhost';
GRANT SELECT 	
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Gast@'%';
GRANT SELECT 	
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Gast@'%';
GRANT SELECT ( Kunden_ID, Kuenstlername )
	  ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Gast@'%';
GRANT SELECT ( Kunstwerk_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis,
               Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung,
               Herstelldatum )	
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Gast@'%';
GRANT SELECT 	
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Gast@'localhost';
GRANT SELECT 	
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Gast@'localhost';
GRANT SELECT ( Kunden_ID, Kuenstlername )	
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Gast@'localhost';
GRANT SELECT ( Kunstwerk_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis,
               Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung,
               Herstelldatum )		
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Gast@'localhost';


-- DROP USER ss20tid4_Kunde;
GRANT USAGE 	
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Kunde@'%';
GRANT USAGE 	
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT ( Kunden_ID, Kuenstlername )	   
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Kunde@'%';
GRANT SELECT ( Kunstwerk_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis,
               Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung,
               Herstelldatum, Kunden_ID )	   
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Kunde@'%';
GRANT SELECT, UPDATE (Art_ID, Kontakt, Bemerkung ), INSERT, DELETE 
      ON 20ss_tid4_kuenstlerdb.Kontakt
      TO ss20tid4_Kunde@'%';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kontaktart
      TO ss20tid4_Kunde@'%';
GRANT SELECT, UPDATE  
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Kunde@'%';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Kunde@'%';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Kunde@'%';

GRANT SELECT ( Kunden_ID, Kuenstlername )	         
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT ( Kunstwerk_ID, Kuenstler_ID, Titel, Image, Hoehe, Breite, Preis,
               Kauf_Zeitstempel, Einstell_Zeitstempel, Gewicht, Beschreibung,
               Herstelldatum, Kunden_ID )	            
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT, UPDATE (Art_ID, Kontakt, Bemerkung ), INSERT, DELETE 
      ON 20ss_tid4_kuenstlerdb.Kontakt
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kontaktart
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT, UPDATE  
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Kunde@'localhost';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Kunde@'localhost';


-- DROP USER KunstKuenster;
GRANT USAGE 		  
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Kuenst@'%';
GRANT USAGE 		  
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT, UPDATE ( Kuenstlername, IBAN, BIC )  
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Kuenst@'%';
GRANT SELECT, INSERT, DELETE,
      UPDATE ( Titel, Image, Hoehe, Breite, Preis,
               Gewicht, Beschreibung, Herstelldatum )                 
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Kuenst@'%';
GRANT SELECT, UPDATE (Art_ID, Kontakt, Bemerkung ), INSERT, DELETE          
      ON 20ss_tid4_kuenstlerdb.Kontakt
      TO ss20tid4_Kuenst@'%';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kontaktart
      TO ss20tid4_Kuenst@'%';
GRANT SELECT, UPDATE  
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Kuenst@'%';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Kuenst@'%';
GRANT SELECT, INSERT, DELETE          
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Kuenst@'%';

GRANT SELECT, UPDATE ( Kuenstlername, IBAN, BIC )  
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT, INSERT, DELETE,
      UPDATE ( Titel, Image, Hoehe, Breite, Preis,
               Gewicht, Beschreibung, Herstelldatum )                 
      ON 20ss_tid4_kuenstlerdb.Kunstwerk
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT, UPDATE (Art_ID, Kontakt, Bemerkung ), INSERT, DELETE           
      ON 20ss_tid4_kuenstlerdb.Kontakt
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kontaktart
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT, UPDATE  
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT          
      ON 20ss_tid4_kuenstlerdb.Kategorie
      TO ss20tid4_Kuenst@'localhost';
GRANT SELECT, INSERT, DELETE          
      ON 20ss_tid4_kuenstlerdb.eingeordnet
      TO ss20tid4_Kuenst@'localhost';

-- DROP USER ss20tid4_Login;
GRANT USAGE 		  
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Login@'%';
GRANT USAGE 		  
      ON 20ss_tid4_kuenstlerdb.*
      TO ss20tid4_Login@'localhost';
GRANT INSERT          
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Login@'%';
GRANT INSERT          
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Login@'%';
GRANT SELECT, UPDATE (Login, Passwort ), INSERT  
      ON 20ss_tid4_kuenstlerdb.Login
      TO ss20tid4_Login@'%';
GRANT INSERT          
      ON 20ss_tid4_kuenstlerdb.Kuenstler
      TO ss20tid4_Login@'localhost';
GRANT INSERT          
      ON 20ss_tid4_kuenstlerdb.Kunde
      TO ss20tid4_Login@'localhost';
GRANT SELECT, UPDATE (Login, Passwort ), INSERT  
      ON 20ss_tid4_kuenstlerdb.Login
      TO ss20tid4_Login@'localhost';