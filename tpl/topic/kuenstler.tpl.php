<div class="container section">
    <div class="row">
        <h1 class="center">K&uuml;nstlerbeschreibung</h1>
        <div class="col-sm-6 bg-white">
            <ul class="factsKuenstler">
                <li><span>K&uuml;nstlername</span></li>
                <li>Dschingis Khan</li>

                <li><span>Stilrichtung</span></li>
                <li>Bockwurst</li>

            </ul>
            <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=kunstwerke">
                <div>
                    <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                </div>
                <div class="buttonrow">
                    <input class="submitAbDamit" type="submit" name="kuenstler" value="Zur&uuml;ck zur &Uuml;bersicht" />
                </div>
            </form>
        </div>
        <div class="col-sm-6 bg-white">
            <p>
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
            </p>
        </div>
    </div>
</div>
<div class="container section">
    <h2>Werke des K&uuml;nstlers</h2>            
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
    </div>
</div>    
