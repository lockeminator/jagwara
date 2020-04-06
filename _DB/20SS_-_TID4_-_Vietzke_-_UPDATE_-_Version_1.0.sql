/* ================================================================================================
--
-- Projekt:		Kuenstler-Website
-- Funktion:	Eintraege updaten (UPDATE)
-- 				Eintraege fuer ein gekuftes Bild aktualisieren
--				
-- Vorlage:		DD_KueWs_Update_V3.xlsx
-- 				ERM_fuer_Kuenstlerwebsite_V3.png
--					CREATE Table
--					INSERT Table
--
--	Autor			C. vietzke
				
-- Team:			S. Friedel, C. Vitzke, T. Buhn
-- Abgabe:		05.04.2020
--
-- ================================================================================================ */


-- Update

UPDATE kunstwerk
SET 
	Kunden_ID 			= 5001, 
	Kauf_IP 				= '192.168.77.18',
	Kauf_Zeitstempel 	= CURRENT_TIMESTAMP
WHERE Kunstwerk_ID = 5098;