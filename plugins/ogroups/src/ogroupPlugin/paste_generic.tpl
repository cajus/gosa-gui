<table width='100%' summary="{tr}Paste object group{/tr}">
	<tr>
		<td width='120'>
			<LABEL for="cn">{tr}Group name{/tr}</LABEL>{$must}
		</td>
		<td>
			<input type='text' id='cn' name='cn' value='{$cn}' size='40' title='{tr}Please enter the new object group name{/tr}'> 
		</td>
	</tr>
</table>



<input type='checkbox' value='1' name='copyMembers' {if $copyMembers} checked {/if} id='copyMembers'>
<LABEL for='copyMembers'>
&nbsp;{tr}Warning: systems can only inherit from a single object group!{/tr}
</LABEL>
<script language="JavaScript" type="text/javascript">
	focus_field('cn');
</script>
