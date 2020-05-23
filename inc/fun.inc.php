<?php 
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw

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
        
        default : 
            $sout = '';
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
        default : 
            return;
        break;
    }
}








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