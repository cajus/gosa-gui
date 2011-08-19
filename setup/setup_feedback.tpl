{if $feedback_send}
	<font color='green'>{tr}Feedback successfully send{/tr}</font>
{else}
	
    <input {if $subscribe} checked {/if} type='checkbox' name='subscribe' value='1' class='center'>
    {tr}Subscribe to the gosa-announce mailing list{/tr}

    <p>{tr}When checking this option, GOsa will try to connect http://oss.gonicus.de in order to subscribe you to the gosa-announce mailing list. You've to confirm this by mail.{/tr}</p>

	<table summary="{tr}Organization{/tr}">	
		<tr>
			<td>{tr}Organization{/tr}</td>
			<td><input name='organization' type='text' value='{$organization}' style='width:300px;'></td>
		</tr>
		<tr>
			<td>{tr}Name{/tr}</td>
			<td><input name='name' type='text' value='{$name}' style='width:300px;'></td>
		</tr>
		<tr>
			<td>{tr}Mail address{/tr}{$must}</td>
			<td><input name='eMail' type='text' value='{$eMail}' style='width:300px;'></td>
		</tr>
	</table>

    <hr>

	<input {if $use_gosa_announce} checked {/if} type='checkbox' name='use_gosa_announce' value='1' class='center'>
    {tr}Send feedback to the GOsa project team{/tr}

	<p>
	{tr}When checking this option, GOsa will try to connect http://oss.gonicus.de in order to submit your form anonymously.{/tr}
	</p>

    <hr>
	<b>{tr}Generic{/tr}</b>
	<table  summary="{tr}Generic{/tr}">	
		<tr>
			<td>{tr}Did the setup procedure help you to get started?{/tr}</td>
			<td><input {if $get_started} checked {/if} type='radio' name='get_started' value='1'>{tr}Yes{/tr}
				<br>
				<input {if !$get_started} checked {/if} type='radio' name='get_started' value='0'>{tr}No{/tr}</td>
		</tr>
		<tr>
			<td>{tr}If not, what problems did you encounter{/tr}:</td>
			<td><textarea name='problems_encountered' rows='4' cols='50' style='width:100%'>{$problems_encountered}</textarea></td>
		</tr>
		<tr>
			<td>{tr}Is this the first time you use GOsa?{/tr}</td>
			<td>
				<input {if $first_use} checked {/if} type='radio' name='first_use' value='1'>{tr}Yes{/tr}
				<br>
				<input {if !$first_use} checked {/if} type='radio' name='first_use' value='0'>{tr}No{/tr},
				{tr}I use it since{/tr}
				<select name='use_since' title='{tr}Select the year since when you are using GOsa{/tr}' size=1> 
					{html_options options=$years}
				</select>
			</td>	
		</tr>
		<tr>
			<td>{tr}What operating system / distribution do you use?{/tr}</td>
			<td><input type='text' name='distribution' size=50 value='{$distribution}'></td>
		</tr>
		<tr>
			<td>{tr}What web server do you use?{/tr}</td>
			<td><input type='text' size=50 name='web_server' value='{$web_server}'></td>
		</tr>
		<tr>
			<td>{tr}What PHP version do you use?{/tr}</td>
			<td><input type='text' size=50 name='php_version' value='{$php_version}'></td>
		</tr>
		<tr>
			<td>{tr}GOsa version{/tr}</td>
			<td>{$gosa_version}</td>
		</tr>
	</table>

	<hr>
    <b>{tr}LDAP{/tr}</b>
	<table  summary="{tr}LDAP{/tr}">
		<tr>
			<td>{tr}What kind of LDAP server(s) do you use?{/tr}</td>
			<td><input type='text' name='ldap_server' size=50 value='{$ldap_server}'></td>
		</tr>
		<tr>
			<td>{tr}How many objects are in your LDAP?{/tr}</td>
			<td><input type='text' name='object_count' size=50 value='{$object_count}'></td>
		</tr>
	</table>

	<hr>
    <b>{tr}Features{/tr}</b>
	<table  summary="{tr}Features{/tr}">
		<tr>
			<td>{tr}What features of GOsa do you use?{/tr}</td>
			<td>
				{foreach from=$features_used item=data key=key}
					<input type='checkbox' name='feature_{$key}' {if $data.USED} checked {/if}>
					{$data.NAME}<br>
				{/foreach}
			</td>
		</tr>
		<tr>
			<td>{tr}What features do you want to see in future versions of GOsa?{/tr}</td>
			<td><textarea name='want_to_see_next' cols=50 rows=3>{$want_to_see_next}</textarea></td>
		</tr>
	</table>
<button type='submit' name='send_feedback'>{tr}Send feedback{/tr}</button>

{/if}
<input type='hidden' name='step_feedback' value='1'>
