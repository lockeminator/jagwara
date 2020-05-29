<?php


DebugArr( $_GET );
DebugArr( $_POST );
DebugArr( $_SESSION ); 
$Errorstring = '';

if (isset($_POST['loginsenden']))
{
    if ( !empty($_POST['uname']) && !empty($_POST['passw'])   )  
    {
    $cluname = htmlentities($_POST['uname']);
    $clpassw = htmlentities($_POST['passw']);
        if (strlen($cluname) <= 64 && strlen($clpassw) <= 64)
        {
            $dbconn = connectKunstDB( 'login' );
            $uid = GetUIDByLogin( $dbconn, $clpassw, $cluname );
            if ($uid > 1 ) {
                $_SESSION['User'] = 'isIN';
                $_SESSION['save']['uid'] = $uid;
                
                header("Location: ./index.php?".session_name()."=".session_id() );
            }
            else $Errorstring ="Benutzerkonto nicht gefunden";
        }
    }
    else $Errorstring = "Login Daten nicht vollständig";
}


?>


<div class="container section">
    <div class="row">
        <div class="col-sm-3">&nbsp;</div>
        
            <div class="col-sm-6 bg-white">
            <h1 class="center">Login</h1>
                <?php if(isset($Errorstring)) echo $err = ErrorDiv($Errorstring); ?>
            <form method="post" action="<?php echo getUrl(); ?>index.php?page=login">
                <label for="uname"><b>Username</b></label>
                <input type="text" name="uname" /> <!-- uebertragen werden nur felder mit name (name) und value (inhalt) -->
                <label for="passw"><b>Password</b></label>
                <input type="password" name="passw" /> <!-- uebertragen werden nur felder mit name (name) und value (inhalt) -->
                <input type="submit" name="loginsenden" value="Login" />
            </form>
            </div>
        
        <div class="col-sm-3">&nbsp;</div>
    </div>
</div>

