<?php 

DebugArr( $_GET );
DebugArr( $_POST );

$dbconn = connectKunstDB( 'gast' );

$StilDS = holeStielrichtung( $dbconn );
$KuenstlerDS = holeKuenstler( $dbconn );


if (isset($_GET['menu']))
$swhere = getwhere( $_GET['menu'], $_GET['auswahl']);
$sorder = getorder( $_GET['sort'] );



$KunstwerkDS = holeKunstwerke( $dbconn , $swhere , $sorder );


?>

<div class="section container">   
    <div class="row  content">
        <h1>In der Schatzkiste stöbern</h1>
    </div>
</div>

<div class="section container bg-white">
         
    <div class="row  content">
        <div class="col-sm-3">
            <select name="sortieren">
                <option value="" selected="selected" disabled>Sortieren nach</option>
                <option value="neueste">Neuheiten</option>
                <option value="reverse">Preis austeigend</option>
                <option value="reverse">Preis abteigend</option>
            </select>
            <p>Kuenstler</p>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=kunstwerke">
                <input type="text" name="suchstring" value="suche" /> 
                <input type="submit" name="absenden" value="Senden" />
            </form>
            
            <p>Stielrichtung</p>
            <ul id="outputStilrichtung">
                <?php echo htmlOutput( $StilDS ); ?>
            </ul>
            <p>Kuenstler</p>
            <ul id="outputStilrichtung">
                <?php echo htmllistOutput( $KuenstlerDS ); ?>
            </ul>
            <p>Preis</p>
            <ul>
                <li><a href='index.php?page=kunstwerke&sort=preis&menu=preis&auswahl=20.0'>unter 20 EUR</a> </li>
                <li><a href="#">20 bis 80 EUR</a> </li>
                <li><a href="#">80 bis 140 EUR</a> </li>
                <li><a href="#">mehr als 140 EUR</a> </li>
            </ul>
            <p>Preisspanne</p>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=kunstwerke">
                <input type="text" name="min" value="min" /> 
                <input type="text" name="max" value="max" />
                <input type="submit" name="absenden" value="Senden" />
            </form>
        </div> 
        <div class="col-sm-9">
            <div class="row  content-kunstw">
                
                <?php echo htmlimgOutput( $KunstwerkDS ); ?>

                
            


            </div>
        </div> 
    </div> 
</div> 

<?php
$dbconn-->exit;// db disconnet
?>