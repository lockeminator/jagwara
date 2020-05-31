<div class="container section">
    <div class="row">
        <div class="col-sm-6">
            <img src="./img/kunstwerke/orginal/Whisky_am_Abend.jpg" alt="Beschreibung was hier dargestellt wird" title="Whisky am Abend" />
        </div>
        <div class="col-sm-6 bg-white">
            <h1 class="center">Artikelbeschreibung</h1>
            <ul class="factsKuenstler">
                <li><span>Stilrichtung</span></li>
                <li>Streetart</li>

                <li><span>Kuenstlername</span></li>
                <li>Name</li>

                <li><span>Preis</span></li>
                <li class="red">Verkauft</li>
            </ul>
            <ul>
                <li>inkl. MwSt. zzgl. Versandkosten</li>
            </ul>
            <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=warenkorb">
                <div>
                    <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                </div>
                <div class="buttonrow">
                    <input class="submitAbDamit" type="submit" name="kuenstler" value="In meen Warenkob" />
                </div>
            </form>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <h2>Informationen zum Bild</h2>
            <p>
                Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
            </p>
        </div>
    </div>
</div>>
<div class="container section">
    <h2>Weitere Werke des K&uuml;nstlers</h2>            
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
