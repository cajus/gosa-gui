<table width='100%' class='sieve_reject_container'  summary="{tr}Sieve: reject{/tr}">

{foreach from=$LastError item=val key=key}
        <tr>
            <td colspan=4>
                <div class='sieve_error_msgs'>{$LastError[$key]}</div>

            </td>
        </tr>

    {/foreach}
	<tr>
		<td>
			<b>{tr}Reject mail{/tr}</b>
			&nbsp;
			{if $Multiline}
<!--				{tr}This is a multi-line text element{/tr}-->
			{else}
<!--				{tr}This is stored as single string{/tr}-->
			{/if}
		</td>
	</tr>
	<tr>
		<td class='sieve_reject_input'>
			<textarea name='reject_message_{$ID}' class='sieve_reject_input'>{$Message}</textarea>
		</td>
	</tr>
</table>
