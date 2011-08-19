<table style='width:100%; ' summary="{tr}Paste fax account settings{/tr}">

 	<tr>
   		<td style='width:50%; '>

     		<h3>{tr}Generic{/tr}</h3>
     		<table summary="{tr}Generic settings{/tr}">
       			<tr>
         			<td>
					<label for="facsimileTelephoneNumber">{tr}Fax{/tr}</label>{$must}
				</td>
         			<td>
           				<input name="facsimileTelephoneNumber" id="facsimileTelephoneNumber" 
							size=40 maxlength=65 value="{$facsimileTelephoneNumber}" 
							title="{tr}Fax number for GOfax to trigger on{/tr}">
         			</td>
       			</tr>
                        <tr>
                                <td colspan=2>
                                      {tr}Alternate fax numbers will not be copied{/tr}
                                </td>
                        </tr>

			</table>
		</td>
	</tr>
</table>
<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
	focus_field('facsimileTelephoneNumber');
  -->
</script>
