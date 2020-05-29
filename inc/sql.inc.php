<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw







/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
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
/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
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
/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
// Hole die Kunstwerke 
function holeKunstwerke( $dbconn ){       // SQL-Abfrage zusammenbasteln

if (isset($_GET['menu'])){
    $WhereString = getwhere( $_GET['menu'], $_GET['auswahl']);
}
else {
    $WhereString = '';
}

if (isset($_GET['sort'])){
    $OrderString = getorder( $_GET['sort'] );
}
else {
    $OrderString = '';
}
if (isset($_POST['PreisAbsenden'])) $WhereString = Preisspanne();

// 2 SQL-String zusammenbasteln
$sSQL = <<<CHEAT
SELECT  Kunstwerk.Titel,
        Kunstwerk.Image, 
        Kunstwerk.Kauf_Zeitstempel, 
        Kunstwerk.Preis, 
        Kategorie.Stilrichtung,
        kuenstler.Kuenstlername,
        Kunstwerk.Breite,
        Kunstwerk.Hoehe
FROM eingeordnet    INNER JOIN Kategorie ON eingeordnet.Kategorie_ID = Kategorie.Kategorie_ID
                    INNER JOIN Kunstwerk ON eingeordnet.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                    INNER JOIN kuenstler ON Kunstwerk.Kuenstler_ID = kuenstler.Kunden_ID
CHEAT;
    $sSQL .= $WhereString;
    $sSQL .= ' ORDER BY'. $OrderString .' Kunstwerk.Kunstwerk_ID' ;
    // print($sSQL);
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


/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
function GetUIDByLogin( $dbconn, $clpw, $cluser ) { 

    // SQL-Abfrage zusammenbasteln
  $SQL_String = "SELECT Kunden_ID".
                " FROM login".
                " WHERE Login = '".$cluser.
                "' AND Passwort =SHA2('" . $clpw . "', 256)";
        print($SQL_String);
  // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen
  $erg = $dbconn->query( $SQL_String );

  if ( !$erg )
  {
    echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
      $SQL_String."<br />".
      $dbconn->errno . ": " . $dbconn->error . "</div>";
  }

  // 4  einen "Datensatz" fetch-en
  $ds = $erg->fetch_assoc();
  if ( $ds == NULL )
    $uid = NULL;
  else
    // 5    Zugriff auf die einzelnen Felder
    $uid = $ds['Kunden_ID'];

  return $uid;
}
    ?>