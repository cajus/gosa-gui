<h3>{tr}Phone settings{/tr}</h3>
<table summary="{tr}Phone numbers{/tr}" style="width:100%" cellspacing=0>
 <tr>
  <td class='right-border'>
   <h3>{tr}Phone numbers{/tr}</h3>
  </td>
 </tr>
 <tr>
  <td class='right-border'>
   <select style="width:100%;" name="phonenumber_list[]" size=7 multiple>
    {html_options options=$phoneNumbers}
     <option disabled>&nbsp; </option>
   </select>
   <br>
   <input type='text' name="phonenumber" size=20 align=middle maxlength=60 value="">
   <button type='submit' name='add_phonenumber'>{msgPool type=addButton}</button> 

   <button type='submit' name='delete_phonenumber'>{msgPool type=delButton}</button>

  </td>
  <td style='width:50%;'>   <table summary="" style="width:100%" border=0>
    <tr>
     <td>      <h3>{tr}Telephone hardware{/tr}</h3>
      <table summary="{tr}Telephone{/tr}" border=0>
       <tr>
        <td>
         <label for="goFonVoicemailPIN">{tr}Voice mail PIN{/tr}{$must}</label>
        </td>
        <td>
         <input type="password" id="goFonVoicemailPIN" name="goFonVoicemailPI" value="{$goFonVoicemailPIN}">
        </td>
       </tr>
       <tr>
        <td>
         <label for="goFonPIN">{tr}Phone PIN{/tr}{$must}</label>
        </td>
        <td>
         <input type="password" id="goFonPIN" name="goFonPIN" value="{$goFonPIN}">
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<input type="hidden" name="phoneTab" value="phoneTab">
<br>
<br>
