<h3>{tr}Properties{/tr}</h3>
<table summary="{tr}Terminal{/tr}" style="width:100%;">
 <tr>
  <td style='width:50%; '>

   <table summary="{tr}Generic settings{/tr}">
    <tr>
     {if $cn eq 'default'}
     <td colspan=2>{tr}Terminal template{/tr}</td>
     {else}
     <td><LABEL for="cn">{tr}Terminal name{/tr}</LABEL>{$must}</td>
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

   <table summary="{tr}Server and mode settings{/tr}" style='width:100%'>
    <tr>
     <td style='width:20%'><LABEL for="gotoMode">{tr}Mode{/tr}</LABEL></td>
     <td>
{render acl=$gotoModeACL}
      <select id="gotoMode" name="gotoMode" title="{tr}Select terminal mode{/tr}" size=1>
       {html_options options=$modes selected=$gotoMode_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSyslogServer">{tr}Syslog server{/tr}</LABEL></td>
     <td>
{render acl=$gotoSyslogServerACL}
      <select name="gotoSyslogServer" id="gotoSyslogServer" title="{tr}Choose server to use for logging{/tr}" size=1>
       {html_options options=$syslogservers selected=$gotoSyslogServer_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoSwapServer">{tr}Swap server{/tr}</LABEL></td>
     <td>
{render acl=$gotoSwapServerACL}
      <select name="gotoSwapServer" id="gotoSwapServer" title="{tr}Choose NFS file system to place swap files on{/tr}" size=1>
       {html_options options=$swapservers selected=$gotoSwapServer_select}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="gotoTerminalPath">{tr}Root server{/tr}</LABEL></td>
      <td>
{render acl=$gotoTerminalPathACL}
      <select name="gotoTerminalPath" id="gotoTerminalPath" title="{tr}Select NFS root file system to use{/tr}" size=1>
       {html_options options=$nfsservers selected=$gotoTerminalPath_select}
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
     <LABEL for="gotoNtpServerSelected">{tr}NTP server{/tr}</LABEL><br>
{render acl=$gotoNtpServerACL}
      <select name="gotoNtpServerSelected[]" id="gotoNtpServerSelected" multiple size=5 style="width:100%;"
			title="{tr}Choose server to use for synchronizing time{/tr}" {if $inheritTimeServer} disabled {/if}>
       {html_options options=$gotoNtpServer_select}
      </select>
{/render}
	 <br>
{render acl=$gotoNtpServerACL}
      <select name="gotoNtpServers" id="gotoNtpServers" {if $inheritTimeServer} disabled {/if}  size=1>
       {html_options values=$ntpservers output=$ntpservers}
      </select>
{/render}
{render acl=$gotoNtpServerACL}
		<button type='submit' name='addNtpServer' id="addNtpServer"
		 {if $inheritTimeServer} disabled {/if}>{msgPool type=addButton}</button>
{/render}
{render acl=$gotoNtpServerACL}
		<button type='submit' name='delNtpServer' id="delNtpServer"
		 {if $inheritTimeServer} disabled {/if}
      >{msgPool type=delButton}</button>
{/render}

  </td>
 </tr>
</table>

{if $cn neq 'default'}
<hr>

{$netconfig}
{/if}
<hr>

{if $member_of_ogroup}
   <button type='submit' name='inheritAll'>{tr}Inherit all{/tr}</button>

{/if}

<input type="hidden" name="termgeneric_posted" value="1">
<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
