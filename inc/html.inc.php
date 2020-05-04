<?php
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw
function htmlOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
        $output .= '<li><a href="index.php?page=kunstwerke&auswahl='. $kat['Stilrichtung'] .'">' . $kat['Stilrichtung'] . '<span>('.$kat['Anzahl'].')</span></a> </li>';
    }
    return $output;
}

?>