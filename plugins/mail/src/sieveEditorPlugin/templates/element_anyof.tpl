<table width='100%' class='sieve_anyof_container' summary="{tr}Sieve filter{/tr}">
	<tr>
    	<td class='sieve_anyof_left'>
            {if $Inverse}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}Not{/tr}</button>

            {else}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">-</button>

            {/if}
			<br>
			<b>{tr}Any of{/tr}</b>
		</td>
        <td class='sieve_anyof_right'>
			{$Contents}
        </td>
	</tr>
</table>
