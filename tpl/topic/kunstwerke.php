<?php 

//DebugArr( $_GET );
//DebugArr( $_POST );
//DebugArr( $_SESSION );

$dbconn = connectKunstDB( 'gast' );

$StilDS = holeStielrichtung( $dbconn );
$KuenstlerDS = holeKuenstler( $dbconn );
$KunstwerkDS = holeKunstwerke( $dbconn );
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
                <option name="SORT" selected="selected" enabled>Sortieren nach</option>
                <option value="neueste">Neuheiten</option>
                <option value="reverse">Preis austeigend</option>
                <option value="reverse">Preis abteigend</option>
                <input type="submit" name="sortabschicken" />
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
            
            <p>Groessen</p>
            <ul>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=150&<?php echo SID ?>">unter 15cm</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=500&<?php echo SID ?>">15cm bis 50cm</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=1500&<?php echo SID ?>">50cm bis 1,5m</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=3500&<?php echo SID ?>">1,5m bis 3,5m</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=10000&<?php echo SID ?>">über 3,5m</a> </li>
            </ul>
            
            <p>Preis</p>
            <ul>
                <li><a href="index.php?page=kunstwerke&menu=preis&auswahl=20.0&<?php echo SID ?>">unter 20 EUR</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=preis&auswahl=80.0 AND Preis >= 20.0&<?php echo SID ?>">20 bis 80 EUR</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=preis&auswahl=140.0 AND Preis >= 80.0&<?php echo SID ?>">80 bis 140 EUR</a> </li>
                <li><a href="index.php?page=kunstwerke&menu=mpreis&auswahl=140.0.SID&<?php echo SID ?>">mehr als 140 EUR</a> </li>
            </ul>
            <p>Preisspanne</p>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=kunstwerke&<?php echo SID ?>">
                <input type="text" name="min" value="min" /> 
                <input type="text" name="max" value="max" />
                <input type="submit" name="PreisAbsenden" value="Senden" />
            </form>
        </div> 
        <div class="col-sm-9">
            
                
                <?php echo htmlimgOutput( $KunstwerkDS ); ?>

            </div>
        </div> 
    </div> 
</div> 

<?php
$dbconn-->exit;// db disconnet
?>