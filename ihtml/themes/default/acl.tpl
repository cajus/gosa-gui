{if !$acl_readable}

	<h3>{msgPool type=permView}</h3>

{else}
	{if $dialogState eq 'head'}
  	<h3>{tr}Assigned ACL for current entry{/tr}</h3>
	  {$aclList}
    {if $acl_createable}
     <button type='submit' name='new_acl'>{tr}New ACL{/tr}</button>
 	  {/if}
	{/if}

	{if $dialogState eq 'create'}
    <h3>{tr}Options{/tr}</h3>
    <table summary='{tr}Options{/tr}'>
      <tr>
        <td>
  	      {tr}ACL type{/tr}
        </td>
        <td>
          {if !$acl_writeable}
            <select size="1" name="dummy_t" title="{tr}Select an ACL type{/tr}" disabled>
              {html_options options=$aclTypes selected=$aclType}
              <option disabled>&nbsp;</option>
            </select>&nbsp;
          {else} 
            <select size="1" name="aclType" title="{tr}Select an ACL type{/tr}" onChange="document.mainform.submit()">
              {html_options options=$aclTypes selected=$aclType}
              <option disabled>&nbsp;</option>
            </select size=1>&nbsp;
            {if $javascript eq 'false'}
              <button type='submit' name='refresh'>{tr}Apply{/tr}</button>
            {/if}
          {/if}
        </td>
      </tr>
      <tr>
        <td>
      	  {tr}Additional filter options{/tr}
        </td>
        <td>
  		    {if !$acl_writeable}
            <input type='text' value='{$aclFilter}' disabled name='dummy_f' style='width:600px;'>
          {else}
            <input type='text' value='{$aclFilter}' name='aclFilter' style='width:600px;'>
          {/if}
        </td>
      </tr>
    </table>

	<hr>
    <h3>{tr}Members{/tr}</h3>
    {$aclMemberList}
    <button type='submit'
      {if !$acl_writeable} disabled="disabled" {/if}
      name='add_user_or_group'>{msgPool type=addButton}</button>&nbsp;

    <button type='submit'
      {if !$acl_writeable} disabled="disabled" {/if}
      name='add_all_users'>{tr}Add all users{/tr}</button>&nbsp;

	{if $aclType ne 'reset'}
	{if $aclType ne 'role'}
	{if $aclType ne 'base'}
	<hr>

	<h3>{tr}List of available ACL categories{/tr}</h3>
	{$aclList}
	{/if}
	{/if}
	{/if}

	{if $aclType eq 'base'}
	<hr>
	<h3>{tr}ACL for this object{/tr}</h3>
	{$aclSelector}
	{/if}

	{if $aclType eq 'role'}
	<hr>
	<h3>{tr}Available roles{/tr}</h3>
	{$roleSelector}
	{/if}

	<hr>
	<div style='text-align:right;margin-top:5px'>
		{if $acl_writeable}
		<button type='submit' name='submit_new_acl'>{tr}Apply{/tr}</button>

		&nbsp;
		{/if}
		<button type='submit' name='cancel_new_acl'>{tr}Cancel{/tr}</button>

	</div>
	{/if}

	{if $dialogState eq 'edit'}

	<h3>{$headline}</h3>

	{$aclSelector}

	<hr>
	<div style='text-align:right;margin-top:5px'>
		<button type='submit' name='submit_edit_acl'>{tr}Apply{/tr}</button>

		&nbsp;
		<button type='submit' name='cancel_edit_acl'>{tr}Cancel{/tr}</button>

	</div>
	{/if}
{/if}
