<?php $aDS = holeStielrichtung(); ?>

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
                <?php echo htmlOutput( $aDS ); ?>
            </ul>
            <p>Kuenstler</p>
            <ul>
                <li><a href="#">Stielrichtung <span>(5)</span></a> </li>
                <li><a href="#">Stielrichtung <span>(5)</span></a> </li>
                <li><a href="#">Stielrichtung <span>(5)</span></a> </li>
            </ul>
            <p>Groessen</p>
            <ul>
                <li><a href="#">small</a> </li>
                <li><a href="#">middle</a> </li>
                <li><a href="#">Big</a> </li>
                <li><a href="#">BIGGER</a> </li>
            </ul>
            <p>Preis</p>
            <ul>
                <li><a href="#">unter 20 EUR</a> </li>
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
                <div class="col-sm-4">
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
                <div class="col-sm-4">
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
                <div class="col-sm-4">
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
            </div>
        </div> 
    </div> 
</div> 