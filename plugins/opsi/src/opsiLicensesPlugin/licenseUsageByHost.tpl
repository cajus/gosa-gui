{if !$init_successfull}
<br>
<b>{msgPool type=siError}</b><br>
{tr}Check if the GOsa support daemon (gosa-si) is running.{/tr}&nbsp;
<button type='submit' name='retry_init'>{tr}Retry{/tr}</button>

<br>
<br>
{else}


<table width="100%" summary="{tr}License usage{/tr}">
  <tr>
    <td style='width: 50%; padding-right:5px; ' class='right-border'>        <h3>{tr}Reserved for{/tr}</h3>
{render acl=$boundToHostACL}
        {$licenseReserved}
{/render}
{render acl=$boundToHostACL}
        <select name='availableLicense' size=1>
{/render}
          {html_options options=$availableLicenses}
        </select>
{render acl=$boundToHostACL}
        <button type='submit' name='addReservation'>{msgPool type=addButton}</button>

{/render}
    </td>
    <td>        <h3>{tr}Licenses used{/tr}</h3>
{render acl=$boundToHostACL}
        {$licenseUses}
{/render}
    </td>
  </tr>
</table>

<input name='opsiLicenseUsagePosted' value='1' type='hidden'>
{/if}
