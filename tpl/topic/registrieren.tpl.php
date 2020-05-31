<?php 

DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION ); 
$button = '';


$dbconnl = connectKunstDB( 'login' );

$dbconn = connectKunstDB( 'kunde' );

if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN')
    {
        $userlogin = holeuserlogin( $dbconnl , $_SESSION['save']['uid'] );
        $userdate = holeuserdate( $dbconn , $_SESSION['save']['uid'] );
    }
    else{
        $userdate[0]['Titel'] = '';
        $userdate[0]['Vorname'] = '';
        $userdate[0]['Nachname'] = '';
        $userdate[0]['Anrede'] = '';
        $userdate[0]['Strasse'] = '';
        $userdate[0]['PLZ'] = '';
        $userdate[0]['Ort'] = '';
        $userdate[0]['Frau']    = '';
        $userdate[0]['Herr']    = '';
        $userdate[0]['Divers']  = '';

        $userlogin = '';
        
    }
$kontaktart =  htmlkontaktart( holekontaktart( $dbconn ) );
?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        <div id="formContain" class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
            <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>

                <form class="regularForm" method="post" action="<?php echo getUrl(); ?>index.php?page=registrieren">
                    <div>
                        <input type="hidden" name="<?php echo  session_name(); ?>" value="<?php echo session_name();?>" />
                    </div>
                <!-- Login    -->
                    <h2>Login Daten</h2>
                    <div class="input">
                        <label for="username"><b>Benutzername</b></label>
                        <input type="text" name="username" value="<?php echo $userlogin; ?>"/>

                        <label for="pwd"><b>Passwort</b></label>
                        <input type="text" name="pwd" />
                        <label for="pwd2"><b>Passwort wiederholen</b></label>
                        <input type="text" name="pwd2" />
                    </div>
                    <h2>Persönliche Angaben</h2>
                <!-- // __Anrede -->
                    <div class="fieldBox">
                        <div class="label">Anrede <span class="red">*</span></div>
                        <select id="gender" class="validate[required]" name="anrede">
                            <option value="">Auswahl...</option>
                            <option value="Frau" <?php if( isset($userdate[0]['Anrede']) && $userdate[0]['Anrede'] == 'Frau' ){   echo 'selected="selected"'; } ?>>Frau</option>
                            <option value="Herr" <?php if( isset($userdate[0]['Anrede']) && $userdate[0]['Anrede'] == 'Mann' ){   echo 'selected="selected"'; } ?>>Herr</option>
                            <option value="Herr" <?php if( isset($userdate[0]['Anrede']) && $userdate[0]['Anrede'] == 'Divers' ){ echo 'selected="selected"'; } ?>>Divers</option>
                        </select>
                    </div>
                <!--//Titel-->
                    <div class="input">
                        <label for="titel"><b>Titel</b></label>
                        <input type="text" name="titel" value="<?php echo $userdate[0]['Titel']; ?>"/>

                <!--//Vorname-->

                        <label for="vname"><b>Vorname</b></label>
                        <input type="text" name="vname" value="<?php echo $userdate[0]['Vorname']; ?>"/>
                <!--//Nachname-->

                        <label for="nname"><b>Nachname</b></label>
                        <input type="text" name="nname" value="<?php echo $userdate[0]['Nachname']; ?>"/>
                    </div>

                    <h2>Lieferadresse</h2>
                    <div class="input">
                    <!--//Straße hnr.-->
                        <label for="str"><b>Straße und Hausnr.</b></label>
                        <input type="text" name="str" value="<?php echo $userdate[0]['Strasse']; ?>"/>
                    <!--//PLZ-->
                        <label for="plz"><b>PLZ</b></label>
                        <input type="int" name="plz" value="<?php echo $userdate[0]['PLZ']; ?>"/>
                    <!--//ORT-->
                        <label for="ort"><b>Ort</b></label>
                        <input type="text" name="ort" value="<?php echo $userdate[0]['Ort']; ?>"/>
                    </div>
                    <h2>Kontaktaufnahme</h2>
                    <!--//Kontaktarten-->
                    <div class="input">
                        <?php echo $kontaktart; ?>
                    </div>
                    <div class="buttonrow">
                        <?php 
                            if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN') {
                                echo '<input class="submitAbDamit" type="submit" name="regupdate" value="REGRESTRIERUNG UPDATEEN" />';
                                }
                            else { 
                                echo '<input class="submitAbDamit" type="submit" name="regsenden" value="REGRESTRIEREN" />';
                                }
                        ?>
                    </div>
                </form>
            <?php 
            if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN'){
                $button .= '<form method="post" action="./index.php?page=KuenstlerStatus&'.session_name().'='.session_id().'">';
                $button .= '<input type="submit" name="kustupdate" value="Künstel werden" /></form>';
                $button .= '</form>'; 
            }
            echo $button;
            ?>              
            <div class="col-sm-3">&nbsp;</div>
        </div>
    </div>
</div>

