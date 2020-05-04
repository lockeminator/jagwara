<?php
/* ****************************************  
 * >>> VIEW
 * **************************************** */
// Include: Page-Configurationen
    include("inc/config.inc.php");

// Include: Page-Backend
    include("inc/dbconn.inc.php");
    include("inc/sql.inc.php");
    include("inc/html.inc.php");
    include("inc/fun.inc.php");


    
// Include: Page-Frontend
    include("tpl/header.inc.php");
    include("tpl/topic/".$file.""); 
    include("tpl/footer.inc.php"); 
?>