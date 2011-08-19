
<h3>{tr}Syslog logging{/tr}</h3>

<input type="checkbox" name="use_database" value="1" {if $use_database} checked {/if}
  onChange="changeState('gosaLogDB'); changeState('goLogAdmin');changeState('goLogPassword');"  class="center">

<b>{tr}Server provides a Syslog MySQL database{/tr}</b>

<table summary="{tr}rSyslog database settings{/tr}">
 <tr>
  <td>{tr}Database{/tr}{$must}</td>
  <td>
   {render acl=$gosaLogDBACL}
    <input name="gosaLogDB" id="gosaLogDB" type='text'
      value="{$gosaLogDB}" {if !$use_database} disabled {/if}>
   {/render}
  </td>
 </tr>
 <tr>
  <td>{tr}Database user{/tr}{$must}</td>
  <td>
   {render acl=$goLogAdminACL}
    <input name="goLogAdmin" id="goLogAdmin" type='text'
      value="{$goLogAdmin}" {if !$use_database} disabled {/if}>
   {/render}
  </td>
 </tr>
 <tr>
  <td>{tr}Password{/tr}{$must}</td>
  <td>
   {render acl=$goLogPasswordACL}
    <input type="password" name="goLogPassword" id="goLogPassword" size=30 maxlength=60 
      value="{$goLogPassword}"    {if !$use_database} disabled {/if}>
   {/render}
  </td>
 </tr>
</table>

<hr>

<div class="plugin-actions">
 <button type='submit' name='SaveService'>{msgPool type=saveButton}</button>
 <button type='submit' name='CancelService'>{msgPool type=cancelButton}</button>
</div>

<input type="hidden" name="rSyslogServerPosted" value="1">
