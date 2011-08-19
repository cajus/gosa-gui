<table summary="{tr}Paste confernece{/tr}">
	<tr>
		<td>
			<LABEL for="cn">
				{tr}Conference name{/tr}
			</LABEL>
			{$must}
		</td>
		<td>
			<input type='text' id="cn" name="cn" size=25 maxlength=60 value="{$cn}" title="{tr}Name of conference to create{/tr}">
		</td>
	</tr>
	<tr>
		<td>
			{tr}Phone number{/tr}
			{$must}
		</td>
		<td>
			<input type='text' name="telephoneNumber" value="{$telephoneNumber}" size=15>
		</td>
	</tr>
</table>

