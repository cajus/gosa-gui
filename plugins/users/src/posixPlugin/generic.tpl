<table style="width:100%;" summary="{tr}POSIX settings{/tr}">
 <tr>
  <td style="width:50%">

   <h3>{tr}Generic{/tr}</h3>
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td><label for="homeDirectory">{tr}Home directory{/tr}</label>{$must}</td>
     <td>
      {render acl=$homeDirectoryACL checkbox=$multiple_support checked=$use_homeDirectory}
      <input type='text' id="homeDirectory" name="homeDirectory" size=40 maxlength=120 value="{$homeDirectory}">
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="loginShell">{tr}Shell{/tr}</label></td>
     <td>
      {render acl=$loginShellACL checkbox=$multiple_support checked=$use_loginShell}
      <select id="loginShell" size="1" name="loginShell">
       {html_options values=$shells output=$shells selected=$loginShell}
      </select> 
      {/render}
     </td>
    </tr>
    <tr>
     <td><label for="primaryGroup">{tr}Primary group{/tr}</label></td>
     <td>
      {render acl=$gidNumberACL checkbox=$multiple_support checked=$use_primaryGroup}
      <select id="primaryGroup" size="1" name="primaryGroup">
       {html_options options=$secondaryGroups selected=$primaryGroup}
      </select> 
      {/render}
     </td>
    </tr>
    {if !$multiple_support}
    <tr>
     <td>{tr}Status{/tr}</td>
     <td>{$status}</td>
    </tr>
    {if $gotoLastSystemLogin}
    <tr>
     <td>{tr}Last log-on{/tr}</td>
     <td>{$gotoLastSystemLogin}</td>
    </tr>
    {/if}
    {/if}
   </table>
   
   {if !$multiple_support}
   
   <table summary="{tr}Account settings{/tr}">
    <tr>
     <td>
      {render acl=$force_idsACL}
      <input id="force_ids" type=checkbox name="force_ids" value="1" {$force_ids} 
      onclick="{$onClickIDS}">
      {/render}
     </td>
     <td>
      <label for="force_ids">{tr}Force UID/GID{/tr}</label>
     </td>
     <td style="width:20px;"></td>
     <td>
      <label for="uidNumber">{tr}UID{/tr}</label>
     </td>
     <td>
      {render acl=$uidNumberACL}
      <input type='text' id="uidNumber" name="uidNumber" size=9 maxlength=9 {$forceMode} value="{$uidNumber}">
      {/render}
     </td>
    </tr>
    <tr>
     <td colspan="3"></td>
     <td>
      <label for="gidNumber">{tr}GID{/tr}</label>
     </td>
     <td>
      {render acl=$gidNumberACL}
      <input type='text' id="gidNumber" name="gidNumber" size=9 maxlength=9 {$forceMode} value="{$gidNumber}">
      {/render}
     </td>
    </tr>
   </table>
   {/if}
  </td>
  <td class='left-border'>   &nbsp;
  </td>
  <td>
   <h3>{tr}Group membership{/tr}
   </h3>
   {if $groups eq "too_many_for_nfs"}
   <b style="color:red">{tr}(Warning: more than 16 groups are not supported by NFS!){/tr}</b>
   <br>
   {/if}
   {render acl=$groupMembershipACL}
   {$groupList}
   {/render}
   {render acl=$groupMembershipACL}
   <button type='submit' name='edit_groupmembership'>{msgPool type=addButton}</button>&nbsp;
   
   {/render}
  </td>
 </tr>
</table>

<hr>

<table style="width:100%" summary="{tr}Account permissions{/tr}" >
 <tr>
  <td style='width:50%'>
   {if $sshPublicKey == 1}
     {render acl=$sshPublicKeyACL}
     <h3>{tr}SSH keys{/tr}</h3>
     <button type='submit' name='edit_sshpublickey'>{tr}Edit public ssh keys...{/tr}</button>
     {/render}
   {/if}

   <hr>
   {include file="$pwmode.tpl"}
  </td>
  <td class='left-border'>   &nbsp;
  </td>
  <td>
    {$trustModeDialog}
  </td>
 </tr>
</table>

{if $multiple_support}
<input type="hidden" name="posix_mulitple_edit" value="1">
{/if}

<input type="hidden" name="posixTab" value="posixTab">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
<!-- // First input field on page
focus_field('homeDirectory');
-->
</script>
