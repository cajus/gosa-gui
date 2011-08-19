
<table summary="{tr}Groupware{/tr}" width="100%">
    <tr>
        <td style='width:50%; vertical-align: top;'>
            <h3>{tr}Groupware{/tr}</h3>

            {tr}Mail address{/tr}:
            {render acl=$primaryMailAddressACL}
                <input type='text' name="primaryMailAddress" value="{$primaryMailAddress}">
            {/render}

            {if $mailSizeLimit_isActive}
                <hr>
                {render acl=$mailSizeLimitACL}
                    <input type='checkbox' name="useMailSizeLimit" 
                        onClick="changeState('mailSizeLimit')" 
                        {if $useMailSizeLimit} checked {/if} value="1">
                {/render}
                {tr}Use incoming mail size limitation{/tr}
                {render acl=$mailSizeLimitACL}
                    <input type='text' name='mailSizeLimit' id="mailSizeLimit" 
                        {if $useMailSizeLimit} value="{$mailSizeLimit}" {else} value="" disabled {/if}>
                {/render}
            {/if}
        </td>
        {if $alternateAddresses_isActive}
            <td style='width:50%; vertical-align: top; padding-left:5px;' class='left-border'>
                <h3><label for="alternateAddressList">{tr}Alternative addresses{/tr}</label></h3>
                {render acl=$alternateAddressesACL}
                    <select id="alternateAddressList" style="width:100%;height:100px;" name="alternateAddressList[]" size="15" multiple
                        title="{tr}List of alternative mail addresses{/tr}">
                        {html_options values=$alternateAddresses output=$alternateAddresses}
                        <option disabled>&nbsp;</option>
                    </select>
                    <br>
                {/render}
                {render acl=$alternateAddressesACL}
                    <input type='text' name="alternateAddressInput">
                {/render}
                {render acl=$alternateAddressesACL}
                    <button type='submit' name='addAlternateAddress'>{msgPool type=addButton}</button>
                {/render}
                {render acl=$alternateAddressesACL}
                    <button type='submit' name='deleteAlternateAddress'>{msgPool type=delButton}</button>
                {/render}
            </td>
        {/if}
    </tr>
</table>

<input type="hidden" name="DistributionList_posted" value="1">
