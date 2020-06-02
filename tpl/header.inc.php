<?php 
$out = '';
$Errorstring = '';
if (isset($_POST['loginsenden']))
    $Errorstring .= LoginComplete();

if(isset($_POST['regsenden']))
    $Errorstring .= Registrieren( );

if(isset($_POST['regupdate']))
    $Errorstring .= regupdate( );

if( isset( $_SESSION['save']['uid'] ) ){
  $conn = connectKunstDB( 'gast' );
      $sql='SELECT COUNT(*) AS Anzahl FROM warenkorb WHERE Kunden_ID='. $_SESSION['save']['uid']; // suche nach ID in DB
      // print("$sql");
      $result= $conn->query( "$sql" );         
            
      if ( !$result ){
              echo "<div><b>Abfrage fehlgeschlagen!</b><br />".
              $sql."<br />".
              $conn->errno . ": " . $conn->error . "</div>";
          }
      else {    
      $row=$result->fetch_assoc(); 
      
      }
// return $row;
}
if (isset($_POST['regkuenstler']) )
  $Errorstring .= insertkuenstler();

if(isset($_POST['updatekuenstler']))
  $Errorstring .= updatekuenstler();

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Kunst.de – ☮ </title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
        <meta name="keywords" content="Kunstwerke Online kaufen" />
        <meta name="description" content="Erstellen Sie eine Website zu einem frei gewÃ¤hlten Thema." />
        <meta name="page-topic" content="Kuns" />
        <meta name="robots" content="index, follow" />
        <meta name="author" content="Buhn, Friedel, Vietzke" />
        <meta name="publisher" content="Buhn, Friedel, Vietzke" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no"  />
        <meta name="geo.region" content="DE-BE" />
        <meta name="geo.placename" content="Berlin" />
        <meta name="city" content="Berlin" />
        <meta name="zipcode" content="10555" />
        <meta name="country" content="Germany" />
        <link rel="shortcut icon" href="favicon.ico" />
<?php // css ?>
        <link href="css/layout.css" rel="stylesheet" type="text/css" />
        <link href="css/navi.css" rel="stylesheet" type="text/css" />
        <link href="css/helper.css" rel="stylesheet" type="text/css" />
        <link href="css/content.css" rel="stylesheet" type="text/css" />
        <link href="css/slider.css" rel="stylesheet" type="text/css"/>
        <link href="css/responsive.css" rel="stylesheet" type="text/css" />
<?php // SKRIPTE ?>
        <script src="<?php echo getUrl(); ?>js/libs/jquery.min.1.8.3.js" type="text/javascript"></script>
        <script src="<?php echo getUrl(); ?>js/responsiveslides.js" type="text/javascript"></script>
        <script src="<?php echo getUrl(); ?>js/main.js" type="text/javascript"></script>
    </head>
    <body>
<?php
        echo"\t <div id=\"page\"> \n";              // div Ende in footer.inc.php
            echo "\t\t <div id=\"wrapper\"> \n";    // div Ende in footer.inc.php
?>
                <div id="header">
                    <div id="navigation">
                        <div class="container">
                            <div class="brand">
                                <a href="<?php echo getUrl(); ?>?<?php echo SID; ?>" id="logo" title="Herzlich Willkommen">
                                    <img src="<?php echo getUrl(); ?>img/layout/stb-logo-200px.png" alt="logo" />
                                </a>
                            </div>
                            <input type="checkbox" id="check1" name="nine" value="none" />
                            <label for="check1" class="switch_menu"> <!--leer--> </label>
                            <div id="nav" class="navMobile">
                                <ul>
                                    <li id="li_home">
                                       <a href="<?php echo getUrl();?>index.php?page=home&<?php echo SID; ?>" <?php if( $page == "home" ) echo 'class="active"'; ?> >
                                           <span class="">&#8962;</span>
                                       </a>
                                    </li>
                                    <li id="li_kunstwerke">
                                       <a href="<?php echo getUrl();?>index.php?page=kunstwerke&<?php echo SID; ?>" <?php if( $page == "kunstwerke" ) echo 'class="active"'; ?> >
                                           <span>Kunstwerke</span>
                                       </a>
                                    </li>  
                                    <li id="li_wir">
                                       <a href="<?php echo getUrl();?>index.php?page=wir&<?php echo SID; ?>" <?php if( $page == "wir" ) echo 'class="active"'; ?> >
                                           <span>&Uuml;ber uns</span>
                                       </a>
                                    </li>  
                                    <li id="li_kontakt">
                                       <a href="<?php echo getUrl(); ?>index.php?page=kontakt&<?php echo SID; ?>" <?php if( $page == "kontakt" ) echo 'class="active"'; ?>>
                                           <span>Kontakt</span>
                                       </a>
                                    </li>
                                </ul>
                                <ul>
                                <?php if( isset($_SESSION['User']) && isset($_SESSION['User']) == 'isIn'){?>
                                        
                                        <li id="li_registrieren">
                                           <a href="<?php echo getUrl();?>index.php?page=registrieren&<?php echo SID; ?>" <?php if( $page == "registrieren" ) echo 'class="active"'; ?> >
                                               <span>Status-Update</span>
                                           </a>
                                        </li>
                                    
                                        <li id="li_logout">
                                           <a href="<?php echo getUrl();?>index.php?page=logout&<?php echo SID; ?>">
                                               <span>Logout</span>
                                           </a>
                                        </li>
                                <?php  
                                        if(isset($_SESSION['save']['uid'])) {
                                        $out .= '<li id="li_warenkorb">'.
                                          $out .= '<a href="index.php?page=warenkorb&' .session_name().'=' .session_id().'"><span>&#10177; ('. $row['Anzahl'] .')</span></a>'.
                                        $out .= '</li>';
                                        echo $out;
                                        }
                                 }else{ ?>

                                        <li id="li_registrieren">
                                           <a href="<?php echo getUrl();?>index.php?page=registrieren&<?php echo SID; ?>" <?php if( $page == "registrieren" ) echo 'class="active"'; ?> >
                                               <span>Registrieren</span>
                                           </a>
                                        </li>
                                        <li id="li_login">
                                           <a href="<?php echo getUrl();?>index.php?page=login&<?php echo SID; ?>" <?php if( $page == "login" ) echo 'class="active"'; ?> >
                                               <span>Login</span>
                                           </a>
                                        </li>
                                
                                <?php  }   ?>
                                       
                                    
                                    
                                  
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <?php echo "<div id=\"content\">";  // div Ende in footer.inc.php ?>
                <!-- <p><div class="error"><?php echo $ErrorString; ?></div></p>-->