{if $readable}
<table summary="{tr}Macro parameter{/tr}">
	<tr>
		<td>{tr}Argument{/tr}
		</td>
		<td>{tr}Name{/tr}
		</td>
		<td>{tr}type{/tr}
		</td>
		<td>{tr}Default value{/tr}
		</td>
		<td>
		&nbsp;
		</td>
	</tr>
		{$vars}
</table>
{else}
	<h3>{tr}You are not allowed to view the macro parameter settings{/tr}</h3>
{/if}
<input type="hidden" name="phoneparemeters">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('cn');
  -->
</script>
