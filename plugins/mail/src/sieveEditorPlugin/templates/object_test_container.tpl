<table width='100%' class='sieve_test_container'  summary="{tr}Sieve test case{/tr}">
	<tr>
		<td style='width:20px; ; text-align:center; '>	

			{if $DisplayAdd}
				{image path="plugins/mail/html/images/sieve_add_test.png" action="Add_Test_Object_{$ID}"
					title="{tr}Add object{/tr}"}
			{/if}
			{if $DisplayDel}
				{image path="plugins/mail/html/images/sieve_del_object.png" action="Remove_Test_Object_{$ID}"
					title="{tr}Remove object{/tr}"}
			{/if}
		</td>
		<td>
			%%OBJECT_CONTENT%%
		</td>
	</tr>
</table>
