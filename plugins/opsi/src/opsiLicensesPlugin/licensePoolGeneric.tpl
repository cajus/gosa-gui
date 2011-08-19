{if !$init_successfull}

  <br>
    <b>{msgPool type=siError}</b><br>
    {tr}Check if the GOsa support daemon (gosa-si) is running.{/tr}&nbsp;
    <button type='submit' name='retry_init'>{tr}Retry{/tr}</button>
  <br>
  <br>

{else}

<table width="100%" summary="{tr}Lincense settings{/tr}">
  <tr> 
    <td>

        <!-- GENERIC -->
        <h3>{tr}Generic{/tr}</h3>
        <table summary="{tr}Generic settings{/tr}">
          <tr> 
            <td>{tr}Name{/tr}</td>
            <td>
              {if $initially_was_account}
                <input type='text' value='{$cn}' disabled>
              {else}
{render acl=$cnACL}
              <input type='text' value='{$cn}' name='cn'>
{/render}
              {/if}
            </td>
          </tr>
          <tr> 
            <td>{tr}Description{/tr}</td>
            <td>
{render acl=$descriptionACL}
              <input type='text' value='{$description}' name='description'>
{/render}
            </td>
          </tr>
        </table>

    </td>
    <td style='width:50%; padding: 5px;' class='left-border'>        <!-- LICENSES -->
      <h3>{tr}Licenses{/tr}</h3>
      {$licenses}
{render acl=$licensesACL}
              <button type='submit' name='addLicense'>{msgPool type=addButton}</button>

{/render}
    </td>
  </tr>
  <tr> 
    <td colspan="2">
      <hr>
    </td>
  </tr>
  <tr>
    <td style='width:50%'>
        <h3>{tr}Applications{/tr}</h3>
{render acl=$productIdsACL}
              <select name='productIds[]' multiple size="6" style="width:100%;">
                {html_options options=$productIds}
              </select><br>
{/render}
{render acl=$productIdsACL}
              <select name='availableProduct' size=1>
                {html_options options=$availableProductIds}
              </select>
{/render}
{render acl=$productIdsACL}
              <button type='submit' name='addProduct'>{msgPool type=addButton}</button>

{/render}
{render acl=$productIdsACL}
              <button type='submit' name='removeProduct'>{msgPool type=delButton}</button>

{/render}
    </td>
    <td style='padding: 5px;' class='left-border'>        <!-- SOFTWARE -->
        <h3>{tr}Windows software IDs{/tr}</h3>
{render acl=$windowsSoftwareIdsACL}
              <select name='softwareIds[]' multiple size="6" style="width:100%;">
                {html_options options=$softwareIds}
              </select>
{/render}
    </td>
  </tr>
</table>
<input name='opsiLicensePoolPosted' value='1' type='hidden'>
{/if}
