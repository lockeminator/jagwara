 
<?php // Slider ?>


<div id="imgSlider" class="container">
    <div class="row">
        <div class="callbacks_container">
            <ul class="rslides" id="slider">
                <li>
                    <img src="./img/slider/img-01.png" alt="">
<!--                    <p class="caption">This is a caption</p>-->
              </li>
              <li>
                    <img src="./img/slider/img-02.png" alt="">
                    <p class="caption">Das ist eine Bildbeschreibung in einem &lt;p&gt;-tag</p>
              </li>
              <li>
                <div id="hero-slide">
                    <div class="heroA">Sei immer <br />&nbsp;&nbsp;&nbsp;du selbst! *</div>
                    <div class="heroB">*Au&szlig;er du kannst <span>Datentechniker</span> sein, <span class="hidden-lg"><br /></span>dann sei Datentechniker.</div>
                    <img src="./img/slider/img-03.png" alt="">                    
<!--                    <p class="caption">The third caption</p>-->
                </div>
              </li>
            </ul>
        </div>
    </div>
</div>


    <div class="section container">
        <div class="row"><h1>Beliebte Werke & gefragte Künstler</h1></div>
    </div>



<?php // Ab hier Content Ausgabe - 2 mal 4 Felder ausgeben ?>

     <div class="section container bg-white">
         
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
         
 <?php // Naechste Zeile ?>
         
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


<?php // Content Ausgabe Ende und der Rest is ohne SQL ?>


<div id="home-bg">
     <div class="shopWindow section"> 
         <div>
            <div class="container">
                <div class="col-sm-12 butten-zu-kunstwerke">
                    <a href="<?php echo getUrl();?>index.php?page=kunstwerke">
                        <span>Jetzt alle ansehen</span>
                    </a> 
                </div>
            </div>
        </div>
     </div>
</div>




    <div class="section container">
        <div class="row">
            <h1>Bei uns wird SICHERHEIT ganz groß geschrieben</h1>
            <h2>Käuferschutz und Datenschutz</h2>
        </div>
    </div>

     <div class="container section bg-white"> 
         <div class="row">
             <div class="col-sm-4">
                 <h3>Geprüfter Online-Shop</h3>
                 <p>Für Ihr Vertrauen</p> 
             </div>
             <div class="col-sm-4">
                 <h3>Sicher shoppen</h3>
                 <p>Mit SSL GDPR</p> 
             </div>
             <div class="col-sm-4">
                 <h3>Geprüfte Werke</h3>
                 <p>Zertififiziert auf Echtheit</p> 
             </div>
         </div>
     </div> 


    <div class="section container">
        <div class="row">
            <h1>Warum online kaufen - Wir über uns als virtuelles Auktionshaus</h1>
            <h2>Käuferschutz und Datenschutz </h2>
        </div>
    </div>


    <div class="container section bg-white"> 
         <div class="row">
             <div class="col-sm-6 img-pferd"></div>
             <div class="col-sm-6">
                 <h3>Rechts</h3>
                 <p>Mit SSL GDPR</p> 
             </div>
         </div>
     </div> 