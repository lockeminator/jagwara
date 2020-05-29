<?php 

DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION ); 
DebugArr( $_COOKIE ); 


//$kontaktart = holekontaktart( $dbconn );

?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
                <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>

            <form method="post" action="<?php echo getUrl(); ?>index.php?page=registrieren">
                <h2>Persönliche Angaben</h2>

                <!-- // __Anrede -->

                <!--//__Titel-->
                    <div class="input">
                        <label for="titel"><b>Titel</b></label>
                        <input type="text" name="titel" />
                    </div>
                <!--//__Vorname-->
                    <label for="vname"><b>Vorname</b></label>
                    <input type="text" name="vname" />
                <!--//__Nachname-->
                    <label for="nname"><b>Nachname</b></label>
                    <input type="text" name="nname" />
                
                <h2>Lieferadresse</h2>
                <!--//__Straße hnr.-->
                    <label for="str"><b>Straße und Hausnr.</b></label>
                    <input type="text" name="str" />
                <!--//__PLZ-->
                    <label for="plz"><b>PLZ</b></label>
                    <input type="text" name="plz" />
                <!--//__ORT-->
                    <label for="ort"><b>Ort</b></label>
                    <input type="text" name="ort" />
                <h2>Kontaktaufnahme</h2>
                <!--//__Kontaktarten-->

                   

                
                <input type="submit" name="regsenden" value="REGRESTRIEREN" />
            </form>
    
        
        <div class="col-sm-3">&nbsp;</div>
    </div>
</div>





        <div class="container section">
            <div class="row">
                <div class="col-sm-2">&nbsp;</div>
                <div class="col-sm-8">
                    <h2>Daten jesendet.</h2>
                    <p>Jetzt kann man sich einloggen.</p>
                    <a href=" <?php echo getUrl(); ?> index.php?page=login"
                
                </div>
                <div class="col-sm-2">&nbsp;</div>
            </div>
        </div>

