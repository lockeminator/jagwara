<?php



/* ****************************************  
 * >>> VIEW
 * **************************************** */
// Include: Page-Backend
    include("inc/dbconn.inc.php");	// db connet.inc	
    include("inc/sql.inc.php");
    include("inc/html.inc.php");	// html.inc 
    include("inc/fun.inc.php");		//dbfunktion.inc

// Include: Page-Configurationen
    include("inc/config.inc.php");   // php.inc
    
// Include: Page-Frontend
    include("tpl/header.inc.php");
    include("tpl/topic/".$file.""); 
    include("tpl/footer.inc.php"); 
?>