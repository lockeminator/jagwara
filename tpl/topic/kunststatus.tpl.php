<?php 

DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION ); 
$Errorstring = '';

if (isset($_POST['regkuenstler']) )
	$Errorstring = insertkuenstler();
?>
<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
                <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>

            <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=KuenstlerStatus">
                <div class="input">
                    <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                    
                    <label for="Kuestlername"><b>Künstlername</b></label>
                    <input type="text" name="Kuenstlername" value=""/>

                    <label for="Vita"><b>Geschichte</b></label>
                    <input type="text" name="Vita" value=""/>

                    <label for="IBAN"><b>IBAN</b></label>
                    <input type="text" name="IBAN" value=""/>

                    <label for="BIC"><b>BIC</b></label>
                    <input type="text" name="BIC" value=""/>
                </div>
                <div class="buttonrow">
                	<input type="submit" name="regkuenstler" value="REGRESTRIEREN" />
            	</div>
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
