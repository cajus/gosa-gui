{if $dialogState eq 'head'}

<h3>{tr}Assigned ACL for current entry{/tr}</h3>
<table summary="{tr}Assigned ACL for current entry{/tr}">
<tr>
	<td>
		{tr}Name{/tr}
	</td>
	<td>	
{render acl=$cnACL}
		<input type="text" name='cn' value="{$cn}" style='width:200px;'>
{/render}
	</td>
</tr>
<tr>
	<td>
		{tr}Description{/tr}
	</td>
	<td>
{render acl=$descriptionACL}
		<input type="text" name='description' value="{$description}" style='width:200px;'>
{/render}
	</td>
</tr>
<tr>
	<td>
		{tr}Base{/tr}{$must}
	</td>
	<td>
{render acl=$baseACL}
  {$base}
{/render}
	</td>
</tr>
</table>
{$aclList}
{render acl=$gosaAclTemplateACL}
<button type='submit' name='new_acl'>{tr}New ACL{/tr}</button>

{/render}

{/if}

{if $dialogState eq 'create'}
<h3>{tr}ACL type{/tr} <select size="1" name="aclType" title="{tr}Select an ACL type{/tr}" onChange="document.mainform.submit()">{html_options options=$aclTypes selected=$aclType}<option disabled>&nbsp;</option></select>&nbsp;{if $javascript eq 'false'}<button type='submit' name='refresh'>{msgPool type=applyButton}</button>{/if}
</h3>

<hr>


<h3>{tr}List of available ACL categories{/tr}</h3>
{$aclList}

<hr>
<div style='text-align:right;margin-top:5px'>
{render acl=$gosaAclTemplateACL}
	<button type='submit' name='submit_new_acl'>{msgPool type=applyButton}</button>

	&nbsp;
{/render}
	<button type='submit' name='cancel_new_acl'>{msgPool type=cancelButton}</button>

</div>
{/if}

{if $dialogState eq 'edit'}

<h3>{$headline}</h3>

{render acl=$gosaAclTemplateACL}
{$aclSelector}
{/render}

<hr>
<div style='text-align:right;margin-top:5px'>
{render acl=$gosaAclTemplateACL}
	<button type='submit' name='submit_edit_acl'>{msgPool type=applyButton}</button>

{/render}
	&nbsp;
	<button type='submit' name='cancel_edit_acl'>{msgPool type=cancelButton}</button>

</div>
{/if}
<input type='hidden' name='acl_role_posted' value='1'>
