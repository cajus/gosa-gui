<table width='100%' class='sieve_redirect_container' summary="{tr}Sieve element redirect{/tr}">
	{foreach from=$LastError item=val key=key}
        <tr>
            <td colspan=4>
                <div class='sieve_error_msgs'>{$LastError[$key]}</div>

            </td>
        </tr>

    {/foreach}
	<tr>
		<td>
			<b>{tr}Redirect{/tr}</b>
		</td>
	</tr>
	<tr>
		<td class='sieve_redirect_input'>
			{tr}Redirect mail to following recipients{/tr}<br>
			<textarea name='redirect_to_{$ID}' class='sieve_redirect_input'>{$Destinations}</textarea>
		</td>
	</tr>
</table>
