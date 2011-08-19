<table width='100%' class='sieve_test_case' summary="{tr}Sieve filter{/tr}">
    <tr>
        <td style='width:200px;'>

            {if $LastError != ""}
                <font color='red'>{$LastError}</font>
                <br>
            {/if}
            <b>{tr}Exists{/tr}</b>
            {if $Inverse}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}Not{/tr}</button>

            {else}
                <button type='submit' name='toggle_inverse_{$ID}' title="{tr}Inverse match{/tr}">{tr}-{/tr}</button>

            {/if}

		</td>
		<td>
            <textarea style='width:99%;height:20px;' name='Values_{$ID}'>{$Values}</textarea>
		</td>
    </tr>
</table>
