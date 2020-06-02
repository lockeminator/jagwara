<?php
DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION );
$output = '';



$dbconn = connectKunstDB( 'gast' );
$Kunstwerk = holeEinKunstwerke( $dbconn );
$KunstwerkDS = holeKunstwerke( $dbconn );

?>
<div class="container section">
    <div class="row">
        <div class="col-sm-6">
            <img src="./img/kunstwerke/orginal/<?php echo $Kunstwerk['Image']; ?>" alt="Beschreibung was hier dargestellt wird" title="Whisky am Abend" />
        </div>
        <div class="col-sm-6 bg-white">
            <h1 class="center"><?php echo $Kunstwerk['Titel']; ?></h1>
            <ul class="factsKuenstler">
                <li><span>Stilrichtung</span></li>
                <li><?php echo $Kunstwerk['Stilrichtung']; ?></li>

                <li><span>Kuenstlername</span></li>
                <li><?php echo $Kunstwerk['Kuenstlername']; ?></li>

                <li><span>Preis</span></li>
<?php
 
    echo $output = changeSOLD($Kunstwerk['Kauf_Zeitstempel'], $Kunstwerk['Preis']);         
?>
               <!-- <li class="red">Verkauft</li> -->
            

            </ul>
            <ul>
                <li>ohne MwSt. oder Versandkosten</li>
            </ul>
            
            <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=warenkorb&<?php echo session_name();?>=<?php echo session_id();?>">
                
                    <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                    <input type="hidden" name="Kaufe" value="<?php echo $Kunstwerk['Kunstwerk_ID']; ?>" />
                <div class="buttonrow">
                    <input class="submitAbDamit" type="submit" name="kuenstler" value="In meen Warenkob" />
                </div>
            </form>
        
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h2>Informationen zum Bild</h2>
            
            <?php 
                if($Kunstwerk['Beschreibung'] !== NULL)
                    echo '<p>'. $Kunstwerk['Beschreibung'] .'</p>';
            ?>
                <ul>
                    <li><b>Herstelldatum</b> = <?php echo $Kunstwerk['Herstelldatum']; ?></li>
                    <li><b>Höhe</b> = <?php echo $Kunstwerk['Hoehe']; ?> cm</li>
                    <li><b>Breite</b> = <?php echo $Kunstwerk['Breite']; ?> cm</li>
                    <li><b>Gewicht</b> = <?php echo $Kunstwerk['Hoehe']; ?> g</li>
                    
                </ul>    
            
            <h2>Informationen zum Künstler: <?php echo $Kunstwerk['Kuenstlername']; ?></h2>
            
                <?php 
                    if($Kunstwerk['Vita'] !== NULL)
                    echo '<p>'. $Kunstwerk['Vita'] .'</p>';
                ?>  
            
        </div>
    </div>
</div>>
<div class="container section">
    <h2>Weitere Werke des K&uuml;nstlers</h2>            
    <div class="section container bg-white">
        <?php echo htmlhomeimgOutput( $KunstwerkDS ); ?>
    </div>

<!--
    <div class="row  content-kunstw">
        <div class="col-sm-3">
             <a href="#">
                <img src="img/kunstwerke/kunstwerk.jpg" alt="Kunstwerkname von Kuenstlername" title="Kunstwerkname von Kuenstlername" />
                <p class="label-header"><span>Kunstrichtung:</span>Kuenswerkname</p>
                <p class="label-name">
                    Kuenstler-Vname Nname
                    <span class="isIn">Preis</span>
                    <span class="isOut">Verkauft</span>
                </p>
            </a>
        </div>
        <div class="col-sm-3">
             <a href="#">
                <img src="img/kunstwerke/kunstwerk.jpg" alt="Kunstwerkname von Kuenstlername" title="Kunstwerkname von Kuenstlername" />
                <p class="label-header"><span>Kunstrichtung:</span>Kuenswerkname</p>
                <p class="label-name">
                    Kuenstler-Vname Nname
                    <span class="isIn">Preis</span>
                    <span class="isOut">Verkauft</span>
                </p>
            </a>
        </div>
        <div class="col-sm-3">
             <a href="#">
                <img src="img/kunstwerke/kunstwerk.jpg" alt="Kunstwerkname von Kuenstlername" title="Kunstwerkname von Kuenstlername" />
                <p class="label-header"><span>Kunstrichtung:</span>Kuenswerkname</p>
                <p class="label-name">
                    Kuenstler-Vname Nname
                    <span class="isIn">Preis</span>
                    <span class="isOut">Verkauft</span>
                </p>
            </a>
        </div>
        <div class="col-sm-3">
             <a href="#">
                <img src="img/kunstwerke/kunstwerk.jpg" alt="Kunstwerkname von Kuenstlername" title="Kunstwerkname von Kuenstlername" />
                <p class="label-header"><span>Kunstrichtung:</span>Kuenswerkname</p>
                <p class="label-name">
                    Kuenstler-Vname Nname
                    <span class="isIn">Preis</span>
                    <span class="isOut">Verkauft</span>
                </p>
            </a>
        </div>
-->   
    </div>
</div>    
