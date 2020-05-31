<div class="container section">
    <div class="row">
        <div class="col-sm-12 center">
            <h1>Kontakt</h1>
        </div>
    </div>
    <div class="row bg-white">
        <div class="col-sm-12 col-lg-6">
            <div id="tableKontakt">
                <h2>Kontakt</h2>
                <table>
                    <thead>
                       <tr>
                           <th colspan="2">Kunstwerkstatt – Kunst.de</th>
                       </tr>
                    </thead>
                    <tbody>
                       <tr>
                          <td>Straße: </td>
                          <td>Bochumer Straße 8b </td>
                       </tr>
                       <tr>
                            <td>PLZ</td>
                            <td>10555 Berlin</td>
                       </tr>
                       <tr>
                            <td>Telefon</td>
                            <td>+49(0)30 3 90 00 60</td>
                       </tr>
                        <tr>
                            <td>Telefon</td>
                            <td>+49(0)30 - 39 00 06 - 0</td>
                       </tr>
                        <tr>
                            <td>E-Mail</td>
                            <td><a href="mailto:info@technikerschule-berlin.de">info@technikerschule-berlin.de</a></td>
                       </tr>
                        <tr>
                            <td>Web</td>
                            <td><a href="http://www.technikerschule-berlin.de/">www.technikerschule-berlin.de</a></td>
                       </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <div id="formContain" class="col-sm-12 col-lg-6">
            <h2>Schreiben Sie uns.</h2>
            <form class="regularForm" action="<?php // action_page.php ?>" method="post">
                <div class="input">
                    <label for="vname">Vorname</label>
                    <input type="text" id="vname" name="vname" />
                </div>
                <div class="input">
                    <label for="nname">Nachname</label>
                    <input type="text" id="nname" name="nname" />
                </div>
                <div class="input">
                    <label for="absender">Ihre E-Mail-Adresse</label>
                    <input type="text" id="absender" name="absender" />
                </div>
                <div class="input">
                    <label for="betreff">Betreff</label>
                    <input type="text" id="betreff" name="betreff" />
                </div>
                <div class="input">
                    <label for="nachricht"><span>Ihre Nachricht</span></label>
                    <textarea id="nachricht" name="nachricht" cols="20" rows="5"></textarea>
                </div>
                <div class="buttonrow">
                    <input class="submitAbDamit" type="submit" value="Abschicken" />
                </div>
            </form>
        </div>
    </div>
</div>
<div class="section">
    <div class="row">
        <div class="col-sm-12">
            <div id="gkarte">&nbsp;</div>
        </div>
    </div>
</div>
