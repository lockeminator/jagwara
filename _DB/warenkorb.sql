CREATE TABLE warenkorb (
	Kunden_ID      INT   UNSIGNED NOT NULL,
	Kunstwerk_ID  	INT 	UNSIGNED NOT NULL,
	FOREIGN KEY ( Kunstwerk_ID )	REFERENCES Kunstwerk( Kunstwerk_ID ),
	FOREIGN KEY ( Kunden_ID ) 		REFERENCES Kunde( Kunden_ID )
) ENGINE = InnoDB;

GRANT ALL 	
      ON 20ss_tid4_kuenstlerdb.warenkorb
      TO ss20tid4_Gast@'%';

GRANT ALL 	
      ON 20ss_tid4_kuenstlerdb.warenkorb
      TO ss20tid4_Gast@'localhost';

GRANT SELECT (Vita)	
      ON 20ss_tid4_kuenstlerdb.kuenstler 
      TO ss20tid4_Gast@'localhost';
