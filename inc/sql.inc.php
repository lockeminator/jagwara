<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw

// Hole die Stil Richtungen
function holeStielrichtung( $dbconn ){       // SQL-Abfrage zusammenbasteln

    $sSQL = "SELECT Kategorie.Stilrichtung, ( SELECT COUNT(*) FROM eingeordnet WHERE Kategorie_ID = Kategorie.Kategorie_ID ) AS Anzahl FROM Kategorie";

    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
     $erg->fetch_assoc();                  // 4	einen "Datensatz" fetch-en
     while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
    $array[] = $ds;
//        DebugArr( $array, '$ds' );
    return $array;
}

// Hole die Künstler 
function holeKuenstler( $dbconn ){       // SQL-Abfrage zusammenbasteln

    $sSQL = 'SELECT kuenstler.Kuenstlername, (SELECT COUNT(*) FROM kunstwerk WHERE Kuenstler_ID = kuenstler.Kunden_ID ) AS Anzahl FROM kuenstler';

    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
     $erg->fetch_assoc();                  // 4 einen "Datensatz" fetch-en
     while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
    $array[] = $ds;
 //       DebugArr( $array, '$ds' );
    return $array;
}

// Hole die Kunstwerke 
function holeKunstwerke( $dbconn , $WhereString , $OrderString ){       // SQL-Abfrage zusammenbasteln
  
// 2 SQL-String zusammenbasteln
$sSQL = <<<CHEAT
SELECT  Kunstwerk.Titel,
        Kunstwerk.Image, 
        Kunstwerk.Kauf_Zeitstempel, 
        Kunstwerk.Preis, 
        Kategorie.Stilrichtung,
        kuenstler.Kuenstlername
FROM eingeordnet    INNER JOIN Kategorie ON eingeordnet.Kategorie_ID = Kategorie.Kategorie_ID
                    INNER JOIN Kunstwerk ON eingeordnet.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                    INNER JOIN kuenstler ON Kunstwerk.Kuenstler_ID = kuenstler.Kunden_ID
CHEAT;
$sSQL .= $WhereString;
$sSQL .= ' ORDER BY'. $OrderString .' Kunstwerk.Kunstwerk_ID' ;
print($sSQL);
    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
	    while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
	    $array[] = $ds;
	
    //   DebugArr( $array, '$ds' );
    return $array;
}


?>