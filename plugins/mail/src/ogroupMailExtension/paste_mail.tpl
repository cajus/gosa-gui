<table width='100%' summary="{tr}Paste group mail settings{/tr}">
        <tr>
                <td width='120'>
			<LABEL for="mail">{tr}Mail{/tr}</LABEL>{$must}
		</td>
		<td>
			<input type='text' id='main' name='mail' value='{$mail}' size='40' title='{tr}Please enter a mail address{/tr}'> 
		</td>
	</tr>
</table>

<script language="JavaScript" type="text/javascript">
	focus_field('mail');
</script>
