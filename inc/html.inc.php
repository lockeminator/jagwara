<?php
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw





function htmlOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
        if($kat['Anzahl'] > '0')
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
        	$output .= '<li><a href="index.php?page=kunstwerke&sort=neu&menu=stil&auswahl='. $kat['Stilrichtung'] .'">' . $kat['Stilrichtung'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
=======
>>>>>>> master
        	$output .= '<li><a href="index.php?page=kunstwerke&menu=stil&auswahl='. $kat['Stilrichtung'] .'">' . $kat['Stilrichtung'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
    }
    return $output;
}

function htmllistOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
    	if($kat['Anzahl'] > '0')
        	$output .= '<li><a href="index.php?page=kunstwerke&menu=kuenstler&auswahl='. $kat['Kuenstlername'] .'">' . $kat['Kuenstlername'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
    }
    return $output;
}

<<<<<<< HEAD
=======
<<<<<<< Updated upstream
function htmllistOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
    	if($kat['Anzahl'] > '0')
        	$output .= '<li><a href="index.php?page=kunstwerke&sort=neu&menu=kuenstler&auswahl='. $kat['Kuenstlername'] .'">' . $kat['Kuenstlername'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
    }
    return $output;
}

=======
>>>>>>> Stashed changes
>>>>>>> master
function htmlimgOutput( $aKunstwerke ) {
    $output = '';
    foreach( $aKunstwerke AS $kwe ){
    	$output .= 	"\n\t\t".'<div class="col-sm-4">'.
    				"\n\t\t\t".'<a href="#">'.
    				"\n\t\t\t".'<img src="img/kunstwerke/orginal/'. $kwe['Image'] .'" alt="'. $kwe['Titel'] . ' von '. $kwe['Kuenstlername'] .'" title="'. $kwe['Titel'] .' von '. $kwe['Kuenstlername'] .'" />'.
    				"\n\t\t\t\t".'<p class="label-header"><span>'. $kwe['Titel'] .':</span><br />'. $kwe['Stilrichtung'] .'</p>'.
    				"\n\t\t\t\t".'<p class="label-name">'.
<<<<<<< HEAD
    				"\n\t\t\t\t". $kwe['Kuenstlername'];

    	if ($kwe['Kauf_Zeitstempel'] === NULL)
        {
            $output .=  "\n\t\t\t\t\t".'<span class="isIn">'. $kwe['Preis'] .' &euro;</span>';
        }
    	else 
        {
            $output .=  "\n\t\t\t\t\t".'<span class="isOut">SOLD</span>';
    	}		
        $output .=  "\n\t\t\t\t".'</p>'.
=======
    				"\n\t\t\t\t". $kwe['Kuenstlername'].
    				"\n\t\t\t\t\t".'<span class="isIn">'. $kwe['Preis'] .'</span>'.
    				"\n\t\t\t\t\t".'<span class="isOut">'. $kwe['Kauf_Zeitstempel'] .'</span>'.
    				"\n\t\t\t\t".'</p>'.
>>>>>>> master
    				"\n\t\t\t".'</a>'.
    				"\n\t\t".'</div>'
    				;


    										// '. $kwe['Titel'] .'
    }
<<<<<<< Updated upstream
  
                  
    
    
    return $output;
}

<<<<<<< HEAD
=======
=======
    return $output;
}

>>>>>>> master
/*! \brief Erstellt ein Div zur Darstellung von Fehlermeldungen

  \param $title Der Titel der Fehlermeldung als string

  \return ein String, der das Komplette Fehlerdic für die HTML-Seite beschreibt

 */
function ErrorDiv( $title )
{
  return  "\n  <div class=\"center\">".
          "\n    <div class=\"title\">".$title."</div>".
          "\n  </div>";
}

<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
?>