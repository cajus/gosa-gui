<h3>{tr}VoIP database information{/tr}</h3>
  <table summary="{tr}VoIP database information{/tr}">
    <tr>
     <td>{tr}Asterisk DB user{/tr}{$must}</td>
     <td>
{render acl=$goFonAdminACL}
      <input type='text' name="goFonAdmin" size=30 maxlength=60 id="goFonAdmin" value="{$goFonAdmin}">
{/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Password{/tr}{$must}</td>
     <td>
{render acl=$goFonPasswordACL}
      <input type=password name="goFonPassword" id="goFonPassword" size=30 maxlength=60 value="{$goFonPassword}">
{/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Country dial prefix{/tr}{$must}</td>
     <td>
{render acl=$goFonCountryCodeACL}
      <input type='text' name="goFonCountryCode" size=10 maxlength=30 id="goFonCountryCode" value="{$goFonCountryCode}">
{/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Local dial prefix{/tr}{$must}</td>
     <td>
{render acl=$goFonAreaCodeACL}
      <input type='text' name="goFonAreaCode" size=10 maxlength=30 id="goFonAreaCode" value="{$goFonAreaCode}">
{/render}
     </td>
    </tr>
   </table>

<hr>
<div class="plugin-actions">
 <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
 <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>
<input type="hidden" name="goFonServerPosted" value="1">
