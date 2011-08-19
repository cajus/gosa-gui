<table width='100%' class='sieve_fileinto_container' summary="{tr}Sieve: File into{/tr}">
	<tr>
		<td colspan=2>
			<b>{tr}Move mail into folder{/tr}</b>
		</td>
		<td style='text-align:right;'>
			{if $User_Mode}
				<button type='submit' name='user_mode_{$ID}'>{tr}Select from list{/tr}</button>
			{else}
				<button type='submit' name='user_mode_{$ID}'>{tr}Manual selection{/tr}</button>

			{/if}
		</td>
	</tr>
	<tr>
		<td style='width:20px;'>
		</td>
		<td>
			{tr}Folder{/tr}
			{if $User_Mode}
				<input class='sieve_fileinto_input' type='text' value="{$Selected}" name='fileinto_{$ID}'>
			{else}
				<select name='fileinto_{$ID}' class='sieve_fileinto_input' size=1>
					{html_options values=$Boxes output=$Boxes selected=$Selected}
				</select>
			{/if}
		</td>
		<td >
		</td>
	</tr>
</table>
