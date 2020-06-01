<?php
// Model SQL
// Nicht die Funktionsbeschreibungen vergessen: Brief param etc usw


function htmlkontaktart( $fetch ){
    $output = '';
    $i = 0;
    foreach( $fetch AS $fetcho ){
        //$output .= '<label for="'. $fetcho['Bezeichnung'] .'\"><b>'. $fetcho['Bezeichnung'] ."</b></label>\n\t\t\t\t".
        //          '<input type="text" name="'. $fetcho['Bezeichnung'] ."\"/>\n\n\t\t\t\t";
    
//          "\n\n\t\t\t".'<h3>' .$fetcho['Bezeichnung']. '</h3>'.
// Die h3 wuerde ich gern canceln, Zu viele headlines machen kirre - cv
        
          $output .=          "\n\t\t\t\t".'<label for="' .$fetcho['Bezeichnung'].'-kontakt\"><b>'. $fetcho['Bezeichnung'].' Kontakt</b></label>'.
                    "\n\t\t\t\t".'<input type="text" name="'. $fetcho['Bezeichnung'] .'-kontakt" value=""/>'.
                    "\n\t\t\t\t".'<label for="' .$fetcho['Bezeichnung'].'-bemerkung\"><b>'. $fetcho['Bezeichnung'].' Bemerkung</b></label>'.
                    "\n\t\t\t\t".'<input type="text" name="'. $fetcho['Bezeichnung'] .'-bemerkung">';
    $i = $i + 1;
        // <?php echo $userdate[0]['Kontakt'] 
    }
    return $output;
}


function htmlOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
        if($kat['Anzahl'] > '0')
        	$output .= '<li><a href="index.php?page=kunstwerke&menu=stil&auswahl='. $kat['Stilrichtung'] .'&'.session_name()."=".session_id().'">' . $kat['Stilrichtung'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
    }
    return $output;
}

function htmllistOutput( $aKategorien ){
    $output = '';
    foreach( $aKategorien AS $kat ){
    	if($kat['Anzahl'] > '0')
        	$output .= '<li><a href="index.php?page=kunstwerke&menu=kuenstler&auswahl='. $kat['Kuenstlername'] .'&'.session_name()."=".session_id().'">' . $kat['Kuenstlername'] . '<span>('.$kat['Anzahl'].')</span></a> </li>'."\n\t\t\t\t";
    }
    return $output;
}

function htmlimgOutput( $aKunstwerke ) {
    $output = '';
    $i = 0;
    foreach( $aKunstwerke AS $kwe ){
        $i++;
        if ($i%3 === 1) $output .= "\n\n\t".'<div class="row  content-kunstw">';

    	$output .= 	"\n\t\t".'<div class="col-sm-4">'.
    				"\n\t\t\t".'<a href="index.php?page=einzelansicht&werk='.$kwe['Kunstwerk_ID'].'&kuenstler='. $kwe['Kunden_ID'] .'&'.session_name()."=".session_id().'">'.
    				"\n\t\t\t".'<img src="img/kunstwerke/orginal/'. $kwe['Image'] .'" alt="'. $kwe['Titel'] . ' von '. $kwe['Kuenstlername'] .'" title="'. $kwe['Titel'] .' von '. $kwe['Kuenstlername'] .'" />'.
    				"\n\t\t\t\t".'<p class="label-header"><span>'. $kwe['Titel'] .':</span><br />'. $kwe['Stilrichtung'] .'</p>'.
    				"\n\t\t\t\t".'<p class="label-name">'.
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
    				"\n\t\t\t".'</a>'.
    				"\n\t\t".'</div>'
    				;
        if ($i%3 === 0) $output .= "\n\n\t".'</div>';
                    

    										// '. $kwe['Titel'] .'
    }
    if($i%3 !== 0) $output .= "\n\n\t".'</div>';
    return $output;
}

function htmlhomeimgOutput( $aKunstwerke ) {
    $output = '';
    $i = 0;
    $output .= '<div class="section container bg-white">';
    foreach( $aKunstwerke AS $kwe ){
        $i++;
        if ($i === 9) return $output;
        if ($i%4 === 1) $output .= "\n\n\t".'<div class="row  content-kunstw">';

        $output .=  "\n\t\t".'<div class="col-sm-3">'.
                    "\n\t\t\t".'<a href="index.php?page=einzelansicht&werk='.$kwe['Kunstwerk_ID'].'&kuenstler='. $kwe['Kunden_ID'] .'&'.session_name()."=".session_id().'">'.
                    "\n\t\t\t".'<img src="img/kunstwerke/orginal/'. $kwe['Image'] .'" alt="'. $kwe['Titel'] . ' von '. $kwe['Kuenstlername'] .'" title="'. $kwe['Titel'] .' von '. $kwe['Kuenstlername'] .'" />'.
                    "\n\t\t\t\t".'<p class="label-header"><span>'. $kwe['Titel'] .':</span><br />'. $kwe['Stilrichtung'] .'</p>'.
                    "\n\t\t\t\t".'<p class="label-name">'.
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
                    "\n\t\t\t".'</a>'.
                    "\n\t\t".'</div>'
                    ;
        if ($i%4 === 0) $output .= "\n\n\t".'</div>';
                    

                                    // '. $kwe['Titel'] .'
    }

    return $output;
}


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


function changeSOLD($Kauf){
    if ($Kauf === NULL)
        {
            $output .=  "\n\t\t\t\t\t".'<span class="isIn">'. $Kunstwerk['Preis'] .' &euro;</span>';
        }
        else 
        {
            $output .=  "\n\t\t\t\t\t".'<span class="isOut">SOLD</span>';
        }      
}

function getkuenstlerbotton(){
    $button = '';
    if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN'){
        $button .= '<form method="post" action="./index.php?page=KuenstlerStatus&'. SID .'">';
        $button .= '<input type="hidden" name="'. session_name() .' value="'.session_name() .'" />';    
        $button .= '<input type="submit" name="kustupdate" value="Künstel werden" /></form>';
        $button .= '</form>'; 
    }
return $button;
}
?>