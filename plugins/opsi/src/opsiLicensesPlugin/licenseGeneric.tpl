{if !$init_successfull}

  <br>
    <b>{msgPool type=siError}</b><br>
    {tr}Check if the GOsa support daemon (gosa-si) is running.{/tr}&nbsp;
    <button type='submit' name='retry_init'>{tr}Retry{/tr}</button>
  <br>
  <hr>
{else}

<h3>{tr}License{/tr}</h3>

<table style='width:100%' summary="{tr}License settings{/tr}">
  <tr>
    <td style='width:50%;'  class='right-border'>        


        <table  summary="{tr}Generic settings{/tr}">
          <tr>
            <td>
              {tr}Name{/tr}{$must}
            </td>
            <td>
              {if $initially_was_account}
                <input type='text' name='dummy12' disabled value='{$cn}'>
              {else}
{render acl=$cnACL}
                <input type='text' name='cn' value='{$cn}'>
{/render}
              {/if}
            </td>
          </tr>
          <tr>
            <td>
              {tr}Partner{/tr}
            </td>
            <td>
{render acl=$partnerACL}
              <input type='text' name='partner' value='{$partner}'>
{/render}
            </td>
          </tr>
          <tr>
            <td>
              {tr}Description{/tr}
            </td>
            <td>
{render acl=$descriptionACL}
              <input type='text' name='description' value='{$description}'>
{/render}
            </td>
          </tr>
          <tr>
            <td>
              {tr}License model{/tr}
            </td>
            <td>
{render acl=$licenseModelACL}
              {if $initially_was_account}
                <select name='dummy223' disabled size=1>
                  {html_options options=$licenseModels values=$licenseModels selected=$licenseModel}
                </select>
              {else}
                <select name='licenseModel' onChange='document.mainform.submit();' size=1>
                  {html_options options=$licenseModels values=$licenseModels selected=$licenseModel}
                </select>
              {/if}
{/render}
            </td>
          </tr>
        </table>

    </td>
    <td>
        <table  summary="{tr}Additional settings{/tr}">
          <tr>
            <td>
              {tr}Conclusion date{/tr}
            </td>
            <td style='width:300px;'>
{render acl=$conclusionDateACL}
              <input type="text" id="date1" name="conclusionDate" value="{$conclusionDate}" class="date" />
              {if $conclusionDateWriteable}
              {literal}
              <script type="text/javascript">
                  /*<[CDATA[*/
                  var datepicker    = new DatePicker({
                  keepFieldEmpty : true,
                  enableCloseEffect : false,
                  enableShowEffect : false,
                  relative    : 'date1',
                  language    : '{/literal}{$lang}{literal}'
                  });
                  /*]]>*/
              </script>
              {/literal}
              {/if}
{/render}
            </td>
          </tr>
          <tr>
            <td>
              {tr}Expiration date{/tr}
            </td>
            <td style='width:300px;'>
{render acl=$expirationDateACL}
              <input type="text" id="date2" name="expirationDate" value="{$expirationDate}" class="date" />
              {if $expirationDateWriteable}
              {literal}
              <script type="text/javascript">
                  /*<[CDATA[*/
                  var datepicker    = new DatePicker({
                  keepFieldEmpty : true,
                  enableCloseEffect : false,
                  enableShowEffect : false,
                  relative    : 'date2',
                  language    : '{/literal}{$lang}{literal}'
                  });
                  /*]]>*/
              </script>
              {/literal}
              {/if}
{/render}
            </td>
          </tr>
          <tr>
            <td>
              {tr}Notification date{/tr}
            </td>
            <td style='width:300px;'>
{render acl=$notificationDateACL}
              <input type="text" id="date3" name="notificationDate" value="{$notificationDate}" class="date" >
              {if $notificationDateWriteable}
              {literal}
              <script type="text/javascript">
                  /*<[CDATA[*/
                  var datepicker    = new DatePicker({
                  keepFieldEmpty : true,
                  enableCloseEffect : false,
                  enableShowEffect : false,
                  relative    : 'date3',
                  language    : '{/literal}{$lang}{literal}'
                  });
                  /*]]>*/
              </script>
              {/literal}
              {/if}
{/render}
            </td>
          </tr>
        </table>
 
    </td> 
  </tr>
</table>

<hr>
<h3>{tr}License key settings{/tr}</h3>

<table width="100%" summary="{tr}License key settings{/tr}">
  <tr>
    <td style='width:50%;' class='right-border'>
        <table summary="{tr}License key settings{/tr}">
          <tr>
            <td>
              {tr}License key{/tr}{$must}
            </td>
            <td>
{render acl=$licenseKeyACL}
              <input type='text' name='licenseKey' value='{$licenseKey}'>
{/render}
            </td>
          </tr>
          {if $licenseModel == "VOLUME"}
          <tr>
            <td>
              {tr}Maximum installations{/tr}
            </td>
            <td>
{render acl=$maximumInstallationsACL}
              <input type='text' name='maximumInstallations' value='{$maximumInstallations}'>
{/render}
            </td>
          </tr>
          {/if}
          {if $licenseModel == "OEM"}
          <tr>
            <td>
              {tr}Reserved for{/tr}
            </td>
            <td>
{render acl=$boundToHostACL}
              <select name='boundToHost' size=1>
                <option value="">{tr}none{/tr}</option>
                {html_options options=$hosts selected=$boundToHost}
              </select>
{/render}
            </td>
          </tr>
          {/if}
        </table>
 
    </td> 
    <td class='right-border'>   
              <b>{tr}Used by{/tr}</b><br>
{render acl=$usedByHostACL}
              <select   disabled
                name='selectedUsedHosts[]' multiple size=4 style='width:100%;'>
                {html_options options=$usedByHost}
              </select><br>
{/render}
    </td> 
  </tr>
</table>
<input name='opsiLicensesPosted' value='1' type='hidden'>
{/if}
