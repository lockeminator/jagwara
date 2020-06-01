<?Php
  //  DebugArr( $_GET );
  //  DebugArr( $_POST );
  // DebugArr( $_SESSION ); 

    $_SESSION['warenkorb']=[];

    $conn = connectKunstDB( 'gast' );
    
    // Anzeigen von Produkten
    getPorduct($conn);
    // Einfügen von Produkten
    insertProdct($conn);
    // was ist im warenkorb ist anzeigen   
    $_SESSION['warenkorb'] = getwarenkorb( $conn );
    


    // LÖSCHEN VON PRODUKTEN
    if( isset($_GET['delete']) ){ 
        for($i=0; $i<count($_SESSION['warenkorb']['1']); $i++){
            $tempID = $_SESSION['warenkorb']['1'][$i]['9'];
            if( $_GET['delete'] == $tempID ){
                // echo "löschen: <br>";
                array_splice($_SESSION['warenkorb']['1'],$i,1);
            }
        }
    }   
?>
Parse error: syntax error, unexpected 'warenkorb' (T_STRING) in C:\Users\Lottar\Desktop\xampp\htdocs\jagwara\tpl\topic\warenkorb.tpl.php on line 94
<div class="container section">
    <div class="row">
        <div class="col-sm-12">
            <h1>Warenkorb</h1>
                <h2>Ihre Auswahl:</h2>
                <div class="row">
                    <div class="col-md-12">
                        <div clas="produkt">
                            <table>
                                <thead>
                                   <tr>
                                      <th>Kunstwerk ID</th> <!-- Artikelnummer-->
                                      <th>PRODUKT</th>
                                      <th>LÖSCHEN</th>
                                      <th>PREIS</th>
                                   </tr>
                                </thead>
                                <tfoot>
                                   <tr><td colspan='4'>&nbsp;</td><td><a href='#' alt='Versandkosten' >Versandkosten</a> | <a href='#' alt='agb' >AGB</a></td></tr>
                                </tfoot>
                                <tbody> 
                                    <?php
                                        
                                       
                                        

                                        $aData = $_SESSION['warenkorb'];
                                        // DebugArr($aData);
                                        $htmlOutput = "";
                                        $gesamtPreis=0.0;
                                        for( $i=0; $i<count($aData);$i++ ){
                                            $htmlOutput .= "<tr>";
                                                $htmlOutput .= '<td>'.$aData[$i]['9'].'</td>';
                                                $htmlOutput .= '<td>'.$aData[$i]['1'].'</td>';
                                                $htmlOutput .= '<td><a href="./index.php?page=warenkorb&delete='.$aData[$i]['9']. '&' .session_name()."=".session_id(). '">Löschen</a></td>';
                                                $htmlOutput .= '<td>'.$aData[$i]['3'].' €</td>';
                                            $htmlOutput .= "</tr>";
                                            $gesamtPreis += $aData[$i]['3'];
                                        }
                                        


                                        if($htmlOutput == ""){
                                            echo "<tr><td colspan='5'>Dein Warenkorb is ganz leer :-( <br> <a href='index.php'> Jetzt einkaufen</a> :-D</tr></td>"; 
                                        }else{
                                            echo $htmlOutput;
                                            $gesPreis       = sprintf("%.2f",$gesamtPreis);
                                            $MwSt           = sprintf("%.2f", $gesPreis * 0.19);
                                            $PreiMitMwSt    = sprintf("%.2f", $gesPreis + $MwSt);
                                            echo "<tr class='tr2'><td colspan='4'>&nbsp;</td><td >Summe: ".$gesamtPreis." €</td></tr>";
                                            echo "<tr class='tr2'><td colspan='4'>&nbsp;</td><td>19% MwSt: ".$MwSt." €</td></tr>";
                                            echo "<tr class='tr2'><td colspan='4'>&nbsp;</td><td>Gesamtpreis: ".$PreiMitMwSt." €</td></tr>";
                                            echo "<tr class='btn_bestellen'><td colspan='4'>&nbsp;</td><td><a href='kaufen.php' type='button' class='btn btn-primary btn-sm btn-block' >JETZT BESTELLEN</a>";
                                        }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
        <div class="col-sm-2">&nbsp;</div>
    </div>
</div>
