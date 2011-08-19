
<table style='width:100%; ' summary="{tr}Blocklist settings{/tr}">

 <tr>
  <td style='width:50%;' class='right-border'> 

   <b>{tr}Blocked numbers/lists{/tr}</b>
   <br> 
   <select style="width:100%; height:300px;" name="block_list[]" size=15 multiple>
	    {html_options values=$cblocklist output=$cblocklist}
		<option disabled>&nbsp;</option>
   </select>
   <br>
   <input type='text' name="block_number" size=25 align="middle" maxlength=30 value="">
   <button type='submit' name='add_blocklist_number'>{msgPool type=addButton}</button>&nbsp;

   <button type='submit' name='delete_blocklist_number'>{msgPool type=delButton}</button>

  </td>
  <td>
	<b>{tr}List of predefined blacklists{/tr}</b><br>
	<table style="width:100%;height:300px;" summary="{tr}List of blocked numbers{/tr}">
		<tr>
			<td valign="top">
					{$predefinedList}
			</td>
		</tr>
	</table>
   <button type='submit' name='add_blocklist'>{tr}Add the list to the blacklists{/tr}</button>
<br>
  </td>
 </tr>
</table>

<hr>
<div class="plugin-actions">
  <button type='submit' name='edit_blocklists_finish'>{msgPool type=applyButton}</button>

  <button type='submit' name='edit_blocklists_cancel'>{msgPool type=cancelButton}</button>

</div>
