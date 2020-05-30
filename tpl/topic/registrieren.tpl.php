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
        $userlogin = '';
        
    }
$kontaktart =  htmlkontaktart( holekontaktart( $dbconn ) );
?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Registrieren</h1>
                <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>

            <form method="post" action="<?php echo getUrl(); ?>index.php?page=registrieren">
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
                    <div class="input">
                <!-- // __Anrede -->

                <!--//Titel-->
                    
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
                <?php 
                    if( isset($_SESSION['User']) && $_SESSION['User'] === 'isIN') {
                        echo '<input type="submit" name="regupdate" value="REGRESTRIERUNG UPDATEEN" />';
                        }
                    else { 
                        echo '<input type="submit" name="regsenden" value="REGRESTRIEREN" />';
                        }
                ?>
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

