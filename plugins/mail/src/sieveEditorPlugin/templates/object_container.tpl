<table width='100%' class='object_container_container' summary="{tr}Sieve element{/tr}">
	<tr>
	    <td style='width:20px;background-color: #B8B8B8'>
			&nbsp;	
		</td>
		<td style='width:200px; background-color: #B8B8B8; vertical-align:middle;' >
            {image path='plugins/mail/html/images/sieve_move_object_up.png' 
                action="Move_Up_Object_{$ID}" title="{tr}Move object up one position{/tr}"}

            {image path='plugins/mail/html/images/sieve_move_object_down.png' 
                action="Move_Down_Object_{$ID}" title="{tr}Move object down one position{/tr}"}

            {image path='images/lists/trash.png' action="Remove_Object_{$ID}" 
                title="{tr}Remove object{/tr}"}

         </td>   
		 <td style=' background-color: #B8B8B8'>
			<select name='element_type_{$ID}' size=1>
				<option value=''>&lt;{tr}choose element{/tr}&gt;</option>
				<option value='sieve_keep'>{tr}Keep{/tr}</option>
				<option value='sieve_comment'>{tr}Comment{/tr}</option>
				<option value='sieve_fileinto'>{tr}File into{/tr}</option>
				<option value='sieve_keep'>{tr}Keep{/tr}</option>
				<option value='sieve_discard'>{tr}Discard{/tr}</option>
				<option value='sieve_redirect'>{tr}Redirect{/tr}</option>
				<option value='sieve_reject'>{tr}Reject{/tr}</option>
				<option value='sieve_require'>{tr}Require{/tr}</option>
				<option value='sieve_stop'>{tr}Stop{/tr}</option>
				<option value='sieve_vacation'>{tr}Vacation message{/tr}</option>
				<option value='sieve_if'>{tr}If{/tr}</option>
				<option value='sieve_else'>{tr}Else{/tr}</option>
				<option value='sieve_elsif'>{tr}Else If{/tr}</option>
			</select>

            {image path="plugins/mail/html/images/sieve_move_object_up.png[new]" 
                action="Add_Object_Top_{$ID}" title="{tr}Add a new object above this one.{/tr}"}
            {image path="plugins/mail/html/images/sieve_move_object_down.png[new]" 
                action="Add_Object_Bottom_{$ID}" title="{tr}Add a new object below this one.{/tr}"}
		</td>
	</tr>
	<tr>
		<td class='object_container_cell_bottom_left'>
		</td>
		<td colspan=2>
			%%OBJECT_CONTENT%%
		</td>
	</tr>
</table>
