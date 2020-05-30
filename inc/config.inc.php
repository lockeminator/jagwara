<?php
/* Hier bitte nur Page-Funktionen einbauen
 * Funktionen für Content bitte in fun.inc.php (Uebersicht)
 */
define('PATH', dirname($_SERVER['SCRIPT_FILENAME']));

    if( isset($_GET['page']) ){
       $page = $_GET['page'] ;
    }else{
       $page = "home";
    }

# #################################################
# Konstanten für DB Aufbau
# #################################################
    
define ( "__MYDEBUG__", true );
define ( "__INC_DBFUNCS__", 1 );
define ( "KUNST_HOST", "localhost" );
define ( "KUNST_DB",   "20ss_tid4_kuenstlerdb" );
//DB Daten fuer bplaced
//define ( "KUNST_HOST", "localhost" );
//define ( "KUNST_DB",   "technikerschule_team2" );

# #################################################
# Konstanten & Variablen deffinieren
# #################################################

    $firma      = "Kuenstler GmbH";
    $strasse    = "Bochumer Straße 8b";
    $plz        = "10555 Berlin";


# #####################################
#   Kunst _ SEASSION
# #####################################
    
    Kunst_Session();
    
# ################################################
# Server und Pfad auslesen
# ################################################
    
    function getUrl( $relative = true ) {
        $srvName = $_SERVER['SERVER_NAME'];         // Server (Domainnamen)
        $phpSelf = dirname($_SERVER['PHP_SELF']);   // Pfad und Dateinamen (/ordner/bilder/bild.jpg)
        
        if( $relative ) {
                return $phpSelf . '/';
        } else {
                return 'https://' . $srvName . $phpSelf . '/';
        }
    }
    
function navigation( $page ){
    
    $file = '';
    
    switch( $page ){
        case "home": $file = "home.tpl.php";
            break;
        case "kunstwerke": $file = "kunstwerke.php";
            break;
        case "kuenstler": $file = "kuenstler.tpl.php";
            break;
        case "wir": $file = "wir.tpl.php";
            break;
        case "registrieren": $file = "registrieren.tpl.php";
            break;
        
        case "KuenstlerStatus": $file = "kunststatus.tpl.php";
            break;
        
        case "login": $file = "login.tpl.php";
            break;
        case "logout": $file = "logout.tpl.php";
<<<<<<< HEAD
                        session_destroy();
                        header("Location: ./index.php?page=home&".session_name()."=".session_id() );
            break;
        case "kontakt": $file = "kontakt.tpl.php";
            break;
        case "datenschutz": $file = "datenschutz.tpl.php";
            break;
        case "impressum": $file = "impressum.tpl.php";
            break;
        default: $file = "err.tpl.php";
    }
    return $file;
}

$file = navigation( $page );

<<<<<<< HEAD




?>