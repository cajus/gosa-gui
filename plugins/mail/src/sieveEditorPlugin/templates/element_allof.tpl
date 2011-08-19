<table width='100%' class='sieve_allof_container' summary="{tr}Sieve filter{/tr}">
	<tr>
    	<td class='sieve_allof_left'>
            {if $Inverse}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}Not{/tr}</button>

            {else}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}-{/tr}</button>

            {/if}
			<br>
			<b>{tr}All of{/tr}</b>
		</td>
        <td class='sieve_allof_right'>
			{$Contents}
        </td>
	</tr>
</table>
