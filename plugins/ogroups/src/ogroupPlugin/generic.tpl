<table summary="{tr}Object group{/tr}" style="width:100%;">
 <tr>
  <td style="width:50%">
   <input type="hidden" name="ogroupedit" value="1">
   <table summary="{tr}Generic settings{/tr}">
    <tr>
     <td><LABEL for="cn">{tr}Group name{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$cnACL}
       <input type='text' name="cn" id="cn" size=25 maxlength=60 value="{$cn}" title="{tr}Name of the group{/tr}">
{/render}
     </td>
    </tr>
    <tr>
     <td><LABEL for="description">{tr}Description{/tr}</LABEL></td>
     <td>
{render acl=$descriptionACL}
	<input type='text' id="description" name="description" size=40 maxlength=80 value="{$description}" title="{tr}Descriptive text for this group{/tr}">
{/render}
     </td>
    </tr>
    <tr>
     <td colspan=2>&nbsp;</td>
    </tr>
    <tr>
     <td><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>
     <td>
{render acl=$baseACL}
       {$base}
{/render}
     </td>
    </tr>
   </table>

    
	<hr>
    {$trustModeDialog}
  </td>
  <td style='padding-left:10px;' class='left-border'>
   {if $isRestrictedByDynGroup}
   <b>{tr}The group members are part of a dyn-group and cannot be managed!{/tr}</b>
    <br>
    <br>
    {/if}

   <b><LABEL for="members">{tr}Member objects{/tr}</LABEL></b>&nbsp;({$combinedObjects})
   <br>
{render acl=$memberACL}
   {$memberList}
{/render}
{if !$isRestrictedByDynGroup}
{render acl=$memberACL}
   <button type='submit' name='edit_membership'>{msgPool type=addButton}</button>&nbsp;
{/render}
{/if}
  </td>
 </tr>
</table>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
