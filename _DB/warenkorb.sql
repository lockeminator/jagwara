CREATE TABLE warenkorb (
	Kunden_ID      INT   UNSIGNED DEFAULT NULL,
	Kunstwerk_ID  	INT 	UNSIGNED NOT NULL,
	FOREIGN KEY ( Kunstwerk_ID )	REFERENCES Kunstwerk( Kunstwerk_ID ),
	FOREIGN KEY ( Kunden_ID ) 		REFERENCES Kunde( Kunden_ID )
) ENGINE = InnoDB;



INSERT INTO warenkorb (id) VALUES (1);