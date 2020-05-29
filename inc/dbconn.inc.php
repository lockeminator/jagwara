<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw




// ********************************************************************************
/*! \brief  Baut eine Datenbankverbindung zur pmg_db auf 
 *  \param  $user ein User für den DB-Zugriff 
 *  \return eine gültige DB-Verbindung vom Typ mysqli im Erfolgsfall, sonst false
 ******************************************************************************** */

function connectKunstDB( $user ){
    
    
    switch ( $user ){
        case "admin" :      $user   = "ss20tid4_Admin";
                            $passwd = "B0SSM4N";
                            break;
        case "gast" :       $user   = "ss20tid4_Gast";
                            $passwd = "gast";
                            break;
        case "kunde" :      $user   = "ss20tid4_Kunde";
                            $passwd = "$4zahlenderKunde$4";
                            break;
        case "kuenstler" :  $user   = "ss20tid4_Kuenst";
                            $passwd = "$4zahlender$4Kuenstler$4";
                            break;
        case "login" :      $user   = "ss20tid4_Login";
                            $passwd = "neuer$4zahlender$4Kunde$4";
                            break;
        default :           $user   = "";
                            $passwd = NULL;
                            break;
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