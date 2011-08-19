<table style='width:100%; ' summary="{tr}Fax account{/tr}">


 <!-- Headline container -->
 <tr>
   <td style='width:50%; '>

     <h3>{tr}Generic{/tr}</h3>

     <table summary="{tr}Generic settings{/tr}">
       <tr>
         <td><label for="facsimileTelephoneNumber">{tr}Fax{/tr}</label>{$must}</td>
         <td>
{if $multiple_support}
	<input type='text' name="dummy1" value="{tr}Multiple edit{/tr}" disabled id="facsimileTelephoneNumber">
{else}
{render acl=$facsimileTelephoneNumberACL}
           <input name="facsimileTelephoneNumber" id="facsimileTelephoneNumber" size=20 maxlength=65 type='text'
		value="{$facsimileTelephoneNumber}" title="{tr}Fax number for GOfax to trigger on{/tr}">
{/render}
{/if}

         </td>
       </tr>
       <tr>
         <td><label for="goFaxLanguage">{tr}Language{/tr}</label></td>
	 <td>

{render acl=$goFaxLanguageACL checkbox=$multiple_support checked=$use_goFaxLanguage}
           <select size="1" name="goFaxLanguage" id="goFaxLanguage" 
		title="{tr}Specify the GOfax communication language for FAX to mail gateway{/tr}">
			{html_options options=$languages selected=$goFaxLanguage}
           </select>
{/render}

         </td>
       </tr>
       <tr>
         <td><label for="goFaxFormat">{tr}Delivery format{/tr}</label></td>
         <td>

{render acl=$goFaxFormatACL checkbox=$multiple_support checked=$use_goFaxFormat}
           <select id="goFaxFormat" size="1" name="goFaxFormat" title="{tr}Specify delivery format for FAX to mail gateway{/tr}">
	    {html_options values=$formats output=$formats selected=$goFaxFormat}
           </select>
{/render}
         </td>
       </tr>
     </table>
     
   </td>
   <td class='left-border'>

    &nbsp;
   </td>
   <td style='width:100%'>

     <h3>{tr}Delivery methods{/tr}</h3>

{render acl=$goFaxIsEnabledACL checkbox=$multiple_support checked=$use_goFaxIsEnabled}
     <input type=checkbox name="goFaxIsEnabled" value="1" {$goFaxIsEnabled} class="center">
{/render}
     {tr}Temporary disable FAX usage{/tr}<br>

     {if $has_mailaccount eq "false"}
{render acl=$faxtomailACL checkbox=$multiple_support checked=$use_faxtomail}
     <input type=checkbox name="faxtomail" value="1" {$faxtomail} class="center">
{/render}
      <label for="mail">{tr}Deliver FAX as mail to{/tr}</label>&nbsp;
{render acl=$faxtomailACL checkbox=$multiple_support checked=$use_mail}
      <input type='text' name="mail" id="mail" size=25 maxlength=65 value="{$mail}" class="center">
{/render}
     {else}
{render acl=$faxtomailACL checkbox=$multiple_support checked=$use_faxtomail}
     <input type=checkbox name="faxtomail" value="1" {$faxtomail} class="center">
{/render}
      {tr}Deliver FAX as mail{/tr}
     {/if}
     <br>

{render acl=$faxtoprinterACL checkbox=$multiple_support checked=$use_faxtoprinter}
     <input type=checkbox name="faxtoprinter" value="1" {$faxtoprinter} class="center">
{/render}
     {tr}Deliver FAX to printer{/tr}&nbsp;
{render acl=$faxtoprinterACL checkbox=$multiple_support checked=$use_goFaxPrinter}
     <select size="1" name="goFaxPrinterSelected">
      {html_options options=$printers selected=$goFaxPrinter}
		<option disabled>&nbsp;</option>
     </select>
{/render}
   </td>
 </tr>
</table>

<hr>

<table style='width:100%; ' summary="{tr}Alternative numbers{/tr}">

  <tr>
    <td style='width:50%; ' class='right-border'>


	{if !$multiple_support}

    <h3>{tr}Alternate FAX numbers{/tr}</h3>
{render acl=$facsimileAlternateTelephoneNumberACL}
    <select style="width:100%" name="alternate_list[]" size="10" multiple>
			{html_options values=$facsimileAlternateTelephoneNumber output=$facsimileAlternateTelephoneNumber}
			<option disabled>&nbsp;</option>
    </select>
{/render}
    <br>
{render acl=$facsimileAlternateTelephoneNumberACL}
    <input type='text' name="forward_address" size=20 align="middle" maxlength=65 value="">
{/render}
{render acl=$facsimileAlternateTelephoneNumberACL}
    <button type='submit' name='add_alternate'>{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$facsimileAlternateTelephoneNumberACL}
    <button type='submit' name='add_local_alternate'>{tr}Add local{/tr}</button>&nbsp;

{/render}
{render acl=$facsimileAlternateTelephoneNumberACL}
    <button type='submit' name='delete_alternate'>{msgPool type=delButton}</button>

{/render}
	{/if}
   </td>
   <td style='width:50%'>

      <h3>{tr}Blacklists{/tr}</h3>
      <table summary="{tr}Blacklists{/tr}" style="width:100%">
        <tr>
          <td>{tr}Blacklists for incoming FAX{/tr}</td>
          <td>
{render acl=$goFaxRBlocklistACL checkbox=$multiple_support checked=$use_edit_incoming}
            <button type='submit' name='edit_incoming'>{tr}Edit{/tr}</button>

{/render}
          </td>
        </tr>
        <tr>
          <td>{tr}Blacklists for outgoing FAX{/tr}</td>
          <td>
{render acl=$goFaxSBlocklistACL checkbox=$multiple_support checked=$use_edit_outgoing}
            <button type='submit' name='edit_outgoing'>{tr}Edit{/tr}</button>

{/render}
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

<input type="hidden" name="faxTab" value="faxTab">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('facsimileTelephoneNumber');
  -->
</script>
