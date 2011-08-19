<table style='width:100%; ' summary="{tr}Samba configuration{/tr}">


 <!-- Headline container -->
 <tr>
  <td style='width:50%; ' colspan="2">

   <h3>{tr}Generic{/tr}</h3>
  </td>
 </tr>
 <tr>
  <td>

   <table summary="{tr}Path configuration{/tr}">
    <tr>
     <td><label for="sambaHomePath">{tr}Home directory{/tr}</label></td>
     <td>
{render acl=$sambaHomePathACL checkbox=$multiple_support checked=$use_sambaHomePath}
      <input type='text' id="sambaHomePath" name="sambaHomePath" size=30 maxlength=60 value="{$sambaHomePath}">
{/render}
{render acl=$sambaHomeDriveACL  checkbox=$multiple_support checked=$use_sambaHomeDrive}
      <select size="1" name="sambaHomeDrive">
       {html_options values=$drives output=$drives selected=$sambaHomeDrive}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="sambaDomainName">{tr}Domain{/tr}</label></td>
     <td>
{render acl=$sambaDomainNameACL  checkbox=$multiple_support checked=$use_sambaDomainName}
      <select id="sambaDomainName" size="1" name="sambaDomainName"
       onChange="document.mainform.submit();">
       {html_options values=$domains output=$domains selected=$sambaDomainName}
      </select>
{/render}
{render acl=$sambaDomainNameACL  checkbox=$multiple_support checked=$use_sambaDomainName}
     <button type='submit' name='display_information'>{tr}Show information{/tr}</button>

{/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>

   <table summary="{tr}Profile and script path settings{/tr}">
    <tr>
     <td><label for="">{tr}Script path{/tr}</label></td>
     <td>
{render acl=$sambaLogonScriptACL  checkbox=$multiple_support checked=$use_sambaLogonScript}
      <input type='text' id="sambaLogonScript" name="sambaLogonScript" size=35 maxlength=60 value="{$sambaLogonScript}">
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="">{tr}Profile path{/tr}</label></td>
     <td>
{render acl=$sambaProfilePathACL  checkbox=$multiple_support checked=$use_sambaProfilePath}
      <input type='text' class="center" id="sambaProfilePath" name="sambaProfilePath" size=35 maxlength=60 value="{$sambaProfilePath}">
{/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<h3>{tr}Terminal Server{/tr}</h3>

<table style='width:100%; ' summary="{tr}Terminal server settings{/tr}">
 <tr>
  <td style='width:50%'>


{if $multiple_support}
   	<input class="center" type=checkbox name="use_tslogin" id="use_tslogin" value="1" 
		{if $use_tslogin} checked {/if}
		onClick="changeState('tslogin')">
	<input class="center" type=checkbox name="tslogin" id="tslogin" value="1" {$tslogin}
		{if !$use_tslogin} disabled {/if}>
{else}
{render acl=$AllowLoginOnTerminalServerACL}
   <input class="center" type=checkbox name="tslogin" id="tslogin" value="1" {$tslogin}
   	onclick="
		changeState('CtxWFHomeDir');
		changeState('CtxWFHomeDirDrive');
		changeState('CtxWFProfilePath');
		changeState('inherit');			
		changeTripleSelectState_2nd_neg('tslogin','inherit','CtxInitialProgram');
		changeTripleSelectState_2nd_neg('tslogin','inherit','CtxWorkDirectory');
		changeState('CtxMaxConnectionTimeF');
		changeState('CtxMaxDisconnectionTimeF');
		changeState('CtxMaxIdleTimeF');
		changeTripleSelectState('tslogin','CtxMaxConnectionTimeF','CtxMaxConnectionTime');
		changeTripleSelectState('tslogin','CtxMaxDisconnectionTimeF','CtxMaxDisconnectionTime');
		changeTripleSelectState('tslogin','CtxMaxIdleTimeF','CtxMaxIdleTime');
		changeState('connectclientdrives');
		changeState('connectclientprinters');
		changeState('defaultprinter');
		changeState('shadow');
		changeState('brokenconn');
		changeState('reconn');
	">
{/render}
{/if}
   <i>{tr}Allow login on terminal server{/tr}</i>
   <table summary="{tr}Terminal server connection settings{/tr}">
    <tr>
     <td><label for="CtxWFHomeDir">{tr}Home directory{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxWFHomeDir}
      <input type='text' id="CtxWFHomeDir" name="CtxWFHomeDir" size=30 maxlength=60 value="{$CtxWFHomeDir}" {$tsloginstate}>
{/render}
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxWFHomeDirDrive}
      <select size="1" id="CtxWFHomeDirDrive" name="CtxWFHomeDirDrive"  {$tsloginstate}>
       {html_options values=$drives output=$drives selected=$CtxWFHomeDirDrive}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="CtxWFProfilePath">{tr}Profile path{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxWFProfilePath}
      <input type='text' id="CtxWFProfilePath" name="CtxWFProfilePath" size=35 maxlength=60 value="{$CtxWFProfilePath}" {$tsloginstate}>
{/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>

{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_inherit}
   <input class="center" type=checkbox id="inherit" name="inherit" {if $inheritstate} checked {/if}
    {$tsloginstate}
	onClick="changeState('CtxInitialProgram');
 		 changeState('CtxWorkDirectory');"
	
	> 
{/render}
   <i>{tr}Inherit client configuration{/tr}</i>
   <table summary="{tr}Client configuration{/tr}">
    <tr>
     <td><label for="CtxInitialProgram">{tr}Initial program{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxInitialProgram}
      <input type='text' id="CtxInitialProgram" name="CtxInitialProgram" size=35 maxlength=60 value="{$CtxInitialProgram}" {$inheritstate} {$tsloginstate}>
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="CtxWorkDirectory">{tr}Working directory{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxWorkDirectory}
      <input type='text' id="CtxWorkDirectory" name="CtxWorkDirectory" size=35 maxlength=60	value='{$CtxWorkDirectory}' {$inheritstate} {$tsloginstate}>
{/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<table style='width:100%; ' summary="{tr}Connection timeout settings{/tr}">

 <tr>
  <td>

   <i>{tr}Timeout settings (in minutes){/tr}</i>
   <table summary="{tr}Connection timeout settings{/tr}">
    <tr>
     <td>
{if $multiple_support}
<input type="checkbox" name="use_CtxMaxConnectionTimeF" {if $use_CtxMaxConnectionTimeF} checked {/if}
	onClick="changeState('CtxMaxConnectionTimeF');" class="center"
	>
{/if}
{render acl=$AllowLoginOnTerminalServerACL}
      <input 		id="CtxMaxConnectionTimeF" 	type="checkbox" class="center" name="CtxMaxConnectionTimeF" 
			{if !$use_CtxMaxConnectionTimeF && $multiple_support} disabled {/if}
			value="1" 			{$CtxMaxConnectionTimeF} 	
			onclick="changeState('CtxMaxConnectionTime')" {$tsloginstate}>
{/render}

      <label for="CtxMaxConnectionTimeF">{tr}Connection{/tr}</label>
     </td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL}
      <input name="CtxMaxConnectionTime" type="text" id="CtxMaxConnectionTime" size=5 maxlength=5 value="{$CtxMaxConnectionTime}" 
			{if !$CtxMaxConnectionTimeF ||  $tsloginstate == "disabled"} disabled  {/if}>
{/render}
     </td>
    </tr>
    <tr>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxMaxDisconnectionTimeF}
      <input id="CtxMaxDisconnectionTimeF" type=checkbox name="CtxMaxDisconnectionTimeF" value="1" {$CtxMaxDisconnectionTimeF} onclick="changeState('CtxMaxDisconnectionTime')" {$tsloginstate} class="center">
{/render}
      <label for="CtxMaxDisconnectionTimeF">{tr}Disconnection{/tr}</label>
     </td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL}
      <input name="CtxMaxDisconnectionTime" id="CtxMaxDisconnectionTime" type="text" size=5 maxlength=5 value="{$CtxMaxDisconnectionTime}" 
			{if $tsloginstate == "disabled" || !$CtxMaxDisconnectionTimeF} disabled  {/if}>
{/render}
     </td>
    </tr>
    <tr>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_CtxMaxIdleTimeF}
      <input id="CtxMaxIdleTimeF" type=checkbox name="CtxMaxIdleTimeF" value="1" {$CtxMaxIdleTimeF} onclick="changeState('CtxMaxIdleTime')" {$tsloginstate} class="center">
{/render}
      <label for="CtxMaxIdleTimeF">{tr}IDLE{/tr}</label>
     </td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL}
      <input name="CtxMaxIdleTime" id="CtxMaxIdleTime" size=5 maxlength=5 type="text" value="{$CtxMaxIdleTime}" 
			{if !$CtxMaxIdleTimeF || $tsloginstate == "disabled"} disabled  {/if}>
{/render}
     </td>
    </tr>
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>


   <i>{tr}Client devices{/tr}</i>
   <table summary="{tr}Client devices{/tr}">
    <tr>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_connectclientdrives}
      <input id="connectclientdrives" type=checkbox name="connectclientdrives" value="1" {$connectclientdrives} {$tsloginstate} class="center">
{/render}
      <label for="connectclientdrives">{tr}Connect client drives at log on{/tr}</label>
     </td>
    </tr>
    <tr>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_connectclientprinters}
      <input id="connectclientprinters" type=checkbox name="connectclientprinters" value="1" {$connectclientprinters}{$tsloginstate} class="center">
{/render}
      <label for="connectclientprinters">{tr}Connect client printers at log on{/tr}</label>
     </td>
    </tr>
    <tr>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_defaultprinter}
      <input id="defaultprinter" type=checkbox name="defaultprinter" value="1" {$defaultprinter} {$tsloginstate} class="center">
{/render}
      <label for="defaultprinter">{tr}Default to main client printer{/tr}</label>
     </td>
    </tr>
   </table>

  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td style='width:50%'>

   <i>{tr}Miscellaneous{/tr}</i>
   <table summary="{tr}Miscellaneous{/tr}">
    <tr>
     <td>
      <label for="shadow">{tr}Shadowing{/tr}</label>
     </td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_shadow}
      <select id="shadow" size="1" name="shadow" {$tsloginstate}>
       {html_options options=$shadow selected=$shadowmode}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="brokenconn">{tr}On broken or timed out{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_brokenconn}
      <select id="brokenconn" size="1" name="brokenconn" {$tsloginstate}>
       {html_options options=$brokenconn selected=$brokenconnmode}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td><label for="reconn">{tr}Reconnect if disconnected{/tr}</label></td>
     <td>
{render acl=$AllowLoginOnTerminalServerACL  checkbox=$multiple_support checked=$use_reconn}
      <select id="reconn" size="1" name="reconn" {$tsloginstate}>
       {html_options options=$reconn selected=$reconnmode}
      </select>
{/render}
     </td>
    </tr>
   </table>

  </td>
 </tr>
</table>

<hr>

<h3>{tr}Access options{/tr}
</h3>

<table style='width:100%; ' summary="{tr}Access options{/tr}">

 <tr>
  <td style='width:50%; ' colspan="2">


      <table>
       <tr>
            <td>
                {render acl=$enforcePasswordChangeACL checkbox=$multiple_support checked=$use_enforcePasswordChange}
                 <input type='checkbox' value='1' name='flag_enforcePasswordChange'
                  {if $flag_enforcePasswordChange} checked {/if} id='flag_enforcePasswordChange'>
                {/render}
            </td>
            <td>
                <label for='flag_enforcePasswordChange'>{tr}Enforce password change{/tr}</label>
            </td>
        </tr>
        <tr>
            <td>
                {render acl=$passwordNeverExpiresACL  checkbox=$multiple_support checked=$use_passwordNeverExpires}
                <input type='checkbox' value='1' name="flag_passwordNeverExpires"
                    {if $flag_passwordNeverExpires} checked {/if} id='flag_passwordNeverExpires'>
                {/render}
            </td>
            <td>
                <label for="flag_passwordNeverExpires">{tr}The password never expires{/tr}</label>
            </td>
        </tr>
        <tr>
            <td>
                {render acl=$noPasswordRequiredACL  checkbox=$multiple_support checked=$use_noPasswordRequired}
                <input type='checkbox' value='1' name="flag_noPasswordRequired"
                    {if $flag_noPasswordRequired} checked {/if} id='flag_noPasswordRequired'>
                {/render}
            </td>
            <td>
                <label for="flag_noPasswordRequired">{tr}Login from windows client requires no password{/tr}</label>
            </td>
        </tr>
        <tr>
            <td>
                {render acl=$temporaryDisabledACL  checkbox=$multiple_support checked=$use_temporaryDisabled}
                <input type='checkbox' value='1' name="flag_temporaryDisabled"
                    {if $flag_temporaryDisabled} checked {/if} id='flag_temporaryDisabled'>
                {/render}
            </td>
            <td>
                <label for="flag_temporaryDisabled">{tr}Lock samba account{/tr}</label>
            </td>
        </tr>
        <tr>
            <td>
                {render acl=$cannotChangePasswordACL  checkbox=$multiple_support checked=$use_cannotChangePassword}
                 <input type='checkbox' value='1' name='flag_cannotChangePassword'
                    {if $flag_cannotChangePassword} checked {/if} id='flag_cannotChangePassword'>
    </table>
    <table>
      <tr>
        <td colspan=2>
           {render acl=$sambaKickoffTimeACL  checkbox=$multiple_support checked=$use_sambaKickoffTime}
             <input id="flag_sambaKickoffTime" type=checkbox name="flag_sambaKickoffTime" value="1" 
                    {if $flag_sambaKickoffTime} checked {/if} class="center">
           {/render}
           <label for="flag_sambaKickoffTime">{tr}Account expires after{/tr}</label>
         </td>
         <td style='width:200px;'>
           {render acl=$sambaKickoffTimeACL}
             <input type="text" id="sambaKickoffTime" name="sambaKickoffTime" class="date" style='width:100px' value="{$sambaKickoffTime}">
                {if $sambaKickoffTimeACL|regex_replace:"/[cdmr]/":"" == "w"}
                  <script type="text/javascript">
                    {literal}
                       var datepicker2 = new DatePicker({ 
                            relative : 'sambaKickoffTime', 
                            language : '{/literal}{$lang}{literal}', 
                            keepFieldEmpty : true, 
                            enableCloseEffect : false, 
                            enableShowEffect : false });
                    {/literal}
                  </script>
               {/if}
            {/render}
          </td>
       </tr>
                {/render}
            </td>
            <td>
                <label for="flag_cannotChangePassword">{tr}Cannot change password{/tr}</label>
            </td>
        </tr>


        <tr>
            <td>
            </td>
            <td>
                {if $additional_info_PwdMustChange}
                    <i>({$additional_info_PwdMustChange})</i>
                {/if}
            </td>
        </tr>            
    </table>

    <table>
        <tr>
            <td colspan=2>
                {render acl=$sambaKickoffTimeACL  checkbox=$multiple_support checked=$use_sambaKickoffTime}
                    <input id="flag_sambaKickoffTime" type=checkbox name="flag_sambaKickoffTime" value="1"
                        {if $flag_sambaKickoffTime} checked {/if} class="center">
                {/render}
                <label for="flag_sambaKickoffTime">{tr}Account expires after{/tr}</label>
            </td>
            <td style='width:200px;'>
                {render acl=$sambaKickoffTimeACL}
                    <input type="text" id="sambaKickoffTime" name="sambaKickoffTime" 
                        class="date" style='width:100px' value="{$sambaKickoffTime}">
                    {if $sambaKickoffTimeACL|regex_replace:"/[cdmr]/":"" == "w"}
                        <script type="text/javascript">
                            {literal}
                               var datepicker2 = new DatePicker({
                                    relative : 'sambaKickoffTime',
                                    language : '{/literal}{$lang}{literal}',
                                    keepFieldEmpty : true,
                                    enableCloseEffect : false,
                                    enableShowEffect : false });
                            {/literal}
                        </script>
                    {/if}
                {/render}
            </td>
        </tr>
    </table>


    <hr>

    {render acl=$sambaLogonHoursACL mode=read_active  checkbox=$multiple_support checked=$use_SetSambaLogonHours}
        {tr}Samba log on times{/tr}&nbsp;<button type='submit' name='SetSambaLogonHours'>{tr}Edit settings...{/tr}</button>
    {/render}
    <!-- /Samba policies -->

  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>

   <label for="workstation_list">{tr}Allow connection from these workstations only{/tr}</label>
   <br>

{if $multiple_support}
	<input type="checkbox" name="use_workstation_list" {if $use_workstation_list} checked {/if} class="center"
		onClick="changeState('workstation_list');">
   <select {if $multiple_support && !$use_workstation_list} disabled {/if} 
	id="workstation_list" style="width:100%;" name="workstation_list[]" size=10 multiple>
	
	{foreach from=$multiple_workstations item=item key=key}
		{if $item.UsedByAllUsers}
			<option value="{$key}">{$item.Name} ({tr}Used by all users{/tr})</option>
		{else}
			<option style='color: #888888; background: #DDDDDD;background-color: #DDDDDD;'
				value="{$key}">{$item.Name} ({tr}Used by some users{/tr})</option>
		{/if}
	{/foreach}
   </select>
   <br>
   <button type='submit' name='add_ws'>{msgPool type=addButton}</button>

   <button type='submit' name='delete_ws'>{msgPool type=delButton}</button>

{else}
	{render acl=$sambaUserWorkstationsACL}
	   <select id="workstation_list" style="width:100%;" name="workstation_list[]" size=5 multiple>
		{html_options values=$workstations output=$workstations}
	   </select>
	{/render}
	   <br>
	{render acl=$sambaUserWorkstationsACL}
	   <button type='submit' name='add_ws'>{msgPool type=addButton}</button>

	{/render}
	{render acl=$sambaUserWorkstationsACL}
	   <button type='submit' name='delete_ws'>{msgPool type=delButton}</button>

	{/render}
{/if}
  </td>
 </tr>
</table>

<input type="hidden" name="sambaTab" value="sambaTab">
