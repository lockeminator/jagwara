<?php



/* ****************************************  
 * >>> VIEW
 * **************************************** */
<<<<<<< HEAD
=======
// Include: Page-Configurationen
    include("inc/config.inc.php");   // php.inc

>>>>>>> master
// Include: Page-Backend
    include("inc/dbconn.inc.php");	// db connet.inc	
    include("inc/sql.inc.php");
    include("inc/html.inc.php");	// html.inc 
    include("inc/fun.inc.php");		//dbfunktion.inc
<<<<<<< HEAD

// Include: Page-Configurationen
    include("inc/config.inc.php");   // php.inc
=======
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes

Kunst_Session();
>>>>>>> master
    
// Include: Page-Frontend
    include("tpl/header.inc.php");
    include("tpl/topic/".$file.""); 
    include("tpl/footer.inc.php"); 
?>