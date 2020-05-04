<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw




// ********************************************************************************
/*! \brief  Baut eine Datenbankverbindung zur pmg_db auf 
 *  \param  $user ein User für den DB-Zugriff (z.Z.: admin, gast)
 *  \return eine gültige DB-Verbindung vom Typ mysqli im Erfolgsfall, sondt false
 ******************************************************************************** */

function connectKunstDB(){
    $user = '';
    
    switch ( $user ){
        case "admin" : $user   = "admin";
                       $passwd = "qwertz";
                       break;
        case "gast"  : $user   = "bob";
                       $passwd = "passwort";
                       break;
        default      : $user   = "root";
                       $passwd = NULL;
//  DB Daten für bplaced                   
//        default      : $user   = "technikerschule";
//                       $passwd = "123asd";
    }
    
    $dbconn = new mysqli (KUNST_HOST, $user, $passwd, KUNST_DB);    // 1a	Verbindung zum DB-Server aufbauen

    if( $dbconn->connect_error ){                               // Verbindung fehlgeschlagen
        echo "<div class=\"debugErr\">"
                . "<span>Verbindung fehlgeschlagen: </span> "
                . $dbconn->connect_errno . " : ". $dbconn->connect_error 
             . "</div>";
        $dbconn = false;
    }else{
        if ( defined( "__MYDEBUG__" ) && __MYDEBUG__ ){
            echo "<div class=\"debugInfo\">"
                    . "<span>Verbindung zum DB-Server hergestellt: </span>" . $dbconn->host_info 
                . "</div> ";
        }
    }
    $dbconn->query("SET NAMES utf8");
    
    return $dbconn;
}


?>