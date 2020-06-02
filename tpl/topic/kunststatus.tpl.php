<?php 
/*
DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION ); 
*/


$botton ='';
$dbconn = connectKunstDB( 'kuenstler' );


$ds = getkuenstlerdata( $dbconn );
if (isset($ds['IBAN']))
$botton = getBilduploadB( $dbconn);

?>
<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
                <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>

            <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=KuenstlerStatus&<?php echo SID; ?>">
                <div class="input">
                    <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                    
                    <label for="Kuestlername"><b>Künstlername</b></label>
                    <input type="text" name="Kuenstlername" value="<?php echo $ds['Kuenstlername']?>"/>

                    <label for="Vita"><b>Geschichte</b></label>
                    <input type="text" name="Vita" value="<?php echo $ds['Vita']?>"/>

                    <label for="IBAN"><b>IBAN</b></label>
                    <input type="text" name="IBAN" value="<?php echo $ds['IBAN']?>"/>

                    <label for="BIC"><b>BIC</b></label>
                    <input type="text" name="BIC" value="<?php echo $ds['BIC']?>"/>
                </div>
                <div class="buttonrow">
                    <?php if(!isset($ds['IBAN']))
                        echo '<input type="submit" name="regkuenstler" value="REGRESTRIEREN" />';
            	    else echo '<input type="submit" name="updatekuenstler" value="__Daten Update__" />';      
                    ?>
                </div>
                <?php echo $botton; ?>
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
                    <a href="<?php echo getUrl(); ?>index.php?page=login.SID</a>"
                
                </div>
                <div class="col-sm-2">&nbsp;</div>
            </div>
        </div>
