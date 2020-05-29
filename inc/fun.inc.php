<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw

<<<<<<< HEAD
function LoginComplete(){
   if ( !empty($_POST['uname']) && !empty($_POST['passw'])   )  
    {
    $cluname = htmlentities($_POST['uname']);
    $clpassw = htmlentities($_POST['passw']);
        if (strlen($cluname) <= 64 && strlen($clpassw) <= 64)
        {
            $dbconn = connectKunstDB( 'login' );
            $uid = GetUIDByLogin( $dbconn, $clpassw, $cluname );
            if ($uid > 1 ) {
                $_SESSION['User'] = 'isIN';
                $_SESSION['save']['uid'] = $uid;
                
                header("Location: ./index.php?page=home&".session_name()."=".session_id() );
                exit;
            }
            else $Errorstring ="Benutzerkonto nicht gefunden";
        }
    }
    else $Errorstring = "Login Daten nicht vollständig";
}
=======
<<<<<<< Updated upstream
=======

>>>>>>> master




/*! \brief Überprüft die Anmeldung des Login-Formulares

    Ist die Anmeldung korrekt, so wird auf die Seite "$Destination" umgelenkt
    Ansonsten wird eine Fehlermeldung als HTMl-Div zurückgeliefert

    \param $Destination Seite, auf die im Erfolgsfall umgelenkt wird
    \param $LoginArr    das Array, wo die Anmeldedaten herkommen
    \return eine UserID als Ganzzahl im Erfolgsfall
            NULL sonst
*/
function CheckLogin( $LoginArr, $Destination ) 
{
  $ErrString ="";
  if ( isset($LoginArr['submit']) )
  { // es wurde ein Submit gesendet: Login-Überprüfung findet statt
    if (  LoginDataComplete( $LoginArr ) )
    {  // Alle Felder ausgefüllt
      $dbconn  = ConnectPmgDB( 'gast' );   //Verbindung zum DB-Server aufbauen
      $uid = GetUIDByLogin( $dbconn, $LoginArr );
      $dbconn->close();

      if ( $uid )
      { // Pers_ID erhalten : umlenkung: anderen header schicken:
        // Problem: UserID in der URL!!
        // jetzt mit einer Session:
        $_SESSION['login']['uid']     = $uid;
        $_SESSION['login']['time']    = time();
        $_SESSION['login']['success'] = true;
        $_SESSION['dummy']['laber'] = "blablabla";
        $_SESSION['dummy']['suelze'] = 12.52;

        header("Location: ./welcome.php");
        echo "<b> Hier kam eine Umlenkung nach welcome.php</b>";
      }
      else
      { // Falsche Anmeldedaten
        $ErrString = ErrorByNo( 102 );
      }
    }
    else
    {// Fehlende Anmeldedaten
      $ErrString = ErrorByNo( 101 );
    }
  }

  return;
}



<<<<<<< HEAD
=======

>>>>>>> master
/*! \brief Initialisiert alle Session-Einstellungen für die Kunst-Seiten

    \param keine
    \return keine
*/
function Kunst_Session()
{
  ini_set( "session.use_cookies", 0 );      // Schaltet Cookie als Standardmechanismus aus
  ini_set( "session.use_only_cookies", 0 ); // Lässt andere Datenwege zu 
  ini_set( "session.name", "Kunst" );         // Setzt den Session-Name
  session_start();                          // Benutze den Session-Mechanismus
}


<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
/*! \brief  Gibt ein String zum einfügen in eine 
            WHERE Bedingung      
    details
    
    \param  $menu in welchem Menü wurde die auswahl getroffen
            $auswahl welche Auswahl wurde getroffen
    \return String zum einstetzen einer SQL-Abfrage 
*/
function getwhere ( $menu , $auswahl ){
    $sout;
    switch ($menu){
        case "stil" :
            $sout = ' WHERE \''. $auswahl . '\' = Kategorie.Stilrichtung';
        break;
        case "kuenstler" :
            $sout = ' WHERE \''. $auswahl . '\' = Kuenstler.Kuenstlername';
        break;
        case "preis" :
            $sout = ' WHERE Kunstwerk.Preis <= '. $auswahl ;
        break;
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
        
        default : 
            $sout = '';
=======
>>>>>>> master
        case "mpreis" :
            $sout = ' WHERE Kunstwerk.Preis >= '. $auswahl ;
        break;
        case "gross" :
            switch ($auswahl){
                case '150' :
                    $sout = ' WHERE Kunstwerk.Hoehe <= '. $auswahl .' OR Kunstwerk.Breite <= '. $auswahl;
                break;
                case '500' :
                    $sout = ' WHERE (Kunstwerk.Hoehe <= '. $auswahl .' OR Kunstwerk.Breite <= '. $auswahl .') AND (Kunstwerk.Hoehe >= 150 OR Kunstwerk.Breite >= 150)';
                break;
                case '1500' :
                    $sout = ' WHERE (Kunstwerk.Hoehe <= '. $auswahl .' OR Kunstwerk.Breite <= '. $auswahl .') AND (Kunstwerk.Hoehe >= 500 OR Kunstwerk.Breite >= 500)';
                break;
                case '3500' :
                    $sout = ' WHERE (Kunstwerk.Hoehe <= '. $auswahl .' OR Kunstwerk.Breite <= '. $auswahl .') AND (Kunstwerk.Hoehe >= 1500 OR Kunstwerk.Breite >= 1500)';
                break;
                case '10000' :
                    $sout = ' WHERE (Kunstwerk.Hoehe > 3500 OR Kunstwerk.Breite > 3500)';
                break;
            }
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
        break;
    }
 return $sout;
 }

/*! \brief  Gibt ein String zum einfügen in eine 
            ORDER BY Bedingung      
    details
    
    \param  $sort nach was soll sortiert werden
    \return String zum einstetzen einer SQL-Abfrage 
*/
function getorder ( $sort ){
    switch ($sort){ 
        case "preis" :
            return ' Kunstwerk.Preis,';
        break;
        case "neu" :
            return ' Kunstwerk.Einstell_Zeitstempel,';
        break;
<<<<<<< HEAD
    }
}

/*! \brief  Gibt ein String zum einfügen in eine 
            SELECT abfrage      
    details
    
    \param  nix
    \return String zum einstetzen einer SQL-Abfrage 
*/
function Preisspanne() {
    $minPreis = htmlentities($_POST['min']); 
    $maxPreis = htmlentities($_POST['max']);

=======
<<<<<<< Updated upstream
        default : 
            return;
        break;
    }
}








/*! \brief Gibt ein Array formatiert zu Debugging-Zwecken aus
    
    details
=======
    }
}

/*! \brief  Gibt ein String zum einfügen in eine 
            SELECT abfrage      
    details
    
    \param  nix
    \return String zum einstetzen einer SQL-Abfrage 
*/
function Preisspanne() {
    $minPreis = htmlentities($_POST['min']); 
    $maxPreis = htmlentities($_POST['max']);

>>>>>>> master
    if ( $minPreis === "min") $minPreis = '0.1';
    if ( $maxPreis === "max") $maxPreis = '1000000';
    
    if ( !preg_match( "/^[0-9]{1,}?[,.]?[0-9]/" , $minPreis )){
        printf("Fehlerhafte Eingabe! -> min <- ");
        return;
    }
    else $cminPreis = $minPreis;

    if ( !preg_match( "/^[1-9]{1,}?[,.]?[0-9]/" , $maxPreis )){
        printf("Fehlerhafte Eingabe! -> max <- ");
        return;
    }
    else $cmaxPreis = $maxPreis;
return ' WHERE Preis >= '. $cminPreis .' AND Preis <= '. $cmaxPreis;
}
>>>>>>> Stashed changes

    \param $arr das auszugebende Array
    \return nichts - reine Ausgabe
*/
function DebugArr( $arr )
{
  if ( __MYDEBUG__ == true )
  {
    echo "<pre>";
    print_r( $arr ); 
    echo "</pre>";
  }
}





<<<<<<< HEAD


=======
>>>>>>> master
/*! \brief Gibt ein Array formatiert zu Debugging-Zwecken aus
    
    details

    \param $arr das auszugebende Array
    \return nichts - reine Ausgabe
*/
function DebugArr( $arr )
{
  if ( __MYDEBUG__ == true )
  {
    echo "<pre>";
    print_r( $arr ); 
    echo "</pre>";
  }
}

?>