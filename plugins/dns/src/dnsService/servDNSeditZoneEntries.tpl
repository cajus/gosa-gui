
<h3>{tr}This dialog allows you to configure all components of this DNS zone on a single list.{/tr}</h3>
<hr>

{if $disableDialog}
 <br>
 <b>{tr}This dialog can't be used until the currently edited zone was saved or the zone entry exists in the LDAP directory.{/tr}</b>
 {else}
 <br>
 {$table}
 <br>
 {render acl=$acl}
  <button type='submit' name='UserRecord' title="{tr}Create a new DNS zone entry{/tr}">{tr}New entry{/tr}</button>
 {/render}
 
{/if}
<hr>

<div class="plugin-actions">
  {render acl=$acl}
   <button type='submit' name='SaveZoneEntryChanges'>{msgPool type=saveButton}</button>
  {/render}
  <button type='submit' name='CancelZoneEntryChanges'>{msgPool type=cancelButton}</button>
</div>
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page	
  focus_field('zoneName');  -->
</script>
