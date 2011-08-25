<table width="100%">
    <tr>
        <td style='width:50%;'>

            <h3>{tr}Device{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for='name'>{tr}Name{/tr}</LABEL>{if $registeredRequired}{$must}{/if}</td>
                    <td>
                        {render acl=$cnACL}
                            <input type="text" name="cn" value="{$cn}" id="cn" value="{$cn}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='description'>{tr}Description{/tr}</LABEL></td>
                    <td>
                        {render acl=$descriptionACL}
                            <input type="text" name="description" value="{$description}" id="description" value="{$description}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td>
                        <div style="height:10px;"> </div>
                        {tr}Base{/tr}
                    </td>
                    <td>
                        <div style="height:10px;"> </div>
                        {render acl=$baseACL}
                            {$base}
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
        <td class='left-border' style='padding-left:5px;'>
            <h3>{tr}Orgaizational data{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for='ou'>{tr}Organizational Unit{/tr}</LABEL></td>
                    <td>
                        {render acl=$ouACL}
                            <input type="text" name="ou" value="{$ou}" id="ou" value="{$ou}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='o'>{tr}Organization{/tr}</LABEL></td>
                    <td>
                        {render acl=$oACL}
                            <input type="text" name="o" value="{$o}" id="o" value="{$o}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='l'>{tr}Location{/tr}</LABEL></td>
                    <td>
                        {render acl=$lACL}
                            <input type="text" name="l" value="{$l}" id="l" value="{$l}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='serialNumber'>{tr}Serial number{/tr}</LABEL></td>
                    <td>
                        {render acl=$serialNumberACL}
                            <input type="text" name="serialNumber" value="{$serialNumber}" id="serialNumber" value="{$serialNumber}">
                        {/render}
                    </td>
                </tr>
<!--
                <tr>
                    <td><LABEL for='seeAlso'>{tr}See also{/tr}</LABEL></td>
                    <td>
                        {render acl=$seeAlsoACL}
                            <input type="text" name="seeAlso" value="{$seeAlso}" id="seeAlso" value="{$seeAlso}">
                        {/render}
                    </td>
                </tr>
-->
<!--
                <tr>
                    <td><LABEL for='owner'>{tr}Owner{/tr}</LABEL></td>
                    <td>
                        {render acl=$ownerACL}
                            <input type="text" name="owner" value="{$owner_name}" id="owner" value="{$owner_name}" 
                            title="{$owner}" disabled style="width:120px;">
                        {/render}

                        {image path="images/lists/edit.png" action="editOwner" acl=$ownerACL}
                        {if $owner!=""}
                            {image path="images/info_small.png" title="{$owner}" acl=$ownerACL}
                            {image path="images/lists/trash.png" action="removeOwner" acl=$ownerACL}
                        {/if}
                 </td>
                </tr>
-->
            </table>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <hr>
        </td>
    </tr>
    <tr>    
        <td style='width:50%;'>
            <h3>{tr}Registration{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for='deviceUUID'>{tr}Device UUID{/tr}{if $registeredRequired}{$must}{/if}</LABEL></td>
                    <td> 
                        {render acl=$deviceUUIDACL}
                            <input type="text" name="deviceUUID" value="{$deviceUUID}" id="deviceUUID" value="{$deviceUUID}">
                        {/render}
                        {render acl=$deviceUUIDACL}
                            {image path="images/lists/reload.png" action="reloadUUID"}
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='deviceType'>{tr}Type{/tr}</LABEL>
                    </td>
                    <td>
                        {render acl=$deviceTypeACL}
                            <input type="text" name="deviceType" value="{$deviceType}" id="deviceType" value="{$deviceType}">
                        {/render}
                    </td>
                </tr>
            </table>
        </td>
        <td class='left-border' style='padding-left:5px; padding-top:10px;'>
            <table>
                <tr>
                    <td><LABEL for='deviceStatus'>{tr}Status{/tr}{if $registeredRequired}{$must}{/if}</LABEL>
                    </td>
                    <td>
                        {render acl=$deviceStatusACL}
                            <input type="text" name="deviceStatus" value="{$deviceStatus}" id="deviceStatus" value="{$deviceStatus}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='manager'>{tr}Manager{/tr}{if $registeredRequired}{$must}{/if}</LABEL>
                    </td>
                    <td>
                        {render acl=$managerACL}
                            <input type="text" name="manager" value="{$manager_name}" id="manager" value="{$manager_name}" 
                            title="{$manager}" disabled style="width:120px;">
                        {/render}

                        {image path="images/lists/edit.png" action="editManager" acl=$managerACL}
                        {if $manager!=""}
                            {image path="images/info_small.png" title="{$manager}" acl=$managerACL}
                            {image path="images/lists/trash.png" action="removeManager" acl=$managerACL}
                        {/if}
                 </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
            <hr>
            <h3>{tr}Network settings{/tr}</h3>
            <table>
                <tr>
                    <td><LABEL for='ipHostNumber'>{tr}IP address{/tr}</LABEL>
                    </td>
                    <td>
                        {render acl=$ipHostNumberACL}
                            <input type="text" name="ipHostNumber" value="{$ipHostNumber}" id="ipHostNumber" value="{$ipHostNumber}">
                        {/render}
                    </td>
                </tr>
                <tr>
                    <td><LABEL for='macAddress'>{tr}MAC address{/tr}</LABEL>
                    </td>
                    <td>
                        {render acl=$macAddressACL}
                            <input type="text" name="macAddress" value="{$macAddress}" id="macAddress" value="{$macAddress}">
                        {/render}
                    </td>
                </tr>
            </table>
