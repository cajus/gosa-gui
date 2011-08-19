<!--////////////////////
	//	LOCALITY (l)
    //////////////////// -->

<table summary="{tr}Locality{/tr}" style="width:100%" cellpadding=4>
 <tr>
   <td style="width:50%">
     <h3>{tr}Properties{/tr}</h3>
     <table summary="{tr}Properties{/tr}">
      <tr>
       <td><LABEL for="l">{tr}Locality name{/tr}</LABEL>{$must}</td>
       <td>
{render acl=$lACL}
    	<input type='text' id="l" name="l" size=25 maxlength=60 value="{$l}" title="{tr}Name of locality to create{/tr}">
{/render}
       </td>
      </tr>
      <tr>
       <td><LABEL for="description">{tr}Description{/tr}</LABEL>{$must}</td>
       <td>
{render acl=$descriptionACL}
        <input type='text' id="description" name="description" size=25 maxlength=80 value="{$description}" title="{tr}Descriptive text for department{/tr}">
{/render}
       </td>
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
 </tr>
</table>
<hr>
<h3>{tr}Administrative settings{/tr}</h3>
{render acl=$gosaUnitTagACL}
 <input id="is_administrational_unit" type=checkbox name="is_administrational_unit" value="1" {$gosaUnitTag}>
 <label for="is_administrational_unit">{tr}Tag department as an independent administrative unit{/tr}</label>
{/render}
<input type='hidden' name='dep_generic_posted' value='1'>
