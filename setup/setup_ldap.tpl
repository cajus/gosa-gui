 <p>
  {tr}The main data source used in GOsa is LDAP. In order to access the information stored there, please enter the required information.{/tr}
 </p>

  <hr>

	{if $resolve_user}

		<b>{tr}Please choose the LDAP user to be used by GOsa{/tr}</b>
		<select name='admin_to_use' size=20 style="width:100%; margin-bottom:10px;">				
			{html_options options=$resolved_users selected=$admin}
		</select>

		<input type='text' value='{$resolve_filter}' name='resolve_filter'>
		<button type='submit' name='resolve_search'>{tr}Search{/tr}</button>
		
        <hr>
        <div class="plugin-actions">
            <button type='submit' name='use_selected_user'>{tr}Apply{/tr}</button>
            <button type='submit' name='resolve_user'>{tr}Cancel{/tr}</button>
		</div>
	</div>		
	
	<div style="clear:both;"></div>

	{else}

	<b>{tr}LDAP connection{/tr}</b>
    <table style='width:100%' summary='{tr}LDAP connection{/tr}'>
        <tr>
            <td style='width:200px;'>{tr}Location name{/tr}</td>
            <td><input type='text' name='location' maxlength='80' size='40' value='{$location}'></td>    
        </tr>
        <tr>
            <td>{tr}Connection URI{/tr}</td>
			<td><input type='text' name='connection' maxlength='80' size='40' value='{$connection}'></td>
        </tr>
        <tr>
            <td>{tr}TLS connection{/tr}</td>
            <td>
                <select name="tls" size="1" title="">
                    {html_options options=$bool selected=$tls}
                </select>
            </td>
        </tr>
        <tr>
            <td>{tr}Base{/tr}</td>
            <td>
                {if $namingContextsCount >= 1}
                    <select name='base' size=1>
                        {html_options values=$namingContexts output=$namingContexts selected=$base}
                    </select>
                {else}
                    <input type='text' name='base' maxlength='80' size='40' value='{$base}'>
                {/if}
            <input type='image' class='center' src='images/lists/reload.png' 
                title='{tr}Reload{/tr}' name='reload' alt='{tr}Reload{/tr}'>
            </td>
        </tr>
    </table>

    <hr> 
	<b>{tr}Authentication{/tr}</b>
    <table style='width:100%' summary='{tr}Authentication{/tr}'>
        <tr>
            <td style='width:200px;'>{tr}Administrator DN{/tr}</td>
            <td>
                <input type='text' name='admin_given' maxlength='160' size='40' value='{$admin_given}'>
			    {if $append_base_to_admin_dn},{$base_to_append}{/if}
			    <input type='image' class='center' src='images/lists/folder.png' 
                    title='{tr}Select user{/tr}' name='resolve_user' alt='{tr}Select user{/tr}'>
            </td>
        </tr>
        <tr>
            <td>
            </td>    
            <td>
                <input onClick='document.mainform.submit();' 
                    {if $append_base_to_admin_dn} checked {/if} 
                    type='checkbox' name='append_base_to_admin_dn' value='1'>&nbsp;
                {tr}Automatically append LDAP base to administrator DN{/tr}
            </td>
        </tr>
        <tr>
            <td>{tr}Administrator password{/tr}</td>
            <td><input type='password' name='password' value='{$password}'></td>
        </tr>
    </table>

    <hr> 
	<b>{tr}Schema based settings{/tr}</b>
    <table style='width:100%' summary='{tr}Schema based settings{/tr}'>
        <tr>
            <td style='width:200px;'>{tr}Use RFC 2307bis compliant groups{/tr}</td>
            <td>
                <select name="rfc2307bis" size="1" title="">
                   {html_options options=$bool selected=$rfc2307bis}
                </select>
            </td>
        </tr>
    </table>

	{if !$resolve_user}
    <hr> 
        <b>{tr}Current status{/tr}</b>
        <table style='width:100%' summary='{tr}Current status{/tr}'>
            <tr>
                <td style='width:200px;'>{tr}Information{/tr}</td>
                <td>{$connection_status}</td>
            </tr>
        </table>
	{/if}
{/if}

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('location');
  -->
</script>

