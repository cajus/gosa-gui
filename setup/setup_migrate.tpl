	{if $method == "default"}
		<p>{tr}During the LDAP inspection, we're going to check for several common pitfalls that may occur when migration to GOsa base LDAP administration. You may want to fix the problems below, in order to provide smooth services.{/tr}
		</p>

        <table style='width:100%' summary='{tr}Checks{/tr}'>
            {foreach from=$checks item=val key=key}
                <tr> 
                    <td>
                        <b>{$checks.$key.TITLE}</b>&nbsp; {$checks.$key.STATUS_MSG}
                        {if $checks.$key.ERROR_MSG}
                            <p>
                                {$checks.$key.ERROR_MSG}
                            </p>
                        {/if}
                    </td>
                </tr>
            {/foreach}
        </table>

	{elseif $method == "rootOC_migrate_dialog"}

			<h2>{tr}Add required object classes to the LDAP base{/tr}</h2>

			<b>{tr}Current{/tr}</b>
			<pre>{$details.current}</pre>

			<br>
			<b>{tr}After migration{/tr}</b>
    		<pre>{$details.target}</pre>

			<br>
			<button type='submit' name='rootOC_migrate_start'>{tr}Migrate{/tr}</button>
			<hr>	
			<div class="plugin-actions">
				<button type='submit' name='rootOC_dialog_cancel'>{tr}Close{/tr}</button>
			</div>

		{elseif $method == "create_acls"}

    <h2>{tr}Create a new GOsa administrator account{/tr}</h2>
    <p>{tr}This dialog will automatically add a new super administrator to your LDAP tree.{/tr}</p>

    <table summary="{tr}Name{/tr}">
        <tr>
            <td>{tr}Name{/tr}:</td>
            <td><i>System administrator</i></td>
        </tr>
        <tr>
            <td>{tr}User ID{/tr}:&nbsp;</td>
            <td><input type='text' value='{$new_user_uid}' name='new_user_uid'><br></td>
        </tr>
        <tr>
            <td>{tr}Password{/tr}:&nbsp;</td>
            <td><input type='password' value='{$new_user_password}' name='new_user_password'><br></td>
        </tr>
        <tr>    
            <td>{tr}Password (again){/tr}:&nbsp;</td>
            <td><input type='password' value='{$new_user_password2}' name='new_user_password2'></td>
        </tr>
    </table>

    <script language="JavaScript" type="text/javascript">
        <!-- // First input field on page
            focus_field('new_user_password');
        -->
    </script>

    <hr>	
    <div class="plugin-actions">
        <button type='submit' name='create_admin_user'>{tr}Apply{/tr}</button>	
        <button type='submit' name='create_acls_cancel'>{tr}Cancel{/tr}</button>
    </div>
{/if}
