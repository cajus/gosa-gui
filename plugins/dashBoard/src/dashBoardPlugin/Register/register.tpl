<script type="text/javascript" src="include/pwdStrength.js"></script>

<h3>{tr}GOsa registration{/tr}</h3>

{if $step == 0}

    {tr}Do you want to register GOsa and benefit from the features it brings?{/tr}
    <p>
     <input type='radio' name='registrationType' value='dontWant' id="registrationType_dontWant"
         {if $default == "dontWant"} checked {/if}>
            <b><LABEL for="registrationType_dontWant">{tr}I do not want to register{/tr}</LABEL></b>
        <p style='padding-left:20px;'>
            <!-- Add a descritive text later -->
        </p>

        <input type='radio' name='registrationType' value='registrate' id="registrationType_registrate"
            {if $default == "registrate"} checked {/if}><b><LABEL for="registrationType_registrate">{tr}Register{/tr}</LABEL></b>
        <p style='padding-left:20px;'>
        {tr}Additionally to the 'Annonomous' account you can:{/tr}
        <ul>
            <li>{tr}Access to 'Premium-Channels'.{/tr}</li>
            <li>{tr}Watch the status of current plugin updates/patches and the availability of new plugins.{/tr}</li>
            <li>{tr}Recieve newsletter, if wanted.{/tr}</li>
            <li>{tr}View several usefull statistics about your GOsa installation{/tr}.</li>
        </ul>
        </p>
           
        <p style='padding-left:20px;'>
        {tr}What information will be transmitted to the backend and maybe stored:{/tr}
        <ul>
            <li>{tr}All personal information filled in the registration form.{/tr}</li>
            <li>{tr}Information about the installed plugins and their version.{/tr}</li>
            <li>{tr}The GOsa-UUID (will be generated during the registration) and a password, to authenticate.{/tr}</li>
            <li>{tr}The bugs you will report and the corresponding trace. You can select what information you want to send in.{/tr}</li>
            <li>{tr}When the statistics extension is used. GOsa will transmit information about plugins, their usage and the amount of objects present in your ldap database. No sensitive data is transmitted here, just the object type, the action performed, cpu usage, memory usage, elapsed time...{/tr}</li>
        </ul>
        </p>
    </p>
    <hr>
    <div class="plugin-actions">
        <button name='startRegistration'>{msgPool type=okButton}</button>
    </div>

{/if}

{if $step == 1 && $default == "registrate"}
    <table>
        <tr>
            <td><LABEL for="username">{tr}Login{/tr}</LABEL></td>
            <td><input type='text' id='username' name='username' value="{$username}"></td>
        </tr>
        <tr>
            <td><LABEL for="password">{tr}Password{/tr}</LABEL></td>
            <td>{factory type='password' name='password' id='password' value={$password}}</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td><div style="color: red; font-size: small;"><i>{$error}</i></div></td>
        </tr>
    </table>
    <hr>
    <div class="plugin-actions">
        <button name='stepBack'>{msgPool type=backButton}</button>        
        <button name='registerPage1'>{msgPool type=okButton}</button>        
    </div>
{/if}

{if $step == 2 && $default == "registrate"}
    <h3>{tr}Registration complete{/tr}</h3>
    <p>
        {tr}GOsa instance successfully registered{/tr}
    </p>
    <hr>
    <div class="plugin-actions">
        <button name='registerComplete'>{msgPool type=okButton}</button>        
    </div>
{/if}

{if $step == 1 && $default == "dontWant"}
    <h3>{tr}Registration complete{/tr}</h3>
    <p>
        {tr}GOsa instance will not be registered{/tr}
    </p>
    <hr>
    <div class="plugin-actions">
        <button name='stepBack'>{msgPool type=backButton}</button>        
        <button name='registerComplete'>{msgPool type=okButton}</button>        
    </div>
{/if}
