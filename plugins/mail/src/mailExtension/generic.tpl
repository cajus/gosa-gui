<table summary="{tr}Mail settings{/tr}" style='width:100%;'>
 <tr>
  <td style='width:50%; '>  

   <h3>{tr}Generic{/tr}</h3>
   
   <table summary="{tr}Mail address configuration{/tr}">
    {if !$multiple_support}
    <tr>
     <td><label for="mail">{tr}Primary address{/tr}</label>{$must}</td>
     <td>
      {if !$isModifyableMail && $initially_was_account && !$is_template}
      <input type='text' disabled size=30 value="{$mail}">
      {else}
      {if $domainSelectionEnabled}
      {render acl=$mailACL}
      <input type='text' id="mail" name="mail" size=20 maxlength=65 value="{$mail}">
      {/render}
      @<select name='MailDomain' size=1>
       {html_options values=$MailDomains output=$MailDomains selected=$MailDomain}
      </select>
      {else}
      {render acl=$mailACL}
      <input type='text' id="mail" name="mail" size=35 maxlength=65 value="{$mail}">
      {/render}
      {/if}
      {/if}
     </td>
    </tr>
    <tr>
     <td><label for="gosaMailServer">{tr}Server{/tr}</label></td>
     <td>
      {if !$isModifyableServer && $initially_was_account && !$is_template}
      <input type='text' disabled size=30 value="{$gosaMailServer}">
      {else}
      
      {render acl=$gosaMailServerACL}
      <select size="1" id="gosaMailServer" name="gosaMailServer" title="{tr}Specify the mail server where the user will be hosted on{/tr}">
       {html_options values=$MailServers output=$MailServers selected=$gosaMailServer}
       <option disabled>&nbsp;</option>
      </select>
      {/render}
      {/if}
     </td>
    </tr>
    {/if}
    
    <tr>
     <td>&nbsp;
     </td>
    </tr>
    {if $quotaEnabled}
    <tr>
     <td>{tr}Quota usage{/tr}</td>
     <td>{$quotaUsage}</td>
    </tr>
    <tr>
     <td><label for="gosaMailQuota">{tr}Quota size{/tr}</label></td>
     <td>
      {render acl=$gosaMailQuotaACL checkbox=$multiple_support checked=$use_gosaMailQuota}
      <input type='text' id="gosaMailQuota" name="gosaMailQuota" size="6" align="middle" maxlength="60"
      value="{$gosaMailQuota}"> MB
      {/render}
     </td>
    </tr>
    {/if}
   </table>
  </td>
  <td class='left-border'>

   &nbsp;
  </td>
  <td>
   {if !$multiple_support}
   <h3>
   <label for="alternates_list"> {tr}Alternative addresses{/tr}</label></h3>
   {render acl=$gosaMailAlternateAddressACL}
   <select id="alternates_list" style="width:100%;height:100px;" name="alternates_list[]" size="15" multiple
   title="{tr}List of alternative mail addresses{/tr}">
   {html_options values=$gosaMailAlternateAddress output=$gosaMailAlternateAddress}
   <option disabled>&nbsp;</option>
   {/render}
</select>
<br />
{render acl=$gosaMailAlternateAddressACL}
<input type='text' name="alternate_address" size="30" align="middle" maxlength="65" value="">
{/render}
{render acl=$gosaMailAlternateAddressACL}
<button type='submit' name='add_alternate'>{msgPool type=addButton}</button>

{/render}
{render acl=$gosaMailAlternateAddressACL}
<button type='submit' name='delete_alternate'>{msgPool type=delButton}</button>

{/render}
{/if}
</td>
</tr>
<tr>
 <td colspan="3">
  <hr>
  <table summary="{tr}Mail account configration flags{/tr}">
   <tr>
    <td>
     {render acl=$gosaMailDeliveryModeCACL}
     <input class="center" type=checkbox id="own_script" name="own_script" value="1" {$own_script}
     onClick="
     changeState('sieveManagement');
     changeState('drop_own_mails');
     changeState('use_vacation');
     changeState('use_spam_filter');
     changeState('use_mailsize_limit');
     changeState('import_vacation');
     changeState('vacation_template');
     changeState('only_local');
     changeState('gosaVacationMessage');
     changeState('gosaSpamSortLevel');
     changeState('gosaSpamMailbox');
     changeState('gosaMailMaxSize');
     changeStates();"> {tr}Use custom sieve script{/tr} <b>({tr}disables all Mail options!{/tr})</b>
     {/render}
    </td>
   </tr>
   {if $allowSieveManagement}
   <tr>
    <td>
     {render acl=$sieveManagementACL}
     <button type='submit' name='sieveManagement' id="sieveManagement" {if $own_script == ""} disabled {/if}
     >{tr}Sieve Management{/tr}</button>
     
     {/render}
    </td>
   </tr>
   {/if}
  </table>
 </td>
</tr>
<tr>
 <td colspan="3">
  <hr>
 </td>
</tr>
</table>

<table summary="{tr}Spam filter configuration{/tr}">
 <tr style="padding-bottom:0px;">
  <td style='width:50%; '>

   
   <div>
    <div style='float:left'>
     {render acl=$gosaMailDeliveryModeIACL checkbox=$multiple_support checked=$use_drop_own_mails}
     <input {if $own_script != ""} disabled {/if} class="center" id='drop_own_mails' 
     type=checkbox name="drop_own_mails" value="1" {$drop_own_mails} 
     title="{tr}Select if you want to forward mails without getting own copies of them{/tr}">
     {/render}
    </div>
    <div style='padding-left: 25px;'>
     {tr}No delivery to own mailbox{/tr}
    </div>
   </div>
   
   <div class='clear'></div>  
   
   <div>
    <div style='float:left'>
     {render acl=$gosaMailDeliveryModeVACL checkbox=$multiple_support checked=$use_use_vacation}
     <input type=checkbox name="use_vacation" value="1" {$use_vacation} 
     id="use_vacation" {if $own_script != ""} disabled {/if}
     title="{tr}Select to automatically response with the vacation message defined below{/tr}" class="center" 
     onclick="changeStates()">
     {/render}
    </div>
    <div style='padding-left: 25px;'>
     {tr}Activate vacation message{/tr}
    </div>
   </div>
   
   <div class='clear'></div>  
   
   {if $rangeEnabled}
   <table summary="{tr}Spam filter configuration{/tr}">
    <tr>
     <td>{tr}from{/tr}</td>
     <td style='width:140px'>
      {render acl=$gosaVacationMessageACL}
      <input type="text" id="gosaVacationStart" name="gosaVacationStart" class="date" style='width:100px' value="{$gosaVacationStart}">
      {if $gosaVacationMessageACL|regex_replace:"/[cdmr]/":"" == "w"}
      <script type="text/javascript">
      {literal}
      var datepicker  = new DatePicker({ relative : 'gosaVacationStart', language : '{/literal}{$lang}{literal}', keepFieldEmpty : true, enableCloseEffect : false, enableShowEffect : false });
      {/literal}
      </script>
      {/if}
      {/render}
     </td>
     <td>{tr}till{/tr}</td>
     <td style='width:140px'>
      {render acl=$gosaVacationMessageACL}
      <div id="vacstart"><input type="text" id="gosaVacationStop" name="gosaVacationStop" class="date" style='width:100px' value="{$gosaVacationStop}"></div>
      {if $gosaVacationMessageACL|regex_replace:"/[cdmr]/":"" == "w"}
      <script type="text/javascript">
      {literal}
      var datepicker2  = new DatePicker({ relative : 'gosaVacationStop', language : '{/literal}{$lang}{literal}', keepFieldEmpty : true, enableCloseEffect : false, enableShowEffect : false });
      {/literal}
      </script>
      {/if}
      {/render}
     </td>
    </tr>
   </table>
   {/if}
   <td class='left-border' rowspan="2">&nbsp;
</td>
   <td>

    
    <div>
     <div style='float:left'>
      {render acl=$gosaMailDeliveryModeSACL checkbox=$multiple_support checked=$use_use_spam_filter}
      <input {if $own_script != ""} disabled {/if} id='use_spam_filter' type=checkbox name="use_spam_filter" 
      value="1" {$use_spam_filter} title="{tr}Select if you want to filter this mails through Spamassassin{/tr}" class="center">
      {/render}
     </div>
     <div style='padding-left: 25px;'>
      <label for="gosaSpamSortLevel">{tr}Move mails tagged with SPAM level greater than{/tr}</label>
      {render acl=$gosaSpamSortLevelACL checkbox=$multiple_support checked=$use_gosaSpamSortLevel}
      <select {if $own_script != ""} disabled {/if} id="gosaSpamSortLevel" size="1" name="gosaSpamSortLevel" 
      title="{tr}Choose SPAM level - smaller values are more sensitive{/tr}">
      {html_options values=$spamlevel output=$spamlevel selected=$gosaSpamSortLevel}
</select>
{/render}
<label for="gosaSpamMailbox">{tr}to folder{/tr}</label>
{render acl=$gosaSpamMailboxACL checkbox=$multiple_support checked=$use_gosaSpamMailbox}
<select {if $own_script != ""} disabled {/if} size="1" id="gosaSpamMailbox" name="gosaSpamMailbox">
 {html_options values=$spambox output=$spambox selected=$gosaSpamMailbox}
 <option disabled>&nbsp;</option>
</select>
{/render}
</div>
</div>

<div class='clear'></div>  

<div>
 <div style='float:left;'>
  {render acl=$gosaMailDeliveryModeRACL checkbox=$multiple_support checked=$use_use_mailsize_limit}
  <input {if $own_script != ""} disabled {/if} id='use_mailsize_limit' type=checkbox 
  name="use_mailsize_limit" value="1" {$use_mailsize_limit} class="center">
  {/render}
 </div>
 <div style='padding-left: 25px;'>
  <label for="gosaMailMaxSize">{tr}Reject mails bigger than{/tr}</label>
  {render acl=$gosaMailMaxSizeACL checkbox=$multiple_support checked=$use_gosaMailMaxSize}
  <input {if $own_script != ""} disabled {/if} id="gosaMailMaxSize" name="gosaMailMaxSize" 
  size="6" align="middle" type='text' maxlength="30" value="{$gosaMailMaxSize}"  class="center"> {tr}MB{/tr}
  {/render}
 </div>
</div>

<div class='clear'></div>  

</td>
</tr>
<tr>
 <td style='width:45%'>

  <p style="margin-bottom:0px;">
  <b><label for="gosaVacationMessage">{tr}Vacation message{/tr}</label></b>
  </p>
  {render acl=$gosaVacationMessageACL checkbox=$multiple_support checked=$use_gosaVacationMessage}
  <textarea {if $own_script != ""} disabled {/if} id="gosaVacationMessage" style="width:99%; height:100px;" 
name="gosaVacationMessage" rows="4" cols="512">{$gosaVacationMessage}</textarea>
{/render}
<br>

{if $show_templates eq "true"}
{render acl=$gosaVacationMessageACL}
<select id='vacation_template' name="vacation_template" {if $own_script != ""} disabled {/if} size=1>
 {html_options options=$vacationtemplates selected=$template}
 <option disabled>&nbsp;</option>
</select>
{/render}
{render acl=$gosaVacationMessageACL}
<button type='submit' name='import_vacation' id="import_vacation" {if $own_script != ""} disabled {/if}
>{tr}Import{/tr}</button>

{/render}
{/if}
</td>
<td>
 <p style="margin-bottom:0px;">
 <b><label for="forwarder_list">{tr}Forward messages to{/tr}</label></b>
 </p>
 
 {if $multiple_support}
 <input type="checkbox" name="use_gosaMailForwardingAddress" onclick="changeState('gosaMailForwardingAddress');" 
 class="center" {if $use_gosaMailForwardingAddress} checked {/if}>   
 {/if}
 
 {render acl=$gosaMailForwardingAddressACL}
 <select {if $use_gosaMailForwardingAddress} checked {/if}
 id="gosaMailForwardingAddress" style="width:100%; height:100px;" name="forwarder_list[]" size=15 multiple>
 {html_options values=$gosaMailForwardingAddress output=$gosaMailForwardingAddress selected=$template}        
 <option disabled>&nbsp;</option>
</select>
{/render}
<br>
{render acl=$gosaMailForwardingAddressACL}
<input type='text' id='forward_address' name="forward_address" size=20 align="middle" maxlength=65 value="">
{/render}
{render acl=$gosaMailForwardingAddressACL}
<button type='submit' name='add_forwarder' id="add_forwarder">{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$gosaMailForwardingAddressACL}
<button type='submit' name='add_local_forwarder' id="add_local_forwarder">{tr}Add local{/tr}</button>&nbsp;

{/render}
{render acl=$gosaMailForwardingAddressACL}
<button type='submit' name='delete_forwarder' id="delete_forwarder">{msgPool type=delButton}</button>

{/render}
</td>
</tr>
</table>
<hr>

<h3>{tr}Advanced mail options{/tr}
</h3>
<table summary="{tr}Delivery settings{/tr}">
 <tr>
  <td>
   {render acl=$gosaMailDeliveryModeLACL checkbox=$multiple_support checked=$use_only_local}
   <input {if $own_script != ""} disabled {/if} id='only_local' type=checkbox name="only_local" 
   value="1" {$only_local} title="{tr}Select if user can only send and receive inside his own domain{/tr}" class="center">
   {/render}
   {tr}User is only allowed to send and receive local mails{/tr}
  </td>
 </tr>
</table>

<input type="hidden" name="mailTab" value="mailTab">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">

{literal}
function validateClick()
{
alert("yes");
if(!document.getElementById('use_vacation').checked){
return;
}
}

function changeStates()
{
if($('own_script').checked) {
$("gosaVacationStart", "gosaVacationStop","gosaVacationMessage").invoke("disable");
$("datepicker-gosaVacationStop_image", "datepicker-gosaVacationStart_image").invoke("hide");
} else {
if($('use_vacation').checked) {
$("gosaVacationStart", "gosaVacationStop","gosaVacationMessage").invoke("enable");
$("datepicker-gosaVacationStop_image", "datepicker-gosaVacationStart_image").invoke("show");
}else{
$("gosaVacationStart", "gosaVacationStop","gosaVacationMessage").invoke("disable");
$("datepicker-gosaVacationStop_image", "datepicker-gosaVacationStart_image").invoke("hide");
}
}
}

changeStates();
focus_field('mail');
{/literal}
</script>
