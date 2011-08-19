<table width='100%' summary="{tr}POSIX settings{/tr}">
 <tr>
  <td style='width:50%;' class='right-border'>

   <h3>{tr}POSIX settings{/tr}</h3>
   <table summary="{tr}Home directory{/tr}">
    <tr>
     <td>
      <label for="homeDirectory">{tr}Home directory{/tr}</label>
     </td>
     <td>
      <input type='text' id="homeDirectory" name="homeDirectory" size=40 maxlength=120 value="{$homeDirectory}">
     </td>
    </tr>
   </table>

   <table summary="{tr}Account settings{/tr}">
    <tr>
     <td><label for="primaryGroup">{tr}Primary group{/tr}</label></td>
     <td>
      <select id="primaryGroup" size="1" name="primaryGroup">
       {html_options options=$secondaryGroups selected=$primaryGroup}
      </select> 
     </td>
    </tr>
    <tr>
     <td>
      <input id="force_ids" type=checkbox name="force_ids" value="1"  {$force_ids}
      onclick="changeState('uidNumber');changeState('gidNumber');">
     </td>
     <td>
      <label for="force_ids">
      {tr}Force UID/GID{/tr}
      </label>
     </td>
     <td>&nbsp;</td>
     <td>
      <label for="uidNumber">{tr}UID{/tr}</label>
     </td>
     <td>
      <input type='text' id="uidNumber" name="uidNumber" size=9 maxlength=9 {$forceMode} value="{$uidNumber}">
     </td>
    </tr>
    <tr>
     <td colspan="3">&nbsp;</td>
     <td>
      <label for="gidNumber">{tr}GID{/tr}</label>
     </td>
     <td>
      <input type='text' id="gidNumber" name="gidNumber" size=9 maxlength=9 {$forceMode} value="{$gidNumber}">
     </td>
    </tr>
   </table>

  </td>
  <td>

   <table summary="{tr}Group membership{/tr}" width='100%'>
 
    <tr>
     <td><h3>{tr}Group membership{/tr}</h3>
     </td>
    </tr>
    <tr>
     <td>
      
      {if $groups eq "too_many_for_nfs"}
      <b style="color:red">{tr}(Warning: more than 16 groups are not supported by NFS!){/tr}</b>
      <br>
      {/if}
      <select style="width:100%; height:130px;" name="group_list[]" size=16 multiple>
       {html_options options=$groupMembership}
      </select>
      <br>
      <button type='submit' name='edit_groupmembership'>{msgPool type=addButton}</button>&nbsp;
      
      <button type='submit' name='delete_groupmembership'>{msgPool type=delButton}</button>
      
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>
<br>
<br>
