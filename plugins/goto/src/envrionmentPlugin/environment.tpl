
<input type="hidden" name="iamposted" value="1">

<h3>{tr}Profiles{/tr}</h3>

<table summary="{tr}Environment management settings{/tr}" width="100%">
 <tr>
  <td>   
   {if $multiple_support}
   {render acl=$gotoProfileACL checkbox=$multiple_support checked=$use_useProfile}
   <input class="center" type="checkbox" value="1" {if $useProfile} checked {/if} 
   name="useProfile" id="useProfile">{tr}Use profile management{/tr}
   {/render}
   <br>
   {render acl=$gotoProfileServerACL checkbox=$multiple_support checked=$use_gotoProfileServer}
   {tr}Profile path{/tr}
   <select id="gotoProfileServer" name="gotoProfileServer" size=1>
    {foreach from=$gotoProfileServers key=key item=item}
    <option {if $gotoProfileServer == $key} selected {/if}value='{$key}'>{$item.DISPLAY}</option>
    {/foreach}
    <option disabled>&nbsp;</option>
   </select>
   {/render}
   <br>
   {render acl=$gotoProfileQuotaACL checkbox=$multiple_support checked=$use_gotoProfileQuota}
   <input type="text" name="gotoProfileQuota" value="{$gotoProfileQuota}" size="6" id="gotoProfileQuota">{tr}MB{/tr}
   {/render}
   <br>
   {render acl=$gotoProfileFlagCACL checkbox=$multiple_support checked=$use_gotoProfileFlagC}
   <input class="center" type="checkbox" name="gotoProfileFlagC" value="C" {$gotoProfileFlagCCHK} id="gotoProfileFlagC">&nbsp;
   {tr}Cache profile locally{/tr}
   {/render}
   
   {else}
   
   
   <table summary="{tr}Profile management{/tr}">
    <tr>
     <td>

      {render acl=$gotoProfileACL}
      <input class="center" type="checkbox" value="1" {$useProfileCHK} name="useProfile" id="useProfile" onclick="changeState('gotoProfileServer');changeState('gotoProfileFlagC');changeState('gotoProfileQuota');">
      {/render}
     </td>
     <td>

      <label for="useProfile">{tr}Use profile management{/tr}</label>
     </td>
    </tr>
    <tr>
     <td>&nbsp;
     </td>
     <td>
      <table summary="{tr}Profile server management{/tr}">
       <tr>
        <td> 
         <label for="gotoProfileServer">{tr}Profile path{/tr}</label>
        </td>
        <td>
         {render acl=$gotoProfileServerACL}
         
         {if $gotoProfileServerWriteable}
         <select id="gotoProfileServer" name="gotoProfileServer" size=1>
          {foreach from=$gotoProfileServers key=key item=item}
          {if $item.ACL != ""}
          <option {if $gotoProfileServer == $key} selected {/if}value='{$key}'>{$item.DISPLAY}</option>
          {/if}
          {/foreach}
          <option disabled>&nbsp;</option>
         </select>
         {else}
         <select id="dummy_pS" name="dummy_pS" disabled  size=1>
          <option>{$gotoProfileServer}&nbsp;</option> 
         </select>
         {/if}
         {/render}
        </td>
       </tr>
       <tr>
        <td>
         <label for="gotoProfileQuota">{tr}Profile quota{/tr}</label> 
         <br>
         <br>
        </td>
        <td>
         {render acl=$gotoProfileQuotaACL}
         <input type="text" name="gotoProfileQuota" value="{$gotoProfileQuota}" size="6" id="gotoProfileQuota">{tr}MB{/tr}
         {/render}
         <br>
         <br>
        </td>
       </tr>
       <tr>
        <td colspan=2> 
         {render acl=$gotoProfileFlagCACL}
         <input class="center" type="checkbox" name="gotoProfileFlagC" value="C" {$gotoProfileFlagCCHK} id="gotoProfileFlagC">&nbsp;
         {/render}
         <label for="gotoProfileFlagC">{tr}Cache profile locally{/tr}</label>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
   
   {/if}
   
  </td>
  <td style='width:50%;' class='left-border'>

   
   <table summary="{tr}Kiosk profile settings{/tr}">
    {if $kiosk_enabled}
    <tr>
     <td colspan=2>
      <label for="kiosk_server">{tr}Kiosk profile{/tr}</label>
     </td>
    </tr>
    <tr>
     <td>	
      {if $multiple_support}
      <input type="checkbox" name="use_kiosk_server" value="1" {if $use_kiosk_server} checked {/if} 
      class="center" 
      onClick="changeState('kiosk_server');
      changeState('kiosk_profile');"> 
      {/if}
      {tr}Server{/tr}
      {render acl=$gotoKioskProfileACL}
      <select name='kiosk_server' id="kiosk_server" onChange='document.mainform.submit();'
      {if !$use_kiosk_server && $multiple_support} disabled {/if}>
      {html_options options=$kiosk_servers selected=$kiosk_server}
</select>
{/render}
</td>
<td>
 {if $kiosk_server != "none"}
 {tr}Profile{/tr}
 {render acl=$gotoKioskProfileACL}
 <select name='kiosk_profile' id="kiosk_profile"
 {if !$use_kiosk_server && $multiple_support} disabled {/if}>
 {html_options values=$kiosk_profiles output=$kiosk_profiles selected=$kiosk_profile}
</select>
{/render}
{else}
&nbsp;
{/if}
</td>
</tr>
{else}
<tr>
 <td>
  <label for="dummy1">{tr}Kiosk profile{/tr}</label>
 </td>
 <td>
  <select name="dummy1" disabled id="dummy1" size=1><option disabled>&nbsp;</option></select>
  <button type="submit" disabled name="dummy2">{tr}Manage{/tr}</button>
 </td>
</tr>
{/if}
<tr>
 <td>
  {if $multiple_support}
  <input type="checkbox" value="1" class="center" name="use_gotoXResolution"
  onClick="changeState('gotoXResolution');" {if $use_gotoXResolution} checked {/if}>
  {/if}
  <label for="gotoXResolution">{tr}Resolution{/tr}</label>
 </td>
 <td>
  {render acl=$gotoXResolutionACL}
  <select name="gotoXResolution" id="gotoXResolution" {if !$use_gotoXResolution && $multiple_support} disabled {/if} size=1>
   {html_options values=$gotoXResolutionKeys output=$gotoXResolutions selected=$gotoXResolution}
   <option disabled>&nbsp;</option>
  </select>
  {/render}
 </td>
</tr>
<tr>
 <td colspan=2>
  {render acl=$gotoProfileFlagLACL checkbox=$multiple_support checked=$use_gotoProfileFlagL}
  <input type="checkbox" name="gotoProfileFlagL" id="gotoProfileFlagL" value="L" {$gotoProfileFlagLCHK} class="center">
  {/render}
  <label for="gotoProfileFlagL">{tr}Resolution changeable during session{/tr}</label>
 </td>
</tr>
</table> 






</td>
</tr>
</table>

<hr>

<table summary="{tr}Environment management settings{/tr}" width="100%">
 <tr>
  <td style='width:50%;' class='right-border'>

   <h3>{tr}Shares{/tr}</h3>
   <table style="width:100%" summary="{tr}Share settings{/tr}">
    <tr>
     <td>
      
      {render acl=$gotoShareACL}
      {$shareList}
      {/render}
      {render acl=$gotoShareACL}
      <input type="text" size=15 name="ShareUser" value="%u" title="{tr}User used to connect to the share{/tr}">@
      {/render}
      {render acl=$gotoShareACL}
      <select name="gotoShareSelection" title="{tr}Select a share{/tr}" size=1>
       {html_options values=$gotoShareSelectionKeys output=$gotoShareSelections}
       <option disabled>&nbsp;</option>
      </select>
      {/render}
      :
      {render acl=$gotoShareACL}
      <input type="text" size=15 name="gotoShareMountPoint" value="%H/Netzlaufwerke/%L/%S"
      title="{tr}Mount path{/tr}">
      {/render}
      {render acl=$gotoShareACL}
      <button type='submit' name='gotoShareAdd'>{msgPool type=addButton}</button> 
      
      {/render}
      <!-- <input type="submit" name="gotoShareDel" value="{tr}Remove{/tr}"> -->
     </td>
    </tr>
   </table>
  </td>
  <td>

   <h3><label for="gotoLogonScript">{tr}Log on scripts{/tr}</label></h3>
   <table summary="{tr}Log on script management{/tr}" style="width:100%">
    <tr>
     <td>
      {render acl=$gotoLogonScriptACL}
      <select style="width:100%;" name="gotoLogonScript" multiple size=5 id="gotoLogonScript">
       
       {if $multiple_support}
       {foreach from=$gotoLogonScripts item=item key=key}
       {if $item.UsedByAllUsers}
       <option value="{$key}">{$item.LogonPriority}&nbsp;{$item.LogonName}&nbsp;[{$item.LogonDescription}] ({tr}Used by all users{/tr})</option>
       {else}
       <option style='color: #888888; background: #DDDDDD;background-color: #DDDDDD;' value="{$key}">{$item.LogonPriority}&nbsp;{$item.LogonName}&nbsp;[{$item.LogonDescription}] ({tr}Used by some users{/tr})</option>
       {/if}
       {/foreach}
       {else}
       {html_options values=$gotoLogonScriptKeys output=$gotoLogonScripts}
       <option disabled>&nbsp;</option>
       {/if}
      </select>
      {/render}
      
      <br>
      {render acl=$gotoLogonScriptACL}
      <button type='submit' name='gotoLogonScriptNew'>{msgPool type=addButton}</button>
      
      {/render}
      {render acl=$gotoLogonScriptACL}
      <button type='submit' name='gotoLogonScriptEdit' {if $gotoLogonScriptKeysCnt ==0} disabled {/if}
      >{tr}Edit{/tr}</button>
      
      {/render}
      {render acl=$gotoLogonScriptACL}
      <button type='submit' name='gotoLogonScriptDel' {if $gotoLogonScriptKeysCnt ==0} disabled {/if}
      >{msgPool type=delButton}</button>
      
      {/render}
     </td>
    </tr>
   </table> 
  </td>
 </tr>
</table>

<hr>

<table summary="{tr}Environment management settings{/tr}" width="100%">
 <tr>
  <td style='width:50%; ' class='right-border'>

   <h3><label for="gotoHotplugDevice_post">{tr}Hot-plug devices{/tr}</label></h3> 
   <table style="width:100%" summary="{tr}Hot-plug device settings{/tr}">
    <tr>
     <td>
      {render acl=$gotoHotplugDeviceDNACL}
      <select name="gotoHotplugDevice_post[]" size=5  style="width:100%;" id="gotoHotplugDevice_post" multiple>
       {if $multiple_support}
       {foreach from=$gotoHotplugDevices item=item key=key}
       {if $item.UsedByAllUsers}
       <option value="{$key}">{$item.name}&nbsp;[{$item.description}] ({tr}Used by all users{/tr})</option>
       {else}
       <option style='color: #888888; background: #DDDDDD;background-color: #DDDDDD;' value="{$key}">{$item.name}&nbsp;[{$item.description}] ({tr}Used by some users{/tr})</option>
       {/if}
       {/foreach}
       {else}
       {html_options values=$gotoHotplugDeviceKeys output=$gotoHotplugDevices}
       <option disabled>&nbsp;</option>
       {/if}
      </select>
      {/render}
     </td>
    </tr>
    <tr>
     <td>
      {render acl=$gotoHotplugDeviceDNACL}
      <button type='submit' name='gotoHotplugDeviceUse'>{msgPool type=addButton}</button>
      
      {/render}
      {render acl=$gotoHotplugDeviceDNACL}
      <button type='submit' name='gotoHotplugDeviceDel' {if !$gotoHotplugDevices} disabled {/if}>{msgPool type=delButton}</button>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   
   
   {if $multiple_support}
   
   <input type="checkbox" name="use_gotoPrinter" value="1" {if $use_gotoPrinter} checked {/if} class="center" onClick="$('div_gotoPrinter').toggle();"><b><label for="gotoPrinter">{tr}Printer{/tr}</label></<>
    
    <div id="div_gotoPrinter" {if !$use_gotoPrinter} style="display: none;" {/if}>
     <b>{tr}Using this option will overwrite the complete printer settings for all currently edited objects!{/tr}</b>
     <table style="width:100%" summary="{tr}Printer settings{/tr}">
      <tr>
       <td>
        {render acl=$gotoPrinterACL}
        <select style="width:100%;" name="gotoPrinterSel[]" multiple size=5 id="gotoPrinter">
         {html_options options=$gotoPrinter}
         <option disabled>&nbsp;</option>
        </select>
        {/render}
        <br>
        {render acl=$gotoPrinterACL}
        <button type='submit' name='gotoPrinterAdd'>{msgPool type=addButton}</button>
        
        {/render}
        {render acl=$gotoPrinterACL}
        <button type='submit' name='gotoPrinterDel' {if !$gotoPrinter} disabled {/if}
        >{msgPool type=delButton}</button>
        
        {/render}
        {render acl=$gotoPrinterACL}
        <button type='submit' name='gotoPrinterEdit' {if !$gotoPrinter} disabled {/if}
        >{tr}Toggle administrator{/tr}</button>
        
        {/render}
        {render acl=$gosaDefaultPrinterACL}
        <button type='submit' name='gotoPrinterDefault' {if !$gotoPrinter||$is_group} disabled {/if}
        >{tr}Toggle default{/tr}</button>
        
        {/render}
       </td>
      </tr>
     </table>
    </div>
    
    {else}
    
    <h3><label for="gotoPrinter">{tr}Printer{/tr}</label></h3>
    <table style="width:100%" summary="{tr}Printer settings{/tr}">
     <tr>
      <td>
       {render acl=$gotoPrinterACL}
       <select style="width:100%;" name="gotoPrinterSel[]" multiple size=5 id="gotoPrinter">
        {html_options options=$gotoPrinter}
        <option disabled>&nbsp;</option>
       </select>
       {/render}
       <br>
       {render acl=$gotoPrinterACL}
       <button type='submit' name='gotoPrinterAdd'>{msgPool type=addButton}</button>
       
       {/render}
       {render acl=$gotoPrinterACL}
       <button type='submit' name='gotoPrinterDel' {if !$gotoPrinter} disabled {/if}
       >{msgPool type=delButton}</button>
       
       {/render}
       {render acl=$gotoPrinterACL}
       <button type='submit' name='gotoPrinterEdit' {if !$gotoPrinter} disabled {/if}
       >{tr}Toggle administrator{/tr}</button>
       
       {/render}
       {render acl=$gosaDefaultPrinterACL}
       <button type='submit' name='gotoPrinterDefault' {if !$gotoPrinter||$is_group} disabled {/if}
       >{tr}Toggle default{/tr}</button>
       
       {/render}
      </td>
     </tr>
    </table>
    
    {/if}
    
  </td>
 </tr>
</table>
{if $multiple_support}
<input type="hidden" name="environment_multiple_posted" value="1">
{/if}
<script language="JavaScript" type="text/javascript">
<!-- // First input field on page
focus_field('useProfile');
-->
</script>

