<table summary="{tr}Phone numbers{/tr}" style="width:100%">
 <tr>
  <td class='right-border'>
   <h3>{tr}Phone numbers{/tr}</h3>

{if $multiple_support}

   <select style="width:100%;" name="dummy1" size=7 >
    {html_options options=$phoneNumbers}
    <option disabled>&nbsp;</option>
   </select>

{else}

{render acl=$telephoneNumberACL}
   <select style="width:100%;" name="phonenumber_list[]" size=7 multiple>
    {html_options options=$phoneNumbers}
    <option disabled>&nbsp;</option>
   </select>
{/render}
   <br>
{render acl=$telephoneNumberACL}
   <input type='text' name="phonenumber" size=20 align=middle maxlength=60 value="">
{/render}
{render acl=$telephoneNumberACL}
   <button type='submit' name='add_phonenumber'>{msgPool type=addButton}</button>&nbsp;

{/render}
{render acl=$telephoneNumberACL}
      <button type='submit' name='delete_phonenumber'>{msgPool type=delButton}</button>

{/render}

{/if}
  </td>
  <td style='width:50%;'>   <table summary="" style="width:100%" border=0>
 <tr>

  <td>   <h3>{tr}Telephone hardware{/tr}</h3>

      <table summary="{tr}Telephone{/tr}" border=0>
	   {if !$multiple_support}
       <tr>
        <td>
			{tr}Telephone{/tr}
		</td>
        <td>
		{render acl=$goFonHardwareACL checkbox=$multiple_support checked=$use_goFonHardware}
			{$hardware_list}
		{/render}
		</td>
       </tr>
	   {/if}
       <tr>
        <td>{tr}Home server{/tr}{$must}
        </td>
        <td>
{render acl=$goFonHomeServerACL checkbox=$multiple_support checked=$use_goFonHomeServer}
         <select name='goFonHomeServer' title='{tr}Select the accounts home server{/tr}' size=1>
          {html_options options=$goFonHomeServers selected=$goFonHomeServer}
         </select>
{/render}
        </td>
      </tr>
    <tr>
     <td>{tr}Context{/tr}
     </td>
     <td>
{render acl=$goFonContextACL checkbox=$multiple_support checked=$use_goFonContext}
      <select name='context' title='{tr}Select the accounts context{/tr}' size=1>
        {html_options values=$sip_contexts output=$sip_contexts selected=$context}
      </select>
{/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Voice mail context{/tr}
     </td>
     <td>
{render acl=$goFonVoiceMailContextACL checkbox=$multiple_support checked=$use_goFonVoiceMailContext}
      <select name='voice_context' title='{tr}Select the accounts context{/tr}' size=1>
        {html_options values=$voicemail_contexts output=$voicemail_contexts selected=$voice_context}
      </select>
{/render}
     </td>
    </tr>

      <tr>
       <td>
        <label for="goFonVoicemailPIN">{tr}Voice mail PIN{/tr}{$must}</label>
       </td>
       <td>
{render acl=$goFonVoicemailPINACL checkbox=$multiple_support checked=$use_goFonVoicemailPIN}
        <input type="password" id="goFonVoicemailPIN" name="goFonVoicemailPIN" value="{$goFonVoicemailPIN}">
{/render}
      </td>
      </tr>
      <tr>
       <td>
        <label for="goFonPIN">{tr}Phone PIN{/tr}{$must}</label>
       </td>
       <td>
{render acl=$goFonPINACL checkbox=$multiple_support checked=$use_goFonPIN}
        <input type="password" id="goFonPIN" name="goFonPIN" value="{$goFonPIN}">
{/render}
      </td>
      </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>

 </tr>
 <tr>
 <td style='width:50%'></td>
 </tr>
 <tr> 
  <td style='width:50%'>  
  <h3>&nbsp;{tr}Phone macro{/tr}</h3>
  <table summary="{tr}Phone macro{/tr}">
   <tr>
    <td colspan=2>
{render acl=$goFonMacroACL  checkbox=$multiple_support checked=$use_macro}
     <select id="macro" name="selectedMacro" onchange="document.mainform.submit()" size=1>
      {html_options options=$macros selected=$macro}
      <option disabled>&nbsp;</option>
     </select>
{/render}
     {if $javascript eq 'false'}
{render acl=$goFonMacroACL}
      <button type='submit' name='refresh'>{tr}Refresh{/tr}</button>

{/render}
     {/if}
    </td>
   </tr>
  </table>
  <br>
  {$macrotab}
 </td>
 </tr>
</table>
<input type="hidden" name="phoneTab" value="phoneTab">


<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('phonenumber');
  -->
</script>
