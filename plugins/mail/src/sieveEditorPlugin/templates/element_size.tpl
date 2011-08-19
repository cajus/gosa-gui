<table width='100%' class='sieve_test_case' summary="{tr}Sieve test case: size{/tr}">
	<tr>
		<td>
			<b>{tr}Size{/tr}</b>
			{if $LastError != ""}
				<font color='red'>{$LastError}</font>
				<br>
			{/if}			

     		{if $Inverse}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}Not{/tr}</button>

            {else}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}-{/tr}</button>

            {/if}

			<select name='Match_type_{$ID}' title='{tr}Select match type{/tr}' size=1>
				{html_options options=$Match_types selected=$Match_type}
			</select>
			<input type='text' name='Value_{$ID}' value='{$Value}'>
			<select name='Value_Unit_{$ID}' title='{tr}Select value unit{/tr}' size=1>
				{html_options options=$Units selected=$Value_Unit}
			</select>
		</td>
	</tr>
</table>
