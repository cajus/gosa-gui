{if $Expert}
    	{if $LastError != ""}
		<table width='100%' class='sieve_test_case' summary="{tr}Sieve element{/tr}">
        	<tr>
				<td colspan=2>
		            <font color='red'><b>{$LastError}</b></font>
				</td>
			</tr>
		</table>
        {/if}

<table width='100%' class='sieve_test_case' summary="{tr}Sieve element{/tr}">
	<tr>
		<td >
			<b>{tr}Address{/tr}</b>
		</td>
        <td style='text-align:right; '>

			<button type='submit' name='Toggle_Expert_{$ID}'>{tr}Normal view{/tr}</button>

		</td>
	</tr>
</table>
<table width='100%' summary="{tr}Sieve element{/tr}">
	<tr>
		<td >
			{tr}Match type{/tr}
		</td>
		<td>
			<select name='matchtype_{$ID}' title='{tr}Boolean value{/tr}' onChange='document.mainform.submit();' size=1> 
				{html_options options=$match_types selected=$match_type}
			</select>

		</td>
	</tr>
	<tr>
		<td>
			{tr}Invert test{/tr}?
		</td>
		<td>
			{if $Inverse}
				<button type='submit' name='toggle_inverse_{$ID}'>{tr}Yes{/tr}</button>

			{else}
				<button type='submit' name='toggle_inverse_{$ID}'>{tr}No{/tr}</button>

			{/if}
		</td>
	</tr>
	<tr>
		<td>
			{tr}Part of address that should be used{/tr}
		</td>
		<td>
			<select name='address_part_{$ID}' title='{tr}Boolean value{/tr}' size=1> 
				{html_options options=$address_parts selected=$address_part}
			</select>
		</td>
	</tr>
	<tr>
		<td>
			{tr}Comparator{/tr}
		</td>
		<td>
			<select name='comparator_{$ID}' title='{tr}Boolean value{/tr}' size=1> 
				{html_options options=$comparators selected=$comparator}
			</select>
		</td>
	</tr>
		{if $match_type == ":count" || $match_type == ":value"}
	<tr>
		<td>
			{tr}Operator{/tr}
		</td>
		<td>
			<select name='operator_{$ID}' title='{tr}Boolean value{/tr}' onChange='document.mainform.submit();' size=1>
				{html_options options=$operators selected=$operator}
			</select>
		</td>
	</tr>
		{/if}
	<tr>
		<td colspan=2>&nbsp;</td>
	</tr>
</table>
<table style='width:100%;' summary="{tr}Sieve element{/tr}">
    <tr>
        <td style='width:50%;'>
            {tr}Address fields to include{/tr}<br>
            <textarea style='width:100%;height:70px;' name='keys_{$ID}'>{$keys}</textarea>
        </td>
        <td style='width:50%;'>
            {tr}Values to match for{/tr}<br>
            <textarea style='width:100%;height:70px;' name='values_{$ID}'>{$values}</textarea>
        </td>
    </tr>
</table>
	{else}

    	{if $LastError != ""}
		<table width='100%' class='sieve_test_case' summary="{tr}Sieve element{/tr}">
        	<tr>
				<td colspan=2>
		            <font color='red'><b>{$LastError}</b></font>
				</td>
			</tr>
		</table>
        {/if}

<table width='100%' class='sieve_test_case' summary="{tr}Sieve element{/tr}">
	<tr>
		{if $match_type == ":count" || $match_type == ":value"}
		<td style='width:350px;'>

		{else}
		<td style='width:200px;'>

		{/if}
			<b>{tr}Address{/tr}</b>
		
			{if $Inverse}
				<button type='submit' name='toggle_inverse_{$ID}'>{tr}Not{/tr}</button>

			{else}
				<button type='submit' name='toggle_inverse_{$ID}'>{tr}-{/tr}</button>

			{/if}
			&nbsp;
			<select onChange='document.mainform.submit();' name='matchtype_{$ID}' title='{tr}Boolean value{/tr}' size=1> 
				{html_options options=$match_types selected=$match_type}
			</select>

			{if $match_type == ":count" || $match_type == ":value"}
			<select name='operator_{$ID}' title='{tr}Boolean value{/tr}' onChange='document.mainform.submit();' size=1>
				{html_options options=$operators selected=$operator}
			</select>
			{/if}
		</td>
		<td>
			<textarea style='width:100%;height:40px;' name='keys_{$ID}'>{$keys}</textarea>
		</td>
		<td>
			<textarea style='width:100%;height:40px;' name='values_{$ID}'>{$values}</textarea>
		</td>
		<td style='text-align:right; width:120px;'>

			<button type='submit' name='Toggle_Expert_{$ID}'>{tr}Expert view{/tr}</button>

		</td>
	</tr>
</table>
	{/if}
