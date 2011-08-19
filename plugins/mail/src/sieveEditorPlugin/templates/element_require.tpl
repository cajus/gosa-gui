<table width='100%' class='sieve_require_container'  summary="{tr}Sieve: require{/tr}">
	{foreach from=$LastError item=val key=key}
		<tr>
			<td colspan=4>
				<div class='sieve_error_msgs'>{$LastError[$key]}</div>
			</td>
		</tr>

	{/foreach}
	<tr>
		<td style=''>
			<b>{tr}Require{/tr}</b>
		</td>
	</tr>
	<tr>
		<td style='padding-left:20px;;'>
			<input type='text'  name='require_{$ID}' class='sieve_require_input' value='{$Require}'>
		</td>
	</tr>
</table>

