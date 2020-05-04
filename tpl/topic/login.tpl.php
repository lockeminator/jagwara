<?php if( !isset( $_POST['eingabe']) ){ ?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Login</h1>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=registrieren">
                <label for="uname"><b>Username</b></label>
                <input type="text" name="uname" /> <!-- uebertragen werden nur felder mit name (name) und value (inhalt) -->
                <label for="passw"><b>Password</b></label>
                <input type="password" name="passw" /> <!-- uebertragen werden nur felder mit name (name) und value (inhalt) -->
                <input type="submit" name="absenden" value="Login" />
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
