<h3>{tr}FAX database information{/tr}</h3>
 <table summary="{tr}Fax database{/tr}">
  <tr>
   <td>{tr}FAX DB user{/tr}{$must}</td>
   <td>
    {render acl=$goFaxAdminACL}
     <input type='text' name="goFaxAdmin" id="goFaxAdmin" value="{$goFaxAdmin}" >
    {/render}
   </td>
  </tr>
  <tr>
   <td>{tr}Password{/tr}{$must}</td>
   <td>
    {render acl=$goFaxPasswordACL}
     <input type=password name="goFaxPassword" id="goFaxPassword" value="{$goFaxPassword}" >
    {/render}
  </td>
 </tr>
</table>

<hr>

<div class="plugin-actions">
 <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
 <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>
<input type="hidden" name="goFaxServerPosted" value="1">
