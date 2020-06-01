<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw


function holeuserdate( $dbconn, $uid ){
    
    $SQL_String = "SELECT kunde.Anrede, ".
                         "kunde.Titel, ".
                         "kunde.Vorname, ".
                         "kunde.Nachname, ".
                         "kunde.Strasse, ".
                         "kunde.PLZ, ".
                         "kunde.Ort, ".
                         "kontakt.Kontakt, ".
                         "kontakt.Bemerkung, ".
                         "kontakt.Art_ID ".
                  "FROM kontakt INNER JOIN kunde ON kontakt.Kunden_ID = kunde.Kunden_ID ".
                  "WHERE kontakt.Kunden_ID = ".$uid ;
    //print($SQL_String);
    $erg = $dbconn->query($SQL_String);
    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }    
    while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
    $array[] = $ds;
      //DebugArr( $array, '$ds' );
      //print($array[0]['Login']);
    return $array;
}

function holeuserlogin( $dbconn, $uid ){
    
    $SQL_String = "SELECT login.Login ".
                  "FROM Login ".
                  "WHERE Kunden_ID = ".$uid ;
    //print($SQL_String);
    $erg = $dbconn->query($SQL_String);
    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }    
    while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
    $array[] = $ds;
      //DebugArr( $array, '$ds' );
      //print($array[0]['Login']);
    return $array[0]['Login'];
}


/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
// Hole die Stil Richtungen
function holekontaktart( $dbconn ){
    $sSQL = "SELECT kontaktart.Bezeichnung , kontaktart.Art_ID FROM kontaktart";

    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
                      // 4 einen "Datensatz" fetch-en
     while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
        $array[] = $ds;
//  DebugArr( $array, '$ds' );
    return $array;
}

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

    $sSQL = 'SELECT kuenstler.Kuenstlername, kuenstler.Kunden_ID, (SELECT COUNT(*) FROM kunstwerk WHERE Kuenstler_ID = kuenstler.Kunden_ID ) AS Anzahl FROM kuenstler';

    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
     
     while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
    $array[] = $ds;
   //     DebugArr( $array, '$ds' );
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
if ($_GET['page'] === 'einzelansicht') $WhereString = ' WHERE '. $_GET['kuenstler'] .' = Kunstwerk.Kuenstler_ID';  
if ($_GET['page'] === 'home') $OrderString = ' Kunstwerk.Einstell_Zeitstempel,';


if (isset($_POST['PreisAbsenden'])) $WhereString = Preisspanne();

// 2 SQL-String zusammenbasteln
$sSQL = <<<CHEAT
SELECT  Kunstwerk.Image,
        Kunstwerk.Titel, 
        Kunstwerk.Kauf_Zeitstempel, 
        Kunstwerk.Preis, 
        Kategorie.Stilrichtung,
        kuenstler.Kuenstlername,
        kuenstler.Kunden_ID,
        Kunstwerk.Breite,
        Kunstwerk.Hoehe,
        Kunstwerk.Kunstwerk_ID
FROM eingeordnet    INNER JOIN Kategorie ON eingeordnet.Kategorie_ID = Kategorie.Kategorie_ID
                    INNER JOIN Kunstwerk ON eingeordnet.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                    INNER JOIN kuenstler ON Kunstwerk.Kuenstler_ID = kuenstler.Kunden_ID
CHEAT;
    $sSQL .= $WhereString;
    $sSQL .= ' ORDER BY'. $OrderString .' Kunstwerk.Kunstwerk_ID' ;
   //print($sSQL);
    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen

    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
	    while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
	    $array[] = $ds;
	
      // DebugArr( $array, '$ds' );
    return $array;
}


/*! \brief Holt eine UserID anhand der Login-Daten aus der DB

    \param $dbconn eine gültige DB-Verbindung vom Typ mysqli
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
function GetUIDByLogin( $dbconn, $clpw, $cluser ) { 

  $pre_stmt = $dbconn->stmt_init();
    // SQL-Abfrage zusammenbasteln
  $SQL_String = "SELECT Kunden_ID".
                " FROM login".
                " WHERE Login = ? AND Passwort = SHA2( ?, 256)";
      //print($SQL_String);
  // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen
  if( $pre_stmt->prepare( $SQL_String ) ){
      $pre_stmt->bind_param( "ss", $cluser, $clpw );
      $pre_stmt->execute();
      $pre_stmt->bind_result( $uid );
    if ( $pre_stmt->fetch() )
      {
        return $uid;
      }
      else
      {
        return false;
      }
  }
  else {
    echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
      $SQL_String."<br />".
      $dbconn->errno . ": " . $dbconn->error . "</div>";
  }
/*
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
*/
}


function checkusername( $dbconn , $uname){
  
  $SQL_String = "SELECT login.Login FROM login ";
    
  $erg = $dbconn->query( $SQL_String );
  if ( !$erg )
  {
    echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
      $SQL_String."<br />".
      $dbconn->errno . ": " . $dbconn->error . "</div>";
  }
  while ( $ds = $erg->fetch_assoc() ) // $array = $erg->fetch_all(); auch moeglich
      if ($uname === $ds['Login']) return false;
      
   //DebugArr( $array, '$ds' );
   return true;
}



function insertkontakt( $dbconn, $last, $art_id, $clkom, $clbem ){
    $SQL_String = 'INSERT INTO Kontakt (Art_ID, Kunden_ID, Kontakt, Bemerkung)'.
                  'VALUES ('.$art_id.', '.$last.', "'. $clkom.'", "'.$clbem.'")';
    // print("$SQL_String");
    $dbconn->query( $SQL_String );
}





function insertkunde( $dbconn, $clusername, $clpwd, $cltitel, $clvn, $clnn, $clstr, $clplz, $clort ){

  $pre_stmt = $dbconn->stmt_init();
  
  $SQL_String = 'INSERT INTO kunde (Titel, Vorname, Nachname, Strasse, PLZ, ORT)'.
                ' VALUES (?, ?, ?, ?, ?, ? )';

  if ( $pre_stmt->prepare( $SQL_String ) )
    {
      $pre_stmt->bind_param("ssssis", $cltitel, $clvn, $clnn, $clstr, $clplz, $clort);
      $pre_stmt->execute();
      $last_id =  $pre_stmt->insert_id;
    }
    else
    { // Abfrage fehlgeschlagen
      echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $SQL_String."<br />".
        $pre_stmt->errno . ": " . $pre_stmt->error . "</div>";
    }

  $SQL_String = "INSERT INTO login ( Kunden_ID, Login, reg_IP, Passwort )".
                'VALUES ( '.$last_id.', "'.$clusername.'", "22.22.22.33", SHA2("'.$clpwd.'", 256) )';
    print("$SQL_String");
    $dbconn->query( $SQL_String );
 
return $last_id;
}

function insertkuenstler(){
  if (!empty($_POST['Kuenstlername']) &&
      !empty($_POST['IBAN']) ){
    $clkunstname = htmlentities($_POST['Kuenstlername']);
    $clvita = htmlentities($_POST['Vita']);
    $clIBAN = htmlentities($_POST['IBAN']);
    $clBIG = htmlentities($_POST['BIG']);
    
    $pre_stmt = $dbconn->stmt_init();
    $SQL_String = 'INSERT INTO Kuenstler '.
                  "VALUES ( ?, ".$clkunstname.", ".$clvita.", ".$clIBAN.", ".$clBIC.")";
    //$pre_stmt->bind_param("i", $_POST[', $clvn, $clnn, $clstr, $clplz, $clort);
    $pre_stmt->execute();

  }
  else return 'Daten nicht vollständig';
return '';
}

function holeeinKunstwerke( $dbconn ){       // SQL-Abfrage zusammenbasteln

$sSQL = <<<CHEAT

SELECT  Kunstwerk.Titel,  
        Kunstwerk.Image,
        Kunstwerk.Hoehe,
        Kunstwerk.Breite,
        Kunstwerk.Preis, 
        Kunstwerk.Kauf_Zeitstempel,  
        Kunstwerk.Gewicht, 
        Kunstwerk.Kuenstler_ID,
        Kunstwerk.Beschreibung,
        Kunstwerk.Herstelldatum,
        Kunstwerk.Kunstwerk_ID,
        Kategorie.Stilrichtung,
        kuenstler.Kuenstlername,
        kuenstler.Vita
FROM eingeordnet    INNER JOIN Kategorie ON eingeordnet.Kategorie_ID = Kategorie.Kategorie_ID
                    INNER JOIN Kunstwerk ON eingeordnet.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                    INNER JOIN kuenstler ON Kunstwerk.Kuenstler_ID = kuenstler.Kunden_ID
CHEAT;
      $sSQL .= ' WHERE Kunstwerk.Kunstwerk_ID="'. $_GET['werk'].'"'; 
    $erg = $dbconn->query( $sSQL );               // 3 SQL-Abfrage abschicken und 3b Ergebnis entgegennehmen
    // print("$sSQL");
    if ( !$erg ){
        echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
        $sSQL."<br />".
        $dbconn->errno . ": " . $dbconn->error . "</div>";
    }
    
      $ds = $erg->fetch_assoc();
       
    //  DebugArr( $ds );
    return $ds;
}


function getwarenkorb( $dbconn ){
  $array[] = '';
  $SQL = <<<CHEAT
SELECT  Kunstwerk.Image,
        Kunstwerk.Titel, 
        Kunstwerk.Kauf_Zeitstempel, 
        Kunstwerk.Preis, 
        Kategorie.Stilrichtung,
        kuenstler.Kuenstlername,
        kuenstler.Kunden_ID,
        Kunstwerk.Breite,
        Kunstwerk.Hoehe,
        Kunstwerk.Kunstwerk_ID
FROM warenkorb  INNER JOIN Kunstwerk ON warenkorb.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                INNER JOIN Kuenstler ON Kunstwerk.Kuenstler_ID = Kuenstler.Kunden_ID        
                INNER JOIN eingeordnet ON eingeordnet.Kunstwerk_ID = Kunstwerk.Kunstwerk_ID
                INNER JOIN Kategorie ON eingeordnet.Kategorie_ID = Kategorie.Kategorie_ID
CHEAT;
//print("$SQL");
$erg = $dbconn->query( $SQL );
  if ( !$erg ){
          echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
          $SQL."<br />".
          $dbconn->errno . ": " . $dbconn->error . "</div>";
      }
      
         $array = $erg->fetch_all();
          
         
         
      // DebugArr( $array );
      return $array;
  }

function getPorduct($conn){
    $sql='SELECT * FROM warenkorb WHERE Kunden_ID='. $_SESSION['save']['uid']; // suche nach ID in DB
    // print("$sql");
    $result= $conn->query( "$sql" );         
          
    if ( !$result ){
            echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
            $sql."<br />".
            $conn->errno . ": " . $conn->error . "</div>";
        }
    else {    
    $row=$result->fetch_assoc(); 
    $_SESSION['warenkorb'][]=$row;
    }
}

function insertProdct($conn){
    if(isset($_POST['kuenstler'])){
     
        $pre_stmt = $conn->stmt_init();
        $isql = 'INSERT INTO warenkorb ( Kunstwerk_ID , Kunden_ID ) VALUES ( ?, ?)';
        if ( $pre_stmt->prepare( $isql ) )
        {
          $pre_stmt->bind_param("ss", $_POST['Kaufe'], $_SESSION['save']['uid']);
          $pre_stmt->execute();
        }
        else
        { // Abfrage fehlgeschlagen
          echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
            $isql."<br />".
            $pre_stmt->errno . ": " . $pre_stmt->error . "</div>";
        }
    }
}

function getuserdatabyisIN($dbconn){
    if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN')
        {
            $userdate = holeuserdate( $dbconn , $_SESSION['save']['uid'] );
        }
        else{
            $userdate[0]['Titel'] = '';
            $userdate[0]['Vorname'] = '';
            $userdate[0]['Nachname'] = '';
            $userdate[0]['Anrede'] = '';
            $userdate[0]['Strasse'] = '';
            $userdate[0]['PLZ'] = '';
            $userdate[0]['Ort'] = '';
            $userdate[0]['Frau']    = '';
            $userdate[0]['Herr']    = '';
            $userdate[0]['Divers']  = '';
     
        }

return $userdate;
}


function getuserloginbyisIN($dbconnl){
  if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN')
      $userlogin = holeuserlogin( $dbconnl , $_SESSION['save']['uid'] );
  else
      $userlogin = '';
return $userlogin;
}
    ?>