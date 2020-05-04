     <?php echo "\t\t\t\t</div>"  // id content ENDE ?>
                <div id="footer">
                    <div class="container">
                        <div class="footerAdvice">
                            <ul>   
                                <li>
                                    ☮ <?php echo date("Y") ." • ".$firma." • ". $strasse." • ".$plz?>
                                </li>
                                <li>
                                    <a href="<?php echo getUrl(); ?>index.php?page=datenschutz" <?php if( $page == "datenschutz" ) echo 'class="active"'; ?>>
                                        <span>Datenschutzerklaerung</span>
                                    </a>
                                     •
                                    <a href="<?php echo getUrl(); ?>index.php?page=impressum" <?php if( $page == "impress" ) echo 'class="active"'; ?>>
                                        <span>Impressum </span>
                                    </a>
                                </li>
                                <li>
                                    <a id="toTop" href="#page" title="Zurück zum Seitenanfang"><span>Zurück zum Seitenanfang</span></a>
                                </li>
                                <li>
                                    <a href="http://validator.w3.org/check?uri=referer">
                                        <img src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Strict" height="21" width="60" />
                                    </a>
                                     <a href="http://jigsaw.w3.org/css-validator/check/referer">
                                        <img src="http://jigsaw.w3.org/css-validator/images/vcss"
                                            alt="CSS ist valide!"
                                            height="21" width="60" />
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
<?php 
    echo"\t\t\t </div> \n";     // div wrapper  ENDE (Beginn in header.inc.php)
    echo "\t\t </div> \n";      // div page     ENDE (Beginn in header.inc.php) 
?>
    </body>
</html>