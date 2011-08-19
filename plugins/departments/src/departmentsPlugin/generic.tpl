<!--////////////////////
	//	ORGANIZATIONAL UNIT (ou)
    //////////////////// -->
<table summary="{tr}Organizational Unit{/tr}" style="width:100%" cellpadding=4>
 <tr>
   <td style="width:50%">
     <h3>{tr}Properties{/tr}</h3>
     
     <table summary="{tr}Properties{/tr}">
      <tr>
       <td><LABEL for="ou">{tr}Name of department{/tr}</LABEL>{$must}</td>
       <td>
{render acl=$ouACL}
	<input type='text' id="ou" name="ou" size=25 maxlength=60 value="{$ou}" title="{tr}Name of subtree to create{/tr}">
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="description">{tr}Description{/tr}</LABEL>{$must}</td>
       <td>
{render acl=$descriptionACL}
        <textarea id='description' name='description' style='width:220px' title="{tr}Descriptive text for   department{/tr}">{$description}</textarea>
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="businessCategory">{tr}Category{/tr}</LABEL></td>
       <td>
{render acl=$businessCategoryACL}
        <input type='text' id="businessCategory" name="businessCategory" size=25 maxlength=80 value="{$businessCategory}" title="{tr}Category for this subtree{/tr}">
{/render}
       </td>
      </tr>
      <tr>
        <td colspan="2"><br></td>
      </tr>
	{if !$is_root_dse}
      <tr>
        <td><LABEL for="base">{tr}Base{/tr}</LABEL>{$must}</td>

        <td>
{render acl=$baseACL}
          {$base}
{/render}
	</td>
       </tr>
	{/if}

  {if $manager_enabled}
    <tr>
     <td><label for="manager">{tr}Manager{/tr}</label></td>
     <td>
{render acl=$managerACL}
        <input type='text' name='manager_name' id='manager_name' value='{$manager_name}' disabled
          title='{$manager}'>
{/render}
{render acl=$managerACL}
        {image path="images/lists/edit.png" action="editManager"}

{/render}
        {if $manager!=""}
{render acl=$managerACL}
        {image path="images/info_small.png" title="{$manager}"}

{/render}
{render acl=$managerACL}
        {image path="images/lists/trash.png" action="removeManager"}

{/render}
        {/if}
     </td>
    </tr>
  {/if}

     </table>

   </td>
   <td class='left-border'>

    &nbsp;
   </td>
   <td>
     <h3>{tr}Location{/tr}</h3>

     <table summary="{tr}Location{/tr}" style="width:100%">
      <tr>
       <td><LABEL for="st">{tr}State{/tr}</LABEL></td>
       <td>
{render acl=$stACL}
	<input type='text' id="st" name="st" size=25 maxlength=60 value="{$st}" title="{tr}State where this subtree is located{/tr}">
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="l">{tr}Location{/tr}</LABEL></td>
       <td>
{render acl=$lACL}
	<input type='text' id="l" name="l" size=25 maxlength=60 value="{$l}" title="{tr}Location of this subtree{/tr}">
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="postalAddress">{tr}Address{/tr}</LABEL></td>
       <td>
{render acl=$postalAddressACL}
	<textarea id="postalAddress" name="postalAddress" style="width:100%" rows=3 cols=22 title="{tr}Postal address of this subtree{/tr}">{$postalAddress}</textarea>
{/render}
      </tr>
      <tr>
       <td><LABEL for="telephoneNumber">{tr}Phone{/tr}</LABEL></td>
       <td>
{render acl=$telephoneNumberACL}
	<input type='text' id="telephoneNumber" name="telephoneNumber" size=25 maxlength=60 value="{$telephoneNumber}" title="{tr}Base telephone number of this subtree{/tr}">
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="facsimileTelephoneNumber">{tr}Fax{/tr}</LABEL></td>
       <td>
{render acl=$facsimileTelephoneNumberACL}
	<input type='text' id="facsimileTelephoneNumber" name="facsimileTelephoneNumber" size=25 maxlength=60 value="{$facsimileTelephoneNumber}" title="{tr}Base facsimile telephone number of this subtree{/tr}">
{/render}
       </td>
      </tr>
     </table>

   </td>
 </tr>
</table>

<hr>
<h3>{tr}Administrative settings{/tr}</h3>
{render acl=$gosaUnitTagACL}
 <input id="is_administrational_unit" type=checkbox name="is_administrational_unit" value="1" {$gosaUnitTag}>
 <label for="is_administrational_unit">{tr}Tag department as an independent administrative unit{/tr}</label>
{/render}

<!-- Place cursor -->
<input type='hidden' name='dep_generic_posted' value='1'>
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('ou');
  -->
</script>
