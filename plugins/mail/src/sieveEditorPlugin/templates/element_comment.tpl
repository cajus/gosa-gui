<table width='100%' class='sieve_comment_container' summary="{tr}Sieve comment{/tr}">  
	<tr>
		<td>
			<b>{tr}Comment{/tr}</b>
		</td>
		<td style='text-align: right;'>
			{if $Small}
				<button type='submit' name='toggle_small_{$ID}'>{tr}Edit{/tr}</button> 	

			{else}
				<button type='submit' name='toggle_small_{$ID}'>{msgPool type=cancelButton}</button> 	

			{/if}
		</td>
	</tr>
	<tr>
		<td style='padding-left:20px;' colspan=2>
		{if $Small}
			{$Comment}
		{else}
			<textarea  name='comment_{$ID}' class='sieve_comment_area'>{$Comment}</textarea>
		{/if}
		</td>
	</tr>
</table>
