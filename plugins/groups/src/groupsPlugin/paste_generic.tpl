<h3>{tr}Group settings{/tr}</h3>
<table width='100%' summary="{tr}Paste group settings{/tr}" >
	<tr>
		<td style='width:150px;'>
			{tr}Group name{/tr}
		</td>
		<td>
			<input type='text' id='cn' name='cn' size='35' maxlength='60' value='{$cn}' title='{tr}POSIX name of the group{/tr}'>
		</td>
	</tr>
	<tr>
		<td>
			<input type=checkbox name='force_gid' value='1' {$used} title='{tr}Normally IDs are auto-generated, select to specify manually{/tr}' 
				onclick='changeState("gidNumber")'>
			<LABEL for='gidNumber'>{tr}Force GID{/tr}</LABEL>
		</td>
		<td>
			<input type='text' name='gidNumber' size=9 maxlength=9 id='gidNumber' {$dis} value='{$gidNumber}' title='{tr}Forced ID number{/tr}'>
		</td>
	</tr>
</table>

<script language="JavaScript" type="text/javascript">
	focus_field('cn');
</script>
