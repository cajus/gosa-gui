<table style='width:100%; ' summary="{tr}SCALIX settings{/tr}">

 <tr>
  <td style='width:50%; '>

   <h3>{tr}Generic{/tr}
</h3>
<!-- Hide user specific attributes when in group mode. -->
   <table summary="{tr}Mail settings{/tr}" >
    <tr>
     <td><label for="scalixMailnode">{tr}SCALIX mail node{/tr}</label>{$must}</td>
     <td>
{render acl=$scalixMailnodeACL}
		<input type='text' id="scalixMailnode" name="scalixMailnode" size=35 maxlength=65 value="{$scalixMailnode}">
{/render}
	 </td>
    </tr>
{if !$scalixGroup}
    <tr>
     <td><label for="scalixMailboxClass">{tr}SCALIX mailbox class{/tr}</label></td>
     <td>
{render acl=$scalixMailboxClassACL}
      <select size="1" id="scalixMailboxClass" name="scalixMailboxClass"  
			title="{tr}Limited users can not make use of the group calendar functionality in SCALIX{/tr}">
		    {html_options values=$mailboxClasses output=$mailboxClasses selected=$scalixMailboxClass}
      </select>
{/render}
     </td>
    </tr>


    <tr>
     <td><label for="scalixServerLanguage">{tr}SCALIX server language{/tr}</label></td>
     <td>
{render acl=$scalixServerLanguageACL}
      <select size="1" id="scalixServerLanguage" name="scalixServerLanguage" 
			title="{tr}Message catalog language for client{/tr}">
		    {html_options values=$serverLanguages output=$serverLanguages selected=$scalixServerLanguage}
      </select>
{/render}
     </td>
    </tr>
{/if} 
   </table>
  
{if !$scalixGroup}
   <hr>
   
   <table summary="{tr}Settings{/tr}" >
    <tr>
     <td>
{render acl=$scalixAdministratorACL}
	  <input type=checkbox name="scalixAdministrator" value="1" {$scalixAdministrator}
	   title="{tr}Select for administrator capabilities{/tr}"> {tr}SCALIX Administrator{/tr}
{/render}
	  <br>
{render acl=$scalixMailboxAdministratorACL}
	  <input type=checkbox name="scalixMailboxAdministrator" value="1" {$scalixMailboxAdministrator}
	   title="{tr}Select for mailbox administrator capabilities{/tr}"> {tr}SCALIX Mailbox Administrator{/tr}
{/render}
	  <br>
{render acl=$scalixHideUserEntryACL}
	  <input type=checkbox name="scalixHideUserEntry" value="1" {$scalixHideUserEntry}
	   title="{tr}Hide user entry from address book{/tr}"> {tr}Hide this user entry in SCALIX{/tr}
{/render}
	  <br>
   </table>
   
   <hr>
   
   <table summary="{tr}Settings{/tr}" >
    <tr>
     <td><label for="scalixLimitMailboxSize">{tr}Limit mailbox size{/tr}</label></td>
     <td>
{render acl=$scalixLimitMailboxSizeACL}
		<input type='text' id="scalixLimitMailboxSize" name="scalixLimitMailboxSize" size=5 maxlength=10 value="{$scalixLimitMailboxSize}">&nbsp;{tr}MB{/tr}
{/render}
	 </td>
    </tr>
    <tr>
     <td >
{render acl=$scalixLimitOutboundMailACL}
	  <input type=checkbox name="scalixLimitOutboundMail" value="1" {$scalixLimitOutboundMail}
	   title="{tr}As sanction on mailbox quota overuse, stop user from sending mail{/tr}"> {tr}Limit Outbound Mail{/tr}
{/render}
	  <br>
{render acl=$scalixLimitInboundMailACL}
	  <input type=checkbox name="scalixLimitInboundMail" value="1" {$scalixLimitInboundMail}
	   title="{tr}As sanction on mailbox quota overuse, stop user from receiving mail{/tr}"> {tr}Limit Inbound Mail{/tr}
{/render}
	  <br>
{render acl=$scalixLimitNotifyUserACL}
	  <input type=checkbox name="scalixLimitNotifyUser" value="1" {$scalixLimitNotifyUser}
	   title="{tr}As sanction on mailbox quota overuse, notify the user by email{/tr}"> {tr}Notify User{/tr}
{/render}
	  <br>
     </td>
    </tr>
   </table>
{/if}
  </td>

  <td class='left-border'>

   &nbsp;
  </td>

  <td>

   <h3>
<label for="emails_list"> {tr}SCALIX email addresses{/tr}</label></h3>
{render acl=$scalixEmailAddressACL}
   <select id="emails_list" style="width:100%;height:100px;" name="emails_list[]" size="15"
		 multiple title="{tr}List of SCALIX email addresses{/tr}" >
            {html_options values=$scalixEmailAddress output=$scalixEmailAddress}
			<option disabled>&nbsp;</option>
   </select>
{/render}
   <br />
{render acl=$scalixEmailAddressACL}
   <input type='text' name="email_address" size="30" align="middle" maxlength="65" value="">
{/render}
{render acl=$scalixEmailAddressACL}
   <button type='submit' name='add_email'>{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$scalixEmailAddressACL}
   <button type='submit' name='delete_email'>{msgPool type=delButton}</button>

{/render}
  </td>
 </tr>
</table>
<input type="hidden" name="scalixTab" value="scalixTab">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('scalixMailnode');
  -->
</script>
