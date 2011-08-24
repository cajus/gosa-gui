<h3>{tr}Properties{/tr}</h3>
<table summary="{tr}Properties{/tr}" style="width:100%;">
 <tr>
  <td style='width:50%; '>

   <table summary="{tr}Generic settings{/tr}">
    <tr>
{if $cn eq 'wdefault'}
     <td colspan=2>{tr}Workstation template{/tr}</td>
{else}
     <td><LABEL for="cn">{tr}Workstation name{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$cnACL}
      <input type='text' name="cn" id="cn" size=18 maxlength=60 value="{$cn}">
{/render}
     </td>
{/if}
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     <td>
{render acl=$descriptionACL}
      <input type='text' name="description" id="description" size=18 maxlength=60 value="{$description}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="cn">{tr}Location{/tr}</LABEL></td>
     <td>
{render acl=$lACL}
      <input type='text' name="l" id="l" size=18 maxlength=60 value="{$l}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$baseACL}
       {$base}
{/render}
     </td>
    </tr>
   </table>

   <hr>
	  {$host_key}

  </td>
  <td class='left-border'>

   <table summary="{tr}Terminal server settings{/tr}">
    <tr>
     <td>{tr}Mode{/tr}</td>
     <td>
{render acl=$gotoModeACL}
      <select name="gotoMode" title="{tr}Select terminal mode{/tr}" size=1>
       {html_options options=$modes selected=$gotoMode_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSyslogServer">{tr}Syslog server{/tr}</LABEL></td>
     <td>
{render acl=$gotoSyslogServerACL}
      <select id="gotoSyslogServer" name="gotoSyslogServer" title="{tr}Choose server to use for logging{/tr}" size=1>
       {html_options options=$syslogservers selected=$gotoSyslogServer_select}
      </select>
{/render}
     </td>
    </tr>
   </table>

   <hr>

    {if $member_of_ogroup}
    {render acl=$gotoNtpServerACL}
            <input type="checkbox" value="1" name="inheritTimeServer"
                {if $inheritTimeServer} checked {/if}
                onClick="javascript:
                        changeState('gotoNtpServerSelected');
                        changeState('gotoNtpServers');
                        changeState('addNtpServer');
                        changeState('delNtpServer');">{tr}Inherit time server attributes{/tr}
    {/render}
    {else}
      <input disabled type='checkbox' name='option_disabled'>{tr}Inherit time server attributes{/tr}
    {/if}
         <LABEL for="gotoNtpServerSelected">{tr}NTP server{/tr}</LABEL>
    {render acl=$gotoNtpServerACL}
          <select name="gotoNtpServerSelected[]" id="gotoNtpServerSelected" multiple size=5 style="width:100%;"
                title="{tr}Choose server to use for synchronizing time{/tr}" {if $inheritTimeServer} disabled {/if}>
           {html_options options=$gotoNtpServer_select}
          </select>
    {/render}
         <br>
    {render acl=$gotoNtpServerACL}
          <select name="gotoNtpServers" id="gotoNtpServers" {if $inheritTimeServer} disabled {/if}  size=1>
           {html_options options=$gotoNtpServers}
          </select>
    {/render}
    {render acl=$gotoNtpServerACL}
            <button type='submit' name='addNtpServer' id="addNtpServer"
             {if $inheritTimeServer} disabled {/if}>{msgPool type=addButton}</button>
    {/render}
    {render acl=$gotoNtpServerACL}
            <button type='submit' name='delNtpServer' id="delNtpServer"
             {if $inheritTimeServer} disabled {/if}>{msgPool type=delButton}</button>
    {/render}

  </td>
 </tr>
</table>

{if $cn neq 'wdefault'}
<hr>

{$netconfig}
{/if}
<hr>

{if $member_of_ogroup}
   <button type='submit' name='inheritAll'>{tr}Inherit all values from group{/tr}</button>
{/if}

<input type="hidden" name="workgeneric_posted" value="1">
{if $cn eq 'wdefault'}

<!-- Place cursor -->
  <script language="JavaScript" type="text/javascript">
    <!-- // First input field on page
    focus_field('l');
    -->
  </script>
{else}
  <script language="JavaScript" type="text/javascript">
    <!-- // First input field on page
    focus_field('cn');
    -->
  </script>
{/if}

