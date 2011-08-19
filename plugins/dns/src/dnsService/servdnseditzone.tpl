
<h3>{tr}Generic{/tr}</h3>

<table summary="{tr}DNS zone{/tr}" width="100%">
 <tr>
  <td style='width:50%;' class='right-border'>
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td>{tr}Zone name{/tr}
      {$must}
     </td>
     <td>
      {render acl=$zoneNameACL}
       <input type="text" name="zoneName" value="{$zoneName}" {if $NotNew || $Zone_is_used} disabled {/if}>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Network address{/tr}
      {$must}
     </td>
     <td>
      {render acl=$ReverseZoneACL}
       <input type="text" name="ReverseZone" value="{$ReverseZone}" {if $NotNew || $Zone_is_used} disabled {/if}>
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Net mask{/tr}
     </td>
     <td>
      {render acl=$NetworkClassACL}
       <select name="NetworkClass" {if $NotNew || $Zone_is_used} disabled{/if} size=1>
        {html_options options=$NetworkClasses selected=$NetworkClass}
       </select>
      {/render}
     </td>
    </tr>
    
    {if $Zone_is_used}
     <tr>
      <td colspan="2"><i>{tr}Zone is in use, network settings can't be modified.{/tr}</i>
      </td>
     </tr>
    {/if}
   </table>
  </td>
  <td>
   <table summary="{tr}Zone records{/tr}">
    <tr>
     <td>{tr}Zone records{/tr}
      <br>
      {if $AllowZoneEdit == false}<i>{tr}Can't be edited because the zone wasn't saved right now.{/tr}</i>{/if}
     </td>
     <td>
      {render acl=$zoneEditorACL mode=read_active}
       <button type='submit' name='EditZoneEntries' {if $AllowZoneEdit == false}disabled {/if}>{tr}Edit{/tr}</button>
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<hr>

<h3>{tr}SOA record{/tr}</h3>

<table summary="{tr}Zone settings{/tr}" width="100%">
 <tr>
  <td style='width:50%;' class='right-border'>
   <table summary="{tr}SOA record{/tr}">
    <tr>
     <td>
      {tr}Primary DNS server for this zone{/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOAprimaryACL}
       <input type="text" name="sOAprimary" value="{$sOAprimary}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Mail address{/tr} {$must}
     </td>
     <td>
      {render acl=$sOAmailACL}
       <input type="text" name="sOAmail" value="{$sOAmail}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Serial number (automatically incremented){/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOAserialACL}
       <input type="text" name="sOAserial" value="{$sOAserial}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   <table summary="{tr}SOA record{/tr}">
    <tr>
     <td>{tr}Refresh{/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOArefreshACL}
       <input type="text" name="sOArefresh" value="{$sOArefresh}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Retry{/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOAretryACL}
       <input type="text" name="sOAretry" value="{$sOAretry}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}Expire{/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOAexpireACL}
       <input type="text" name="sOAexpire" value="{$sOAexpire}">
      {/render}
     </td>
    </tr>
    <tr>
     <td>{tr}TTL{/tr}
      {$must}
     </td>
     <td>
      {render acl=$sOAttlACL}
       <input type="text" name="sOAttl" value="{$sOAttl}">
      {/render}
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<hr>
<br>
<table summary="{tr}Mx record{/tr}" width="100%">
 <tr>
  <td style='width:50%;' class='right-border'>
   <h3>{tr}MX records{/tr}</h3>
   <table width="100%" summary="{tr}MX records{/tr}">
    <tr>
     <td>
      {render acl=$mXRecordACL}
       {$Mxrecords}
      {/render}
      {render acl=$mXRecordACL}
       <input type="text" 		name="StrMXRecord" value="">
      {/render}
      {render acl=$mXRecordACL}
       <button type='submit' name='AddMXRecord'>{msgPool type=addButton}</button>
      {/render}
     </td>
    </tr>
   </table>
  </td>
  <td>
   <h3>{tr}Global zone records{/tr}
   </h3>
   {render acl=$zoneRecordsACL}
    {$records}
   {/render}
  </td>
 </tr>
</table>

<hr>
<div class="plugin-actions">
  <button type='submit' name='SaveZoneChanges'>{msgPool type=saveButton}</button>
  <button type='submit' name='CancelZoneChanges'>{msgPool type=cancelButton}</button>
</div>
<script language="JavaScript" type="text/javascript">
 <!-- // First input field on page	
  focus_field('zoneName');  
 -->
</script>
