<?php 

DebugArr( $_GET );
DebugArr( $_POST );
<<<<<<< HEAD
DebugArr( $_SESSION );
=======
<<<<<<< Updated upstream
=======
DebugArr( $_SESSION );
>>>>>>> Stashed changes
>>>>>>> master

$dbconn = connectKunstDB( 'gast' );

$StilDS = holeStielrichtung( $dbconn );
$KuenstlerDS = holeKuenstler( $dbconn );

<<<<<<< HEAD
=======
<<<<<<< Updated upstream

if (isset($_GET['menu']))
$swhere = getwhere( $_GET['menu'], $_GET['auswahl']);
$sorder = getorder( $_GET['sort'] );


=======
>>>>>>> master
if (isset($_GET['menu'])){
    $swhere = getwhere( $_GET['menu'], $_GET['auswahl']);
}
else {
    $swhere = '';
}

if (isset($_GET['sort'])){
    $sorder = getorder( $_GET['sort'] );
}
else {
    $sorder = '';
}
if (isset($_POST['PreisAbsenden'])) $swhere = Preisspanne();
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master

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
<<<<<<< HEAD
                <option name="SORT" selected="selected" disabled>Sortieren nach</option>
=======
<<<<<<< Updated upstream
                <option value="" selected="selected" disabled>Sortieren nach</option>
=======
                <option name="SORT" selected="selected" disabled>Sortieren nach</option>
>>>>>>> Stashed changes
>>>>>>> master
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
<<<<<<< HEAD
=======
<<<<<<< Updated upstream
            <p>Preis</p>
            <ul>
                <li><a href='index.php?page=kunstwerke&sort=preis&menu=preis&auswahl=20.0'>unter 20 EUR</a> </li>
                <li><a href="#">20 bis 80 EUR</a> </li>
                <li><a href="#">80 bis 140 EUR</a> </li>
                <li><a href="#">mehr als 140 EUR</a> </li>
=======
>>>>>>> master
            
            <p>Groessen</p>
            <ul>
                <li><a href="index.php?page=kunstwerke&menu=gross&auswahl=150">unter 15cm</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=gross&auswahl=500'>15cm bis 50cm</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=gross&auswahl=1500'>50cm bis 1,5m</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=gross&auswahl=3500'>1,5m bis 3,5m</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=gross&auswahl=10000'>über 3,5m</a> </li>
            </ul>
            
            <p>Preis</p>
            <ul>
                <li><a href='index.php?page=kunstwerke&menu=preis&auswahl=20.0'>unter 20 EUR</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=preis&auswahl=80.0 AND Preis >= 20.0'>20 bis 80 EUR</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=preis&auswahl=140.0 AND Preis >= 80.0'>80 bis 140 EUR</a> </li>
                <li><a href='index.php?page=kunstwerke&menu=mpreis&auswahl=140.0.SID'>mehr als 140 EUR</a> </li>
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
>>>>>>> master
            </ul>
            <p>Preisspanne</p>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=kunstwerke">
                <input type="text" name="min" value="min" /> 
                <input type="text" name="max" value="max" />
<<<<<<< HEAD
                <input type="submit" name="PreisAbsenden" value="Senden" />
=======
<<<<<<< Updated upstream
                <input type="submit" name="absenden" value="Senden" />
=======
                <input type="submit" name="PreisAbsenden" value="Senden" />
>>>>>>> Stashed changes
>>>>>>> master
            </form>
        </div> 
        <div class="col-sm-9">
            <div class="row  content-kunstw">
                
                <?php echo htmlimgOutput( $KunstwerkDS ); ?>

<<<<<<< HEAD
=======
<<<<<<< Updated upstream
                
            


=======
>>>>>>> Stashed changes
>>>>>>> master
            </div>
        </div> 
    </div> 
</div> 

<?php
$dbconn-->exit;// db disconnet
?>