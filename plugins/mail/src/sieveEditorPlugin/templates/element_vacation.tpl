<table width='100%' class='sieve_vacation_container' summary="{tr}Sieve element{/tr}">

	{foreach from=$LastError item=val key=key}
		<tr>
			<td colspan=4>
				<div class='sieve_error_msgs'>{$LastError[$key]}</div>
			</td>
		</tr>
	{/foreach}
	{if $Expert}
	<tr>
		<td style='width:20%'>	
			<b>{tr}Vacation Message{/tr}</b>
		</td>	
        <td style='text-align:right; '>

            <button type='submit' name='Toggle_Expert_{$ID}'>{tr}Normal view{/tr}</button>

        </td>
	</tr>
	<tr>
		<td >
			{tr}Release interval{/tr}&nbsp;
		</td>
		<td>
			<input type='text' name='vacation_release_{$ID}' value='{$Days}'>
			&nbsp;{tr}days{/tr}
		</td>
	</tr>
	<tr>
		<td>
			{tr}Alternative sender addresses{/tr}
		</td>
		<td>
    		<textarea name='vacation_receiver_{$ID}' style='width:100%;height:20px;'>{$Addresses}</textarea>
		</td>
	</tr>
	<tr>
		<td class='sieve_vacation_input' colspan=2>
		    <textarea name='vacation_reason_{$ID}' class='sieve_vacation_input'>{$Reason}</textarea>
		</td>
	</tr>
	{else}
	<tr>
		<td>	
			<b>{tr}Vacation message{/tr}</b>
		</td>	
		<td>

            <button type='submit' name='Toggle_Expert_{$ID}'>{tr}Expert view{/tr}</button>

		</td>
	</tr>
	<tr>
		<td class='sieve_vacation_input' colspan=2>
		    <textarea name='vacation_reason_{$ID}' class='sieve_vacation_input'>{$Reason}</textarea>
		</td>
	</tr>
	{/if}
</table>
