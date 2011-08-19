
<table width="100%" summary="{tr}FAI partition table{/tr}">
 <tr>
  <td width="50%" valign="top">
   <h3>{tr}Generic{/tr}
   </h3>
   <table summary="{tr}Generic settings{/tr}" cellspacing="4">
    <tr>
     <td><LABEL for="cn">{tr}Name{/tr}
      {$must}</LABEL>
     </td>
     <td>
      {render acl=$cnACL}
       <input type='text' value="{$cn}" size="45" maxlength="80" id='cn' disabled >
      {/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL>
     </td>
     <td>
      {render acl=$descriptionACL}
       <input type='text' value="{$description}" size="45" maxlength="80" name="description" id="description">
      {/render}
     </td>
    </tr>
   </table>
   <hr>
   <p>
    <input type="checkbox" name="mode" value="1" {$mode} {$lockmode} id='setup-storage'
      onClick="changeState('AddRaid'); changeState('AddVolgroup');">
    <label for='setup-storage'>{tr}Use 'setup-storage' to partition the disk{/tr}</label>
   </p>
  </td>
  <td class='left-border'>&nbsp;
  </td>
  <td>
   <h3><LABEL for="SubObject">{tr}Discs{/tr}</LABEL>
   </h3>
   {$Entry_listing}
   
   {if $sub_object_is_addable}
    <button type='submit' name='AddDisk' title="{tr}Add disk{/tr}">{tr}Add disk{/tr}</button>
    <button {$storage_mode} {$addraid} type='submit' name='AddRaid' id="AddRaid" title="{tr}Add RAID{/tr}">{tr}Add RAID{/tr}</button>
    <button {$storage_mode} type='submit' name='AddVolgroup' id="AddVolgroup" title="{tr}Add volume group{/tr}">{tr}Add volume group{/tr}</button>
    {else}
    <button type='button' disabled name='AddDisk' title="{tr}Add disk{/tr}">{tr}Add disk{/tr}</button>
    <button type='button' disabled name='AddRaid' title="{tr}Add RAID{/tr}">{tr}Add RAID{/tr}</button>
    <button type='button' disabled name='AddVolgroup' title="{tr}Add volume group{/tr}">{tr}Add volume group{/tr}</button>
    
   {/if}
  </td>
 </tr>
</table>
<input type='hidden' name='FAIpartitionTablePosted' value='1'><!-- Place cursor -->
<script language="JavaScript" type="text/javascript"><!-- // First input field on page	focus_field('cn','description');  --></script>
