
<table width="100%">
    <tr>
        <td style="width:50%">
            <h3>{tr}Installation type{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for="installTemplate">{tr}Template{/tr}</LABEL></td>
                    <td>
                        {render acl=$installTemplateACL}
                        <select name="installTemplate" size=1 onChange="document.mainform.submit();">
                            {html_options options=$installTemplateList 
                            selected=$installTemplate}
                        </select>
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for="installRelease">{tr}Release{/tr}</LABEL></td>
                    <td>
                        {render acl=$installReleaseACL}
                        <select name="installRelease" size=1 onChange="document.mainform.submit();">
                            {html_options options=$installReleaseList 
                            selected=$installRelease}
                        </select>
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for="installConfigManagement">{tr}Config management{/tr}</LABEL></td>
                    <td>
                        {render acl=$installConfigManagementACL}
                        <select name="installConfigManagement" size=1 onChange='document.mainform.submit();'>
                            {html_options options=$installConfigManagementList 
                            selected=$installConfigManagement}
                        </select>
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
        <td style='width:50%; vertical-align: top;padding-left:5px;' class='left-border'>
            <h3>{tr}Partition table{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for="installPartitionTable">{tr}Partition table{/tr}</LABEL></td>
                    <td>
                        {render acl=$installPartitionTableACL}
                        <input type='submit' name="edit_installPartitionTable" id="edit_installPartitionTable" 
                            value="{tr}Edit partition table{/tr}">
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<hr>
<table style='width:100%;'>
    <tr>
        <td style='width:50%; vertical-align: top;'>
            <h3>{tr}Bootstrap settings{/tr}</h3>
    
            <table>
                <tr>
                    <td><LABEL for="installMirror">{tr}Mirror{/tr}</LABEL></td>
                    <td>
                        {render acl=$installMirrorACL}
                        <select name="installMirror" size=1>
                            {html_options options=$installMirrorList 
                            selected=$installMirror}
                        </select>
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for="installKernelPackage">{tr}Kernel package{/tr}</LABEL></td>
                    <td>
                        {render acl=$installKernelPackageACL}
                        <select name="installKernelPackage" size=1>
                            {html_options values=$installKernelPackageList output=$installKernelPackageList 
                            selected=$installKernelPackage}
                        </select>
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
        <td style='width:50%; vertical-align: top;padding-left:5px;' class='left-border'>
            <h3>{tr}Login{/tr}</h3>

            <table>
                <tr>
                    <td>
                        {render acl=$installRootEnabledACL}
                        <input type='checkbox' value='1' {if $installRootEnabled} checked {/if}
                            onClick="changeState('setPasswordHash');"
                            name="installRootEnabled" id="installRootEnabled" 
                           >
                        {/render}
                        <LABEL for="installRootEnabled">{tr}Use root user{/tr}</LABEL>&nbsp;
                        {render acl=$installRootPasswordHashACL}
                        <button name='setPasswordHash'
                            {if !$installRootEnabled} disabled {/if}
                            id="setPasswordHash">{tr}Set password{/tr}</button>
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td colspan=2><hr></td>
    </tr>
    <tr>
        <td style='width:50%; vertical-align: top;'>
            <h3>{tr}Locale{/tr}</h3>

            <table>
                <tr>
                    <td><LABEL for="installKeyboardlayout">{tr}Keyboard layout{/tr}</LABEL></td>
                    <td>
                        {render acl=$installKeyboardlayoutACL}
                        <select name="installKeyboardlayout" size=1>
                            {html_options options=$installKeyboardlayoutList
                            selected=$installKeyboardlayout}
                        </select>
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for="installSystemLocale">{tr}System locale{/tr}</LABEL></td>
                    <td>
                        {render acl=$installSystemLocaleACL}
                        <select name="installSystemLocale" size=1>
                            {html_options options=$installSystemLocaleList 
                            selected=$installSystemLocale}
                        </select>
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
        <td style='width:50%; vertical-align: top;padding-left:5px;' class='left-border'>
            <h3>{tr}Time{/tr}</h3>

            <table>
                <tr>
                    <td>
                        {render acl=$installTimeUTCACL}
                        <input type='checkbox' name="installTimeUTC" id="installTimeUTC" 
                        {if $installTimeUTC} checked {/if}>
                        <LABEL for="installTimeUTC">{tr}Use UTC{/tr}</LABEL>
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for="installTimezone">{tr}Timezone{/tr}</LABEL></td>
                    <td>
                        {render acl=$installTimezoneACL}
                        <select size='1' name="installTimezone" id="installTimezone">
                            {html_options output=$timezones values=$timezones 
                            selected=$installTimezone}
                        </select>
                        {/render}
                    </td>
                </tr>
                <tr>    
                    <td colspan=2>
                        {tr}NTP server{/tr}
                        {render acl=$installNTPServerACL}
                            {$installNTPServerList}
                        {/render}
                        {render acl=$installNTPServerACL}
                            <input type='text' name="installNTPServer_Input">
                        {/render}
                        {render acl=$installNTPServerACL}
                            <button name='installNTPServer_Add'>{msgPool type=addButton}</button>
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<input type='hidden' name='InstallRecipePosted' value=1>
