<?php if( !isset( $_POST['eingabe']) ){ ?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=registrieren">
                <input type="text" name="eingabe" /> <!-- uebertragen werden nur felder mit name (name) und value (inhalt) -->
                <input type="submit" name="absenden" value="Senden" />
            </form>
            </div>
        
        <div class="col-sm-3">&nbsp;</div>
    </div>
</div>



<?php }else{ ?>

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

<?php } ?>